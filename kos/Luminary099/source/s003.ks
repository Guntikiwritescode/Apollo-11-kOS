// PORT: Original source unit AOSTASK_AND_AOSJOB.agc.
// PORT: Physical bank 20. Shared continuation entries, slots 18727–18732.
function agcAotUnit1130 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18729 {
        if slot <= 18727 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:2
//# Filename:	AOSTASK_AND_AOSJOB.agc
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:9
//# Pages:	1485-1506
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:10
//# Mod history:	2009-05-27 RSB	Adapted from the corresponding
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:11
//#				Luminary131 file, using page
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:12
//#				images from Luminary 1A.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:13
//#		2009-06-05 RSB	Corrected a memory-bank error type.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:14
//#		2009-06-07 RSB	Corrected a typo.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:15
//#
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:16
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:17
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:18
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:19
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:20
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:21
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:22
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:23
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:24
//# actually created.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:25
//#
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:26
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:27
//#
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:28
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:29
//#	16:27 JULY 14, 1969
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:30
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:31
//# Page 1485
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:32
//# PROGRAM NAME:		1/ACCS
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:33
//# PROGRAM WRITTEN BY: 	BOB COVELLI AND MIKE HOUSTON
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:34
//# LAST MODIFICATION:	FEB. 14, 1969 BY G. KALAN
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:35
//#
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:36
//# PROGRAM DESCRIPTION:
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:37
//#	1/ACCS PROVIDES THE INTERFACE BETWEEN THE GUIDANCE PROGRAMS AND THE DIGITAL AUTOPILOT.  WHENEVER THERE IS A
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:38
//# 	CHANGE IN THE MASS OF THE VEHICLE, IN THE DEADBAND SELECTED, IN THE VEHICLE CONFIGURATION (ASCENT-DESCENT-
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:39
//#	DOCKED), AND DURING A FRESH START OR A RESTART, 1/ACCS IS CALLED TO COMMUNICATE THE DATA CHANGES TO THE DAP.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:40
//#
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:41
//# 	THE INPUTS TO 1/ACCS ARE MASS, ACCELERATION (ABDELV), DEADBAND (DB), OFFSET ACCELERATIONS (AOSQ AND AOSR),
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:42
//# 	STAGE VERIFY BIT (CHAN30, BIT2), DOCKED BIT (DAPBOOLS, BIT13), DRIFT BIT (DAPBOOLS, BIT8), USEQRJTS (DAPBOOLS,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:43
//# 	BIT14), AND SURFACE FLAG (FLAGWRDB, BIT8), AND CH5MASK.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:44
//#
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:45
//#	1/ACCS COMPUTES THE JET ACCELERATIONS (1JACC, 1JACCQ, 1JACCR) AS FUNCTIONS OF MASS.  1JACCU AND 1JACCV ARE
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:46
//#	FORMED BY RESOLVING 1JACCQ AND 1JACCR.  IN THE DESCENT CASE, THE DESCENT ENGINE MOMENT ARM (L, PVT-CG) IS ALSO
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:47
//# 	COMPUTED AS A FUNCTION OF MASS.  THE RATE OF CHANGE OF ACCELERATION DUE TO ROTATION OF THE GIMBAL (ACCDOTQ,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:48
//#	ACCDOTR) IS ALSO COMPUTED IN THE DESCENT CASE.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:49
//#
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:50
//#	AFTER THE ABOVE COMPUTATIONS, THE PROGRAM 1/ACCONT COMPUTES THE RECIPROCAL NET ACCELERATIONS ABOUT THE P, U,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:51
//# 	AND V AXES (2 JETS FOR P-AXIS, BOTH 1 AND 2 JETS FOR U AND V AXES), AND THE RECIPROCAL COAST ACCELERATIONS ABOUT
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:52
//# 	THE P, U, AND V AXES.  THE ACCELERATION FUNCTIONS (ACCFCTZ1 AND ACCFCTZ5) ARE ALSO COMPUTED FOR THESE AXES.  THE
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:53
//# 	FIRE AND COAST DEADBANDS AND AXISDIST ARE COMPUTED FOR EACH AXIS.  FLAT AND ZONE3LIM, THE WIDTH AND HEIGHT OF THE
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:54
//# 	MINIMUM IMPULSE ZONE, ARE COMPUTED.  1/ACCONT ALSO SETS ACCSWU AND ACCSWV, WHICH INDICATE WHEN 1 JET ACCELERATION
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:55
//#	IS NOT SUFFICIENT TO PRODUCE MINIMUM ACCELERATION.  AT THE COMPLETION OF 1/ACCS, THE ACCSOKAY BIT IS SET.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:56
//#
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:57
//# SUBROUTINES CALLED:
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:58
//#	TIMEGMBL
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:59
//#	MAKECADR
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:60
//#	ROT45DEG
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:61
//#
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:62
//# CALLING SEQUENCE:
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:63
//#		TC	BANKCALL	# (1/ACCS MUST BE CALLED BY BANKCALL)
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:64
//#		CADR	1/ACCS
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:65
//#
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:66
//# NORMAL EXIT:	VIA BANKJUMP
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:67
//#
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:68
//# ALARM AND EXIT MODES:  NONE
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:69
//#
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:70
//# INPUT/OUTPUT:  SEE PROGRAM DESCRIPTION.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:71
//#
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:72
//# DEBRIS:
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:73
//#	ALL OF THE EXECUTIVE TEMPORARY REGISTERS, EXCEPT FIXLOC AND OVFIND, AND THE CORE SET AREA FROM MPAC TO BANKSET.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:74
//#
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:75
//# RESTRICTIONS:
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:76
//#	1/ACCS MUST BE CALLED BY BANKCALL
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:77
//#	EBANK IS SET TO 6, BUT NOT RESTORED.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:78
//# Page 1486
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:79
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:80
//		BANK	20
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:81
//		SETLOC	DAPS3
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:82
//		BANK
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:83
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:84
//		COUNT*	$$/DAPAO
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:85
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:86
//		EBANK=	AOSQ
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:87
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:88
//# ENTRY IS THROUGH 1/ACCJOB OR 1/ACCSET WHEN 1/ACCS IS TO BE DONE AS A SEPARATE NOVAC JOB.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:89
//# IT IS POSSIBLE FOR MORE THAN ONE OF THESE JOBS TO BE SET UP CONCURRENTLY.  HOWEVER, SINCE THERE IS NO CHECK OF
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:90
//# NEWJOB, A SECOND MANIFESTATION CANNOT BE STARTED UNTIL THE FIRST IS COMPLETED.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:91
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:92
//1/ACCSET	CAF	ZERO		# ENTRY FROM FRESH START/RESTART CODING.
// PORT: Fixed ROM slots 18727.
            if slot <> 18727 or instruction <> 14829 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18728 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:93
//		TS	AOSQ		#	NULL THE OFFSET ESTIMATES FOR 1/ACCS.
// PORT: Fixed ROM slots 18728.
                if slot <> 18728 or instruction <> 23391 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23391, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:94
//		TS	AOSR
// PORT: Fixed ROM slots 18729.
                if slot <> 18729 or instruction <> 23393 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23393, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 18730 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:95
//		TS	ALPHAQ		#	NULL THE OFFSET ESTIMATES FOR DOWNLIST
// PORT: Fixed ROM slots 18730.
            if slot <> 18730 or instruction <> 23316 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23316, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18731 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:96
//		TS	ALPHAR
// PORT: Fixed ROM slots 18731.
                if slot <> 18731 or instruction <> 23317 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23317, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:97
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:98
//1/ACCJOB	TC	BANKCALL	# 1/ACCS ASSUMES ENTRY VIA BANKCALL.
// PORT: Fixed ROM slots 18732.
                if slot <> 18732 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1130] to agcAotUnit1130@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:99
//		CADR	1/ACCS 	+2	# SKIP EBANK SETTING.
// PORT: Fixed ROM slots 18733.
    18733, 33378
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18734–18792.
function agcAotUnit1131 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18762 {
        if slot <= 18747 {
            if slot <= 18740 {
                if slot <= 18736 {
                    if slot <= 18734 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:100
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:101
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 18734.
                        if slot <> 18734 or instruction <> 2669 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2669, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18735 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:102
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:103
//1/ACCS		CA	EBANK6		# ***** EBANK SET BUT NOT RESTORED *****
// PORT: Fixed ROM slots 18735.
                            if slot <> 18735 or instruction <> 14861 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:104
//		TS	EBANK
// PORT: Fixed ROM slots 18736.
                            if slot <> 18736 or instruction <> 22531 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22531, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18738 {
                        if slot <= 18737 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:105
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:106
//		TC	MAKECADR	# SAVE RETURN SO THAT BUF2 MAY BE USED
// PORT: Fixed ROM slots 18737.
                            if slot <> 18737 or instruction <> 2469 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2469, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:107
//		TS	ACCRETRN
// PORT: Fixed ROM slots 18738.
                            if slot <> 18738 or instruction <> 22607 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22607, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18739 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:108
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:109
//# DETERMINE MASS OF THE LEM.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:110
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:111
//		CA	DAPBOOLS	# IS THE CSM DOCKED
// PORT: Fixed ROM slots 18739.
                            if slot <> 18739 or instruction <> 12361 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 73).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:112
//		MASK	CSMDOCKD
// PORT: Fixed ROM slots 18740.
                            if slot <> 18740 or instruction <> 31199 { return choose false if checkOnly else -1. }
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
                    }
                }
            } else {
                if slot <= 18743 {
                    if slot <= 18741 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:113
//		TS	DOCKTEMP	# STORE RECORD OF STATE IN TEMP (MPAC +3).
// PORT: Fixed ROM slots 18741.
                        if slot <> 18741 or instruction <> 22639 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22639, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18742 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:114
//		CCS	A
// PORT: Fixed ROM slots 18742.
                            if slot <> 18742 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:115
//		CS	CSMMASS		#	DOCKED:  LEMMAS = MASS - CSMMASS
// PORT: Fixed ROM slots 18743.
                            if slot <> 18743 or instruction <> 17114 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 730).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18745 {
                        if slot <= 18744 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:116
//		AD	MASS		#	LEM ALONE:  LEMMASS = MASS
// PORT: Fixed ROM slots 18744.
                            if slot <> 18744 or instruction <> 25252 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 676).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:117
//		TS	LEMMASS
// PORT: Fixed ROM slots 18745.
                            if slot <> 18745 or instruction <> 23257 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23257, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18746 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:118
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:119
//# ON THE BASIS OF APSFLAG:
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:120
//#	SET THE P-AXIS RATE COMMAND LIMIT FOR 2-JET/2-JET CONTROL
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:121
//#	SET MPAC, WHICH INDICATES THE PROPER SET OF COEFFICIENTS FOR THE LEM-ALONE F(MASS) CALCULATIONS
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:122
//#	ENSURE THAT THE LEM MASS VALUE IS WITHIN THE ACCEPTABLE RANGE
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:123
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:124
//		INHINT
// PORT: Fixed ROM slots 18746.
                            if slot <> 18746 or instruction <> 4 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 4, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:125
//		CAE	FLGWRD10	# DETERMINE WHETHER STAGED.
// PORT: Fixed ROM slots 18747.
                            if slot <> 18747 or instruction <> 12358 { return choose false if checkOnly else -1. }
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
        } else {
            if slot <= 18754 {
                if slot <= 18750 {
                    if slot <= 18748 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:126
//		MASK	APSFLBIT
// PORT: Fixed ROM slots 18748.
                        if slot <> 18748 or instruction <> 31199 { return choose false if checkOnly else -1. }
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
                        if slot <= 18749 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:127
//		EXTEND
// PORT: Fixed ROM slots 18749.
                            if slot <> 18749 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:128
//		BZF	DPSFLITE
// PORT: Fixed ROM slots 18750.
                            if slot <> 18750 or instruction <> 5458 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5458, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18752 {
                        if slot <= 18751 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:129
//# Page 1487
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:130
//		CS	POSMAX		# ASCENT (OR ON LUNAR SURFACE)
// PORT: Fixed ROM slots 18751.
                            if slot <> 18751 or instruction <> 18907 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:131
//		TS	-2JETLIM	# ALWAYS 2 JETS FOR P-AXIS RATE COMMAND
// PORT: Fixed ROM slots 18752.
                            if slot <> 18752 or instruction <> 23357 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23357, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18753 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:132
//		CAF	OCT14		# INITIALIZE INDEX AT 12.
// PORT: Fixed ROM slots 18753.
                            if slot <> 18753 or instruction <> 15337 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 3049), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:133
//		TS	MPAC
// PORT: Fixed ROM slots 18754.
                            if slot <> 18754 or instruction <> 22636 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22636, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18758 {
                    if slot <= 18756 {
                        if slot <= 18755 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:134
//		CS	LEMMASS		# CHECK IF MASS TOO HIGH.  CATCH STAGING.
// PORT: Fixed ROM slots 18755.
                            if slot <> 18755 or instruction <> 17113 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 729).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:135
//		AD	HIASCENT
// PORT: Fixed ROM slots 18756.
                            if slot <> 18756 or instruction <> 25344 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 768).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18757 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:136
//		EXTEND
// PORT: Fixed ROM slots 18757.
                            if slot <> 18757 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:137
//		BZMF	MASSFIX
// PORT: Fixed ROM slots 18758.
                            if slot <> 18758 or instruction <> 25931 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 25931, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18760 {
                        if slot <= 18759 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:138
//		CS	LEMMASS		# CHECK IF MASS TOO LOW.  THIS LIMITS THE
// PORT: Fixed ROM slots 18759.
                            if slot <> 18759 or instruction <> 17113 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 729).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:139
//		AD	LOASCENT	#	DECREMENTING BY MASSMON.
// PORT: Fixed ROM slots 18760.
                            if slot <> 18760 or instruction <> 25601 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1025), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18761 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:140
//		EXTEND
// PORT: Fixed ROM slots 18761.
                            if slot <> 18761 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:141
//		BZMF	F(MASS)
// PORT: Fixed ROM slots 18762.
                            if slot <> 18762 or instruction <> 25952 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 25952, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 18777 {
            if slot <= 18769 {
                if slot <= 18765 {
                    if slot <= 18763 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:142
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:143
//MASSFIX		ADS	LEMMASS		# STORE THE VIOLATED LIMIT AS LEMMASS.
// PORT: Fixed ROM slots 18763.
                        if slot <> 18763 or instruction <> 11993 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 729).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18764 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:144
//		ZL			#	ALSO CORRECT TOTAL MASS, ZEROING THE
// PORT: Fixed ROM slots 18764.
                            if slot <> 18764 or instruction <> 9223 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 7, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:145
//		CCS	DOCKTEMP	#	LOW-ORDER WORD.
// PORT: Fixed ROM slots 18765.
                            if slot <> 18765 or instruction <> 4207 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 111).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18767 {
                        if slot <= 18766 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:146
//		CAE	CSMMASS		#		DOCKED:  MASS = LEMMASS + CSMMASS
// PORT: Fixed ROM slots 18766.
                            if slot <> 18766 or instruction <> 13018 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 730).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:147
//		AD	LEMMASS		#		LEM ALONE:  MASS = LEMMASS
// PORT: Fixed ROM slots 18767.
                            if slot <> 18767 or instruction <> 25305 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 729).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18768 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:148
//		DXCH	MASS
// PORT: Fixed ROM slots 18768.
                            if slot <> 18768 or instruction <> 22181 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 677, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:149
//		TCF	F(MASS)
// PORT: Fixed ROM slots 18769.
                            if slot <> 18769 or instruction <> 5472 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5472, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18773 {
                    if slot <= 18771 {
                        if slot <= 18770 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:150
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:151
//DPSFLITE	CS	BIT10		# FOUR JETS FOR P-AXIS RATE COMMAND ERRORS
// PORT: Fixed ROM slots 18770.
                            if slot <> 18770 or instruction <> 18914 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:152
//		TS	-2JETLIM	#	EXCEEDING 1.4 DEG/SEC (SCALED AT 45)
// PORT: Fixed ROM slots 18771.
                            if slot <> 18771 or instruction <> 23357 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23357, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18772 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:153
//		CAF	SIX		# INITIALIZE INDEX AT 6.
// PORT: Fixed ROM slots 18772.
                            if slot <> 18772 or instruction <> 15522 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 3234), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:154
//		TS	MPAC
// PORT: Fixed ROM slots 18773.
                            if slot <> 18773 or instruction <> 22636 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22636, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18775 {
                        if slot <= 18774 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:155
//		CS	LEMMASS		# CHECK IF MASS TOO HIGH.  SHOULD NEVER
// PORT: Fixed ROM slots 18774.
                            if slot <> 18774 or instruction <> 17113 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 729).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:156
//		AD	HIDESCNT	# 	OCCUR EXCEPT PERHAPS BEFORE THE PAD
// PORT: Fixed ROM slots 18775.
                            if slot <> 18775 or instruction <> 25602 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1026), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18776 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:157
//		EXTEND			#	LOAD IS DONE.
// PORT: Fixed ROM slots 18776.
                            if slot <> 18776 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:158
//		BZMF	MASSFIX
// PORT: Fixed ROM slots 18777.
                            if slot <> 18777 or instruction <> 25931 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 25931, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 18784 {
                if slot <= 18780 {
                    if slot <= 18778 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:159
//		CS	LEMMASS		# CHECK IF MASS TOO LOW.  THIS LIMITS THE
// PORT: Fixed ROM slots 18778.
                        if slot <> 18778 or instruction <> 17113 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 729).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18779 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:160
//		AD	LODESCNT	#	DECREMENTING BY MASSMON.
// PORT: Fixed ROM slots 18779.
                            if slot <> 18779 or instruction <> 25603 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1027), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:161
//		AD	HIASCENT
// PORT: Fixed ROM slots 18780.
                            if slot <> 18780 or instruction <> 25344 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 768).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18782 {
                        if slot <= 18781 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:162
//		EXTEND
// PORT: Fixed ROM slots 18781.
                            if slot <> 18781 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:163
//		BZMF	F(MASS)
// PORT: Fixed ROM slots 18782.
                            if slot <> 18782 or instruction <> 25952 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 25952, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18783 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:164
//		TCF	MASSFIX
// PORT: Fixed ROM slots 18783.
                            if slot <> 18783 or instruction <> 5451 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5451, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:165
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:166
//# COMPUTATION OF FUNCTIONS OF MASS
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:167
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:168
//F(MASS)		RELINT
// PORT: Fixed ROM slots 18784.
                            if slot <> 18784 or instruction <> 3 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18788 {
                    if slot <= 18786 {
                        if slot <= 18785 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:169
//		CCS	DOCKTEMP
// PORT: Fixed ROM slots 18785.
                            if slot <> 18785 or instruction <> 4207 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 111).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:170
//		TCF	DOCKED		# DOCKED:  USE SEPARATE COMPUTATION.
// PORT: Fixed ROM slots 18786.
                            if slot <> 18786 or instruction <> 5701 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5701, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18787 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:171
//		CA	TWO
// PORT: Fixed ROM slots 18787.
                            if slot <> 18787 or instruction <> 14826 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:172
//STCTR		TS	MPAC 	+1	# J=2,1,0 FOR 1JACCR,1JACCQ,1JACC
// PORT: Fixed ROM slots 18788.
                            if slot <> 18788 or instruction <> 22637 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22637, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18790 {
                        if slot <= 18789 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:173
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:174
//		CS	TWO
// PORT: Fixed ROM slots 18789.
                            if slot <> 18789 or instruction <> 18922 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:175
//		ADS	MPAC		# JX=10,8,6 OR 4,2,0 TO INDEX COEFS.
// PORT: Fixed ROM slots 18790.
                            if slot <> 18790 or instruction <> 11372 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 108).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18791 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:176
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:177
//STCTR1		CAE	LEMMASS
// PORT: Fixed ROM slots 18791.
                            if slot <> 18791 or instruction <> 13017 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 729).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:178
//		INDEX	MPAC
// PORT: Fixed ROM slots 18792.
                            if slot <> 18792 or instruction <> 20588 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 20588, words[0], readEffective).
                            }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 20588, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1131] to agcAotUnit1131@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:179
//		AD	INERCONC
// PORT: Fixed ROM slots 18793.
    18793, 52320
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18794–18796.
function agcAotUnit1132 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18794 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:180
//		TS	MPAC 	+2	# MASS + C
// PORT: Fixed ROM slots 18794.
        if slot <> 18794 or instruction <> 22638 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22638, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 18795 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:181
//# Page 1488
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:182
//		EXTEND
// PORT: Fixed ROM slots 18795.
            if slot <> 18795 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:183
//		INDEX	MPAC
// PORT: Fixed ROM slots 18796.
            if slot <> 18796 or instruction <> 20588 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20588, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20588, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1132] to agcAotUnit1132@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:184
//		DCA	INERCONA
// PORT: Fixed ROM slots 18797.
    18797, 27716
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18798–18800.
function agcAotUnit1133 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18798 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:185
//		EXTEND
// PORT: Fixed ROM slots 18798.
        if slot <> 18798 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 18799 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:186
//		DV	MPAC 	+2
// PORT: Fixed ROM slots 18799.
            if slot <> 18799 or instruction <> 4206 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreDv(words, 110, readEffective:call(words, 110)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:187
//		INDEX	MPAC
// PORT: Fixed ROM slots 18800.
            if slot <> 18800 or instruction <> 20588 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20588, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20588, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1133] to agcAotUnit1133@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:188
//		AD	INERCONB
// PORT: Fixed ROM slots 18801.
    18801, 52318
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18802–18802.
function agcAotUnit1134 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:189
//		INDEX	MPAC 	+1	# 1JACC(J)=A(JX)/(MASS+C(JX) + B(JX)
// PORT: Fixed ROM slots 18802.
    if slot <> 18802 or instruction <> 20589 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1134] to agcAotUnit1134@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:190
//		TS	1JACC		# 1JACC(-1)=L,PVT-CG  SCALED AT 8 FEET
// PORT: Fixed ROM slots 18803.
    18803, 46768
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18804–18859.
function agcAotUnit1135 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18831 {
        if slot <= 18817 {
            if slot <= 18810 {
                if slot <= 18806 {
                    if slot <= 18804 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:191
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:192
//		CCS	MPAC 	+1
// PORT: Fixed ROM slots 18804.
                        if slot <> 18804 or instruction <> 4205 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 109).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18805 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:193
//		TCF	STCTR
// PORT: Fixed ROM slots 18805.
                            if slot <> 18805 or instruction <> 5476 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5476, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:194
//		TCF	COMMEQS
// PORT: Fixed ROM slots 18806.
                            if slot <> 18806 or instruction <> 5496 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5496, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18808 {
                        if slot <= 18807 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:195
//		TCF	LRESC
// PORT: Fixed ROM slots 18807.
                            if slot <> 18807 or instruction <> 5559 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5559, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:196
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:197
//# COEFFQ AND COEFFR ARE COMPUTED IN THIS SECTION.  THEY ARE USED TO RESOLVE Q-R COMPONENTS INTO NON-ORTHOGONAL
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:198
//# U AND V COMPONENTS (SEE ROT-TOUV SECTION).
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:199
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:200
//COMMEQS		CS	1JACCR
// PORT: Fixed ROM slots 18808.
                            if slot <> 18808 or instruction <> 17242 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 858).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18809 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:201
//		AD	1JACCQ
// PORT: Fixed ROM slots 18809.
                            if slot <> 18809 or instruction <> 25433 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 857).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:202
//		EXTEND
// PORT: Fixed ROM slots 18810.
                            if slot <> 18810 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18813 {
                    if slot <= 18811 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:203
//		BZMF	BIGIQ
// PORT: Fixed ROM slots 18811.
                        if slot <> 18811 or instruction <> 25999 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 25999, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18812 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:204
//		EXTEND			# EPSILON IS A MEASURE OF COUPLING AND IS
// PORT: Fixed ROM slots 18812.
                            if slot <> 18812 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:205
//		DV	1JACCQ		# DEFINED=1-IQ/IR FOR IR GREATER THAN IQ.
// PORT: Fixed ROM slots 18813.
                            if slot <> 18813 or instruction <> 4953 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreDv(words, 857, readEffective:call(words, 857)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18815 {
                        if slot <= 18814 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:206
//		TS	EPSILON		# THE COMPUTED EXPRESSION IS EQUIVALENT
// PORT: Fixed ROM slots 18814.
                            if slot <> 18814 or instruction <> 22637 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22637, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:207
//		AD	-EPSMAX
// PORT: Fixed ROM slots 18815.
                            if slot <> 18815 or instruction <> 26180 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1604), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18816 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:208
//		EXTEND
// PORT: Fixed ROM slots 18816.
                            if slot <> 18816 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:209
//		BZMF	GOODEPS1
// PORT: Fixed ROM slots 18817.
                            if slot <> 18817 or instruction <> 25988 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 25988, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 18824 {
                if slot <= 18820 {
                    if slot <= 18818 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:210
//		CS	-EPSMAX
// PORT: Fixed ROM slots 18818.
                        if slot <> 18818 or instruction <> 17988 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 1604), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18819 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:211
//		TS	EPSILON		# EPSILON IS LIMITED TO A MAX. OF .42265
// PORT: Fixed ROM slots 18819.
                            if slot <> 18819 or instruction <> 22637 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22637, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:212
//GOODEPS1	CA	EPSILON
// PORT: Fixed ROM slots 18820.
                            if slot <> 18820 or instruction <> 12397 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 109).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18822 {
                        if slot <= 18821 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:213
//		EXTEND
// PORT: Fixed ROM slots 18821.
                            if slot <> 18821 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:214
//		MP	0.35356
// PORT: Fixed ROM slots 18822.
                            if slot <> 18822 or instruction <> 30272 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 1600, readEffective:call(words, 1600)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18823 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:215
//		AD	.7071
// PORT: Fixed ROM slots 18823.
                            if slot <> 18823 or instruction <> 26178 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1602), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:216
//		TS	COEFFR		# IN THIS CASE WHERE IR IS GREATER THAN
// PORT: Fixed ROM slots 18824.
                            if slot <> 18824 or instruction <> 23448 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23448, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18827 {
                    if slot <= 18825 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:217
//		CS	POSMAX		# IQ, COEFFQ=-.707(1+.5EPSILON)(1-EPSILON)
// PORT: Fixed ROM slots 18825.
                        if slot <> 18825 or instruction <> 18907 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18826 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:218
//		AD	EPSILON		# AND COEFFR=.707(1+.5EPSILON)
// PORT: Fixed ROM slots 18826.
                            if slot <> 18826 or instruction <> 24685 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 109).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:219
//		EXTEND
// PORT: Fixed ROM slots 18827.
                            if slot <> 18827 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18829 {
                        if slot <= 18828 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:220
//		MP	COEFFR
// PORT: Fixed ROM slots 18828.
                            if slot <> 18828 or instruction <> 29592 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 920, readEffective:call(words, 920)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:221
//		TS	COEFFQ
// PORT: Fixed ROM slots 18829.
                            if slot <> 18829 or instruction <> 23447 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23447, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18830 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:222
//		TCF	JACCUV
// PORT: Fixed ROM slots 18830.
                            if slot <> 18830 or instruction <> 5538 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5538, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:223
//BIGIQ		EXTEND			# EPSILON IS DEFINED AS 1-IR/IQ FOR IQ
// PORT: Fixed ROM slots 18831.
                            if slot <> 18831 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 18845 {
            if slot <= 18838 {
                if slot <= 18834 {
                    if slot <= 18832 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:224
//		DV	1JACCR		# GREATER THAN IR.  -EPSILON IS COMPUTED
// PORT: Fixed ROM slots 18832.
                        if slot <> 18832 or instruction <> 4954 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreDv(words, 858, readEffective:call(words, 858)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18833 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:225
//		TS	-EPSILON	# RATHER THAN EPSILON FOR CONVENIENCE
// PORT: Fixed ROM slots 18833.
                            if slot <> 18833 or instruction <> 22637 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22637, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:226
//		CS	-EPSILON
// PORT: Fixed ROM slots 18834.
                            if slot <> 18834 or instruction <> 16493 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 109).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18836 {
                        if slot <= 18835 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:227
//		AD	-EPSMAX
// PORT: Fixed ROM slots 18835.
                            if slot <> 18835 or instruction <> 26180 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1604), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:228
//		EXTEND
// PORT: Fixed ROM slots 18836.
                            if slot <> 18836 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18837 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:229
//		BZMF	GOODEPS2
// PORT: Fixed ROM slots 18837.
                            if slot <> 18837 or instruction <> 26008 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 26008, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:230
//		CA	-EPSMAX
// PORT: Fixed ROM slots 18838.
                            if slot <> 18838 or instruction <> 13892 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1604), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18841 {
                    if slot <= 18839 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:231
//		TS	-EPSILON	# EPSILON IS LIMITED TO A MAX. OF .42265
// PORT: Fixed ROM slots 18839.
                        if slot <> 18839 or instruction <> 22637 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22637, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18840 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:232
//# Page 1489
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:233
//GOODEPS2	CA	-EPSILON
// PORT: Fixed ROM slots 18840.
                            if slot <> 18840 or instruction <> 12397 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 109).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:234
//		EXTEND
// PORT: Fixed ROM slots 18841.
                            if slot <> 18841 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18843 {
                        if slot <= 18842 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:235
//		MP	0.35356
// PORT: Fixed ROM slots 18842.
                            if slot <> 18842 or instruction <> 30272 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 1600, readEffective:call(words, 1600)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:236
//		AD	-.7071
// PORT: Fixed ROM slots 18843.
                            if slot <> 18843 or instruction <> 26179 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1603), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18844 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:237
//		TS	COEFFQ		# IN THIS CASE WHERE IQ IS GREATER THAN
// PORT: Fixed ROM slots 18844.
                            if slot <> 18844 or instruction <> 23447 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23447, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:238
//		CS	-EPSILON	# IR, COEFFQ=-.707(1+.5EPSILON) AND
// PORT: Fixed ROM slots 18845.
                            if slot <> 18845 or instruction <> 16493 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 109).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 18852 {
                if slot <= 18848 {
                    if slot <= 18846 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:239
//		AD	NEGMAX		# COEFFR=.707(1+.5EPSILON)(1-EPSILON)
// PORT: Fixed ROM slots 18846.
                        if slot <> 18846 or instruction <> 27101 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18847 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:240
//		EXTEND
// PORT: Fixed ROM slots 18847.
                            if slot <> 18847 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:241
//		MP	COEFFQ
// PORT: Fixed ROM slots 18848.
                            if slot <> 18848 or instruction <> 29591 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 919, readEffective:call(words, 919)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18850 {
                        if slot <= 18849 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:242
//		TS	COEFFR
// PORT: Fixed ROM slots 18849.
                            if slot <> 18849 or instruction <> 23448 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23448, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:243
//JACCUV		CS	COEFFQ
// PORT: Fixed ROM slots 18850.
                            if slot <> 18850 or instruction <> 17303 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 919).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18851 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:244
//		EXTEND
// PORT: Fixed ROM slots 18851.
                            if slot <> 18851 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:245
//		MP	1JACCQ		# 1JACCQ IS SCALED AT PI/4
// PORT: Fixed ROM slots 18852.
                            if slot <> 18852 or instruction <> 29529 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 857, readEffective:call(words, 857)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18855 {
                    if slot <= 18853 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:246
//		TS	1JACCU		# 1JACCU USED AS TEMPORARY STORAGE
// PORT: Fixed ROM slots 18853.
                        if slot <> 18853 or instruction <> 23387 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23387, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18854 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:247
//		CA	COEFFR
// PORT: Fixed ROM slots 18854.
                            if slot <> 18854 or instruction <> 13208 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 920).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:248
//		EXTEND
// PORT: Fixed ROM slots 18855.
                            if slot <> 18855 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18857 {
                        if slot <= 18856 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:249
//		MP	1JACCR
// PORT: Fixed ROM slots 18856.
                            if slot <> 18856 or instruction <> 29530 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 858, readEffective:call(words, 858)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:250
//		AD	1JACCU
// PORT: Fixed ROM slots 18857.
                            if slot <> 18857 or instruction <> 25435 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 859).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18858 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:251
//		EXTEND
// PORT: Fixed ROM slots 18858.
                            if slot <> 18858 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:252
//		MP	BIT14		# SCALING CHANGED FROM PI/4 TO PI/2
// PORT: Fixed ROM slots 18859.
                            if slot <> 18859 or instruction <> 31198 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2526, readEffective:call(words, 2526)).
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
set agcAotRoutes[1135] to agcAotUnit1135@.

// PORT: Physical bank 20. Shared continuation entries, slots 18860–18874.
function agcAotUnit1136 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18866 {
        if slot <= 18862 {
            if slot <= 18860 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:253
//		TS	1JACCU
// PORT: Fixed ROM slots 18860.
                if slot <> 18860 or instruction <> 23387 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23387, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18861 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:254
//		TS	1JACCV		# SCALED AT PI/2 RADIANS/SEC(2)
// PORT: Fixed ROM slots 18861.
                    if slot <> 18861 or instruction <> 23388 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23388, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:255
//		CCS	MPAC		# COMPUTE L,PVT-CG IF IN DESCENT
// PORT: Fixed ROM slots 18862.
                    if slot <> 18862 or instruction <> 4204 { return choose false if checkOnly else -1. }
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
            if slot <= 18864 {
                if slot <= 18863 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:256
//		CAF	ZERO		# ZERO SWITCHES AND GO TO 1/ACCONT IN
// PORT: Fixed ROM slots 18863.
                    if slot <> 18863 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:257
//		TS	ALLOWGTS	#	ASCENT
// PORT: Fixed ROM slots 18864.
                    if slot <> 18864 or instruction <> 23362 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23362, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18865 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:258
//		TCF	1/ACCONT -1
// PORT: Fixed ROM slots 18865.
                    if slot <> 18865 or instruction <> 5784 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5784, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:259
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:260
//		CS	TWO
// PORT: Fixed ROM slots 18866.
                    if slot <> 18866 or instruction <> 18922 { return choose false if checkOnly else -1. }
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
    } else {
        if slot <= 18870 {
            if slot <= 18868 {
                if slot <= 18867 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:261
//		TS	MPAC
// PORT: Fixed ROM slots 18867.
                    if slot <> 18867 or instruction <> 22636 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22636, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:262
//		CS	ONE
// PORT: Fixed ROM slots 18868.
                    if slot <> 18868 or instruction <> 18923 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18869 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:263
//		TS	MPAC 	+1
// PORT: Fixed ROM slots 18869.
                    if slot <> 18869 or instruction <> 22637 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22637, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:264
//		TCF	STCTR1
// PORT: Fixed ROM slots 18870.
                    if slot <> 18870 or instruction <> 5479 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5479, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 18872 {
                if slot <= 18871 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:265
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:266
//# THIS SECTION COMPUTES THE RATE OF CHANGE OF ACCELERATION DUE TO THE ROTATION OF THE GIMBALS.  THE EQUATION
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:267
//# IMPLEMENTED IN BOTH THE Y-X PLANE AND THE Z-X PLANE IS -- D(ALPHA)/DT = TL/I*D(DELTA)/DT, WHERE
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:268
//#	T = ENGINE THRUST FORCE
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:269
//#	L = PIVOT TO CG DISTANCE OF ENGINE
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:270
//#	I = MOMENT OF INERTIA
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:271
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:272
//LRESC		CAE	ABDELV		# SCALED AT 2(13) CM/SEC(2)
// PORT: Fixed ROM slots 18871.
                    if slot <> 18871 or instruction <> 12966 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 678).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:273
//		EXTEND
// PORT: Fixed ROM slots 18872.
                    if slot <> 18872 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18873 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:274
//		MP	MASS		# SCALED AT B+16 KGS
// PORT: Fixed ROM slots 18873.
                    if slot <> 18873 or instruction <> 29348 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 676, readEffective:call(words, 676)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:275
//		TC	DVOVSUB		# GET QUOTIENT WITH OVERFLOW PROTECTION
// PORT: Fixed ROM slots 18874.
                    if slot <> 18874 or instruction <> 1534 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1534, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1136] to agcAotUnit1136@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:276
//		ADRES	GFACTM
// PORT: Fixed ROM slots 18875.
    18875, 3202
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18876–18882.
function agcAotUnit1137 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18878 {
        if slot <= 18876 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:277
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:278
//# MASS IS DIVIDED BY ACCELERATION OF GRAVITY IN ORDER TO MATCH THE UNITS OF IXX,IYY,IZZ, WHICH ARE SLUG-FT(2).
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:279
//# THE RATIO OF ACCELERATION FROM PIPAS TO ACCELERATION OF GRAVITY IS THE SAME IN METRIC OR ENGINEERING UNITS, SO
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:280
//# THAT IS UNCONVERTED.  2.20462 CONVERTS KG. TO LB.  NOW T IN IN A SCALED AT 2(14).
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:281
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:282
//		EXTEND
// PORT: Fixed ROM slots 18876.
            if slot <> 18876 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18877 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:283
//		MP	L,PVT-CG	# SCALED AT 8 FEET.
// PORT: Fixed ROM slots 18877.
                if slot <> 18877 or instruction <> 29527 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 855, readEffective:call(words, 855)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:284
//# Page 1490
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:285
//		INHINT
// PORT: Fixed ROM slots 18878.
                if slot <> 18878 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 18880 {
            if slot <= 18879 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:286
//		TS	MPAC
// PORT: Fixed ROM slots 18879.
                if slot <> 18879 or instruction <> 22636 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22636, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:287
//		EXTEND
// PORT: Fixed ROM slots 18880.
                if slot <> 18880 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18881 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:288
//		MP	1JACCR
// PORT: Fixed ROM slots 18881.
                if slot <> 18881 or instruction <> 29530 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 858, readEffective:call(words, 858)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:289
//		TC	DVOVSUB		# GET QUOTIENT WITH OVERFLOW PROTECTION
// PORT: Fixed ROM slots 18882.
                if slot <> 18882 or instruction <> 1534 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1534, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1137] to agcAotUnit1137@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:290
//		ADRES	TORKJET1
// PORT: Fixed ROM slots 18883.
    18883, 2048
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18884–18888.
function agcAotUnit1138 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18885 {
        if slot <= 18884 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:291
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:292
//		TS	ACCDOTR		# SCALED AT PI/2(7)
// PORT: Fixed ROM slots 18884.
            if slot <> 18884 or instruction <> 23369 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23369, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:293
//		CA	MPAC
// PORT: Fixed ROM slots 18885.
            if slot <> 18885 or instruction <> 12396 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 108).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 18886 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:294
//		EXTEND
// PORT: Fixed ROM slots 18886.
            if slot <> 18886 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18887 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:295
//		MP	1JACCQ
// PORT: Fixed ROM slots 18887.
                if slot <> 18887 or instruction <> 29529 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 857, readEffective:call(words, 857)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:296
//		TC	DVOVSUB		# GET QUOTIENT WITH OVERFLOW PROTECTION
// PORT: Fixed ROM slots 18888.
                if slot <> 18888 or instruction <> 1534 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1534, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1138] to agcAotUnit1138@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:297
//		ADRES	TORKJET1
// PORT: Fixed ROM slots 18889.
    18889, 2048
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18890–18906.
function agcAotUnit1139 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18897 {
        if slot <= 18893 {
            if slot <= 18891 {
                if slot <= 18890 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:298
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:299
//SPSCONT		TS	ACCDOTQ		# SCALED AT PI/2(7)
// PORT: Fixed ROM slots 18890.
                    if slot <> 18890 or instruction <> 23367 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23367, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:300
//		EXTEND
// PORT: Fixed ROM slots 18891.
                    if slot <> 18891 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18892 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:301
//		MP	DGBF		# .3ACCDOTQ SCALED AT PI/2(8)
// PORT: Fixed ROM slots 18892.
                    if slot <> 18892 or instruction <> 30271 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 1599, readEffective:call(words, 1599)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:302
//		TS	KQ
// PORT: Fixed ROM slots 18893.
                    if slot <> 18893 or instruction <> 23364 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23364, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 18895 {
                if slot <= 18894 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:303
//		CAE	ACCDOTR		# .3ACCDOTR AT PI/2(8)
// PORT: Fixed ROM slots 18894.
                    if slot <> 18894 or instruction <> 13129 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 841).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:304
//		EXTEND
// PORT: Fixed ROM slots 18895.
                    if slot <> 18895 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18896 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:305
//		MP	DGBF
// PORT: Fixed ROM slots 18896.
                    if slot <> 18896 or instruction <> 30271 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 1599, readEffective:call(words, 1599)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:306
//		TS	KRDAP
// PORT: Fixed ROM slots 18897.
                    if slot <> 18897 or instruction <> 23366 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23366, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 18901 {
            if slot <= 18899 {
                if slot <= 18898 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:307
//		EXTEND			# NOW COMPUTE QACCDOT, RACCDOT, THE SIGNED
// PORT: Fixed ROM slots 18898.
                    if slot <> 18898 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:308
//		READ	CHAN12		# JERK TERMS.  STORE CHANNEL 12. WITH GIMBAL
// PORT: Fixed ROM slots 18899.
                    if slot <> 18899 or instruction <> 10 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 0, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18900 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:309
//		TS	MPAC 	+1	# DRIVE BITS 9 THROUGH 12 SET LOOP
// PORT: Fixed ROM slots 18900.
                    if slot <> 18900 or instruction <> 22637 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22637, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:310
//		CAF	BIT2		# INDEX TO COMPUTE RACCDOT, THEN QACCDOT.
// PORT: Fixed ROM slots 18901.
                    if slot <> 18901 or instruction <> 14826 { return choose false if checkOnly else -1. }
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
        } else {
            if slot <= 18903 {
                if slot <= 18902 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:311
//		TCF	LOOP3
// PORT: Fixed ROM slots 18902.
                    if slot <> 18902 or instruction <> 5592 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5592, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:312
//		CAF	ZERO		# ACCDOTQ AND ACCDOTR ARE NOT NEGATIVE,
// PORT: Fixed ROM slots 18903.
                    if slot <> 18903 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
                if slot <= 18904 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:313
//LOOP3		TS	MPAC		# BECAUSE THEY ARE MAGNITUDES
// PORT: Fixed ROM slots 18904.
                    if slot <> 18904 or instruction <> 22636 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22636, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18905 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:314
//		CA	MPAC 	+1
// PORT: Fixed ROM slots 18905.
                        if slot <> 18905 or instruction <> 12397 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 109).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:315
//		INDEX	MPAC		# MASK CHANNEL IMAGE FOR ANY GIMBAL MOTION
// PORT: Fixed ROM slots 18906.
                        if slot <> 18906 or instruction <> 20588 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20588, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20588, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1139] to agcAotUnit1139@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:316
//		MASK	GIMBLBTS
// PORT: Fixed ROM slots 18907.
    18907, 60534
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18908–18911.
function agcAotUnit1140 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18909 {
        if slot <= 18908 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:317
//		EXTEND
// PORT: Fixed ROM slots 18908.
            if slot <> 18908 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:318
//		BZF	ZACCDOT		# IF NONE, Q(R)ACCDOT IS ZERO.
// PORT: Fixed ROM slots 18909.
            if slot <> 18909 or instruction <> 5609 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5609, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 18910 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:319
//		CA	MPAC 	+1
// PORT: Fixed ROM slots 18910.
            if slot <> 18910 or instruction <> 12397 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 109).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:320
//		INDEX	MPAC		# GIMBAL IS MOVING.  IS ROTATION POSITIVE.
// PORT: Fixed ROM slots 18911.
            if slot <> 18911 or instruction <> 20588 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20588, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20588, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1140] to agcAotUnit1140@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:321
//		MASK	GIMBLBTS +1
// PORT: Fixed ROM slots 18912.
    18912, 60536
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18913–18915.
function agcAotUnit1141 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18913 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:322
//		EXTEND
// PORT: Fixed ROM slots 18913.
        if slot <> 18913 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 18914 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:323
//		BZF	FRSTZERO	# IF NOT POSITIVE, BRANCH
// PORT: Fixed ROM slots 18914.
            if slot <> 18914 or instruction <> 5606 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5606, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:324
//		INDEX	MPAC		# POSITIVE ROTATION, NEGATIVE Q(R)ACCDOT.
// PORT: Fixed ROM slots 18915.
            if slot <> 18915 or instruction <> 20588 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20588, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20588, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1141] to agcAotUnit1141@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:325
//		CS	ACCDOTQ
// PORT: Fixed ROM slots 18916.
    18916, 34446
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18917–18918.
function agcAotUnit1142 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18917 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:326
//		TCF	STACCDOT
// PORT: Fixed ROM slots 18917.
        if slot <> 18917 or instruction <> 5610 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5610, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:327
//FRSTZERO	INDEX	MPAC		# NEGATIVE ROTATION, POSITIVE Q(R)ACCDOT.
// PORT: Fixed ROM slots 18918.
        if slot <> 18918 or instruction <> 20588 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20588, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20588, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1142] to agcAotUnit1142@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:328
//		CA	ACCDOTQ
// PORT: Fixed ROM slots 18919.
    18919, 26254
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18920–18922.
function agcAotUnit1143 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18920 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:329
//		TCF	STACCDOT
// PORT: Fixed ROM slots 18920.
        if slot <> 18920 or instruction <> 5610 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5610, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 18921 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:330
//ZACCDOT		CAF	ZERO
// PORT: Fixed ROM slots 18921.
            if slot <> 18921 or instruction <> 14829 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:331
//STACCDOT	INDEX	MPAC
// PORT: Fixed ROM slots 18922.
            if slot <> 18922 or instruction <> 20588 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20588, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20588, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1143] to agcAotUnit1143@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:332
//		TS	QACCDOT		# STORE Q(R)ACCDOT.
// PORT: Fixed ROM slots 18923.
    18923, 46736
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18924–18937.
function agcAotUnit1144 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18930 {
        if slot <= 18926 {
            if slot <= 18924 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:333
//		CCS	MPAC
// PORT: Fixed ROM slots 18924.
                if slot <> 18924 or instruction <> 4204 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 108).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18925 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:334
//		TCF	LOOP3 	-1	# NOW DO QACCDOT.
// PORT: Fixed ROM slots 18925.
                    if slot <> 18925 or instruction <> 5591 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5591, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:335
//# Page 1491
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:336
//		CS	DAPBOOLS	# IS GIMBAL USABLE?
// PORT: Fixed ROM slots 18926.
                    if slot <> 18926 or instruction <> 16457 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 73).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 18928 {
                if slot <= 18927 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:337
//		MASK	USEQRJTS
// PORT: Fixed ROM slots 18927.
                    if slot <> 18927 or instruction <> 31198 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:338
//		EXTEND
// PORT: Fixed ROM slots 18928.
                    if slot <> 18928 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18929 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:339
//		BZF	DOWNGTS		# NO. BE SURE THE GIMBAL SWITCHES ARE DOWN
// PORT: Fixed ROM slots 18929.
                    if slot <> 18929 or instruction <> 6086 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6086, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:340
//		CS	T5ADR		# YES.  IS THE DAP RUNNINT?
// PORT: Fixed ROM slots 18930.
                    if slot <> 18930 or instruction <> 17084 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 700).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 18933 {
            if slot <= 18931 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:341
//		AD	PAXISADR
// PORT: Fixed ROM slots 18931.
                if slot <> 18931 or instruction <> 26613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2037), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18932 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:342
//		EXTEND
// PORT: Fixed ROM slots 18932.
                    if slot <> 18932 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:343
//		BZF	+2
// PORT: Fixed ROM slots 18933.
                    if slot <> 18933 or instruction <> 5623 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5623, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 18935 {
                if slot <= 18934 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:344
//		TCF	DOWNGTS		# NO. BE SURE THE GIMBAL SWITCHES ARE DOWN
// PORT: Fixed ROM slots 18934.
                    if slot <> 18934 or instruction <> 6086 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6086, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:345
//		CCS	INGTS		# YES.  IS GTS IN CONTROL?
// PORT: Fixed ROM slots 18935.
                    if slot <> 18935 or instruction <> 5019 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 923).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18936 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:346
//		TCF	DOCKTEST	# YES.  PROCEED WITH 1/ACCS.
// PORT: Fixed ROM slots 18936.
                    if slot <> 18936 or instruction <> 5627 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5627, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:347
//		TC	IBNKCALL	# NO. NULL OFFSET AND FIND ALLOWGTS
// PORT: Fixed ROM slots 18937.
                    if slot <> 18937 or instruction <> 2492 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2492, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1144] to agcAotUnit1144@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:348
//		CADR	TIMEGMBL
// PORT: Fixed ROM slots 18938.
    18938, 36272
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18939–18944.
function agcAotUnit1145 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18941 {
        if slot <= 18939 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:349
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:350
//DOCKTEST	CCS	DOCKTEMP	# BYPASS 1/ACCONT WHEN DOCKED.
// PORT: Fixed ROM slots 18939.
            if slot <> 18939 or instruction <> 4207 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 111).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18940 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:351
//		TCF	1/ACCRET
// PORT: Fixed ROM slots 18940.
                if slot <> 18940 or instruction <> 6073 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6073, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:352
//		TCF	1/ACCONT
// PORT: Fixed ROM slots 18941.
                if slot <> 18941 or instruction <> 5785 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5785, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 18942 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:353
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:354
//# Page 1492
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:355
//# SUBROUTINE:	DVOVSUB
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:356
//# AUTHOR:	C. WORK, MOD 0, 12 JUNE 68
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:357
//# PURPOSE:	THIS SUBROUTINE PROVIDES A SINGLE-PRECISION MACHINE LANGUAGE DIVISION OPERATION WHICH RETURNS
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:358
//#		(1) THE QUOTIENT, IF THE DIVISION WAS NORMAL.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:359
//#		(2) NEGMAX, IF THE QUOTIENT WAS IMPROPER AND NEGATIVE.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:360
//#		(3) POSMAX, IF THE QUOTIENT WAS IMPROPER AND POSITIVE OR IF THERE WAS A ZERO DIVISOR.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:361
//#		THE CALLING PROGRAM IS PRESUMED TO BE A JOB IN THE F BANK WHICH CONTAINS DVOVSUB.  E BANK MUST BE 6.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:362
//#		THE DIVISOR FOR THIS ROUTINE MAY BE IN EITHER FIXED OR ERASABLE STORAGE.  SIGN AGREEMENT IS
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:363
//#		ASSUMED BETWEEN THE TWO HALVES OF THE DIVIDEND.  (THIS IS CERTAIN IF THE A AND L REGISTERS ARE THE
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:364
//#		RESULT OF A MULTIPLICATION OPERATION.)
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:365
//# CALL SEQUENCE:	L	TC	DVOVSUB
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:366
//#			L +1	ADRES	(DIVISOR)
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:367
//#			L +2	RETURN HERE, WITH RESULT IN A,L
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:368
//# INPUT:	DIVIDEND IN A,L (SIGN AGREEMENT ASSUMED), DIVISOR IN LOCATION DESIGNATED BY "ADRES".
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:369
//#		DIVISOR MAY BE IN THE DVOVSUB FBANK,FIXED-FIXED FBANK,EBANK 6, OR UNSWITCHED ERASABLE.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:370
//# OUTPUT:	QUOTIENT AND REMAINDER, OR POSMAX (NEGMAX), WHICHEVER IS APPROPRIATE.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:371
//# DEBRIS:	SCRATCHX,SCRATCHY,SCRATCHZ,A,L	(NOTE: SCRATCHX,Y,Z ARE EQUATED TO MPAC +4,+5, AND +6.)
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:372
//# ABORTS OR ALARMS:  NONE
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:373
//# EXITS:	TO THE CALL POINT +2.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:374
//# SUBROUTINES CALLED:  NONE.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:375
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:376
//DVOVSUB		TS	SCRATCHY	# SAVE UPPER HALF OF DIVIDEND
// PORT: Fixed ROM slots 18942.
            if slot <> 18942 or instruction <> 22641 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22641, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18943 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:377
//		TS	SCRATCHX
// PORT: Fixed ROM slots 18943.
                if slot <> 18943 or instruction <> 22640 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22640, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:378
//		INDEX	Q		# OBTAIN ADDRESS OF DIVISOR.
// PORT: Fixed ROM slots 18944.
                if slot <> 18944 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1145] to agcAotUnit1145@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:379
//		CA	0
// PORT: Fixed ROM slots 18945.
    18945, 24576
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18946–18947.
function agcAotUnit1146 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18946 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:380
//		INCR	Q		# STEP Q FOR PROPER RETURN SEQUENCE.
// PORT: Fixed ROM slots 18946.
        if slot <> 18946 or instruction <> 10242 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreINCR(words, 2).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:381
//		INDEX	A
// PORT: Fixed ROM slots 18947.
        if slot <> 18947 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1146] to agcAotUnit1146@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:382
//		CA	0		# PICK UP THE DIVISOR.
// PORT: Fixed ROM slots 18948.
    18948, 24576
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18949–18974.
function agcAotUnit1147 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18961 {
        if slot <= 18954 {
            if slot <= 18951 {
                if slot <= 18949 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:383
//		EXTEND			# RETURN POSMAX FOR A ZERO DIVISOR.
// PORT: Fixed ROM slots 18949.
                    if slot <> 18949 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18950 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:384
//		BZF	MAXPLUS
// PORT: Fixed ROM slots 18950.
                        if slot <> 18950 or instruction <> 5661 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5661, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:385
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:386
//		TS	SCRATCHZ	# STORE DIVISOR.
// PORT: Fixed ROM slots 18951.
                        if slot <> 18951 or instruction <> 22642 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22642, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18952 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:387
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:388
//		CCS	A		# GET ABS(DIVISOR) IN THE A REGISTER.
// PORT: Fixed ROM slots 18952.
                    if slot <> 18952 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18953 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:389
//		AD	BIT1
// PORT: Fixed ROM slots 18953.
                        if slot <> 18953 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:390
//		TCF	ZEROPLUS
// PORT: Fixed ROM slots 18954.
                        if slot <> 18954 or instruction <> 5644 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5644, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 18957 {
                if slot <= 18955 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:391
//		AD	BIT1
// PORT: Fixed ROM slots 18955.
                    if slot <> 18955 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
                    if slot <= 18956 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:392
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:393
//ZEROPLUS	XCH	SCRATCHY	# STORE ABS(DIVISOR).  PICK UP TOP HALF OF
// PORT: Fixed ROM slots 18956.
                        if slot <> 18956 or instruction <> 23665 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 113, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:394
//		EXTEND			# DIVIDEND.
// PORT: Fixed ROM slots 18957.
                        if slot <> 18957 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18959 {
                    if slot <= 18958 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:395
//		BZMF	GOODNEG		# GET -ABS(DIVIDEND)
// PORT: Fixed ROM slots 18958.
                        if slot <> 18958 or instruction <> 26128 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26128, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:396
//# Page 1493
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:397
//		CS	A
// PORT: Fixed ROM slots 18959.
                        if slot <> 18959 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18960 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:398
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:399
//GOODNEG		AD	SCRATCHY	# ABS(DIVISOR) - ABS(DIVIDEND)
// PORT: Fixed ROM slots 18960.
                        if slot <> 18960 or instruction <> 24689 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 113).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:400
//		EXTEND
// PORT: Fixed ROM slots 18961.
                        if slot <> 18961 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 18967 {
            if slot <= 18964 {
                if slot <= 18962 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:401
//		BZMF	MAKEMAX		# BRANCH IF DIVISION IS NOT PROPER.
// PORT: Fixed ROM slots 18962.
                    if slot <> 18962 or instruction <> 26135 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26135, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18963 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:402
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:403
//		CA	SCRATCHX	# RE-ESTABLISH THE DIVIDEND
// PORT: Fixed ROM slots 18963.
                        if slot <> 18963 or instruction <> 12400 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 112).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:404
//		EXTEND
// PORT: Fixed ROM slots 18964.
                        if slot <> 18964 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18965 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:405
//		DV	SCRATCHZ	# QUOTIENT IN THE A, REMAINDER IN L.
// PORT: Fixed ROM slots 18965.
                    if slot <> 18965 or instruction <> 4210 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreDv(words, 114, readEffective:call(words, 114)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18966 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:406
//		TC	Q		# RETURN TO CALLER.
// PORT: Fixed ROM slots 18966.
                        if slot <> 18966 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:407
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:408
//MAKEMAX		CCS	SCRATCHX	# DETERMINE THE SIGN OF THE QUOTIENT.
// PORT: Fixed ROM slots 18967.
                        if slot <> 18967 or instruction <> 4208 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 112).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 18970 {
                if slot <= 18968 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:409
//		CCS	SCRATCHZ	# SCRATCHX AND SCRATCHZ ARE NON-ZERO.
// PORT: Fixed ROM slots 18968.
                    if slot <> 18968 or instruction <> 4210 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 114).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18969 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:410
//		TCF	MAXPLUS
// PORT: Fixed ROM slots 18969.
                        if slot <> 18969 or instruction <> 5661 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5661, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:411
//		CCS	SCRATCHZ
// PORT: Fixed ROM slots 18970.
                        if slot <> 18970 or instruction <> 4210 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 114).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18972 {
                    if slot <= 18971 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:412
//		CAF	NEGMAX		# +,- OR -,+
// PORT: Fixed ROM slots 18971.
                        if slot <> 18971 or instruction <> 14813 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:413
//		TC	Q
// PORT: Fixed ROM slots 18972.
                        if slot <> 18972 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18973 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:414
//MAXPLUS		CAF	POSMAX		# -,- OR +,+
// PORT: Fixed ROM slots 18973.
                        if slot <> 18973 or instruction <> 14811 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:415
//		TC	Q
// PORT: Fixed ROM slots 18974.
                        if slot <> 18974 or instruction <> 2 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[1147] to agcAotUnit1147@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:416
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:417
//# COEFFICIENTS FOR THE JET ACCELERATION CURVE FITS
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:418
//# THE CURVE FITS ARE OF THE FORM --
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:419
//#
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:420
//#	1JACC = A/(MASS + C) + B
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:421
//#
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:422
//# A IS SCALED AT PI/4 RAD/SEC**2 B+16KG, B IS SCALED AT PI/4 RAD/SEC**2, AND C IS SCALED AT B +16 KG.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:423
//#
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:424
//# THE CURVE FIT FOR L,PVT-CG IS OF THE SAME FORM, EXCEPT THAT A IS SCALED AT 8 FT B+16 KG, B IS SCALED AT 8 FT,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:425
//# AND C IS SCALED AT B+16 KG.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:426
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:427
//		2DEC	+.0410511917	# L		A		DESCENT
// PORT: Fixed ROM slots 18975 18976.
    18975, 1344, 18976, 19094,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:428
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:429
//INERCONA	2DEC	+.0059347674	# 1JACCP	A		DESCENT
// PORT: Fixed ROM slots 18977 18978.
    18977, 194, 18978, 7708,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:430
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:431
//		2DEC	+.0014979264	# 1JACCQ	A		DESCENT
// PORT: Fixed ROM slots 18979 18980.
    18979, 48, 18980, 17762,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:432
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:433
//		2DEC	+.0010451889	# 1JACCR	A		DESCENT
// PORT: Fixed ROM slots 18981 18982.
    18981, 34, 18982, 4076,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:434
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:435
//		2DEC	+.0065443852	# 1JACCP	A		ASCENT
// PORT: Fixed ROM slots 18983 18984.
    18983, 214, 18984, 7314,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:436
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:437
//		2DEC	+.0035784354	# 1JACCQ	A		ASCENT
// PORT: Fixed ROM slots 18985 18986.
    18985, 116, 18986, 20614,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:438
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:439
//		2DEC	+.0056946631	# 1JACCR	A		ASCENT
// PORT: Fixed ROM slots 18987 18988.
    18987, 186, 18988, 9874,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:440
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:441
//		DEC	+.155044	# L		B		DESCENT
// PORT: Fixed ROM slots 18989.
    18989, 5080,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:442
//		DEC	-.025233	# L		C		DESCENT
// PORT: Fixed ROM slots 18990.
    18990, 64708,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:443
//# Page 1494
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:444
//INERCONB	DEC	+.002989	# 1JACCP	B		DESCENT
// PORT: Fixed ROM slots 18991.
    18991, 98,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:445
//INERCONC	DEC	+.008721	# 1JACCP	C		DESCENT
// PORT: Fixed ROM slots 18992.
    18992, 286,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:446
//		DEC	+.018791	# 1JACCQ	B		DESCENT
// PORT: Fixed ROM slots 18993.
    18993, 616,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:447
//		DEC	-.068163	# 1JACCQ	C		DESCENT
// PORT: Fixed ROM slots 18994.
    18994, 63300,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:448
//		DEC	+.021345	# 1JACCR	B		DESCENT
// PORT: Fixed ROM slots 18995.
    18995, 700,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:449
//		DEC	-.066027	# 1JACCR	C		DESCENT
// PORT: Fixed ROM slots 18996.
    18996, 63370,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:450
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:451
//		DEC	+.000032	# 1JACCP	B		ASCENT
// PORT: Fixed ROM slots 18997.
    18997, 2,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:452
//		DEC	-.006923	# 1JACCP	C		ASCENT
// PORT: Fixed ROM slots 18998.
    18998, 65308,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:453
//		DEC	+.162862	# 1JACCQ	B		ASCENT
// PORT: Fixed ROM slots 18999.
    18999, 5336,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:454
//		DEC	+.002588	# 1JACCQ	C		ASCENT
// PORT: Fixed ROM slots 19000.
    19000, 84,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:455
//		DEC	+.009312	# 1JACCR	B		ASCENT
// PORT: Fixed ROM slots 19001.
    19001, 306,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:456
//		DEC	-.023608	# 1JACCR	C		ASCENT
// PORT: Fixed ROM slots 19002.
    19002, 64760,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:457
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:458
//GIMBLBTS	OCTAL	01400
// PORT: Fixed ROM slots 19003.
    19003, 1536,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:459
//		OCTAL	01000
// PORT: Fixed ROM slots 19004.
    19004, 1024,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:460
//		OCTAL	06000
// PORT: Fixed ROM slots 19005.
    19005, 6144,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:461
//		OCTAL	04000
// PORT: Fixed ROM slots 19006.
    19006, 4096,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:462
//DGBF		DEC	0.6		# .3 SCALED AT 1/2
// PORT: Fixed ROM slots 19007.
    19007, 19660,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:463
//0.35356		DEC	0.35356		# .70711 SCALED AT 2
// PORT: Fixed ROM slots 19008.
    19008, 11586,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:464
//GFACTM		OCT	337		# 979.24/2.20462 AT B+15
// PORT: Fixed ROM slots 19009.
    19009, 446,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:465
//.7071		DEC	.70711
// PORT: Fixed ROM slots 19010.
    19010, 23170,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:466
//-.7071		DEC	-.70711
// PORT: Fixed ROM slots 19011.
    19011, 42364,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:467
//-EPSMAX		DEC	-.42265
// PORT: Fixed ROM slots 19012.
    19012, 51684
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19013–19017.
function agcAotUnit1148 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19014 {
        if slot <= 19013 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:468
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:469
//# CSM-DOCKED INERTIA COMPUTATIONS
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:470
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:471
//DOCKED		CA	ONE		# COEFTR  = 1 FOR INERTIA COEFFICIENTS
// PORT: Fixed ROM slots 19013.
            if slot <> 19013 or instruction <> 14827 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:472
//SPSLOOP1	TS	COEFCTR		#         = 7 FOR CG COEFFICIENTS
// PORT: Fixed ROM slots 19014.
            if slot <> 19014 or instruction <> 22640 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22640, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19015 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:473
//		CA	ONE		# MASSCTR = 1 FOR CSM
// PORT: Fixed ROM slots 19015.
            if slot <> 19015 or instruction <> 14827 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 19016 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:474
//		TS	MASSCTR		#         = 0 FOR LEM
// PORT: Fixed ROM slots 19016.
                if slot <> 19016 or instruction <> 22641 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22641, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:475
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:476
//		INDEX	COEFCTR
// PORT: Fixed ROM slots 19017.
                if slot <> 19017 or instruction <> 20592 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20592, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20592, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1148] to agcAotUnit1148@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:477
//		CA	COEFF 	-1	# COEFF -1 = C
// PORT: Fixed ROM slots 19018.
    19018, 27924
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19019–19023.
function agcAotUnit1149 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19020 {
        if slot <= 19019 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:478
//		EXTEND
// PORT: Fixed ROM slots 19019.
            if slot <> 19019 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:479
//		MP	LEMMASS
// PORT: Fixed ROM slots 19020.
            if slot <> 19020 or instruction <> 29401 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 729, readEffective:call(words, 729)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19021 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:480
//		EXTEND
// PORT: Fixed ROM slots 19021.
            if slot <> 19021 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 19022 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:481
//		MP	CSMMASS		# LET X = CSMMASS AND Y = LEMMASS
// PORT: Fixed ROM slots 19022.
                if slot <> 19022 or instruction <> 29402 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 730, readEffective:call(words, 730)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:482
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:483
//		INDEX	COEFCTR
// PORT: Fixed ROM slots 19023.
                if slot <> 19023 or instruction <> 20592 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20592, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20592, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1149] to agcAotUnit1149@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:484
//		AD	COEFF		# COEFF = F
// PORT: Fixed ROM slots 19024.
    19024, 52502
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19025–19030.
function agcAotUnit1150 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19027 {
        if slot <= 19025 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:485
//		TS	MPAC		# MPAC = C X Y + F
// PORT: Fixed ROM slots 19025.
            if slot <> 19025 or instruction <> 22636 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22636, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 19026 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:486
//		TCF	+4
// PORT: Fixed ROM slots 19026.
                if slot <> 19026 or instruction <> 5718 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5718, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:487
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:488
//SPSLOOP2	TS	MASSCTR		# LOOP TWICE THROUGH HERE TO OBTAIN
// PORT: Fixed ROM slots 19027.
                if slot <> 19027 or instruction <> 22641 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22641, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 19028 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:489
//		EXTEND			# MPAC = MPAC + (A X +D)X + (B Y +E)Y
// PORT: Fixed ROM slots 19028.
            if slot <> 19028 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 19029 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:490
//		DIM	COEFCTR		#		 LOOP #1     LOOP #2
// PORT: Fixed ROM slots 19029.
                if slot <> 19029 or instruction <> 11376 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreDIM(words, 112).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:491
//		INDEX	COEFCTR
// PORT: Fixed ROM slots 19030.
                if slot <> 19030 or instruction <> 20592 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20592, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20592, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1150] to agcAotUnit1150@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:492
//		CA	COEFF 	+2	# COEFF +2 = A OR B
// PORT: Fixed ROM slots 19031.
    19031, 27930
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19032–19033.
function agcAotUnit1151 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19032 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:493
//		EXTEND
// PORT: Fixed ROM slots 19032.
        if slot <> 19032 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:494
//# Page 1495
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:495
//		INDEX	MASSCTR
// PORT: Fixed ROM slots 19033.
        if slot <> 19033 or instruction <> 20593 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20593, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20593, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1151] to agcAotUnit1151@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:496
//		MP	LEMMASS
// PORT: Fixed ROM slots 19034.
    19034, 58802
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19035–19035.
function agcAotUnit1152 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:497
//		INDEX	COEFCTR
// PORT: Fixed ROM slots 19035.
    if slot <> 19035 or instruction <> 20592 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20592, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20592, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1152] to agcAotUnit1152@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:498
//		AD	COEFF 	+4	# COEFF +4 = E OR D
// PORT: Fixed ROM slots 19036.
    19036, 52510
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19037–19038.
function agcAotUnit1153 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19037 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:499
//		EXTEND
// PORT: Fixed ROM slots 19037.
        if slot <> 19037 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:500
//		INDEX	MASSCTR
// PORT: Fixed ROM slots 19038.
        if slot <> 19038 or instruction <> 20593 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20593, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20593, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1153] to agcAotUnit1153@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:501
//		MP	LEMMASS
// PORT: Fixed ROM slots 19039.
    19039, 58802
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19040–19042.
function agcAotUnit1154 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19040 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:502
//		ADS	MPAC
// PORT: Fixed ROM slots 19040.
        if slot <> 19040 or instruction <> 11372 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreADS(words, 108).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 19041 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:503
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:504
//		CCS	MASSCTR
// PORT: Fixed ROM slots 19041.
            if slot <> 19041 or instruction <> 4209 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 113).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:505
//		TCF	SPSLOOP2
// PORT: Fixed ROM slots 19042.
            if slot <> 19042 or instruction <> 5715 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5715, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1154] to agcAotUnit1154@.

// PORT: Physical bank 20. Shared continuation entries, slots 19043–19044.
function agcAotUnit1155 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19043 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:506
//		CCS	COEFCTR		# IF COEFCTR IS POS, EXIT FROM LOOP WITH
// PORT: Fixed ROM slots 19043.
        if slot <> 19043 or instruction <> 4208 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCCS(words, 112).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:507
//		TCF	+7		# CG X DELDOT = MPAC X 4 PI RAD-CM/SEC
// PORT: Fixed ROM slots 19044.
        if slot <> 19044 or instruction <> 5739 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5739, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1155] to agcAotUnit1155@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:508
//TORQCONS	2DEC	0.51443 B-14	# CORRESPONDS TO 500 LB-FT
// PORT: Fixed ROM slots 19045 19046.
    19045, 0, 19046, 16856
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19047–19053.
function agcAotUnit1156 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19049 {
        if slot <= 19047 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:509
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:510
//		CA	MPAC
// PORT: Fixed ROM slots 19047.
            if slot <> 19047 or instruction <> 12396 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 108).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 19048 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:511
//		TS	MPAC 	+1	# INERTIA = (MPAC +1) X 2(38) KG-CM(2)
// PORT: Fixed ROM slots 19048.
                if slot <> 19048 or instruction <> 22637 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22637, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:512
//		CA	SEVEN
// PORT: Fixed ROM slots 19049.
                if slot <> 19049 or instruction <> 14831 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2543), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 19051 {
            if slot <= 19050 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:513
//		TCF	SPSLOOP1
// PORT: Fixed ROM slots 19050.
                if slot <> 19050 or instruction <> 5702 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5702, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:514
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:515
//		CA	1JACCCON	# 1JACC=1JACCCON/MASS
// PORT: Fixed ROM slots 19051.
                if slot <> 19051 or instruction <> 13962 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1674), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19052 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:516
//		ZL
// PORT: Fixed ROM slots 19052.
                if slot <> 19052 or instruction <> 9223 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 7, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:517
//		TC	DVOVSUB
// PORT: Fixed ROM slots 19053.
                if slot <> 19053 or instruction <> 1534 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1534, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1156] to agcAotUnit1156@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:518
//		ADRES	MASS
// PORT: Fixed ROM slots 19054.
    19054, 1352
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19055–19078.
function agcAotUnit1157 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19066 {
        if slot <= 19060 {
            if slot <= 19057 {
                if slot <= 19055 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:519
//		TS	1JACC		# SCALED AT PI/4
// PORT: Fixed ROM slots 19055.
                    if slot <> 19055 or instruction <> 23384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23384, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19056 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:520
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:521
//		CA	POSMAX		# SET INVERSE JET ACCELERATIONS TO POSMAX,
// PORT: Fixed ROM slots 19056.
                        if slot <> 19056 or instruction <> 14811 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:522
//		TS	1/ANETP		# WHICH CORRESPONDS TO ACCEL. OF 1.4 D/SS.
// PORT: Fixed ROM slots 19057.
                        if slot <> 19057 or instruction <> 23401 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23401, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19058 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:523
//		TS	1/ANET2 +1
// PORT: Fixed ROM slots 19058.
                    if slot <> 19058 or instruction <> 23417 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23417, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19059 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:524
//		TS	1/ANET2 +2
// PORT: Fixed ROM slots 19059.
                        if slot <> 19059 or instruction <> 23418 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23418, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:525
//		TS	1/ANET2 +17D
// PORT: Fixed ROM slots 19060.
                        if slot <> 19060 or instruction <> 23433 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23433, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 19063 {
                if slot <= 19061 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:526
//		TS	1/ANET2 +18D
// PORT: Fixed ROM slots 19061.
                    if slot <> 19061 or instruction <> 23434 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23434, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19062 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:527
//		EXTEND
// PORT: Fixed ROM slots 19062.
                        if slot <> 19062 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:528
//		DCA	TORQCONS
// PORT: Fixed ROM slots 19063.
                        if slot <> 19063 or instruction <> 13926 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 1638, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19064 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:529
//		EXTEND
// PORT: Fixed ROM slots 19064.
                    if slot <> 19064 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19065 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:530
//		DV	MPAC 	+1
// PORT: Fixed ROM slots 19065.
                        if slot <> 19065 or instruction <> 4205 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreDv(words, 109, readEffective:call(words, 109)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:531
//		INHINT
// PORT: Fixed ROM slots 19066.
                        if slot <> 19066 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 19072 {
            if slot <= 19069 {
                if slot <= 19067 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:532
//		TS	1JACCQ		# SCALED AT PI/4
// PORT: Fixed ROM slots 19067.
                    if slot <> 19067 or instruction <> 23385 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23385, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19068 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:533
//		TS	1JACCR
// PORT: Fixed ROM slots 19068.
                        if slot <> 19068 or instruction <> 23386 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23386, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:534
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:535
//		CA	-.7071
// PORT: Fixed ROM slots 19069.
                        if slot <> 19069 or instruction <> 13891 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1603), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19070 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:536
//		TS	COEFFQ		# COEFFQ AND COEFFR ARE CHOSEN TO MAKE U-
// PORT: Fixed ROM slots 19070.
                    if slot <> 19070 or instruction <> 23447 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23447, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19071 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:537
//		CA	.7071		# AND V-AXES ORTHOGONAL FOR DOCKED CASE
// PORT: Fixed ROM slots 19071.
                        if slot <> 19071 or instruction <> 13890 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1602), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:538
//		TS	COEFFR
// PORT: Fixed ROM slots 19072.
                        if slot <> 19072 or instruction <> 23448 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23448, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 19075 {
                if slot <= 19073 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:539
//		CA	MASS		# SCALED AT 2(16) KG
// PORT: Fixed ROM slots 19073.
                    if slot <> 19073 or instruction <> 12964 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 676).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19074 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:540
//		EXTEND
// PORT: Fixed ROM slots 19074.
                        if slot <> 19074 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:541
//		MP	MPAC		# SCALED AT 4 PI RAD-CM/SEC
// PORT: Fixed ROM slots 19075.
                        if slot <> 19075 or instruction <> 28780 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 108, readEffective:call(words, 108)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19076 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:542
//		EXTEND
// PORT: Fixed ROM slots 19076.
                    if slot <> 19076 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19077 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:543
//		MP	ABDELV		# SCALED AT 2(13) CM/SEC(2)
// PORT: Fixed ROM slots 19077.
                        if slot <> 19077 or instruction <> 29350 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 678, readEffective:call(words, 678)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:544
//		TC	DVOVSUB		# GET QUOTIENT WITH OVERFLOW PROTECTION
// PORT: Fixed ROM slots 19078.
                        if slot <> 19078 or instruction <> 1534 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1534, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1157] to agcAotUnit1157@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:545
//# Page 1496
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:546
//		ADRES	MPAC 	+1
// PORT: Fixed ROM slots 19079.
    19079, 218
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19080–19081.
function agcAotUnit1158 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19080 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:547
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:548
//		TS	ACCDOTR
// PORT: Fixed ROM slots 19080.
        if slot <> 19080 or instruction <> 23369 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23369, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:549
//		TCF	SPSCONT		# CONTINUE K, KSQ CALCULATIONS
// PORT: Fixed ROM slots 19081.
        if slot <> 19081 or instruction <> 5578 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5578, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1158] to agcAotUnit1158@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:550
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:551
//1JACCCON	OCT	00167		# SCALED AT PI/4X2(16) RAD/SEC(2)-KG
// PORT: Fixed ROM slots 19082.
    19082, 238,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:552
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:553
//#                                               2     2
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:554
//# COEFFICIENTS FOR CURVE FIT OF THE FORM Z = A X  +B Y  +C X Y +D X +E Y +F
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:555
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:556
//COEFF		DEC	.19518		# C  COEFFICIENT OF INERTIA
// PORT: Fixed ROM slots 19083.
    19083, 6396,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:557
//		DEC	-.00529		# F             "
// PORT: Fixed ROM slots 19084.
    19084, 65360,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:558
//		DEC	-.17670		# B             "
// PORT: Fixed ROM slots 19085.
    19085, 59744,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:559
//		DEC	-.03709		# A             "
// PORT: Fixed ROM slots 19086.
    19086, 64318,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:560
//		DEC	.06974		# E             "
// PORT: Fixed ROM slots 19087.
    19087, 2286,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:561
//		DEC	.02569		# D             "
// PORT: Fixed ROM slots 19088.
    19088, 842,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:562
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:563
//		DEC	.20096		# C  COEFFICIENT OF CG
// PORT: Fixed ROM slots 19089.
    19089, 6586,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:564
//		DEC	.13564		# F          "
// PORT: Fixed ROM slots 19090.
    19090, 4444,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:565
//		DEC	.75704		# B          "
// PORT: Fixed ROM slots 19091.
    19091, 24806,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:566
//		DEC	-.37142		# A          "
// PORT: Fixed ROM slots 19092.
    19092, 53364,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:567
//		DEC	-.63117		# E          "
// PORT: Fixed ROM slots 19093.
    19093, 44852,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:568
//		DEC	.41179		# D          "
// PORT: Fixed ROM slots 19094.
    19094, 13494,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:569
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:570
//# ASSIGNMENT OF TEMPORARIES FOR 1/ACCS (EXCLUDING 1/ACCONT)
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:571
//# MPAC, MPAC +1, MPAC +2  USED EXPLICITLY
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:572
//COEFCTR 	EQUALS	MPAC 	+4
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:573
//MASSCTR		EQUALS	MPAC 	+5
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:574
//SCRATCHX	EQUALS	MPAC 	+4	# SCRATCH AREA FOR DVOVSUB ROUTINE.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:575
//SCRATCHY	EQUALS	SCRATCHX +1
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:576
//SCRATCHZ	EQUALS	SCRATCHX +2
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:577
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:578
//DOCKTEMP	EQUALS	MPAC 	+3	# RECORD OF CSMDOCKED BIT OF DAPBOOLS
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:579
//EPSILON		EQUALS	MPAC 	+1
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:580
//-EPSILON	EQUALS	EPSILON
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:581
//-.1875		DEC	-.18750
// PORT: Fixed ROM slots 19095.
    19095, 59390
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19096–19110.
function agcAotUnit1159 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19102 {
        if slot <= 19098 {
            if slot <= 19096 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:582
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:583
//# Page 1497
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:584
//		BANK	20
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:585
//		SETLOC	DAPS3
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:586
//		BANK
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:587
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:588
//		EBANK=	AOSQ
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:589
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:590
//		COUNT*	$$/DAPAO
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:591
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:592
// -1		TS	INGTS		# ZERO INGTS IN ASCENT
// PORT: Fixed ROM slots 19096.
                if slot <> 19096 or instruction <> 23451 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23451, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19097 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:593
//1/ACCONT	CA	DB		# INITIALIZE DBVAL1,2,3
// PORT: Fixed ROM slots 19097.
                    if slot <> 19097 or instruction <> 13030 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 742).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:594
//		EXTEND
// PORT: Fixed ROM slots 19098.
                    if slot <> 19098 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 19100 {
                if slot <= 19099 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:595
//		MP	BIT13
// PORT: Fixed ROM slots 19099.
                    if slot <> 19099 or instruction <> 31199 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 2527, readEffective:call(words, 2527)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:596
//		TS	L		# 0.25 DB
// PORT: Fixed ROM slots 19100.
                    if slot <> 19100 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19101 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:597
//		AD	A
// PORT: Fixed ROM slots 19101.
                    if slot <> 19101 or instruction <> 24576 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:598
//		TS	DBVAL3		# 0.50 DB
// PORT: Fixed ROM slots 19102.
                    if slot <> 19102 or instruction <> 22605 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22605, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 19106 {
            if slot <= 19104 {
                if slot <= 19103 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:599
//		CS	DBVAL1
// PORT: Fixed ROM slots 19103.
                    if slot <> 19103 or instruction <> 17126 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 742).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:600
//		AD	L
// PORT: Fixed ROM slots 19104.
                    if slot <> 19104 or instruction <> 24577 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19105 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:601
//		TS	DBVAL2		# -.75 DB
// PORT: Fixed ROM slots 19105.
                    if slot <> 19105 or instruction <> 22604 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22604, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:602
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:603
//GETAOSUV	INHINT
// PORT: Fixed ROM slots 19106.
                    if slot <> 19106 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 19108 {
                if slot <= 19107 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:604
//		CAE	AOSR		# COMPUTE ASOU AND AOSV BY ROTATING
// PORT: Fixed ROM slots 19107.
                    if slot <> 19107 or instruction <> 13153 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 865).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:605
//		TS	L		#	AOSQ AND AOSR.
// PORT: Fixed ROM slots 19108.
                    if slot <> 19108 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19109 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:606
//		CAE	AOSQ
// PORT: Fixed ROM slots 19109.
                    if slot <> 19109 or instruction <> 13151 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 863).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:607
//		TC	IBNKCALL
// PORT: Fixed ROM slots 19110.
                    if slot <> 19110 or instruction <> 2492 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2492, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1159] to agcAotUnit1159@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:608
//		CADR	ROT-TOUV
// PORT: Fixed ROM slots 19111.
    19111, 31948
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19112–19153.
function agcAotUnit1160 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19132 {
        if slot <= 19121 {
            if slot <= 19116 {
                if slot <= 19113 {
                    if slot <= 19112 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:609
//		DXCH	AOSU
// PORT: Fixed ROM slots 19112.
                        if slot <> 19112 or instruction <> 22372 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 868, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:610
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:611
//		RELINT
// PORT: Fixed ROM slots 19113.
                        if slot <> 19113 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19114 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:612
//		CA	DAPBOOLS
// PORT: Fixed ROM slots 19114.
                        if slot <> 19114 or instruction <> 12361 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 73).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19115 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:613
//		MASK	DRIFTBIT	# ZERO DURING ULLAGE AND POWERED FLIGHT.
// PORT: Fixed ROM slots 19115.
                            if slot <> 19115 or instruction <> 31204 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:614
//		CCS	A		# IF DRIFTING LIGHT,
// PORT: Fixed ROM slots 19116.
                            if slot <> 19116 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                if slot <= 19118 {
                    if slot <= 19117 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:615
//		CA	ONE		# 	SET DRIFTER TO 1
// PORT: Fixed ROM slots 19117.
                        if slot <> 19117 or instruction <> 14827 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:616
//		TS	DRIFTER		# SAVE TO TEST FOR DRIFTING FLIGHT LATER
// PORT: Fixed ROM slots 19118.
                        if slot <> 19118 or instruction <> 22606 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22606, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19119 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:617
//		AD	ALLOWGTS	# NON-ZERO IF DRIFT OR GTS NEAR
// PORT: Fixed ROM slots 19119.
                        if slot <> 19119 or instruction <> 25410 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 834).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19120 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:618
//		CCS	A
// PORT: Fixed ROM slots 19120.
                            if slot <> 19120 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:619
//		CA	FLATVAL		# DRIFTING FLIGHT, STORE .8 IN FLAT
// PORT: Fixed ROM slots 19121.
                            if slot <> 19121 or instruction <> 14323 { return choose false if checkOnly else -1. }
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
            }
        } else {
            if slot <= 19126 {
                if slot <= 19123 {
                    if slot <= 19122 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:620
//		TS	FLATEMP		# IN POWERED FLIGHT, STORE ZERO IN FLAT
// PORT: Fixed ROM slots 19122.
                        if slot <> 19122 or instruction <> 22633 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22633, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:621
//		EXTEND
// PORT: Fixed ROM slots 19123.
                        if slot <> 19123 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19124 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:622
//		BZF	DOPAXIS		# IF POWERED AND NO GTS, START P AXIS,
// PORT: Fixed ROM slots 19124.
                        if slot <> 19124 or instruction <> 5816 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5816, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19125 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:623
//		CCS	DRIFTER		# OTHERWISE SET ZONE3LIM
// PORT: Fixed ROM slots 19125.
                            if slot <> 19125 or instruction <> 4174 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 78).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:624
//		CA	ZONE3MAX	# 17.5 MS, SCALED AT 4 SECONDS.
// PORT: Fixed ROM slots 19126.
                            if slot <> 19126 or instruction <> 14322 { return choose false if checkOnly else -1. }
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
                }
            } else {
                if slot <= 19129 {
                    if slot <= 19127 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:625
//		TS	Z3TEM
// PORT: Fixed ROM slots 19127.
                        if slot <> 19127 or instruction <> 22634 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22634, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19128 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:626
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:627
//DOPAXIS		CA	1JACC		# 1JACC AT PI/4 = 2JACC AT PI/2 =
// PORT: Fixed ROM slots 19128.
                            if slot <> 19128 or instruction <> 13144 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 856).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:628
//					# ANET AT PI/2 = ANET/ACOAST AT 2(6).
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:629
//		AD	BIT9		# 1 + ANET/ACOAST AT 2(6)
// PORT: Fixed ROM slots 19129.
                            if slot <> 19129 or instruction <> 27107 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 19130 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:630
//		TS	FUNTEM
// PORT: Fixed ROM slots 19130.
                        if slot <> 19130 or instruction <> 22639 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22639, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19131 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:631
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:632
//		CA	1JACC
// PORT: Fixed ROM slots 19131.
                            if slot <> 19131 or instruction <> 13144 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 856).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:633
//# Page 1498
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:634
//		TC	INVERT
// PORT: Fixed ROM slots 19132.
                            if slot <> 19132 or instruction <> 1984 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1984, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 19142 {
            if slot <= 19137 {
                if slot <= 19134 {
                    if slot <= 19133 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:635
//		INHINT			# P AXIS DATA MUST BE CONSISTENT
// PORT: Fixed ROM slots 19133.
                        if slot <> 19133 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:636
//		TS	1/ANETP		# SCALED AT 2(7)/PI.
// PORT: Fixed ROM slots 19134.
                        if slot <> 19134 or instruction <> 23401 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23401, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19135 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:637
//		TS	1/ANETP +1
// PORT: Fixed ROM slots 19135.
                        if slot <> 19135 or instruction <> 23402 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23402, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19136 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:638
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:639
//		CS	BIT9		# -1 AT 2(6)
// PORT: Fixed ROM slots 19136.
                            if slot <> 19136 or instruction <> 18915 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:640
//		EXTEND
// PORT: Fixed ROM slots 19137.
                            if slot <> 19137 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 19139 {
                    if slot <= 19138 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:641
//		MP	1/ANETP		# -1/ANET AT 2(13)/PI
// PORT: Fixed ROM slots 19138.
                        if slot <> 19138 or instruction <> 29545 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 873, readEffective:call(words, 873)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:642
//		EXTEND
// PORT: Fixed ROM slots 19139.
                        if slot <> 19139 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19140 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:643
//		DV	FUNTEM		# -1/(ANET + ANET**2/ACOAST) AT 2(7)/PI
// PORT: Fixed ROM slots 19140.
                        if slot <> 19140 or instruction <> 4207 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreDv(words, 111, readEffective:call(words, 111)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19141 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:644
//		TS	PACCFUN
// PORT: Fixed ROM slots 19141.
                            if slot <> 19141 or instruction <> 23407 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23407, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:645
//		TS	PACCFUN +1
// PORT: Fixed ROM slots 19142.
                            if slot <> 19142 or instruction <> 23408 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23408, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 19147 {
                if slot <= 19144 {
                    if slot <= 19143 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:646
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:647
//		CA	1/.03		# NO AOS FOR P AXIS, ACOAST = AMIN
// PORT: Fixed ROM slots 19143.
                        if slot <> 19143 or instruction <> 14811 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:648
//		TS	1/ACOSTP
// PORT: Fixed ROM slots 19144.
                        if slot <> 19144 or instruction <> 23403 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23403, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19145 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:649
//		TS	1/ACOSTP +1
// PORT: Fixed ROM slots 19145.
                        if slot <> 19145 or instruction <> 23404 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23404, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19146 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:650
//		RELINT
// PORT: Fixed ROM slots 19146.
                            if slot <> 19146 or instruction <> 3 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:651
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:652
//		ZL
// PORT: Fixed ROM slots 19147.
                            if slot <> 19147 or instruction <> 9223 { return choose false if checkOnly else -1. }
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
                if slot <= 19150 {
                    if slot <= 19148 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:653
//		CCS	DRIFTER
// PORT: Fixed ROM slots 19148.
                        if slot <> 19148 or instruction <> 4174 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 78).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19149 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:654
//		DXCH	AOSU		# ZERO AOSU,V IF IN DRIFT, JUST TO BE SURE
// PORT: Fixed ROM slots 19149.
                            if slot <> 19149 or instruction <> 22372 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 868, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:655
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:656
//UAXIS		CA	ZERO		# DO U AXIS COMPUTATIONS
// PORT: Fixed ROM slots 19150.
                            if slot <> 19150 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
                    if slot <= 19151 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:657
//		TS	UV		# ZERO FOR U AXIS, ONE FOR V AXIS.
// PORT: Fixed ROM slots 19151.
                        if slot <> 19151 or instruction <> 22636 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22636, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19152 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:658
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:659
//BOTHAXES	TS	SIGNAOS		# CODING COMMON TO U,V AXES
// PORT: Fixed ROM slots 19152.
                            if slot <> 19152 or instruction <> 22643 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22643, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:660
//		INDEX	UV
// PORT: Fixed ROM slots 19153.
                            if slot <> 19153 or instruction <> 20588 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 20588, words[0], readEffective).
                            }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 20588, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1160] to agcAotUnit1160@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:661
//		CCS	AOSU		# PICK UP ABS(AOSU OR AOSV)
// PORT: Fixed ROM slots 19154.
    19154, 9926
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19155–19172.
function agcAotUnit1161 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19163 {
        if slot <= 19158 {
            if slot <= 19156 {
                if slot <= 19155 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:662
//		AD	ONE		# RESTORE TO PROPER VALUE
// PORT: Fixed ROM slots 19155.
                    if slot <> 19155 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:663
//		TCF	+3		# AND LEAVE SIGNAOS AT ZERO
// PORT: Fixed ROM slots 19156.
                    if slot <> 19156 or instruction <> 5847 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5847, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19157 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:664
//		AD	ONE		# NEGATIVE, RESTORE TO PROPER VALUE
// PORT: Fixed ROM slots 19157.
                    if slot <> 19157 or instruction <> 27115 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:665
//		INCR	SIGNAOS		# AND SET SIGNAOS TO ONE TO SHOW AOS NEG
// PORT: Fixed ROM slots 19158.
                    if slot <> 19158 or instruction <> 10355 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 115).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 19160 {
                if slot <= 19159 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:666
//		TS	ABSAOS		# SAVE ABS(AOS)
// PORT: Fixed ROM slots 19159.
                    if slot <> 19159 or instruction <> 22642 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22642, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:667
//		CS	SIGNAOS
// PORT: Fixed ROM slots 19160.
                    if slot <> 19160 or instruction <> 16499 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 115).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19161 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:668
//		TS	-SIGNAOS	# USED AS AN INDEX
// PORT: Fixed ROM slots 19161.
                    if slot <> 19161 or instruction <> 22644 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22644, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19162 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:669
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:670
//		CA	DBVAL1		# SET DB1, DB2 TO DBVAL1 (= DB)
// PORT: Fixed ROM slots 19162.
                        if slot <> 19162 or instruction <> 13030 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 742).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:671
//		TS	DBB1
// PORT: Fixed ROM slots 19163.
                        if slot <> 19163 or instruction <> 22627 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22627, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 19167 {
            if slot <= 19165 {
                if slot <= 19164 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:672
//		TS	DBB2
// PORT: Fixed ROM slots 19164.
                    if slot <> 19164 or instruction <> 22628 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22628, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:673
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:674
//		CA	ABSAOS		# TEST MAGNITUDE OF ABS(AOS)
// PORT: Fixed ROM slots 19165.
                    if slot <> 19165 or instruction <> 12402 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 114).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19166 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:675
//		AD	-.03R/S2
// PORT: Fixed ROM slots 19166.
                    if slot <> 19166 or instruction <> 26612 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2036), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:676
//		EXTEND
// PORT: Fixed ROM slots 19167.
                    if slot <> 19167 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 19169 {
                if slot <= 19168 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:677
//		BZMF	NOTMUCH		# ABS(AOS) LESS THAN AMIN
// PORT: Fixed ROM slots 19168.
                    if slot <> 19168 or instruction <> 26394 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26394, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:678
//BIGAOS		CCS	FLATEMP		# AGS(AOS) GREATER THAN AMIN
// PORT: Fixed ROM slots 19169.
                    if slot <> 19169 or instruction <> 4201 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 105).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19170 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:679
//		TCF	SKIPDB1		# I DRIFT OR GTS, DO NOT COMPUTE DB
// PORT: Fixed ROM slots 19170.
                    if slot <> 19170 or instruction <> 5882 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5882, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19171 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:680
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:681
//		CA	DBVAL1
// PORT: Fixed ROM slots 19171.
                        if slot <> 19171 or instruction <> 13030 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 742).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:682
//		INDEX	-SIGNAOS
// PORT: Fixed ROM slots 19172.
                        if slot <> 19172 or instruction <> 20596 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20596, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20596, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1161] to agcAotUnit1161@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:683
//# Page 1499
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:684
//		ADS	DBB2		# DB2(1) = 2 DB
// PORT: Fixed ROM slots 19173.
    19173, 22728
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19174–19174.
function agcAotUnit1162 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:685
//		INDEX	SIGNAOS
// PORT: Fixed ROM slots 19174.
    if slot <> 19174 or instruction <> 20595 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20595, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20595, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1162] to agcAotUnit1162@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:686
//		TS	DBB4		# DB4(3) = 1 DB
// PORT: Fixed ROM slots 19175.
    19175, 45258
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19176–19189.
function agcAotUnit1163 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19182 {
        if slot <= 19178 {
            if slot <= 19176 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:687
//		CA	-.1875		# -.1875 PI/2 RAD/SEC(2) SCALED AT PI/2
// PORT: Fixed ROM slots 19176.
                if slot <> 19176 or instruction <> 13975 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1687), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19177 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:688
//		AD	ABSAOS		# ABSAOS IS SCALED AT PI/2
// PORT: Fixed ROM slots 19177.
                    if slot <> 19177 or instruction <> 24690 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 114).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:689
//		EXTEND
// PORT: Fixed ROM slots 19178.
                    if slot <> 19178 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 19180 {
                if slot <= 19179 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:690
//		BZMF	+3
// PORT: Fixed ROM slots 19179.
                    if slot <> 19179 or instruction <> 26350 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26350, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:691
//		CS	DBVAL3		# -.5 DB
// PORT: Fixed ROM slots 19180.
                    if slot <> 19180 or instruction <> 16461 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 77).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19181 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:692
//		TCF	DBONE
// PORT: Fixed ROM slots 19181.
                    if slot <> 19181 or instruction <> 5877 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5877, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:693
//		CS	ABSAOS
// PORT: Fixed ROM slots 19182.
                    if slot <> 19182 or instruction <> 16498 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 114).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 19185 {
            if slot <= 19183 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:694
//		DOUBLE
// PORT: Fixed ROM slots 19183.
                if slot <> 19183 or instruction <> 24576 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19184 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:695
//		DOUBLE
// PORT: Fixed ROM slots 19184.
                    if slot <> 19184 or instruction <> 24576 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:696
//		AD	BIT14
// PORT: Fixed ROM slots 19185.
                    if slot <> 19185 or instruction <> 27102 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 19187 {
                if slot <= 19186 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:697
//		DOUBLE			# 1-8 ABSAOS.  (8 IS 16/PI SCALED AT 2/PI)
// PORT: Fixed ROM slots 19186.
                    if slot <> 19186 or instruction <> 24576 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:698
//		EXTEND
// PORT: Fixed ROM slots 19187.
                    if slot <> 19187 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19188 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:699
//		MP	DB
// PORT: Fixed ROM slots 19188.
                    if slot <> 19188 or instruction <> 29414 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 742, readEffective:call(words, 742)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:700
//DBONE		INDEX	SIGNAOS		# DB1(2)=(1-8 ABSAOS) DB.  IF ABSAOS IS
// PORT: Fixed ROM slots 19189.
                    if slot <> 19189 or instruction <> 20595 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20595, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20595, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1163] to agcAotUnit1163@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:701
//		TS	DBB1		# GREATER THAN .1875 THEN DB1(2) = -.5 DB
// PORT: Fixed ROM slots 19190.
    19190, 45254
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19191–19192.
function agcAotUnit1164 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19191 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:702
//		CA	DBVAL2
// PORT: Fixed ROM slots 19191.
        if slot <> 19191 or instruction <> 12364 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 76).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:703
//		INDEX	-SIGNAOS
// PORT: Fixed ROM slots 19192.
        if slot <> 19192 or instruction <> 20596 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20596, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20596, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1164] to agcAotUnit1164@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:704
//		TS	DBB3		# DB3(4) = -.75 DB
// PORT: Fixed ROM slots 19193.
    19193, 45260
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19194–19194.
function agcAotUnit1165 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:705
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:706
//SKIPDB1		CA	ABSAOS		# ABS(AOS) GREATER THAN AMIN, SO IT IS
// PORT: Fixed ROM slots 19194.
    if slot <> 19194 or instruction <> 12402 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
        agcCoreCA(words, 114).
        return list(false, false, inheritedTransient, false, false).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1165] to agcAotUnit1165@.

// PORT: Physical bank 20. Shared continuation entries, slots 19195–19199.
function agcAotUnit1166 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19196 {
        if slot <= 19195 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:707
//		EXTEND
// PORT: Fixed ROM slots 19195.
            if slot <> 19195 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:708
//		MP	BIT12
// PORT: Fixed ROM slots 19196.
            if slot <> 19196 or instruction <> 31200 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 2528, readEffective:call(words, 2528)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19197 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:709
//		AD	ABSAOS		# (9/8) ABSAOS.
// PORT: Fixed ROM slots 19197.
            if slot <> 19197 or instruction <> 24690 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 114).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 19198 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:710
//		TC	INVERT		# ALL RIGHT TO DIVIDE
// PORT: Fixed ROM slots 19198.
                if slot <> 19198 or instruction <> 1984 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1984, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:711
//		INDEX	-SIGNAOS
// PORT: Fixed ROM slots 19199.
                if slot <> 19199 or instruction <> 20596 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20596, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20596, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1166] to agcAotUnit1166@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:712
//		TS	1/ACOSTT +1	# 1/ACOASTPOS(NET) = 1/ABS(AOS)
// PORT: Fixed ROM slots 19200.
    19200, 45232
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19201–19202.
function agcAotUnit1167 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19201 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:713
//		CA	1/.03
// PORT: Fixed ROM slots 19201.
        if slot <> 19201 or instruction <> 14811 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2523), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:714
//		INDEX	SIGNAOS
// PORT: Fixed ROM slots 19202.
        if slot <> 19202 or instruction <> 20595 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20595, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20595, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1167] to agcAotUnit1167@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:715
//		TS	1/ACOSTT	# 1/ACOASTNEG(POS) = 1/AIN
// PORT: Fixed ROM slots 19203.
    19203, 45230
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19204–19237.
function agcAotUnit1168 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19220 {
        if slot <= 19211 {
            if slot <= 19207 {
                if slot <= 19205 {
                    if slot <= 19204 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:716
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:717
//		CA	ABSAOS
// PORT: Fixed ROM slots 19204.
                        if slot <> 19204 or instruction <> 12402 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 114).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:718
//		AD	1JACCU
// PORT: Fixed ROM slots 19205.
                        if slot <> 19205 or instruction <> 25435 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 859).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19206 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:719
//		AD	1JACCU		# 2 JACC + ABS(AOS)
// PORT: Fixed ROM slots 19206.
                        if slot <> 19206 or instruction <> 25435 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 859).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:720
//		AD	BIT9		# MAXIMUM VALUE IN COMPUTATIONS
// PORT: Fixed ROM slots 19207.
                        if slot <> 19207 or instruction <> 27107 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19209 {
                    if slot <= 19208 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:721
//		TS	A		# TEST FOR OVERFLOW
// PORT: Fixed ROM slots 19208.
                        if slot <> 19208 or instruction <> 22528 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22528, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:722
//		TCF	SKIPDB2		# NO OVERFLOW, DO NORMAL COMPUTATION
// PORT: Fixed ROM slots 19209.
                        if slot <> 19209 or instruction <> 5934 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5934, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19210 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:723
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:724
//		CA	ABSAOS		# RESCALE TO PI TO PREVENT OVERFLOW
// PORT: Fixed ROM slots 19210.
                        if slot <> 19210 or instruction <> 12402 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 114).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:725
//		EXTEND
// PORT: Fixed ROM slots 19211.
                        if slot <> 19211 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 19215 {
                if slot <= 19213 {
                    if slot <= 19212 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:726
//		MP	BIT14
// PORT: Fixed ROM slots 19212.
                        if slot <> 19212 or instruction <> 31198 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2526, readEffective:call(words, 2526)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:727
//		AD	1JACCU		# 1 JACC AT PI/2 = 2JACC AT PI
// PORT: Fixed ROM slots 19213.
                        if slot <> 19213 or instruction <> 25435 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 859).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19214 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:728
//		TS	ANET		# ANETPOS(NEG) MAX SCALED AT PI =
// PORT: Fixed ROM slots 19214.
                        if slot <> 19214 or instruction <> 22639 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22639, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:729
//					# ANETPOS(NEG) MAX/ACOASTNEG(POS) AT 2(7)
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:730
//		AD	BIT8		# 1 + ANETPOS/ACOASTNEG AT 2(7)
// PORT: Fixed ROM slots 19215.
                        if slot <> 19215 or instruction <> 27108 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19217 {
                    if slot <= 19216 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:731
//		XCH	ANET		# SAVE IN ANET, WHILE PICKING UP ANET
// PORT: Fixed ROM slots 19216.
                        if slot <> 19216 or instruction <> 23663 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 111, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:732
//		TC	INVERT
// PORT: Fixed ROM slots 19217.
                        if slot <> 19217 or instruction <> 1984 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1984, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19218 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:733
//		EXTEND
// PORT: Fixed ROM slots 19218.
                        if slot <> 19218 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19219 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:734
//# Page 1500
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:735
//		MP	BIT14		# SCALE 1/ANET AT 2(7)/PI
// PORT: Fixed ROM slots 19219.
                            if slot <> 19219 or instruction <> 31198 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2526, readEffective:call(words, 2526)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:736
//		TS	1/ANET
// PORT: Fixed ROM slots 19220.
                            if slot <> 19220 or instruction <> 22640 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22640, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 19228 {
            if slot <= 19224 {
                if slot <= 19222 {
                    if slot <= 19221 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:737
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:738
//		CA	ACCHERE		# SET UP RETURN FROM COMPUTATION ROUTINE
// PORT: Fixed ROM slots 19221.
                        if slot <> 19221 or instruction <> 14105 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1817), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:739
//		TS	ARET
// PORT: Fixed ROM slots 19222.
                        if slot <> 19222 or instruction <> 22641 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22641, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19223 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:740
//		CS	BIT8		# -1 AT 2(7)
// PORT: Fixed ROM slots 19223.
                        if slot <> 19223 or instruction <> 18916 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:741
//		TCF	DOACCFUN	# FINISH ACCFUN COMPUTATION
// PORT: Fixed ROM slots 19224.
                        if slot <> 19224 or instruction <> 6107 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6107, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19226 {
                    if slot <= 19225 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:742
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:743
//ACCHERE		TCF	ACCTHERE
// PORT: Fixed ROM slots 19225.
                        if slot <> 19225 or instruction <> 5939 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5939, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:744
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:745
//NOTMUCH		TS	L		# ABS(AOS) LESS THAN AMIN, SAVE IN L
// PORT: Fixed ROM slots 19226.
                        if slot <> 19226 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19227 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:746
//		CA	1/.03		# ACOASTPOS,NEG = AMIN
// PORT: Fixed ROM slots 19227.
                        if slot <> 19227 or instruction <> 14811 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:747
//		TS	1/ACOSTT
// PORT: Fixed ROM slots 19228.
                        if slot <> 19228 or instruction <> 22615 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22615, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 19232 {
                if slot <= 19230 {
                    if slot <= 19229 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:748
//		TS	1/ACOSTT +1
// PORT: Fixed ROM slots 19229.
                        if slot <> 19229 or instruction <> 22616 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22616, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:749
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:750
//		CCS	FLATEMP
// PORT: Fixed ROM slots 19230.
                        if slot <> 19230 or instruction <> 4201 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 105).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19231 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:751
//		TCF	SKIPDB2		# DO NOT COMPUTE DB IF DRIFT OR GTS
// PORT: Fixed ROM slots 19231.
                        if slot <> 19231 or instruction <> 5934 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5934, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:752
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:753
//		CA	.0125RS		# AMIN/2
// PORT: Fixed ROM slots 19232.
                        if slot <> 19232 or instruction <> 14820 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19234 {
                    if slot <= 19233 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:754
//		AD	L		# L HAS ABS(AOS) - AMIN
// PORT: Fixed ROM slots 19233.
                        if slot <> 19233 or instruction <> 24577 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 1).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:755
//		EXTEND			# RESULT IS ABS(AOS)- AMIN/2
// PORT: Fixed ROM slots 19234.
                        if slot <> 19234 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19235 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:756
//		BZMF	NOAOS		# ABS(AOS) LESS THAN AMIN/2
// PORT: Fixed ROM slots 19235.
                        if slot <> 19235 or instruction <> 26411 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26411, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19236 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:757
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:758
//SOMEAOS		CA	DBVAL3		# AMIN/2 LT ABS(AOS) LT AMIN
// PORT: Fixed ROM slots 19236.
                            if slot <> 19236 or instruction <> 12365 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 77).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:759
//		INDEX	-SIGNAOS
// PORT: Fixed ROM slots 19237.
                            if slot <> 19237 or instruction <> 20596 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 20596, words[0], readEffective).
                            }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 20596, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1168] to agcAotUnit1168@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:760
//		TS	DBB3		# DB3(4) = DB/2
// PORT: Fixed ROM slots 19238.
    19238, 45260
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19239–19240.
function agcAotUnit1169 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19239 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:761
//		AD	A
// PORT: Fixed ROM slots 19239.
        if slot <> 19239 or instruction <> 24576 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreAD(words, 0).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:762
//		INDEX	SIGNAOS
// PORT: Fixed ROM slots 19240.
        if slot <> 19240 or instruction <> 20595 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20595, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20595, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1169] to agcAotUnit1169@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:763
//		TS	DBB4		# DB4(3) = DB
// PORT: Fixed ROM slots 19241.
    19241, 45258
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19242–19251.
function agcAotUnit1170 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19246 {
        if slot <= 19243 {
            if slot <= 19242 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:764
//		TCF	SKIPDB2
// PORT: Fixed ROM slots 19242.
                if slot <> 19242 or instruction <> 5934 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5934, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:765
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:766
//NOAOS		CA	DBVAL1
// PORT: Fixed ROM slots 19243.
                if slot <> 19243 or instruction <> 13030 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 742).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19244 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:767
//		TS	DBB3		# DB3,4 = DB
// PORT: Fixed ROM slots 19244.
                if slot <> 19244 or instruction <> 22630 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22630, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19245 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:768
//		TS	DBB4
// PORT: Fixed ROM slots 19245.
                    if slot <> 19245 or instruction <> 22629 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22629, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:769
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:770
//SKIPDB2		CA	ABSAOS		# ANETPOS(NEG) MAX = 2 JACC + ABS(AOS)
// PORT: Fixed ROM slots 19246.
                    if slot <> 19246 or instruction <> 12402 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 114).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 19248 {
            if slot <= 19247 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:771
//		AD	1JACCU
// PORT: Fixed ROM slots 19247.
                if slot <> 19247 or instruction <> 25435 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 859).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:772
//		AD	1JACCU
// PORT: Fixed ROM slots 19248.
                if slot <> 19248 or instruction <> 25435 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 859).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19249 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:773
//		TS	ANET		# CANNOT OVERFLOW HERE
// PORT: Fixed ROM slots 19249.
                if slot <> 19249 or instruction <> 22639 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22639, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19250 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:774
//CL1/NET+	TC	DO1/NET+	# COMPUTE 1/ANET, ACCFUN
// PORT: Fixed ROM slots 19250.
                    if slot <> 19250 or instruction <> 2004 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2004, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:775
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:776
//ACCTHERE	INDEX	-SIGNAOS
// PORT: Fixed ROM slots 19251.
                    if slot <> 19251 or instruction <> 20596 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20596, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20596, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1170] to agcAotUnit1170@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:777
//		TS	Z5TEM 	+2	# STORE ACCFUN IN TEMPORARY BUFFER
// PORT: Fixed ROM slots 19252.
    19252, 45240
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19253–19254.
function agcAotUnit1171 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19253 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:778
//		CA	1/ANET
// PORT: Fixed ROM slots 19253.
        if slot <> 19253 or instruction <> 12400 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 112).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:779
//		INDEX	-SIGNAOS
// PORT: Fixed ROM slots 19254.
        if slot <> 19254 or instruction <> 20596 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20596, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20596, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1171] to agcAotUnit1171@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:780
//		TS	1/ATEM2 +2	# STORE 1/ANET IN TEMPORARY BUFFER
// PORT: Fixed ROM slots 19255.
    19255, 45228
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19256–19265.
function agcAotUnit1172 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19260 {
        if slot <= 19257 {
            if slot <= 19256 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:781
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:782
//		CA	ABSAOS		# SEE IF OVERFLOW IN MIN CASE
// PORT: Fixed ROM slots 19256.
                if slot <> 19256 or instruction <> 12402 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 114).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:783
//		AD	1JACCU
// PORT: Fixed ROM slots 19257.
                if slot <> 19257 or instruction <> 25435 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 859).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19258 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:784
//# Page 1501
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:785
//		AD	BIT9		# MAXIMUM POSSIBLE VALUE
// PORT: Fixed ROM slots 19258.
                if slot <> 19258 or instruction <> 27107 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19259 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:786
//		TS	A		# OVERFLOW POSSIBLE BUT REMOTE
// PORT: Fixed ROM slots 19259.
                    if slot <> 19259 or instruction <> 22528 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22528, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:787
//		TCF	+2
// PORT: Fixed ROM slots 19260.
                    if slot <> 19260 or instruction <> 5950 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5950, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 19262 {
            if slot <= 19261 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:788
//		CA	POSMAX		# IF OVERFLOW, TRUNCATE TO PI/2
// PORT: Fixed ROM slots 19261.
                if slot <> 19261 or instruction <> 14811 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:789
//		AD	-.03R/S2	# RESTORE TO CORRECT VALUE
// PORT: Fixed ROM slots 19262.
                if slot <> 19262 or instruction <> 26612 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2036), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19263 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:790
//		TS	ANET
// PORT: Fixed ROM slots 19263.
                if slot <> 19263 or instruction <> 22639 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22639, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19264 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:791
//		TC	DO1/NET+	# COMPUTE 1/ANET, ACCFUN
// PORT: Fixed ROM slots 19264.
                    if slot <> 19264 or instruction <> 2004 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2004, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:792
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:793
//		INDEX	-SIGNAOS	# STORE MIN VALUES JUST AS MAX VALUES
// PORT: Fixed ROM slots 19265.
                    if slot <> 19265 or instruction <> 20596 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20596, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20596, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1172] to agcAotUnit1172@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:794
//		TS	Z5TEM
// PORT: Fixed ROM slots 19266.
    19266, 45236
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19267–19268.
function agcAotUnit1173 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19267 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:795
//		CA	1/ANET
// PORT: Fixed ROM slots 19267.
        if slot <> 19267 or instruction <> 12400 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 112).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:796
//		INDEX	-SIGNAOS
// PORT: Fixed ROM slots 19268.
        if slot <> 19268 or instruction <> 20596 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20596, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20596, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1173] to agcAotUnit1173@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:797
//		TS	1/ATEM2
// PORT: Fixed ROM slots 19269.
    19269, 45224
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19270–19274.
function agcAotUnit1174 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19271 {
        if slot <= 19270 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:798
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:799
//		CS	ABSAOS		# NOW DO NEG(POS) CASES
// PORT: Fixed ROM slots 19270.
            if slot <> 19270 or instruction <> 16498 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 114).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:800
//		AD	1JACCU
// PORT: Fixed ROM slots 19271.
            if slot <> 19271 or instruction <> 25435 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 859).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19272 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:801
//		AD	1JACCU		# ANETNEG(POS) MAX
// PORT: Fixed ROM slots 19272.
            if slot <> 19272 or instruction <> 25435 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 859).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 19273 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:802
//		TC	1/ANET-		# COMPUTE 1/ANET, ACCFUN, AND ACCSW
// PORT: Fixed ROM slots 19273.
                if slot <> 19273 or instruction <> 1994 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1994, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:803
//		INDEX	SIGNAOS		# STORE NEG(POS) VALUES JUST AS POS(NEG)
// PORT: Fixed ROM slots 19274.
                if slot <> 19274 or instruction <> 20595 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20595, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20595, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1174] to agcAotUnit1174@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:804
//		TS	Z1TEM 	+2
// PORT: Fixed ROM slots 19275.
    19275, 45238
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19276–19278.
function agcAotUnit1175 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19276 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:805
//		TS	L		# SAVE IN L FOR POSSIBLE FUTURE USE
// PORT: Fixed ROM slots 19276.
        if slot <> 19276 or instruction <> 22529 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 22529, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 19277 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:806
//		CA	1/ANET
// PORT: Fixed ROM slots 19277.
            if slot <> 19277 or instruction <> 12400 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 112).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:807
//		INDEX	SIGNAOS
// PORT: Fixed ROM slots 19278.
            if slot <> 19278 or instruction <> 20595 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20595, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20595, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1175] to agcAotUnit1175@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:808
//		TS	1/ATEM1 +2
// PORT: Fixed ROM slots 19279.
    19279, 45226
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19280–19287.
function agcAotUnit1176 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19283 {
        if slot <= 19281 {
            if slot <= 19280 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:809
//		CS	ABSAOS
// PORT: Fixed ROM slots 19280.
                if slot <> 19280 or instruction <> 16498 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 114).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:810
//		AD	1JACCU		# 1/ANETNEG(POS) MIN
// PORT: Fixed ROM slots 19281.
                if slot <> 19281 or instruction <> 25435 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 859).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19282 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:811
//		TS	ANET
// PORT: Fixed ROM slots 19282.
                if slot <> 19282 or instruction <> 22639 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22639, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:812
//		AD	-.03R/S2	# TEST FOR AMIN
// PORT: Fixed ROM slots 19283.
                if slot <> 19283 or instruction <> 26612 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2036), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 19285 {
            if slot <= 19284 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:813
//		EXTEND			# IF ANET LESS THAN AMIN, STORE MAX JET
// PORT: Fixed ROM slots 19284.
                if slot <> 19284 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:814
//		BZMF	FIXMIN		# VALUES FOR MIN JETS AND SET ACCSW
// PORT: Fixed ROM slots 19285.
                if slot <> 19285 or instruction <> 26595 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26595, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19286 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:815
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:816
//		TC	1/NETMIN	# OTHERWISE DO MIN JET COMPUTATIONS
// PORT: Fixed ROM slots 19286.
                if slot <> 19286 or instruction <> 2000 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2000, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:817
//STMIN-		INDEX	SIGNAOS		# STORE VALUES
// PORT: Fixed ROM slots 19287.
                if slot <> 19287 or instruction <> 20595 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20595, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20595, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1176] to agcAotUnit1176@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:818
//		TS	Z1TEM
// PORT: Fixed ROM slots 19288.
    19288, 45234
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19289–19290.
function agcAotUnit1177 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19289 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:819
//		CA	1/ANET
// PORT: Fixed ROM slots 19289.
        if slot <> 19289 or instruction <> 12400 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 112).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:820
//		INDEX	SIGNAOS
// PORT: Fixed ROM slots 19290.
        if slot <> 19290 or instruction <> 20595 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20595, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20595, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1177] to agcAotUnit1177@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:821
//		TS	1/ATEM1
// PORT: Fixed ROM slots 19291.
    19291, 45222
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19292–19292.
function agcAotUnit1178 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:822
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:823
//		INDEX	UV
// PORT: Fixed ROM slots 19292.
    if slot <> 19292 or instruction <> 20588 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20588, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20588, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1178] to agcAotUnit1178@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:824
//		CA	+UMASK
// PORT: Fixed ROM slots 19293.
    19293, 28656
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19294–19301.
function agcAotUnit1179 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19297 {
        if slot <= 19295 {
            if slot <= 19294 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:825
//		MASK	CH5MASK		# TEST FOR +U (+V) JET FAILURES
// PORT: Fixed ROM slots 19294.
                if slot <> 19294 or instruction <> 29362 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 690).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:826
//		EXTEND
// PORT: Fixed ROM slots 19295.
                if slot <> 19295 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19296 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:827
//		BZF	FAIL-
// PORT: Fixed ROM slots 19296.
                if slot <> 19296 or instruction <> 5989 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5989, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:828
//		CA	1/ATEM2		# REPLACE FUNCTION VALUES DEPENDING ON THE
// PORT: Fixed ROM slots 19297.
                if slot <> 19297 or instruction <> 12372 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 84).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 19299 {
            if slot <= 19298 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:829
//		TS	1/ATEM2 +2	# FAILED JET PAIR WITH CORRESPONDING ONE-
// PORT: Fixed ROM slots 19298.
                if slot <> 19298 or instruction <> 22614 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22614, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:830
//		CA	Z5TEM		# JET (OR AMIN) FUNCTION VALUES
// PORT: Fixed ROM slots 19299.
                if slot <> 19299 or instruction <> 12378 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 90).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19300 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:831
//		TS	Z5TEM 	+2
// PORT: Fixed ROM slots 19300.
                if slot <> 19300 or instruction <> 22620 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22620, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:832
//FAIL-		INDEX	UV
// PORT: Fixed ROM slots 19301.
                if slot <> 19301 or instruction <> 20588 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20588, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20588, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1179] to agcAotUnit1179@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:833
//# Page 1502
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:834
//		CA	-UMASK
// PORT: Fixed ROM slots 19302.
    19302, 28652
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19303–19324.
function agcAotUnit1180 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19313 {
        if slot <= 19307 {
            if slot <= 19304 {
                if slot <= 19303 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:835
//		MASK	CH5MASK		# TEST FOR -U (-V) JET FAILURES
// PORT: Fixed ROM slots 19303.
                    if slot <> 19303 or instruction <> 29362 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 690).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:836
//		EXTEND
// PORT: Fixed ROM slots 19304.
                    if slot <> 19304 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19305 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:837
//		BZF	DBFUN
// PORT: Fixed ROM slots 19305.
                    if slot <> 19305 or instruction <> 5998 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5998, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19306 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:838
//		CA	1/ATEM1		# REPLACE FUNCTION VALUES DEPENDING ON THE
// PORT: Fixed ROM slots 19306.
                        if slot <> 19306 or instruction <> 12371 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 83).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:839
//		TS	1/ATEM1 +2	# FAILED JET PAIR WITH CORRESPONDING ONE-
// PORT: Fixed ROM slots 19307.
                        if slot <> 19307 or instruction <> 22613 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22613, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 19310 {
                if slot <= 19308 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:840
//		CA	Z1TEM		# JET (OR AMIN) FUNCTION VALUES
// PORT: Fixed ROM slots 19308.
                    if slot <> 19308 or instruction <> 12377 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 89).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19309 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:841
//		TS	Z1TEM 	+2
// PORT: Fixed ROM slots 19309.
                        if slot <> 19309 or instruction <> 22619 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22619, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:842
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:843
//DBFUN		CS	DBB3		# COMPUTE AXISDIST
// PORT: Fixed ROM slots 19310.
                        if slot <> 19310 or instruction <> 16486 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 102).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19311 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:844
//		AD	DBB1
// PORT: Fixed ROM slots 19311.
                    if slot <> 19311 or instruction <> 24675 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 99).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19312 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:845
//		AD	FLATEMP
// PORT: Fixed ROM slots 19312.
                        if slot <> 19312 or instruction <> 24681 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 105).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:846
//		TS	AXDSTEM
// PORT: Fixed ROM slots 19313.
                        if slot <> 19313 or instruction <> 22631 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22631, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 19318 {
            if slot <= 19315 {
                if slot <= 19314 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:847
//		CS	DBB4
// PORT: Fixed ROM slots 19314.
                    if slot <> 19314 or instruction <> 16485 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 101).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:848
//		AD	DBB2
// PORT: Fixed ROM slots 19315.
                    if slot <> 19315 or instruction <> 24676 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 100).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19316 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:849
//		AD	FLATEMP
// PORT: Fixed ROM slots 19316.
                    if slot <> 19316 or instruction <> 24681 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 105).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19317 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:850
//		TS	AXDSTEM +1
// PORT: Fixed ROM slots 19317.
                        if slot <> 19317 or instruction <> 22632 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22632, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:851
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:852
//		INHINT
// PORT: Fixed ROM slots 19318.
                        if slot <> 19318 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 19321 {
                if slot <= 19319 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:853
//		CCS	UV		# TEST FOR U OR V AXIS
// PORT: Fixed ROM slots 19319.
                    if slot <> 19319 or instruction <> 4204 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 108).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19320 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:854
//		TCF	STORV		# V AXIS 	STORE V VALUES
// PORT: Fixed ROM slots 19320.
                        if slot <> 19320 or instruction <> 6026 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6026, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:855
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:856
//		CA	ACCSW		# U AXIS 	STORE U VALUES
// PORT: Fixed ROM slots 19321.
                        if slot <> 19321 or instruction <> 12370 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 82).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19322 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:857
//		TS	ACCSWU
// PORT: Fixed ROM slots 19322.
                    if slot <> 19322 or instruction <> 23399 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23399, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19323 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:858
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:859
//		CA	NINE		# TRANSFER 10 WORDS VIA GENTRAN
// PORT: Fixed ROM slots 19323.
                        if slot <> 19323 or instruction <> 14544 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2256), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:860
//		TC	GENTRAN +1
// PORT: Fixed ROM slots 19324.
                        if slot <> 19324 or instruction <> 2917 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2917, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1180] to agcAotUnit1180@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:861
//		ADRES	1/ATEM1		# TEMPORARY BUFFER
// PORT: Fixed ROM slots 19325.
    19325, 166,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:862
//		ADRES	1/ANET1		# THE REAL PLACE
// PORT: Fixed ROM slots 19326.
    19326, 1774
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19327–19338.
function agcAotUnit1181 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19332 {
        if slot <= 19329 {
            if slot <= 19327 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:863
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:864
//		RELINT
// PORT: Fixed ROM slots 19327.
                if slot <> 19327 or instruction <> 3 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19328 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:865
//		DXCH	DBB1		# SAVE U DBS FOR LATER STORING
// PORT: Fixed ROM slots 19328.
                    if slot <> 19328 or instruction <> 21604 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 100, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:866
//		DXCH	UDB1
// PORT: Fixed ROM slots 19329.
                    if slot <> 19329 or instruction <> 21598 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 94, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 19330 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:867
//		DXCH	DBB4
// PORT: Fixed ROM slots 19330.
                if slot <> 19330 or instruction <> 21606 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 102, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19331 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:868
//		DXCH	UDB4
// PORT: Fixed ROM slots 19331.
                    if slot <> 19331 or instruction <> 21600 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 96, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:869
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:870
//		DXCH	AXDSTEM
// PORT: Fixed ROM slots 19332.
                    if slot <> 19332 or instruction <> 21608 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 104, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 19335 {
            if slot <= 19333 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:871
//		DXCH	UAXDIST
// PORT: Fixed ROM slots 19333.
                if slot <> 19333 or instruction <> 21602 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 98, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19334 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:872
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:873
//		CA	ONE		# NOW DO V AXIS
// PORT: Fixed ROM slots 19334.
                    if slot <> 19334 or instruction <> 14827 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:874
//		TS	UV
// PORT: Fixed ROM slots 19335.
                    if slot <> 19335 or instruction <> 22636 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22636, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 19336 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:875
//		CA	ZERO
// PORT: Fixed ROM slots 19336.
                if slot <> 19336 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 19337 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:876
//		TCF	BOTHAXES	# AND DO IT AGAIN
// PORT: Fixed ROM slots 19337.
                    if slot <> 19337 or instruction <> 5840 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5840, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:877
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:878
//STORV		CA	ACCSW		# STORE V AXIS VALUES
// PORT: Fixed ROM slots 19338.
                    if slot <> 19338 or instruction <> 12370 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 82).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1181] to agcAotUnit1181@.

// PORT: Physical bank 20. Shared continuation entries, slots 19339–19341.
function agcAotUnit1182 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19339 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:879
//		TS	ACCSWV
// PORT: Fixed ROM slots 19339.
        if slot <> 19339 or instruction <> 23400 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23400, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 19340 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:880
//		CA	NINE
// PORT: Fixed ROM slots 19340.
            if slot <> 19340 or instruction <> 14544 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2256), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:881
//		TC	GENTRAN +1
// PORT: Fixed ROM slots 19341.
            if slot <> 19341 or instruction <> 2917 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2917, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1182] to agcAotUnit1182@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:882
//# Page 1503
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:883
//		ADRES 	1/ATEM1		# TEMPORARY BUFFER
// PORT: Fixed ROM slots 19342.
    19342, 166,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:884
//		ADRES	1/ANET1 +16D	# THE REAL PLACE
// PORT: Fixed ROM slots 19343.
    19343, 1806
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19344–19410.
function agcAotUnit1183 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19376 {
        if slot <= 19359 {
            if slot <= 19351 {
                if slot <= 19347 {
                    if slot <= 19345 {
                        if slot <= 19344 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:885
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:886
//					# NOW STORE DEADBANDS FOR ALL AXES
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:887
//		DXCH	FLATEMP		# FLAT AND ZONE3LIM
// PORT: Fixed ROM slots 19344.
                            if slot <> 19344 or instruction <> 21610 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 106, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:888
//		DXCH	FLAT
// PORT: Fixed ROM slots 19345.
                            if slot <> 19345 or instruction <> 22382 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 878, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19346 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:889
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:890
//		CA	DBVAL1		# COMPUTE P AXIS DEADBANDS
// PORT: Fixed ROM slots 19346.
                            if slot <> 19346 or instruction <> 13030 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 742).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:891
//		TS	PDB1
// PORT: Fixed ROM slots 19347.
                            if slot <> 19347 or instruction <> 23409 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23409, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 19349 {
                        if slot <= 19348 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:892
//		TS	PDB2
// PORT: Fixed ROM slots 19348.
                            if slot <> 19348 or instruction <> 23410 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23410, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:893
//		AD	FLAT
// PORT: Fixed ROM slots 19349.
                            if slot <> 19349 or instruction <> 25453 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 877).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19350 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:894
//		TS	PDB3
// PORT: Fixed ROM slots 19350.
                            if slot <> 19350 or instruction <> 23412 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23412, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:895
//		TS	PDB4
// PORT: Fixed ROM slots 19351.
                            if slot <> 19351 or instruction <> 23411 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23411, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 19355 {
                    if slot <= 19353 {
                        if slot <= 19352 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:896
//		CA	ZERO
// PORT: Fixed ROM slots 19352.
                            if slot <> 19352 or instruction <> 14829 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:897
//		TS	PAXDIST
// PORT: Fixed ROM slots 19353.
                            if slot <> 19353 or instruction <> 23413 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23413, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19354 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:898
//		TS	PAXDIST +1
// PORT: Fixed ROM slots 19354.
                            if slot <> 19354 or instruction <> 23414 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23414, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:899
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:900
//		CCS	FLAT
// PORT: Fixed ROM slots 19355.
                            if slot <> 19355 or instruction <> 4973 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 877).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 19357 {
                        if slot <= 19356 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:901
//		TCF	DRFDB		# DRIFT OR GTS -- COMPUTE DBS
// PORT: Fixed ROM slots 19356.
                            if slot <> 19356 or instruction <> 6058 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6058, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:902
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:903
//		DXCH	UDB1		# STORE U DEADBANDS
// PORT: Fixed ROM slots 19357.
                            if slot <> 19357 or instruction <> 21598 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 94, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19358 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:904
//		DXCH	FIREDB		# CANNOT USE GENTRAN BECAUSE OF RELINT
// PORT: Fixed ROM slots 19358.
                            if slot <> 19358 or instruction <> 22402 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 898, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:905
//		DXCH	UDB4
// PORT: Fixed ROM slots 19359.
                            if slot <> 19359 or instruction <> 21600 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 96, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 19367 {
                if slot <= 19363 {
                    if slot <= 19361 {
                        if slot <= 19360 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:906
//		DXCH	COASTDB
// PORT: Fixed ROM slots 19360.
                            if slot <> 19360 or instruction <> 22404 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 900, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:907
//		DXCH	UAXDIST
// PORT: Fixed ROM slots 19361.
                            if slot <> 19361 or instruction <> 21602 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 98, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19362 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:908
//		DXCH	AXISDIST
// PORT: Fixed ROM slots 19362.
                            if slot <> 19362 or instruction <> 22406 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 902, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:909
//		DXCH	DBB1		# STORE V AXIS DEADBANDS
// PORT: Fixed ROM slots 19363.
                            if slot <> 19363 or instruction <> 21604 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 100, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 19365 {
                        if slot <= 19364 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:910
//		DXCH	FIREDB 	+16D	# COULD USE GENTRAN IF DESIRED
// PORT: Fixed ROM slots 19364.
                            if slot <> 19364 or instruction <> 22418 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 914, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:911
//		DXCH	DBB4
// PORT: Fixed ROM slots 19365.
                            if slot <> 19365 or instruction <> 21606 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 102, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19366 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:912
//		DXCH	COASTDB +16D
// PORT: Fixed ROM slots 19366.
                            if slot <> 19366 or instruction <> 22420 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 916, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:913
//		DXCH	AXDSTEM
// PORT: Fixed ROM slots 19367.
                            if slot <> 19367 or instruction <> 21608 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 104, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 19371 {
                    if slot <= 19369 {
                        if slot <= 19368 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:914
//		DXCH	AXISDIST +16D
// PORT: Fixed ROM slots 19368.
                            if slot <> 19368 or instruction <> 22422 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 918, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:915
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:916
//		TCF	1/ACCRET +1	# ALL DONE
// PORT: Fixed ROM slots 19369.
                            if slot <> 19369 or instruction <> 6074 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6074, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19370 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:917
//DRFDB		CA	DBVAL1		# DRIFT DEADBANDS
// PORT: Fixed ROM slots 19370.
                            if slot <> 19370 or instruction <> 13030 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 742).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:918
//		TS	FIREDB
// PORT: Fixed ROM slots 19371.
                            if slot <> 19371 or instruction <> 23425 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23425, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 19373 {
                        if slot <= 19372 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:919
//		TS	FIREDB 	+1
// PORT: Fixed ROM slots 19372.
                            if slot <> 19372 or instruction <> 23426 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23426, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:920
//		TS	FIREDB 	+16D
// PORT: Fixed ROM slots 19373.
                            if slot <> 19373 or instruction <> 23441 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23441, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19374 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:921
//		TS	FIREDB 	+17D
// PORT: Fixed ROM slots 19374.
                            if slot <> 19374 or instruction <> 23442 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23442, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19375 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:922
//		AD	FLAT
// PORT: Fixed ROM slots 19375.
                                if slot <> 19375 or instruction <> 25453 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 877).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:923
//		TS	COASTDB
// PORT: Fixed ROM slots 19376.
                                if slot <> 19376 or instruction <> 23427 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23427, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 19393 {
            if slot <= 19384 {
                if slot <= 19380 {
                    if slot <= 19378 {
                        if slot <= 19377 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:924
//		TS	COASTDB +1
// PORT: Fixed ROM slots 19377.
                            if slot <> 19377 or instruction <> 23428 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23428, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:925
//		TS	COASTDB +16D
// PORT: Fixed ROM slots 19378.
                            if slot <> 19378 or instruction <> 23443 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23443, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19379 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:926
//		TS	COASTDB +17D
// PORT: Fixed ROM slots 19379.
                            if slot <> 19379 or instruction <> 23444 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23444, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:927
//		CA	ZERO
// PORT: Fixed ROM slots 19380.
                            if slot <> 19380 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
                    if slot <= 19382 {
                        if slot <= 19381 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:928
//		TS	AXISDIST
// PORT: Fixed ROM slots 19381.
                            if slot <> 19381 or instruction <> 23429 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23429, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:929
//		TS	AXISDIST +1
// PORT: Fixed ROM slots 19382.
                            if slot <> 19382 or instruction <> 23430 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23430, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19383 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:930
//		TS	AXISDIST +16D
// PORT: Fixed ROM slots 19383.
                            if slot <> 19383 or instruction <> 23445 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23445, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:931
//		TS	AXISDIST +17D
// PORT: Fixed ROM slots 19384.
                            if slot <> 19384 or instruction <> 23446 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23446, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 19388 {
                    if slot <= 19386 {
                        if slot <= 19385 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:932
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:933
//# Page 1504
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:934
//1/ACCRET	INHINT
// PORT: Fixed ROM slots 19385.
                            if slot <> 19385 or instruction <> 4 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 4, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:935
//		CS	DAPBOOLS	# SET BIT TO INDICATE DATA GOOD.
// PORT: Fixed ROM slots 19386.
                            if slot <> 19386 or instruction <> 16457 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 73).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19387 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:936
//		MASK	ACCSOKAY
// PORT: Fixed ROM slots 19387.
                            if slot <> 19387 or instruction <> 31209 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                                if fixedOperand = 4 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 4), 2) * 4).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:937
//		ADS	DAPBOOLS
// PORT: Fixed ROM slots 19388.
                            if slot <> 19388 or instruction <> 11337 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 73).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 19390 {
                        if slot <= 19389 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:938
//		RELINT
// PORT: Fixed ROM slots 19389.
                            if slot <> 19389 or instruction <> 3 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:939
//		CA	ACCRETRN
// PORT: Fixed ROM slots 19390.
                            if slot <> 19390 or instruction <> 12367 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 79).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19391 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:940
//		TC	BANKJUMP	# RETURN TO CALLER
// PORT: Fixed ROM slots 19391.
                            if slot <> 19391 or instruction <> 2464 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2464, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19392 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:941
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:942
//INVERT		TS	HOLD		# ROUTINE TO INVERT -INPUT AT PI/2
// PORT: Fixed ROM slots 19392.
                                if slot <> 19392 or instruction <> 22645 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22645, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:943
//		CA	BIT9		# 1 AT 2(6)
// PORT: Fixed ROM slots 19393.
                                if slot <> 19393 or instruction <> 14819 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2531), 32768).
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
            if slot <= 19401 {
                if slot <= 19397 {
                    if slot <= 19395 {
                        if slot <= 19394 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:944
//		ZL			# ZERO L FOR ACCURACY AND TO PREVENT OVFLO
// PORT: Fixed ROM slots 19394.
                            if slot <> 19394 or instruction <> 9223 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 7, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:945
//		EXTEND
// PORT: Fixed ROM slots 19395.
                            if slot <> 19395 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19396 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:946
//		DV	HOLD
// PORT: Fixed ROM slots 19396.
                            if slot <> 19396 or instruction <> 4213 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreDv(words, 117, readEffective:call(words, 117)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:947
//		TC	Q		# RESULT AT 2(7)/PI
// PORT: Fixed ROM slots 19397.
                            if slot <> 19397 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 19399 {
                        if slot <= 19398 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:948
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:949
//DOWNGTS		CAF	ZERO		# ZERO SWITCHES WHEN USEQRJTS BIT IS UP
// PORT: Fixed ROM slots 19398.
                            if slot <> 19398 or instruction <> 14829 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:950
//		TS	ALLOWGTS	#	OR DAP IS OFF
// PORT: Fixed ROM slots 19399.
                            if slot <> 19399 or instruction <> 23362 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23362, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19400 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:951
//		TS	INGTS
// PORT: Fixed ROM slots 19400.
                            if slot <> 19400 or instruction <> 23451 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23451, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:952
//		TCF	DOCKTEST
// PORT: Fixed ROM slots 19401.
                            if slot <> 19401 or instruction <> 5627 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5627, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 19405 {
                    if slot <= 19403 {
                        if slot <= 19402 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:953
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:954
//1/ANET-		ZL
// PORT: Fixed ROM slots 19402.
                            if slot <> 19402 or instruction <> 9223 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 7, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:955
//		LXCH	ACCSW		# ZERO ACCSW
// PORT: Fixed ROM slots 19403.
                            if slot <> 19403 or instruction <> 9298 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 82, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19404 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:956
//		TS	ANET		# SAVE ANET
// PORT: Fixed ROM slots 19404.
                            if slot <> 19404 or instruction <> 22639 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22639, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:957
//		AD	-.03R/S2	# TEST FOR MIN VALUE
// PORT: Fixed ROM slots 19405.
                            if slot <> 19405 or instruction <> 26612 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2036), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 19407 {
                        if slot <= 19406 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:958
//		EXTEND
// PORT: Fixed ROM slots 19406.
                            if slot <> 19406 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:959
//		BZMF	NETNEG		# ANET LESS THAN AMIN, SO FAKE IT
// PORT: Fixed ROM slots 19407.
                            if slot <> 19407 or instruction <> 26592 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 26592, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 19408 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:960
//1/NETMIN	CA	ANET
// PORT: Fixed ROM slots 19408.
                            if slot <> 19408 or instruction <> 12399 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 111).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19409 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:961
//		EXTEND
// PORT: Fixed ROM slots 19409.
                                if slot <> 19409 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:962
//		INDEX	-SIGNAOS
// PORT: Fixed ROM slots 19410.
                                if slot <> 19410 or instruction <> 20596 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 20596, words[0], readEffective).
                                }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 20596, words[0], readEffective).
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
set agcAotRoutes[1183] to agcAotUnit1183@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:963
//		MP	1/ACOSTT +1	# ANETNEG(POS)/ACOASTPOS(NEG) AT 2(6)
// PORT: Fixed ROM slots 19411.
    19411, 57520
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19412–19432.
function agcAotUnit1184 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19421 {
        if slot <= 19416 {
            if slot <= 19413 {
                if slot <= 19412 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:964
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:965
//# THE FOLLOWING CODING IS VALID FOR BOTH POS OR NEG
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:966
//#	VALUES OF AOS
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:967
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:968
//DO1/NET+	AD	BIT9		# 1 + ANET/ACOAST AT 2(6)
// PORT: Fixed ROM slots 19412.
                    if slot <> 19412 or instruction <> 27107 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:969
//		XCH	ANET		# SAVE AND PICK UP ANET
// PORT: Fixed ROM slots 19413.
                    if slot <> 19413 or instruction <> 23663 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 111, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19414 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:970
//		EXTEND
// PORT: Fixed ROM slots 19414.
                    if slot <> 19414 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19415 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:971
//		QXCH	ARET		# SAVE RETURN
// PORT: Fixed ROM slots 19415.
                        if slot <> 19415 or instruction <> 9329 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 2, 113, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:972
//		TC	INVERT
// PORT: Fixed ROM slots 19416.
                        if slot <> 19416 or instruction <> 1984 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1984, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 19418 {
                if slot <= 19417 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:973
//		TS	1/ANET		# 1/ANET AT 2(7)/PI
// PORT: Fixed ROM slots 19417.
                    if slot <> 19417 or instruction <> 22640 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22640, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:974
//		CS	BIT9		# -1 AT 2(6)
// PORT: Fixed ROM slots 19418.
                    if slot <> 19418 or instruction <> 18915 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19419 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:975
//DOACCFUN	EXTEND
// PORT: Fixed ROM slots 19419.
                    if slot <> 19419 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19420 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:976
//		MP	1/ANET		# -1/ANET AT 2(13)/PI
// PORT: Fixed ROM slots 19420.
                        if slot <> 19420 or instruction <> 28784 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 112, readEffective:call(words, 112)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:977
//		EXTEND
// PORT: Fixed ROM slots 19421.
                        if slot <> 19421 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 19426 {
            if slot <= 19423 {
                if slot <= 19422 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:978
//		DV	ANET		# ACCFUN AT 2(7)/PI
// PORT: Fixed ROM slots 19422.
                    if slot <> 19422 or instruction <> 4207 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreDv(words, 111, readEffective:call(words, 111)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:979
//		TC	ARET		# RETURN
// PORT: Fixed ROM slots 19423.
                    if slot <> 19423 or instruction <> 113 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 113, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19424 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:980
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:981
//NETNEG		CS	-.03R/S2	# ANET LESS THAN AMIN -- SET EQUAL TO AMIN
// PORT: Fixed ROM slots 19424.
                    if slot <> 19424 or instruction <> 18420 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2036), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19425 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:982
//		TS	ANET
// PORT: Fixed ROM slots 19425.
                        if slot <> 19425 or instruction <> 22639 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22639, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:983
//# Page 1505
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:984
//		TCF	1/NETMIN +1	# CONTINUE AS IF NOTHING HAPPENED.
// PORT: Fixed ROM slots 19426.
                        if slot <> 19426 or instruction <> 6097 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6097, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 19429 {
                if slot <= 19427 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:985
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:986
//FIXMIN		CCS	SIGNAOS
// PORT: Fixed ROM slots 19427.
                    if slot <> 19427 or instruction <> 4211 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 115).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19428 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:987
//		CA	TWO		# IF AOS NEG, ACCSW = +1
// PORT: Fixed ROM slots 19428.
                        if slot <> 19428 or instruction <> 14826 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:988
//		AD	NEGONE		# IF AOS POS, ACCSW = -1
// PORT: Fixed ROM slots 19429.
                        if slot <> 19429 or instruction <> 28647 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 4071), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19430 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:989
//		TS	ACCSW
// PORT: Fixed ROM slots 19430.
                    if slot <> 19430 or instruction <> 22610 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22610, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19431 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:990
//		AD	UV		# IF ACCSW = +1, TEST FOR +U (+V) JET FAIL
// PORT: Fixed ROM slots 19431.
                        if slot <> 19431 or instruction <> 24684 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 108).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:991
//		INDEX	A		# IF ACCSW = -1, TEST FOR -U (-V) JET FAIL
// PORT: Fixed ROM slots 19432.
                        if slot <> 19432 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1184] to agcAotUnit1184@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:992
//		CA	-UMASK 	+1
// PORT: Fixed ROM slots 19433.
    19433, 28654
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19434–19441.
function agcAotUnit1185 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19437 {
        if slot <= 19435 {
            if slot <= 19434 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:993
//		MASK	CH5MASK
// PORT: Fixed ROM slots 19434.
                if slot <> 19434 or instruction <> 29362 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 690).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:994
//		EXTEND
// PORT: Fixed ROM slots 19435.
                if slot <> 19435 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19436 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:995
//		BZF	+4
// PORT: Fixed ROM slots 19436.
                if slot <> 19436 or instruction <> 6128 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6128, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:996
//		CS	-.03R/S2	# JET FAILURE -- CANNOT USE 2-JET VALUES
// PORT: Fixed ROM slots 19437.
                if slot <> 19437 or instruction <> 18420 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2036), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 19439 {
            if slot <= 19438 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:997
//		TS	ANET		# ANET = AMIN
// PORT: Fixed ROM slots 19438.
                if slot <> 19438 or instruction <> 22639 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22639, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:998
//		TCF	STMIN- 	-1	# CALCULATE FUNCTIONS USING AMIN
// PORT: Fixed ROM slots 19439.
                if slot <> 19439 or instruction <> 5974 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5974, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19440 {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:999
//		CA	L		# L HAS ACCFUN
// PORT: Fixed ROM slots 19440.
                if slot <> 19440 or instruction <> 12289 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 1).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1000
//		TCF	STMIN-		# STORE MAX VALUES FOR MIN JETS
// PORT: Fixed ROM slots 19441.
                if slot <> 19441 or instruction <> 5975 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5975, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1185] to agcAotUnit1185@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1001
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1002
//# ERASABLE ASSIGNMENTS FOR 1/ACCONT
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1003
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1004
//1/ANETP		EQUALS	BLOCKTOP +2
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1005
//1/ACOSTP	EQUALS	BLOCKTOP +4
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1006
//PACCFUN		EQUALS	BLOCKTOP +8D
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1007
//PDB1		EQUALS	BLOCKTOP +10D
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1008
//PDB2		EQUALS	BLOCKTOP +11D
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1009
//PDB4		EQUALS	BLOCKTOP +12D
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1010
//PDB3		EQUALS	BLOCKTOP +13D
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1011
//PAXDIST		EQUALS	BLOCKTOP +14D
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1012
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1013
//ACCSW		EQUALS	VBUF		# EXECUTIVE TEMPORARIES
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1014
//					# CANNOT DO CCS NEWJOB DURING 1/ACCS
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1015
//1/ATEM1		EQUALS	ACCSW 	+1	# TEMP BUFFER FOR U AND V AXES
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1016
//1/ATEM2		EQUALS	1/ATEM1 +1
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1017
//1/ACOSTT	EQUALS	1/ATEM1 +4
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1018
//Z1TEM		EQUALS	1/ATEM1 +6
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1019
//Z5TEM		EQUALS	1/ATEM1 +7
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1020
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1021
//UDB1		EQUALS	1/ATEM1 +10D	# UAXIS DEADBAND BUFFER
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1022
//UDB2		EQUALS	1/ATEM1 +11D
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1023
//UDB4		EQUALS	1/ATEM1 +12D
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1024
//UDB3		EQUALS	1/ATEM1 +13D
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1025
//UAXDIST		EQUALS	1/ATEM1 +14D
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1026
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1027
//DBB1		EQUALS	1/ATEM1 +16D	# TEMP DEADBAND BUFFER, ALSO V AXIS
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1028
//DBB2		EQUALS	1/ATEM1 +17D
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1029
//DBB4		EQUALS	1/ATEM1 +18D
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1030
//DBB3		EQUALS	1/ATEM1 +19D
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1031
//AXDSTEM		EQUALS	1/ATEM1 +20D
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1032
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1033
//# Page 1506
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1034
//FLATEMP		EQUALS	1/ATEM1 +22D
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1035
//Z3TEM		EQUALS	1/ATEM1 +23D	# MUST FOLLOW FLATEMP
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1036
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1037
//DBVAL1		EQUALS	DB
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1038
//DBVAL2		EQUALS	INTB15+
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1039
//DBVAL3		EQUALS	INTB15+ +1
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1040
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1041
//DRIFTER		EQUALS	INTB15+ +2
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1042
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1043
//UV		EQUALS	MPAC
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1044
//ANET		EQUALS	MPAC 	+3
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1045
//FUNTEM		EQUALS	MPAC 	+3
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1046
//1/ANET		EQUALS	MPAC 	+4
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1047
//ARET		EQUALS	MPAC 	+5
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1048
//ABSAOS		EQUALS	MPAC 	+6
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1049
//SIGNAOS		EQUALS	MPAC 	+7
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1050
//-SIGNAOS	EQUALS	MPAC 	+8D
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1051
//HOLD		EQUALS	MPAC 	+9D
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1052
//ACCRETRN	EQUALS	FIXLOC 	-1
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1053
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1054
//ZONE3MAX	DEC	.004375		# 17.5 MS (35 MS FOR 1 JET) AT 4 SECONDS
// PORT: Fixed ROM slots 19442.
    19442, 144,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1055
//FLATVAL		DEC	.01778		# .8 AT PI/4 RAD
// PORT: Fixed ROM slots 19443.
    19443, 582,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1056
//-.03R/S2	OCT	77377		# -PI/2(7) AT PI/2
// PORT: Fixed ROM slots 19444.
    19444, 65022,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1057
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1058
//.0125RS		EQUALS	BIT8		# PI/2(+8) AT PI/2
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1059
//1/.03		EQUALS	POSMAX		# 2(7)/PI AT 2(7)/PI
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1060
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1061
//PAXISADR	GENADR	PAXIS
// PORT: Fixed ROM slots 19445.
    19445, 2326,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1062
//
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1063
//					# THE FOLLOWING 4 CONSTANTS ARE JET
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1064
//					# FAILURE MASKS AND ARE INDEXED
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1065
//-UMASK		OCT	00110		# -U
// PORT: Fixed ROM slots 19446.
    19446, 144,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1066
//		OCT	00022		# -V
// PORT: Fixed ROM slots 19447.
    19447, 36,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1067
//+UMASK		OCT	00204		# +U
// PORT: Fixed ROM slots 19448.
    19448, 264,
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1068
//		OCT	00041		# +V
// PORT: Fixed ROM slots 19449.
    19449, 66
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE AOSTASK_AND_AOSJOB.agc:1069
//
