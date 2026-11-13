// PORT: Original source unit TVCEXECUTIVE.agc.
// PORT: Physical bank 16. Shared continuation entries, slots 16848–16853.
function agcAotUnit964 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16850 {
        if slot <= 16848 {
// PORT: SOURCE TVCEXECUTIVE.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE TVCEXECUTIVE.agc:2
//# Filename:	TVCEXECUTIVE.agc
// PORT: SOURCE TVCEXECUTIVE.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// PORT: SOURCE TVCEXECUTIVE.agc:4
//#		It is part of the source code for the Command Module's (CM)
// PORT: SOURCE TVCEXECUTIVE.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE TVCEXECUTIVE.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE TVCEXECUTIVE.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE TVCEXECUTIVE.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE TVCEXECUTIVE.agc:9
//# Pages:	945-950
// PORT: SOURCE TVCEXECUTIVE.agc:10
//# Mod history:	2009-05-12 RSB	Adapted from the Colossus249/ file of the
// PORT: SOURCE TVCEXECUTIVE.agc:11
//#				same name, using Comanche055 page images.
// PORT: SOURCE TVCEXECUTIVE.agc:12
//#		2009-05-20 RSB	Corrections:  CAE -> CAF in one place.
// PORT: SOURCE TVCEXECUTIVE.agc:13
//#		2009-05-21 RSB	In 1SHOTCHK, a CAF SEVEN was corrected to
// PORT: SOURCE TVCEXECUTIVE.agc:14
//#				CAF SIX.
// PORT: SOURCE TVCEXECUTIVE.agc:15
//#
// PORT: SOURCE TVCEXECUTIVE.agc:16
//# This source code has been transcribed or otherwise adapted from digitized
// PORT: SOURCE TVCEXECUTIVE.agc:17
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// PORT: SOURCE TVCEXECUTIVE.agc:18
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// PORT: SOURCE TVCEXECUTIVE.agc:19
//# thanks to both.  The images (with suitable reduction in storage size and
// PORT: SOURCE TVCEXECUTIVE.agc:20
//# consequent reduction in image quality as well) are available online at
// PORT: SOURCE TVCEXECUTIVE.agc:21
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// PORT: SOURCE TVCEXECUTIVE.agc:22
//# illegible, contact me at info@sandroid.org about getting access to the
// PORT: SOURCE TVCEXECUTIVE.agc:23
//# (much) higher-quality images which Paul actually created.
// PORT: SOURCE TVCEXECUTIVE.agc:24
//#
// PORT: SOURCE TVCEXECUTIVE.agc:25
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE TVCEXECUTIVE.agc:26
//#
// PORT: SOURCE TVCEXECUTIVE.agc:27
//#	Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE TVCEXECUTIVE.agc:28
//#	2021113-051.  10:28 APR. 1, 1969
// PORT: SOURCE TVCEXECUTIVE.agc:29
//#
// PORT: SOURCE TVCEXECUTIVE.agc:30
//#	This AGC program shall also be referred to as
// PORT: SOURCE TVCEXECUTIVE.agc:31
//#			Colossus 2A
// PORT: SOURCE TVCEXECUTIVE.agc:32
//
// PORT: SOURCE TVCEXECUTIVE.agc:33
//# Page 945
// PORT: SOURCE TVCEXECUTIVE.agc:34
//# PROGRAM NAME....	TVCEXECUTIVE, CONSISTING OF TVCEXEC, NEEDLEUP, VARGAINS
// PORT: SOURCE TVCEXECUTIVE.agc:35
//#			1SHOTCHK, REPCHEK, CG.CORR, COPYCYCLES, ETC.
// PORT: SOURCE TVCEXECUTIVE.agc:36
//# LOG SECTION...TVCEXECUTIVE			   SUBROUTINE...DAPCSM
// PORT: SOURCE TVCEXECUTIVE.agc:37
//# MODIFIED BY SCHLUNDT				   21 OCTOBER 1968
// PORT: SOURCE TVCEXECUTIVE.agc:38
//# FUNCTIONAL DESCRIPTION....
// PORT: SOURCE TVCEXECUTIVE.agc:39
//#
// PORT: SOURCE TVCEXECUTIVE.agc:40
//#      *A SELF-PERPETUATING WAITLIST TASK AT 1/2 SECOND INTERVALS WHICH:
// PORT: SOURCE TVCEXECUTIVE.agc:41
//#	PREPARES THE ROLL DAP WITH OGA (CDUX)
// PORT: SOURCE TVCEXECUTIVE.agc:42
//#	PREPARES THE ROLL FDAI NEEDLE (FLY-TO  OGA ERROR)
// PORT: SOURCE TVCEXECUTIVE.agc:43
//#	PREPARES THE ROLL PHASE PLANE  OGAERR  (FLY-FROM  OGA ERROR)
// PORT: SOURCE TVCEXECUTIVE.agc:44
//#	PREPARES THE TVC ROLLDAP TASK WAITLIST CALL (3 CS DELAY)
// PORT: SOURCE TVCEXECUTIVE.agc:45
//#	UPDATES THE NEEDLES DISPLAY
// PORT: SOURCE TVCEXECUTIVE.agc:46
//#	UPDATES VEHICLE MASS AND CALLS MASSPROP TO UPDATE INERTIA DATA
// PORT: SOURCE TVCEXECUTIVE.agc:47
//#	UPDATES PITCH, YAW, AND ROLL DAP GAINS FROM MASSPROP DATA
// PORT: SOURCE TVCEXECUTIVE.agc:48
//#	PERFORMS ONE-SHOT CORRECTION FOR TMC LOOP 0-3 SEC AFTER IGNITION
// PORT: SOURCE TVCEXECUTIVE.agc:49
//#	PERFORMS REPETITIVE UPDATES FOR TMC LOOP AFTER THE ONE-SHOT CORR.
// PORT: SOURCE TVCEXECUTIVE.agc:50
//#
// PORT: SOURCE TVCEXECUTIVE.agc:51
//# CALLING SEQUENCE....
// PORT: SOURCE TVCEXECUTIVE.agc:52
//#
// PORT: SOURCE TVCEXECUTIVE.agc:53
//#      *TVCEXEC CALLED AS A WAITLIST TASK, IN PARTICULAR BY TVCINIT4 AND BY
// PORT: SOURCE TVCEXECUTIVE.agc:54
//#	ITSELF, BOTH AT 1/2 SECOND INTERVALS
// PORT: SOURCE TVCEXECUTIVE.agc:55
//#
// PORT: SOURCE TVCEXECUTIVE.agc:56
//# NORMAL EXIT MODE.... TASKOVER
// PORT: SOURCE TVCEXECUTIVE.agc:57
//#
// PORT: SOURCE TVCEXECUTIVE.agc:58
//# ALARM OR ABORT EXIT MODES.... NONE
// PORT: SOURCE TVCEXECUTIVE.agc:59
//#
// PORT: SOURCE TVCEXECUTIVE.agc:60
//# SUBROUTINES CALLED....NEEDLER, S40.15, MASSPROP, TASKOVER, IBNKCALL
// PORT: SOURCE TVCEXECUTIVE.agc:61
//#
// PORT: SOURCE TVCEXECUTIVE.agc:62
//# OTHER INTERFACES....
// PORT: SOURCE TVCEXECUTIVE.agc:63
//#
// PORT: SOURCE TVCEXECUTIVE.agc:64
//#      *TVCRESTART PACKAGE FOR RESTARTS
// PORT: SOURCE TVCEXECUTIVE.agc:65
//#      *PITCHDAP, YAWDAP FOR VARIABLE GAINS AND ENGINE TRIM ANGLES
// PORT: SOURCE TVCEXECUTIVE.agc:66
//# ERASABLE INITIALIZATION REQUIRED....
// PORT: SOURCE TVCEXECUTIVE.agc:67
//#
// PORT: SOURCE TVCEXECUTIVE.agc:68
//#      *SEE TVCDAPON....TVCINIT4
// PORT: SOURCE TVCEXECUTIVE.agc:69
//#      *VARK AND 1/CONACC (S40.15 OF TVCINITIALIZE)
// PORT: SOURCE TVCEXECUTIVE.agc:70
//#      *PAD LOAD EREPFRAC
// PORT: SOURCE TVCEXECUTIVE.agc:71
//#      *BITS 15,14 OF FLAGWRD6 (T5 BITS)
// PORT: SOURCE TVCEXECUTIVE.agc:72
//#      *TVCEXPHS FOR RESTARTS
// PORT: SOURCE TVCEXECUTIVE.agc:73
//#      *ENGINE-ON BIT (11.13) FOR RESTARTS
// PORT: SOURCE TVCEXECUTIVE.agc:74
//#      *CDUX, OGAD
// PORT: SOURCE TVCEXECUTIVE.agc:75
//#
// PORT: SOURCE TVCEXECUTIVE.agc:76
//# OUTPUT....
// PORT: SOURCE TVCEXECUTIVE.agc:77
//#
// PORT: SOURCE TVCEXECUTIVE.agc:78
//#      *ROLL DAP OGANOW, FDAI NEEDLE (AK), AND PHASE PLANE OGAERR
// PORT: SOURCE TVCEXECUTIVE.agc:79
//#      *VARIABLE GAINS FOR PITCH/YAW AND ROLL TVC DAPS
// PORT: SOURCE TVCEXECUTIVE.agc:80
//#      *SINGLE-SHOT AND REPETITIVE CORRECTIONS TO ENGINE TRIM ANGLES
// PORT: SOURCE TVCEXECUTIVE.agc:81
//#	PACTOFF AND YACTOFF
// PORT: SOURCE TVCEXECUTIVE.agc:82
//#
// PORT: SOURCE TVCEXECUTIVE.agc:83
//# DEBRIS....	MUCH, BUT SHAREABLE WITH RCS/ENTRY, ALL IN EBANK6
// PORT: SOURCE TVCEXECUTIVE.agc:84
//
// PORT: SOURCE TVCEXECUTIVE.agc:85
//# Page 946
// PORT: SOURCE TVCEXECUTIVE.agc:86
//		BANK	16
// PORT: SOURCE TVCEXECUTIVE.agc:87
//		SETLOC	DAPROLL
// PORT: SOURCE TVCEXECUTIVE.agc:88
//		BANK
// PORT: SOURCE TVCEXECUTIVE.agc:89
//		EBANK=	BZERO
// PORT: SOURCE TVCEXECUTIVE.agc:90
//		COUNT*	$$/TVCX
// PORT: SOURCE TVCEXECUTIVE.agc:91
//
// PORT: SOURCE TVCEXECUTIVE.agc:92
//TVCEXEC		CS	FLAGWRD6	# CHECK FOR TERMINATION (BITS 15,14 READ
// PORT: Fixed ROM slots 16848.
            if slot <> 16848 or instruction <> 16450 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 66).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 16849 {
// PORT: SOURCE TVCEXECUTIVE.agc:93
//		MASK	OCT60000	#      10 FROM TVCDAPON TO RCSDAPON)
// PORT: Fixed ROM slots 16849.
                if slot <> 16849 or instruction <> 30789 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2117), 32768).
                    if fixedOperand = 24576 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 8192), 4) * 8192).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:94
//		EXTEND
// PORT: Fixed ROM slots 16850.
                if slot <> 16850 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 16851 {
// PORT: SOURCE TVCEXECUTIVE.agc:95
//		BZMF	TVCEXFIN	# TERMINATE
// PORT: Fixed ROM slots 16851.
            if slot <> 16851 or instruction <> 26204 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26204, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 16852 {
// PORT: SOURCE TVCEXECUTIVE.agc:96
//
// PORT: SOURCE TVCEXECUTIVE.agc:97
//		CAF	.5SEC		# W.L. CALL TO PERPETUATE TVCEXEC
// PORT: Fixed ROM slots 16852.
                if slot <> 16852 or instruction <> 14878 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2590), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:98
//		TC	WAITLIST
// PORT: Fixed ROM slots 16853.
                if slot <> 16853 or instruction <> 2725 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2725, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[964] to agcAotUnit964@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TVCEXECUTIVE.agc:99
//		EBANK=	BZERO
// PORT: SOURCE TVCEXECUTIVE.agc:100
//		2CADR	TVCEXEC
// PORT: Fixed ROM slots 16854 16855.
    16854, 2976, 16855, 28780
)).

// PORT: Physical bank 16. Shared continuation entries, slots 16856–16867.
function agcAotUnit965 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16861 {
        if slot <= 16858 {
            if slot <= 16856 {
// PORT: SOURCE TVCEXECUTIVE.agc:101
//
// PORT: SOURCE TVCEXECUTIVE.agc:102
//ROLLPREP	CAE	CDUX		# UPDATE ROLL LADDERS (NO NEED TO RESTART-
// PORT: Fixed ROM slots 16856.
                if slot <> 16856 or instruction <> 12314 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 26).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 16857 {
// PORT: SOURCE TVCEXECUTIVE.agc:103
//		XCH	OGANOW		#      PROTECT, SINCE ROLL DAPS RE-START)
// PORT: Fixed ROM slots 16857.
                    if slot <> 16857 or instruction <> 24498 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 946, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCEXECUTIVE.agc:104
//		XCH	OGAPAST
// PORT: Fixed ROM slots 16858.
                    if slot <> 16858 or instruction <> 24499 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 947, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 16859 {
// PORT: SOURCE TVCEXECUTIVE.agc:105
//
// PORT: SOURCE TVCEXECUTIVE.agc:106
//		CAE	OGAD		# PREPARE ROLL FDAI NEEDLE WITH FLY-TO
// PORT: Fixed ROM slots 16859.
                if slot <> 16859 or instruction <> 13096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 808).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 16860 {
// PORT: SOURCE TVCEXECUTIVE.agc:107
//		EXTEND			#      ERROR (COMMAND - MEASURED)
// PORT: Fixed ROM slots 16860.
                    if slot <> 16860 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCEXECUTIVE.agc:108
//		MSU	OGANOW
// PORT: Fixed ROM slots 16861.
                    if slot <> 16861 or instruction <> 9138 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMSU(words, 946).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 16864 {
            if slot <= 16862 {
// PORT: SOURCE TVCEXECUTIVE.agc:109
//		TS	AK		# FLY-TO OGA ERROR, SC.AT B-1 REVS
// PORT: Fixed ROM slots 16862.
                if slot <> 16862 or instruction <> 23358 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23358, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 16863 {
// PORT: SOURCE TVCEXECUTIVE.agc:110
//
// PORT: SOURCE TVCEXECUTIVE.agc:111
//		EXTEND			# PREPARE ROLL DAP PHASE PLANE  OGAERR
// PORT: Fixed ROM slots 16863.
                    if slot <> 16863 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCEXECUTIVE.agc:112
//		MP	-BIT14
// PORT: Fixed ROM slots 16864.
                    if slot <> 16864 or instruction <> 32709 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 4037, readEffective:call(words, 4037)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 16865 {
// PORT: SOURCE TVCEXECUTIVE.agc:113
//		TS	OGAERR		# PHASE-PLANE (FLY-FROM) OGAERROR,
// PORT: Fixed ROM slots 16865.
                if slot <> 16865 or instruction <> 23476 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23476, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 16866 {
// PORT: SOURCE TVCEXECUTIVE.agc:114
//					#      SC.AT B+0 REVS
// PORT: SOURCE TVCEXECUTIVE.agc:115
//
// PORT: SOURCE TVCEXECUTIVE.agc:116
//		CAF	THREE		# SET UP ROLL DAP TASK (ALLOW SOME TIME)
// PORT: Fixed ROM slots 16866.
                    if slot <> 16866 or instruction <> 15500 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCEXECUTIVE.agc:117
//		TC	WAITLIST
// PORT: Fixed ROM slots 16867.
                    if slot <> 16867 or instruction <> 2725 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2725, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[965] to agcAotUnit965@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TVCEXECUTIVE.agc:118
//		EBANK=	BZERO
// PORT: SOURCE TVCEXECUTIVE.agc:119
//		2CADR	ROLLDAP
// PORT: Fixed ROM slots 16868 16869.
    16868, 3444, 16869, 28780
)).

// PORT: Physical bank 16. Shared continuation entries, slots 16870–16870.
function agcAotUnit966 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE TVCEXECUTIVE.agc:120
//
// PORT: SOURCE TVCEXECUTIVE.agc:121
//NEEDLEUP	TC	IBNKCALL	# DO A NEEDLES UPDATE (RETURNS AFTER CADR)
// PORT: Fixed ROM slots 16870.
    if slot <> 16870 or instruction <> 2528 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2528, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[966] to agcAotUnit966@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TVCEXECUTIVE.agc:122
//		CADR	NEEDLER		#      (NEEDLES RESTARTS ITSELF)
// PORT: Fixed ROM slots 16871.
    16871, 35360
)).

// PORT: Physical bank 16. Shared continuation entries, slots 16872–16889.
function agcAotUnit967 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16880 {
        if slot <= 16875 {
            if slot <= 16873 {
                if slot <= 16872 {
// PORT: SOURCE TVCEXECUTIVE.agc:123
//
// PORT: SOURCE TVCEXECUTIVE.agc:124
//VARGAINS	CAF	BIT13		# CHECK ENGINE-ON BIT TO INHIBIT VARIABLE
// PORT: Fixed ROM slots 16872.
                    if slot <> 16872 or instruction <> 14851 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCEXECUTIVE.agc:125
//		EXTEND			#      GAINS AND MASS IF ENGINE OFF
// PORT: Fixed ROM slots 16873.
                    if slot <> 16873 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 16874 {
// PORT: SOURCE TVCEXECUTIVE.agc:126
//		RAND	DSALMOUT	# CHANNEL 11
// PORT: Fixed ROM slots 16874.
                    if slot <> 16874 or instruction <> 1033 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 9, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCEXECUTIVE.agc:127
//		CCS	A
// PORT: Fixed ROM slots 16875.
                    if slot <> 16875 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
            if slot <= 16877 {
                if slot <= 16876 {
// PORT: SOURCE TVCEXECUTIVE.agc:128
//		TCF	+4		#     ON , SO OK TO UPDATE GAINS AND MASS
// PORT: Fixed ROM slots 16876.
                    if slot <> 16876 or instruction <> 5616 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5616, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCEXECUTIVE.agc:129
//	+5	CAF	TWO		#      OFF, SO BYPASS MASS/GAIN UPDATES,
// PORT: Fixed ROM slots 16877.
                    if slot <> 16877 or instruction <> 14862 { return choose false if checkOnly else -1. }
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
                if slot <= 16878 {
// PORT: SOURCE TVCEXECUTIVE.agc:130
//		TS	TVCEXPHS	#	    ALSO ENTRY FROM CCS BELOW WITH
// PORT: Fixed ROM slots 16878.
                    if slot <> 16878 or instruction <> 23465 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23465, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 16879 {
// PORT: SOURCE TVCEXECUTIVE.agc:131
//		TCF	1SHOTCHK	#	    VCNTR = -0 (V97 R40 ENGFAIL)
// PORT: Fixed ROM slots 16879.
                        if slot <> 16879 or instruction <> 5641 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5641, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCEXECUTIVE.agc:132
//		CCS	VCNTR		#      TEST FOR GAIN OF UPDATE TIME
// PORT: Fixed ROM slots 16880.
                        if slot <> 16880 or instruction <> 5027 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 931).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 16884 {
            if slot <= 16882 {
                if slot <= 16881 {
// PORT: SOURCE TVCEXECUTIVE.agc:133
//		TCF	+4		#	    NOT YET
// PORT: Fixed ROM slots 16881.
                    if slot <> 16881 or instruction <> 5621 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5621, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCEXECUTIVE.agc:134
//# Page 947
// PORT: SOURCE TVCEXECUTIVE.agc:135
//		TCF	GAINCHNG	#		NOW
// PORT: Fixed ROM slots 16882.
                    if slot <> 16882 or instruction <> 5625 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5625, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 16883 {
// PORT: SOURCE TVCEXECUTIVE.agc:136
//		TCF	+0		#		NOT USED
// PORT: Fixed ROM slots 16883.
                    if slot <> 16883 or instruction <> 5619 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5619, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCEXECUTIVE.agc:137
//		TCF	VARGAINS +5	#		NO, LOTHRUST (S40.8 R40)
// PORT: Fixed ROM slots 16884.
                    if slot <> 16884 or instruction <> 5613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5613, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 16886 {
                if slot <= 16885 {
// PORT: SOURCE TVCEXECUTIVE.agc:138
//
// PORT: SOURCE TVCEXECUTIVE.agc:139
//	+4	TS	VCNTRTMP	#	 PROTECT VCNTR AND
// PORT: Fixed ROM slots 16885.
                    if slot <> 16885 or instruction <> 23467 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23467, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCEXECUTIVE.agc:140
//		CAE	CSMMASS		#	CSMMASS DURING AN IMPULSIVE BURN
// PORT: Fixed ROM slots 16886.
                    if slot <> 16886 or instruction <> 13116 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 828).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 16887 {
// PORT: SOURCE TVCEXECUTIVE.agc:141
//		TS	MASSTMP
// PORT: Fixed ROM slots 16887.
                    if slot <> 16887 or instruction <> 23466 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23466, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 16888 {
// PORT: SOURCE TVCEXECUTIVE.agc:142
//		TCF	EXECCOPY
// PORT: Fixed ROM slots 16888.
                        if slot <> 16888 or instruction <> 5634 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5634, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCEXECUTIVE.agc:143
//
// PORT: SOURCE TVCEXECUTIVE.agc:144
//GAINCHNG	TC	IBNKCALL	# UPDATE IXX, IAVG, IAVG/TLX
// PORT: Fixed ROM slots 16889.
                        if slot <> 16889 or instruction <> 2528 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2528, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[967] to agcAotUnit967@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TVCEXECUTIVE.agc:145
//		CADR	FIXCW		# MASSPROP ENTRY  (ALREADY INITIALIZED)
// PORT: Fixed ROM slots 16890.
    16890, 11812
)).

// PORT: Physical bank 16. Shared continuation entries, slots 16891–16891.
function agcAotUnit968 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE TVCEXECUTIVE.agc:146
//		TC	IBNKCALL	# UPDATE 1/CONACC, VARK
// PORT: Fixed ROM slots 16891.
    if slot <> 16891 or instruction <> 2528 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2528, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[968] to agcAotUnit968@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TVCEXECUTIVE.agc:147
//		CADR	S40.15		#      (S40.15 IS IN TVCINITIALIZE)
// PORT: Fixed ROM slots 16892.
    16892, 31332
)).

// PORT: Physical bank 16. Shared continuation entries, slots 16893–16982.
function agcAotUnit969 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16937 {
        if slot <= 16914 {
            if slot <= 16903 {
                if slot <= 16897 {
                    if slot <= 16894 {
                        if slot <= 16893 {
// PORT: SOURCE TVCEXECUTIVE.agc:148
//		CS	TENMDOT		# UPDATE MASS FOR NEXT 10 SEC. OF BURN
// PORT: Fixed ROM slots 16893.
                            if slot <> 16893 or instruction <> 17311 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 927).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCEXECUTIVE.agc:149
//		AD	CSMMASS
// PORT: Fixed ROM slots 16894.
                            if slot <> 16894 or instruction <> 25404 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 828).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16895 {
// PORT: SOURCE TVCEXECUTIVE.agc:150
//		TS	MASSTMP		# KG B+16
// PORT: Fixed ROM slots 16895.
                            if slot <> 16895 or instruction <> 23466 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23466, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16896 {
// PORT: SOURCE TVCEXECUTIVE.agc:151
//
// PORT: SOURCE TVCEXECUTIVE.agc:152
//		CAF	NINETEEN	# RESET THE VARIABLE-GAIN UPDATE COUNTER
// PORT: Fixed ROM slots 16896.
                                if slot <> 16896 or instruction <> 14588 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2300), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:153
//		TS	VCNTRTMP
// PORT: Fixed ROM slots 16897.
                                if slot <> 16897 or instruction <> 23467 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23467, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 16900 {
                        if slot <= 16898 {
// PORT: SOURCE TVCEXECUTIVE.agc:154
//
// PORT: SOURCE TVCEXECUTIVE.agc:155
//EXECCOPY	INCR	TVCEXPHS	# RESTART-PROTECT THE COPYCYCLE        (1)
// PORT: Fixed ROM slots 16898.
                            if slot <> 16898 or instruction <> 11177 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreINCR(words, 937).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16899 {
// PORT: SOURCE TVCEXECUTIVE.agc:156
//
// PORT: SOURCE TVCEXECUTIVE.agc:157
//		CAE	MASSTMP		# CSMMASS KG B+16
// PORT: Fixed ROM slots 16899.
                                if slot <> 16899 or instruction <> 13226 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 938).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:158
//		TS	CSMMASS
// PORT: Fixed ROM slots 16900.
                                if slot <> 16900 or instruction <> 23356 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23356, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16901 {
// PORT: SOURCE TVCEXECUTIVE.agc:159
//
// PORT: SOURCE TVCEXECUTIVE.agc:160
//		CAE	VCNTRTMP	# VCNTR
// PORT: Fixed ROM slots 16901.
                            if slot <> 16901 or instruction <> 13227 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 939).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16902 {
// PORT: SOURCE TVCEXECUTIVE.agc:161
//		TS	VCNTR
// PORT: Fixed ROM slots 16902.
                                if slot <> 16902 or instruction <> 23459 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23459, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:162
//		TS	V97VCNTR	# FOR ENGFAIL (R41) MASS UPDATES AT SPSOFF
// PORT: Fixed ROM slots 16903.
                                if slot <> 16903 or instruction <> 23332 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23332, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 16908 {
                    if slot <= 16905 {
                        if slot <= 16904 {
// PORT: SOURCE TVCEXECUTIVE.agc:163
//
// PORT: SOURCE TVCEXECUTIVE.agc:164
//		INCR	TVCEXPHS	# COPYCYCLE OVER                       (2)
// PORT: Fixed ROM slots 16904.
                            if slot <> 16904 or instruction <> 11177 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreINCR(words, 937).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCEXECUTIVE.agc:165
//
// PORT: SOURCE TVCEXECUTIVE.agc:166
//1SHOTCHK	CCS	CNTR		# CHECK TIME FOR ONE-SHOT OR REPCORR
// PORT: Fixed ROM slots 16905.
                            if slot <> 16905 or instruction <> 4903 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 807).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16906 {
// PORT: SOURCE TVCEXECUTIVE.agc:167
//		TCF	+4		#      NOT YET
// PORT: Fixed ROM slots 16906.
                            if slot <> 16906 or instruction <> 5646 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5646, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16907 {
// PORT: SOURCE TVCEXECUTIVE.agc:168
//		TCF	1SHOTOK		#      NOW
// PORT: Fixed ROM slots 16907.
                                if slot <> 16907 or instruction <> 5657 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5657, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:169
//		TCF	REPCHEK		#      ONE-SHOT OVER, ON TO REPCORR
// PORT: Fixed ROM slots 16908.
                                if slot <> 16908 or instruction <> 5650 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5650, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 16911 {
                        if slot <= 16909 {
// PORT: SOURCE TVCEXECUTIVE.agc:170
//		TCF	1SHOTOK		#      NOW  (ONE-SHOT ONLY, NO REPCORR)
// PORT: Fixed ROM slots 16909.
                            if slot <> 16909 or instruction <> 5657 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5657, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16910 {
// PORT: SOURCE TVCEXECUTIVE.agc:171
//
// PORT: SOURCE TVCEXECUTIVE.agc:172
//	+4	TS	CNTRTMP		# COUNT DOWN
// PORT: Fixed ROM slots 16910.
                                if slot <> 16910 or instruction <> 23486 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23486, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:173
//		CAF	SIX		# SET UP TVCEXPHS FOR ENTRY AT CNTRCOPY
// PORT: Fixed ROM slots 16911.
                                if slot <> 16911 or instruction <> 15497 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 3209), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16912 {
// PORT: SOURCE TVCEXECUTIVE.agc:174
//		TS	TVCEXPHS
// PORT: Fixed ROM slots 16912.
                            if slot <> 16912 or instruction <> 23465 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23465, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16913 {
// PORT: SOURCE TVCEXECUTIVE.agc:175
//		TCF	CNTRCOPY
// PORT: Fixed ROM slots 16913.
                                if slot <> 16913 or instruction <> 5722 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5722, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:176
//
// PORT: SOURCE TVCEXECUTIVE.agc:177
//REPCHEK		CAE	REPFRAC		# CHECK FOR REPETITIVE UPDATES
// PORT: Fixed ROM slots 16914.
                                if slot <> 16914 or instruction <> 13218 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 930).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 16925 {
                if slot <= 16919 {
                    if slot <= 16916 {
                        if slot <= 16915 {
// PORT: SOURCE TVCEXECUTIVE.agc:178
//		EXTEND
// PORT: Fixed ROM slots 16915.
                            if slot <> 16915 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCEXECUTIVE.agc:179
//		BZMF	TVCEXFIN	#      NO, OVER-AND-OUT
// PORT: Fixed ROM slots 16916.
                            if slot <> 16916 or instruction <> 26204 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 26204, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16917 {
// PORT: SOURCE TVCEXECUTIVE.agc:180
//		TS	TEMPDAP +1	#      YES, SET UP CORRECTION FRACTION
// PORT: Fixed ROM slots 16917.
                            if slot <> 16917 or instruction <> 23334 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23334, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16918 {
// PORT: SOURCE TVCEXECUTIVE.agc:181
//		CAF	FOUR		# SET UP TVCEXPHS FOR ENTRY AT CORSETUP
// PORT: Fixed ROM slots 16918.
                                if slot <> 16918 or instruction <> 14861 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:182
//		TS	TVCEXPHS
// PORT: Fixed ROM slots 16919.
                                if slot <> 16919 or instruction <> 23465 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23465, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 16922 {
                        if slot <= 16920 {
// PORT: SOURCE TVCEXECUTIVE.agc:183
//		TCF	CORSETUP
// PORT: Fixed ROM slots 16920.
                            if slot <> 16920 or instruction <> 5667 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5667, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16921 {
// PORT: SOURCE TVCEXECUTIVE.agc:184
//# Page 948
// PORT: SOURCE TVCEXECUTIVE.agc:185
//1SHOTOK		CAF	BIT13		# CHECK ENGINE-ON BIT, NOT PERMITTING
// PORT: Fixed ROM slots 16921.
                                if slot <> 16921 or instruction <> 14851 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:186
//		EXTEND			#      ONE-SHOT DURING ENGINE-SHUTDOWN
// PORT: Fixed ROM slots 16922.
                                if slot <> 16922 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16923 {
// PORT: SOURCE TVCEXECUTIVE.agc:187
//		RAND	DSALMOUT
// PORT: Fixed ROM slots 16923.
                            if slot <> 16923 or instruction <> 1033 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 2, 9, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16924 {
// PORT: SOURCE TVCEXECUTIVE.agc:188
//		CCS	A
// PORT: Fixed ROM slots 16924.
                                if slot <> 16924 or instruction <> 4096 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:189
//		TCF	+2		#      ONE-SHOT OK
// PORT: Fixed ROM slots 16925.
                                if slot <> 16925 or instruction <> 5663 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5663, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 16931 {
                    if slot <= 16928 {
                        if slot <= 16926 {
// PORT: SOURCE TVCEXECUTIVE.agc:190
//		TCF	TVCEXFIN	#      NO, TERMINATE
// PORT: Fixed ROM slots 16926.
                            if slot <> 16926 or instruction <> 5724 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5724, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16927 {
// PORT: SOURCE TVCEXECUTIVE.agc:191
//
// PORT: SOURCE TVCEXECUTIVE.agc:192
//		INCR	TVCEXPHS	#					(3)
// PORT: Fixed ROM slots 16927.
                                if slot <> 16927 or instruction <> 11177 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreINCR(words, 937).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:193
//
// PORT: SOURCE TVCEXECUTIVE.agc:194
//# RSB 2009.  The following instruction was previously "CAE FCORFRAC", but FCORFRAC
// PORT: SOURCE TVCEXECUTIVE.agc:195
//# is not in erasable memory as implied by the use of CAE.  I've accordingly changed
// PORT: SOURCE TVCEXECUTIVE.agc:196
//# it to CAF instead to indicate fixed memory.
// PORT: SOURCE TVCEXECUTIVE.agc:197
//TEMPSET		CAF	FCORFRAC	#      SET UP CORRECTION FRACTION
// PORT: Fixed ROM slots 16928.
                                if slot <> 16928 or instruction <> 13919 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1631), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16929 {
// PORT: SOURCE TVCEXECUTIVE.agc:198
//		TS	TEMPDAP +1
// PORT: Fixed ROM slots 16929.
                            if slot <> 16929 or instruction <> 23334 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23334, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16930 {
// PORT: SOURCE TVCEXECUTIVE.agc:199
//
// PORT: SOURCE TVCEXECUTIVE.agc:200
//		INCR	TVCEXPHS	# ENTRY FROM REPCHECK AT NEXT LOCATION	(4)
// PORT: Fixed ROM slots 16930.
                                if slot <> 16930 or instruction <> 11177 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreINCR(words, 937).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:201
//
// PORT: SOURCE TVCEXECUTIVE.agc:202
//CORSETUP	CAE	DAPDATR1	# CHECK FOR LEM-OFF/ON
// PORT: Fixed ROM slots 16931.
                                if slot <> 16931 or instruction <> 13110 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 822).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 16934 {
                        if slot <= 16932 {
// PORT: SOURCE TVCEXECUTIVE.agc:203
//		MASK	BIT13		# (NOTE, SHOWS LEM-OFF)
// PORT: Fixed ROM slots 16932.
                            if slot <> 16932 or instruction <> 31235 { return choose false if checkOnly else -1. }
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
                        } else {
                            if slot <= 16933 {
// PORT: SOURCE TVCEXECUTIVE.agc:204
//		EXTEND
// PORT: Fixed ROM slots 16933.
                                if slot <> 16933 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:205
//		BZF	+2		# LEM IS ON,  PICK UP   TEMPDAP+1
// PORT: Fixed ROM slots 16934.
                                if slot <> 16934 or instruction <> 5672 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5672, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16935 {
// PORT: SOURCE TVCEXECUTIVE.agc:206
//		CAE	TEMPDAP +1	# LEM IS OFF, PICK UP 2(TEMPDAP+1)
// PORT: Fixed ROM slots 16935.
                            if slot <> 16935 or instruction <> 13094 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 806).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16936 {
// PORT: SOURCE TVCEXECUTIVE.agc:207
//		AD	TEMPDAP +1
// PORT: Fixed ROM slots 16936.
                                if slot <> 16936 or instruction <> 25382 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 806).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:208
//		TS	TEMPDAP		# CG.CORR USES TEMPDAP
// PORT: Fixed ROM slots 16937.
                                if slot <> 16937 or instruction <> 23333 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23333, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 16959 {
            if slot <= 16948 {
                if slot <= 16942 {
                    if slot <= 16939 {
                        if slot <= 16938 {
// PORT: SOURCE TVCEXECUTIVE.agc:209
//
// PORT: SOURCE TVCEXECUTIVE.agc:210
//		CAF	NEGONE		# SET UP FOR CNTR = -1 (ONE-SHOT DONE)
// PORT: Fixed ROM slots 16938.
                            if slot <> 16938 or instruction <> 16334 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 4046), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCEXECUTIVE.agc:211
//		TS	CNTRTMP		#      (COPYCYCLE AT  .CNTRCOPY. )
// PORT: Fixed ROM slots 16939.
                            if slot <> 16939 or instruction <> 23486 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23486, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16940 {
// PORT: SOURCE TVCEXECUTIVE.agc:212
//
// PORT: SOURCE TVCEXECUTIVE.agc:213
//CG.CORR		EXTEND			# PITCH TMC LOOP
// PORT: Fixed ROM slots 16940.
                            if slot <> 16940 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16941 {
// PORT: SOURCE TVCEXECUTIVE.agc:214
//		DCA	PDELOFF
// PORT: Fixed ROM slots 16941.
                                if slot <> 16941 or instruction <> 13190 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 902, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:215
//		DXCH	PACTTMP
// PORT: Fixed ROM slots 16942.
                                if slot <> 16942 or instruction <> 22459 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 955, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 16945 {
                        if slot <= 16943 {
// PORT: SOURCE TVCEXECUTIVE.agc:216
//		EXTEND
// PORT: Fixed ROM slots 16943.
                            if slot <> 16943 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16944 {
// PORT: SOURCE TVCEXECUTIVE.agc:217
//		DCS	PDELOFF
// PORT: Fixed ROM slots 16944.
                                if slot <> 16944 or instruction <> 17286 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCS", 902, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:218
//		DDOUBL
// PORT: Fixed ROM slots 16945.
                                if slot <> 16945 or instruction <> 8193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 1) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16946 {
// PORT: SOURCE TVCEXECUTIVE.agc:219
//		DDOUBL
// PORT: Fixed ROM slots 16946.
                            if slot <> 16946 or instruction <> 8193 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 1) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16947 {
// PORT: SOURCE TVCEXECUTIVE.agc:220
//		DXCH	TTMP1
// PORT: Fixed ROM slots 16947.
                                if slot <> 16947 or instruction <> 22410 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 906, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:221
//		EXTEND
// PORT: Fixed ROM slots 16948.
                                if slot <> 16948 or instruction <> 6 { return choose false if checkOnly else -1. }
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
                if slot <= 16953 {
                    if slot <= 16950 {
                        if slot <= 16949 {
// PORT: SOURCE TVCEXECUTIVE.agc:222
//		DCA	DELPBAR
// PORT: Fixed ROM slots 16949.
                            if slot <> 16949 or instruction <> 13186 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 898, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCEXECUTIVE.agc:223
//		DDOUBL
// PORT: Fixed ROM slots 16950.
                            if slot <> 16950 or instruction <> 8193 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 1) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16951 {
// PORT: SOURCE TVCEXECUTIVE.agc:224
//		DDOUBL
// PORT: Fixed ROM slots 16951.
                            if slot <> 16951 or instruction <> 8193 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 1) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16952 {
// PORT: SOURCE TVCEXECUTIVE.agc:225
//		DAS	TTMP1
// PORT: Fixed ROM slots 16952.
                                if slot <> 16952 or instruction <> 9098 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 906) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:226
//		EXTEND
// PORT: Fixed ROM slots 16953.
                                if slot <> 16953 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 16956 {
                        if slot <= 16954 {
// PORT: SOURCE TVCEXECUTIVE.agc:227
//		DCA	TTMP1
// PORT: Fixed ROM slots 16954.
                            if slot <> 16954 or instruction <> 13194 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 906, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16955 {
// PORT: SOURCE TVCEXECUTIVE.agc:228
//		EXTEND
// PORT: Fixed ROM slots 16955.
                                if slot <> 16955 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:229
//		MP	TEMPDAP
// PORT: Fixed ROM slots 16956.
                                if slot <> 16956 or instruction <> 29477 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 805, readEffective:call(words, 805)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16957 {
// PORT: SOURCE TVCEXECUTIVE.agc:230
//		DAS	PACTTMP
// PORT: Fixed ROM slots 16957.
                            if slot <> 16957 or instruction <> 9147 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 955) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16958 {
// PORT: SOURCE TVCEXECUTIVE.agc:231
//
// PORT: SOURCE TVCEXECUTIVE.agc:232
//		EXTEND			# YAW TMC LOOP
// PORT: Fixed ROM slots 16958.
                                if slot <> 16958 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:233
//		DCA	YDELOFF
// PORT: Fixed ROM slots 16959.
                                if slot <> 16959 or instruction <> 13192 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 904, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 16970 {
                if slot <= 16964 {
                    if slot <= 16961 {
                        if slot <= 16960 {
// PORT: SOURCE TVCEXECUTIVE.agc:234
//		DXCH	YACTTMP
// PORT: Fixed ROM slots 16960.
                            if slot <> 16960 or instruction <> 22461 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 957, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCEXECUTIVE.agc:235
//		EXTEND
// PORT: Fixed ROM slots 16961.
                            if slot <> 16961 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16962 {
// PORT: SOURCE TVCEXECUTIVE.agc:236
//		DCS	YDELOFF
// PORT: Fixed ROM slots 16962.
                            if slot <> 16962 or instruction <> 17288 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCS", 904, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16963 {
// PORT: SOURCE TVCEXECUTIVE.agc:237
//		DDOUBL
// PORT: Fixed ROM slots 16963.
                                if slot <> 16963 or instruction <> 8193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 1) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:238
//# Page 949
// PORT: SOURCE TVCEXECUTIVE.agc:239
//		DDOUBL
// PORT: Fixed ROM slots 16964.
                                if slot <> 16964 or instruction <> 8193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 1) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 16967 {
                        if slot <= 16965 {
// PORT: SOURCE TVCEXECUTIVE.agc:240
//		DXCH	TTMP1
// PORT: Fixed ROM slots 16965.
                            if slot <> 16965 or instruction <> 22410 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 906, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16966 {
// PORT: SOURCE TVCEXECUTIVE.agc:241
//		EXTEND
// PORT: Fixed ROM slots 16966.
                                if slot <> 16966 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:242
//		DCA	DELYBAR
// PORT: Fixed ROM slots 16967.
                                if slot <> 16967 or instruction <> 13188 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 900, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16968 {
// PORT: SOURCE TVCEXECUTIVE.agc:243
//		DDOUBL
// PORT: Fixed ROM slots 16968.
                            if slot <> 16968 or instruction <> 8193 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 1) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16969 {
// PORT: SOURCE TVCEXECUTIVE.agc:244
//		DDOUBL
// PORT: Fixed ROM slots 16969.
                                if slot <> 16969 or instruction <> 8193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 1) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:245
//		DAS	TTMP1
// PORT: Fixed ROM slots 16970.
                                if slot <> 16970 or instruction <> 9098 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 906) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 16976 {
                    if slot <= 16973 {
                        if slot <= 16971 {
// PORT: SOURCE TVCEXECUTIVE.agc:246
//		EXTEND
// PORT: Fixed ROM slots 16971.
                            if slot <> 16971 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16972 {
// PORT: SOURCE TVCEXECUTIVE.agc:247
//		DCA	TTMP1
// PORT: Fixed ROM slots 16972.
                                if slot <> 16972 or instruction <> 13194 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 906, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:248
//		EXTEND
// PORT: Fixed ROM slots 16973.
                                if slot <> 16973 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16974 {
// PORT: SOURCE TVCEXECUTIVE.agc:249
//		MP	TEMPDAP
// PORT: Fixed ROM slots 16974.
                            if slot <> 16974 or instruction <> 29477 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 805, readEffective:call(words, 805)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16975 {
// PORT: SOURCE TVCEXECUTIVE.agc:250
//		DAS	YACTTMP
// PORT: Fixed ROM slots 16975.
                                if slot <> 16975 or instruction <> 9149 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 957) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:251
//
// PORT: SOURCE TVCEXECUTIVE.agc:252
//CORCOPY		INCR	TVCEXPHS	# RESTART PROTECT THE COPYCYCLE		(5)
// PORT: Fixed ROM slots 16976.
                                if slot <> 16976 or instruction <> 11177 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreINCR(words, 937).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 16979 {
                        if slot <= 16977 {
// PORT: SOURCE TVCEXECUTIVE.agc:253
//
// PORT: SOURCE TVCEXECUTIVE.agc:254
//		EXTEND			# TRIM-ESTIMATES, AND
// PORT: Fixed ROM slots 16977.
                            if slot <> 16977 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16978 {
// PORT: SOURCE TVCEXECUTIVE.agc:255
//		DCA	PACTTMP
// PORT: Fixed ROM slots 16978.
                                if slot <> 16978 or instruction <> 13243 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 955, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:256
//		TS	PACTOFF		#	TRIMS
// PORT: Fixed ROM slots 16979.
                                if slot <> 16979 or instruction <> 23315 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23315, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 16980 {
// PORT: SOURCE TVCEXECUTIVE.agc:257
//		DXCH	PDELOFF
// PORT: Fixed ROM slots 16980.
                            if slot <> 16980 or instruction <> 22406 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 902, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16981 {
// PORT: SOURCE TVCEXECUTIVE.agc:258
//
// PORT: SOURCE TVCEXECUTIVE.agc:259
//		EXTEND
// PORT: Fixed ROM slots 16981.
                                if slot <> 16981 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:260
//		DCA	YACTTMP
// PORT: Fixed ROM slots 16982.
                                if slot <> 16982 or instruction <> 13245 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 957, readPhysical, readAdjacent) { return -1. }
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
}
set agcAotRoutes[969] to agcAotUnit969@.

// PORT: Physical bank 16. Shared continuation entries, slots 16983–16990.
function agcAotUnit970 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16986 {
        if slot <= 16984 {
            if slot <= 16983 {
// PORT: SOURCE TVCEXECUTIVE.agc:261
//		TS	YACTOFF
// PORT: Fixed ROM slots 16983.
                if slot <> 16983 or instruction <> 23316 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23316, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:262
//		DXCH	YDELOFF
// PORT: Fixed ROM slots 16984.
                if slot <> 16984 or instruction <> 22408 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 904, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 16985 {
// PORT: SOURCE TVCEXECUTIVE.agc:263
//
// PORT: SOURCE TVCEXECUTIVE.agc:264
//		INCR	TVCEXPHS	# ENTRY FROM 1SHOTCHK AT NEXT LOCATION	(6)
// PORT: Fixed ROM slots 16985.
                if slot <> 16985 or instruction <> 11177 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 937).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:265
//
// PORT: SOURCE TVCEXECUTIVE.agc:266
//CNTRCOPY	CAE	CNTRTMP		# UPDATE CNTR (RESTARTS OK, FOLLOWS CPYCY)
// PORT: Fixed ROM slots 16986.
                if slot <> 16986 or instruction <> 13246 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 958).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 16988 {
            if slot <= 16987 {
// PORT: SOURCE TVCEXECUTIVE.agc:267
//		TS	CNTR
// PORT: Fixed ROM slots 16987.
                if slot <> 16987 or instruction <> 23335 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23335, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:268
//
// PORT: SOURCE TVCEXECUTIVE.agc:269
//TVCEXFIN	CAF	ZERO		# RESET TVCEXPHS
// PORT: Fixed ROM slots 16988.
                if slot <> 16988 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
            if slot <= 16989 {
// PORT: SOURCE TVCEXECUTIVE.agc:270
//		TS	TVCEXPHS
// PORT: Fixed ROM slots 16989.
                if slot <> 16989 or instruction <> 23465 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23465, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCEXECUTIVE.agc:271
//		TCF	TASKOVER	# TVCEXECUTIVE FINISHED
// PORT: Fixed ROM slots 16990.
                if slot <> 16990 or instruction <> 6868 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6868, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[970] to agcAotUnit970@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TVCEXECUTIVE.agc:272
//
// PORT: SOURCE TVCEXECUTIVE.agc:273
//FCORFRAC	OCT	10000		# ONE-SHOT CORRECTION FRACTION
// PORT: Fixed ROM slots 16991.
    16991, 8192
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE TVCEXECUTIVE.agc:274
//
// PORT: SOURCE TVCEXECUTIVE.agc:275
//# Page 950 (page is empty)
// PORT: SOURCE TVCEXECUTIVE.agc:276
//
