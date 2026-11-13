// TVCEXECUTIVE.agc
// bank 16, slots 16848-16853
function agcAotUnit964 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16850 {
        if slot <= 16848 {
// TVCEXECUTIVE.agc:1
//# Copyright:	Public domain.
// TVCEXECUTIVE.agc:2
//# Filename:	TVCEXECUTIVE.agc
// TVCEXECUTIVE.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// TVCEXECUTIVE.agc:4
//#		It is part of the source code for the Command Module's (CM)
// TVCEXECUTIVE.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// TVCEXECUTIVE.agc:6
//# Assembler:	yaYUL
// TVCEXECUTIVE.agc:7
//# Contact:	Burkey Kerman <info@sandroid.org>.
// TVCEXECUTIVE.agc:8
//# Website:	www.ibiblio.org/apollo.
// TVCEXECUTIVE.agc:9
//# Pages:	945-950
// TVCEXECUTIVE.agc:10
//# Mod history:	2009-05-12 RSB	Adapted from the Colossus249/ file of the
// TVCEXECUTIVE.agc:11
//#				same name, using Comanche055 page images.
// TVCEXECUTIVE.agc:12
//#		2009-05-20 RSB	Corrections:  CAE -> CAF in one place.
// TVCEXECUTIVE.agc:13
//#		2009-05-21 RSB	In 1SHOTCHK, a CAF SEVEN was corrected to
// TVCEXECUTIVE.agc:14
//#				CAF SIX.
// TVCEXECUTIVE.agc:15
//#
// TVCEXECUTIVE.agc:16
//# This source code has been transcribed or otherwise adapted from digitized
// TVCEXECUTIVE.agc:17
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// TVCEXECUTIVE.agc:18
//# by Fjeld Kerman, and arranged for by Douglas Kerman of the Museum.  Many
// TVCEXECUTIVE.agc:19
//# thanks to both.  The images (with suitable reduction in storage size and
// TVCEXECUTIVE.agc:20
//# consequent reduction in image quality as well) are available online at
// TVCEXECUTIVE.agc:21
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// TVCEXECUTIVE.agc:22
//# illegible, contact me at info@sandroid.org about getting access to the
// TVCEXECUTIVE.agc:23
//# (much) higher-quality images which Fjeld Kerman actually created.
// TVCEXECUTIVE.agc:24
//#
// TVCEXECUTIVE.agc:25
//# Notations on the hardcopy document read, in part:
// TVCEXECUTIVE.agc:26
//#
// TVCEXECUTIVE.agc:27
//#	Assemble revision 055 of AGC program Comanche by NASA
// TVCEXECUTIVE.agc:28
//#	2021113-051.  10:28 APR. 1, 1969
// TVCEXECUTIVE.agc:29
//#
// TVCEXECUTIVE.agc:30
//#	This AGC program shall also be referred to as
// TVCEXECUTIVE.agc:31
//#			Colossus 2A
// TVCEXECUTIVE.agc:32
//
// TVCEXECUTIVE.agc:33
//# Page 945
// TVCEXECUTIVE.agc:34
//# PROGRAM NAME....	TVCEXECUTIVE, CONSISTING OF TVCEXEC, NEEDLEUP, VARGAINS
// TVCEXECUTIVE.agc:35
//#			1SHOTCHK, REPCHEK, CG.CORR, COPYCYCLES, ETC.
// TVCEXECUTIVE.agc:36
//# LOG SECTION...TVCEXECUTIVE			   SUBROUTINE...DAPCSM
// TVCEXECUTIVE.agc:37
//# MODIFIED BY SCHLUNDT KERMAN				   21 OCTOBER 1968
// TVCEXECUTIVE.agc:38
//# FUNCTIONAL DESCRIPTION....
// TVCEXECUTIVE.agc:39
//#
// TVCEXECUTIVE.agc:40
//#      *A SELF-PERPETUATING WAITLIST TASK AT 1/2 SECOND INTERVALS WHICH:
// TVCEXECUTIVE.agc:41
//#	PREPARES THE ROLL DAP WITH OGA (CDUX)
// TVCEXECUTIVE.agc:42
//#	PREPARES THE ROLL FDAI NEEDLE (FLY-TO  OGA ERROR)
// TVCEXECUTIVE.agc:43
//#	PREPARES THE ROLL PHASE PLANE  OGAERR  (FLY-FROM  OGA ERROR)
// TVCEXECUTIVE.agc:44
//#	PREPARES THE TVC ROLLDAP TASK WAITLIST CALL (3 CS DELAY)
// TVCEXECUTIVE.agc:45
//#	UPDATES THE NEEDLES DISPLAY
// TVCEXECUTIVE.agc:46
//#	UPDATES VEHICLE MASS AND CALLS MASSPROP TO UPDATE INERTIA DATA
// TVCEXECUTIVE.agc:47
//#	UPDATES PITCH, YAW, AND ROLL DAP GAINS FROM MASSPROP DATA
// TVCEXECUTIVE.agc:48
//#	PERFORMS ONE-SHOT CORRECTION FOR TMC LOOP 0-3 SEC AFTER IGNITION
// TVCEXECUTIVE.agc:49
//#	PERFORMS REPETITIVE UPDATES FOR TMC LOOP AFTER THE ONE-SHOT CORR.
// TVCEXECUTIVE.agc:50
//#
// TVCEXECUTIVE.agc:51
//# CALLING SEQUENCE....
// TVCEXECUTIVE.agc:52
//#
// TVCEXECUTIVE.agc:53
//#      *TVCEXEC CALLED AS A WAITLIST TASK, IN PARTICULAR BY TVCINIT4 AND BY
// TVCEXECUTIVE.agc:54
//#	ITSELF, BOTH AT 1/2 SECOND INTERVALS
// TVCEXECUTIVE.agc:55
//#
// TVCEXECUTIVE.agc:56
//# NORMAL EXIT MODE.... TASKOVER
// TVCEXECUTIVE.agc:57
//#
// TVCEXECUTIVE.agc:58
//# ALARM OR ABORT EXIT MODES.... NONE
// TVCEXECUTIVE.agc:59
//#
// TVCEXECUTIVE.agc:60
//# SUBROUTINES CALLED....NEEDLER, S40.15, MASSPROP, TASKOVER, IBNKCALL
// TVCEXECUTIVE.agc:61
//#
// TVCEXECUTIVE.agc:62
//# OTHER INTERFACES....
// TVCEXECUTIVE.agc:63
//#
// TVCEXECUTIVE.agc:64
//#      *TVCRESTART PACKAGE FOR RESTARTS
// TVCEXECUTIVE.agc:65
//#      *PITCHDAP, YAWDAP FOR VARIABLE GAINS AND ENGINE TRIM ANGLES
// TVCEXECUTIVE.agc:66
//# ERASABLE INITIALIZATION REQUIRED....
// TVCEXECUTIVE.agc:67
//#
// TVCEXECUTIVE.agc:68
//#      *SEE TVCDAPON....TVCINIT4
// TVCEXECUTIVE.agc:69
//#      *VARK AND 1/CONACC (S40.15 OF TVCINITIALIZE)
// TVCEXECUTIVE.agc:70
//#      *PAD LOAD EREPFRAC
// TVCEXECUTIVE.agc:71
//#      *BITS 15,14 OF FLAGWRD6 (T5 BITS)
// TVCEXECUTIVE.agc:72
//#      *TVCEXPHS FOR RESTARTS
// TVCEXECUTIVE.agc:73
//#      *ENGINE-ON BIT (11.13) FOR RESTARTS
// TVCEXECUTIVE.agc:74
//#      *CDUX, OGAD
// TVCEXECUTIVE.agc:75
//#
// TVCEXECUTIVE.agc:76
//# OUTPUT....
// TVCEXECUTIVE.agc:77
//#
// TVCEXECUTIVE.agc:78
//#      *ROLL DAP OGANOW, FDAI NEEDLE (AK), AND PHASE PLANE OGAERR
// TVCEXECUTIVE.agc:79
//#      *VARIABLE GAINS FOR PITCH/YAW AND ROLL TVC DAPS
// TVCEXECUTIVE.agc:80
//#      *SINGLE-SHOT AND REPETITIVE CORRECTIONS TO ENGINE TRIM ANGLES
// TVCEXECUTIVE.agc:81
//#	PACTOFF AND YACTOFF
// TVCEXECUTIVE.agc:82
//#
// TVCEXECUTIVE.agc:83
//# DEBRIS....	MUCH, BUT SHAREABLE WITH RCS/ENTRY, ALL IN EBANK6
// TVCEXECUTIVE.agc:84
//
// TVCEXECUTIVE.agc:85
//# Page 946
// TVCEXECUTIVE.agc:86
//		BANK	16
// TVCEXECUTIVE.agc:87
//		SETLOC	DAPROLL
// TVCEXECUTIVE.agc:88
//		BANK
// TVCEXECUTIVE.agc:89
//		EBANK=	BZERO
// TVCEXECUTIVE.agc:90
//		COUNT*	$$/TVCX
// TVCEXECUTIVE.agc:91
//
// TVCEXECUTIVE.agc:92
//TVCEXEC		CS	FLAGWRD6	# CHECK FOR TERMINATION (BITS 15,14 READ
// slot 16848
            if slot <> 16848 or instruction <> 16450 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 66).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 16849 {
// TVCEXECUTIVE.agc:93
//		MASK	OCT60000	#      10 FROM TVCDAPON TO RCSDAPON)
// slot 16849
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
// TVCEXECUTIVE.agc:94
//		EXTEND
// slot 16850
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
// TVCEXECUTIVE.agc:95
//		BZMF	TVCEXFIN	# TERMINATE
// slot 16851
            if slot <> 16851 or instruction <> 26204 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26204, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 16852 {
// TVCEXECUTIVE.agc:96
//
// TVCEXECUTIVE.agc:97
//		CAF	.5SEC		# W.L. CALL TO PERPETUATE TVCEXEC
// slot 16852
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
// TVCEXECUTIVE.agc:98
//		TC	WAITLIST
// slot 16853
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
// TVCEXECUTIVE.agc:99
//		EBANK=	BZERO
// TVCEXECUTIVE.agc:100
//		2CADR	TVCEXEC
// slot 16854 16855
    16854, 2976, 16855, 28780
)).

// bank 16, slots 16856-16867
function agcAotUnit965 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16861 {
        if slot <= 16858 {
            if slot <= 16856 {
// TVCEXECUTIVE.agc:101
//
// TVCEXECUTIVE.agc:102
//ROLLPREP	CAE	CDUX		# UPDATE ROLL LADDERS (NO NEED TO RESTART-
// slot 16856
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
// TVCEXECUTIVE.agc:103
//		XCH	OGANOW		#      PROTECT, SINCE ROLL DAPS RE-START)
// slot 16857
                    if slot <> 16857 or instruction <> 24498 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 946, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCEXECUTIVE.agc:104
//		XCH	OGAPAST
// slot 16858
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
// TVCEXECUTIVE.agc:105
//
// TVCEXECUTIVE.agc:106
//		CAE	OGAD		# PREPARE ROLL FDAI NEEDLE WITH FLY-TO
// slot 16859
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
// TVCEXECUTIVE.agc:107
//		EXTEND			#      ERROR (COMMAND - MEASURED)
// slot 16860
                    if slot <> 16860 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCEXECUTIVE.agc:108
//		MSU	OGANOW
// slot 16861
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
// TVCEXECUTIVE.agc:109
//		TS	AK		# FLY-TO OGA ERROR, SC.AT B-1 REVS
// slot 16862
                if slot <> 16862 or instruction <> 23358 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23358, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 16863 {
// TVCEXECUTIVE.agc:110
//
// TVCEXECUTIVE.agc:111
//		EXTEND			# PREPARE ROLL DAP PHASE PLANE  OGAERR
// slot 16863
                    if slot <> 16863 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCEXECUTIVE.agc:112
//		MP	-BIT14
// slot 16864
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
// TVCEXECUTIVE.agc:113
//		TS	OGAERR		# PHASE-PLANE (FLY-FROM) OGAERROR,
// slot 16865
                if slot <> 16865 or instruction <> 23476 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23476, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 16866 {
// TVCEXECUTIVE.agc:114
//					#      SC.AT B+0 REVS
// TVCEXECUTIVE.agc:115
//
// TVCEXECUTIVE.agc:116
//		CAF	THREE		# SET UP ROLL DAP TASK (ALLOW SOME TIME)
// slot 16866
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
// TVCEXECUTIVE.agc:117
//		TC	WAITLIST
// slot 16867
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
// TVCEXECUTIVE.agc:118
//		EBANK=	BZERO
// TVCEXECUTIVE.agc:119
//		2CADR	ROLLDAP
// slot 16868 16869
    16868, 3444, 16869, 28780
)).

// bank 16, slots 16870-16870
function agcAotUnit966 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// TVCEXECUTIVE.agc:120
//
// TVCEXECUTIVE.agc:121
//NEEDLEUP	TC	IBNKCALL	# DO A NEEDLES UPDATE (RETURNS AFTER CADR)
// slot 16870
    if slot <> 16870 or instruction <> 2528 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2528, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[966] to agcAotUnit966@.

agcAotInstallSourceRope(list(
// TVCEXECUTIVE.agc:122
//		CADR	NEEDLER		#      (NEEDLES RESTARTS ITSELF)
// slot 16871
    16871, 35360
)).

// bank 16, slots 16872-16889
function agcAotUnit967 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16880 {
        if slot <= 16875 {
            if slot <= 16873 {
                if slot <= 16872 {
// TVCEXECUTIVE.agc:123
//
// TVCEXECUTIVE.agc:124
//VARGAINS	CAF	BIT13		# CHECK ENGINE-ON BIT TO INHIBIT VARIABLE
// slot 16872
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
// TVCEXECUTIVE.agc:125
//		EXTEND			#      GAINS AND MASS IF ENGINE OFF
// slot 16873
                    if slot <> 16873 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 16874 {
// TVCEXECUTIVE.agc:126
//		RAND	DSALMOUT	# CHANNEL 11
// slot 16874
                    if slot <> 16874 or instruction <> 1033 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 9, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCEXECUTIVE.agc:127
//		CCS	A
// slot 16875
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
// TVCEXECUTIVE.agc:128
//		TCF	+4		#     ON , SO OK TO UPDATE GAINS AND MASS
// slot 16876
                    if slot <> 16876 or instruction <> 5616 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5616, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCEXECUTIVE.agc:129
//	+5	CAF	TWO		#      OFF, SO BYPASS MASS/GAIN UPDATES,
// slot 16877
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
// TVCEXECUTIVE.agc:130
//		TS	TVCEXPHS	#	    ALSO ENTRY FROM CCS BELOW WITH
// slot 16878
                    if slot <> 16878 or instruction <> 23465 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23465, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 16879 {
// TVCEXECUTIVE.agc:131
//		TCF	1SHOTCHK	#	    VCNTR = -0 (V97 R40 ENGFAIL)
// slot 16879
                        if slot <> 16879 or instruction <> 5641 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5641, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCEXECUTIVE.agc:132
//		CCS	VCNTR		#      TEST FOR GAIN OF UPDATE TIME
// slot 16880
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
// TVCEXECUTIVE.agc:133
//		TCF	+4		#	    NOT YET
// slot 16881
                    if slot <> 16881 or instruction <> 5621 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5621, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCEXECUTIVE.agc:134
//# Page 947
// TVCEXECUTIVE.agc:135
//		TCF	GAINCHNG	#		NOW
// slot 16882
                    if slot <> 16882 or instruction <> 5625 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5625, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 16883 {
// TVCEXECUTIVE.agc:136
//		TCF	+0		#		NOT USED
// slot 16883
                    if slot <> 16883 or instruction <> 5619 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5619, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCEXECUTIVE.agc:137
//		TCF	VARGAINS +5	#		NO, LOTHRUST (S40.8 R40)
// slot 16884
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
// TVCEXECUTIVE.agc:138
//
// TVCEXECUTIVE.agc:139
//	+4	TS	VCNTRTMP	#	 PROTECT VCNTR AND
// slot 16885
                    if slot <> 16885 or instruction <> 23467 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23467, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCEXECUTIVE.agc:140
//		CAE	CSMMASS		#	CSMMASS DURING AN IMPULSIVE BURN
// slot 16886
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
// TVCEXECUTIVE.agc:141
//		TS	MASSTMP
// slot 16887
                    if slot <> 16887 or instruction <> 23466 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23466, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 16888 {
// TVCEXECUTIVE.agc:142
//		TCF	EXECCOPY
// slot 16888
                        if slot <> 16888 or instruction <> 5634 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5634, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCEXECUTIVE.agc:143
//
// TVCEXECUTIVE.agc:144
//GAINCHNG	TC	IBNKCALL	# UPDATE IXX, IAVG, IAVG/TLX
// slot 16889
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
// TVCEXECUTIVE.agc:145
//		CADR	FIXCW		# MASSPROP ENTRY  (ALREADY INITIALIZED)
// slot 16890
    16890, 11812
)).

// bank 16, slots 16891-16891
function agcAotUnit968 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// TVCEXECUTIVE.agc:146
//		TC	IBNKCALL	# UPDATE 1/CONACC, VARK
// slot 16891
    if slot <> 16891 or instruction <> 2528 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2528, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[968] to agcAotUnit968@.

agcAotInstallSourceRope(list(
// TVCEXECUTIVE.agc:147
//		CADR	S40.15		#      (S40.15 IS IN TVCINITIALIZE)
// slot 16892
    16892, 31332
)).

// bank 16, slots 16893-16982
function agcAotUnit969 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16937 {
        if slot <= 16914 {
            if slot <= 16903 {
                if slot <= 16897 {
                    if slot <= 16894 {
                        if slot <= 16893 {
// TVCEXECUTIVE.agc:148
//		CS	TENMDOT		# UPDATE MASS FOR NEXT 10 SEC. OF BURN
// slot 16893
                            if slot <> 16893 or instruction <> 17311 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 927).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TVCEXECUTIVE.agc:149
//		AD	CSMMASS
// slot 16894
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
// TVCEXECUTIVE.agc:150
//		TS	MASSTMP		# KG B+16
// slot 16895
                            if slot <> 16895 or instruction <> 23466 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23466, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16896 {
// TVCEXECUTIVE.agc:151
//
// TVCEXECUTIVE.agc:152
//		CAF	NINETEEN	# RESET THE VARIABLE-GAIN UPDATE COUNTER
// slot 16896
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
// TVCEXECUTIVE.agc:153
//		TS	VCNTRTMP
// slot 16897
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
// TVCEXECUTIVE.agc:154
//
// TVCEXECUTIVE.agc:155
//EXECCOPY	INCR	TVCEXPHS	# RESTART-PROTECT THE COPYCYCLE        (1)
// slot 16898
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
// TVCEXECUTIVE.agc:156
//
// TVCEXECUTIVE.agc:157
//		CAE	MASSTMP		# CSMMASS KG B+16
// slot 16899
                                if slot <> 16899 or instruction <> 13226 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 938).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCEXECUTIVE.agc:158
//		TS	CSMMASS
// slot 16900
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
// TVCEXECUTIVE.agc:159
//
// TVCEXECUTIVE.agc:160
//		CAE	VCNTRTMP	# VCNTR
// slot 16901
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
// TVCEXECUTIVE.agc:161
//		TS	VCNTR
// slot 16902
                                if slot <> 16902 or instruction <> 23459 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23459, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCEXECUTIVE.agc:162
//		TS	V97VCNTR	# FOR ENGFAIL (R41) MASS UPDATES AT SPSOFF
// slot 16903
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
// TVCEXECUTIVE.agc:163
//
// TVCEXECUTIVE.agc:164
//		INCR	TVCEXPHS	# COPYCYCLE OVER                       (2)
// slot 16904
                            if slot <> 16904 or instruction <> 11177 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreINCR(words, 937).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TVCEXECUTIVE.agc:165
//
// TVCEXECUTIVE.agc:166
//1SHOTCHK	CCS	CNTR		# CHECK TIME FOR ONE-SHOT OR REPCORR
// slot 16905
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
// TVCEXECUTIVE.agc:167
//		TCF	+4		#      NOT YET
// slot 16906
                            if slot <> 16906 or instruction <> 5646 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5646, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16907 {
// TVCEXECUTIVE.agc:168
//		TCF	1SHOTOK		#      NOW
// slot 16907
                                if slot <> 16907 or instruction <> 5657 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5657, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCEXECUTIVE.agc:169
//		TCF	REPCHEK		#      ONE-SHOT OVER, ON TO REPCORR
// slot 16908
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
// TVCEXECUTIVE.agc:170
//		TCF	1SHOTOK		#      NOW  (ONE-SHOT ONLY, NO REPCORR)
// slot 16909
                            if slot <> 16909 or instruction <> 5657 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5657, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16910 {
// TVCEXECUTIVE.agc:171
//
// TVCEXECUTIVE.agc:172
//	+4	TS	CNTRTMP		# COUNT DOWN
// slot 16910
                                if slot <> 16910 or instruction <> 23486 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23486, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCEXECUTIVE.agc:173
//		CAF	SIX		# SET UP TVCEXPHS FOR ENTRY AT CNTRCOPY
// slot 16911
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
// TVCEXECUTIVE.agc:174
//		TS	TVCEXPHS
// slot 16912
                            if slot <> 16912 or instruction <> 23465 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23465, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16913 {
// TVCEXECUTIVE.agc:175
//		TCF	CNTRCOPY
// slot 16913
                                if slot <> 16913 or instruction <> 5722 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5722, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCEXECUTIVE.agc:176
//
// TVCEXECUTIVE.agc:177
//REPCHEK		CAE	REPFRAC		# CHECK FOR REPETITIVE UPDATES
// slot 16914
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
// TVCEXECUTIVE.agc:178
//		EXTEND
// slot 16915
                            if slot <> 16915 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TVCEXECUTIVE.agc:179
//		BZMF	TVCEXFIN	#      NO, OVER-AND-OUT
// slot 16916
                            if slot <> 16916 or instruction <> 26204 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 26204, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16917 {
// TVCEXECUTIVE.agc:180
//		TS	TEMPDAP +1	#      YES, SET UP CORRECTION FRACTION
// slot 16917
                            if slot <> 16917 or instruction <> 23334 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23334, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16918 {
// TVCEXECUTIVE.agc:181
//		CAF	FOUR		# SET UP TVCEXPHS FOR ENTRY AT CORSETUP
// slot 16918
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
// TVCEXECUTIVE.agc:182
//		TS	TVCEXPHS
// slot 16919
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
// TVCEXECUTIVE.agc:183
//		TCF	CORSETUP
// slot 16920
                            if slot <> 16920 or instruction <> 5667 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5667, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16921 {
// TVCEXECUTIVE.agc:184
//# Page 948
// TVCEXECUTIVE.agc:185
//1SHOTOK		CAF	BIT13		# CHECK ENGINE-ON BIT, NOT PERMITTING
// slot 16921
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
// TVCEXECUTIVE.agc:186
//		EXTEND			#      ONE-SHOT DURING ENGINE-SHUTDOWN
// slot 16922
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
// TVCEXECUTIVE.agc:187
//		RAND	DSALMOUT
// slot 16923
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
// TVCEXECUTIVE.agc:188
//		CCS	A
// slot 16924
                                if slot <> 16924 or instruction <> 4096 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCEXECUTIVE.agc:189
//		TCF	+2		#      ONE-SHOT OK
// slot 16925
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
// TVCEXECUTIVE.agc:190
//		TCF	TVCEXFIN	#      NO, TERMINATE
// slot 16926
                            if slot <> 16926 or instruction <> 5724 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5724, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16927 {
// TVCEXECUTIVE.agc:191
//
// TVCEXECUTIVE.agc:192
//		INCR	TVCEXPHS	#					(3)
// slot 16927
                                if slot <> 16927 or instruction <> 11177 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreINCR(words, 937).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCEXECUTIVE.agc:193
//
// TVCEXECUTIVE.agc:194
//# RSB 2009.  The following instruction was previously "CAE FCORFRAC", but FCORFRAC
// TVCEXECUTIVE.agc:195
//# is not in erasable memory as implied by the use of CAE.  I've accordingly changed
// TVCEXECUTIVE.agc:196
//# it to CAF instead to indicate fixed memory.
// TVCEXECUTIVE.agc:197
//TEMPSET		CAF	FCORFRAC	#      SET UP CORRECTION FRACTION
// slot 16928
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
// TVCEXECUTIVE.agc:198
//		TS	TEMPDAP +1
// slot 16929
                            if slot <> 16929 or instruction <> 23334 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23334, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16930 {
// TVCEXECUTIVE.agc:199
//
// TVCEXECUTIVE.agc:200
//		INCR	TVCEXPHS	# ENTRY FROM REPCHECK AT NEXT LOCATION	(4)
// slot 16930
                                if slot <> 16930 or instruction <> 11177 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreINCR(words, 937).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCEXECUTIVE.agc:201
//
// TVCEXECUTIVE.agc:202
//CORSETUP	CAE	DAPDATR1	# CHECK FOR LEM-OFF/ON
// slot 16931
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
// TVCEXECUTIVE.agc:203
//		MASK	BIT13		# (NOTE, SHOWS LEM-OFF)
// slot 16932
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
// TVCEXECUTIVE.agc:204
//		EXTEND
// slot 16933
                                if slot <> 16933 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCEXECUTIVE.agc:205
//		BZF	+2		# LEM IS ON,  PICK UP   TEMPDAP+1
// slot 16934
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
// TVCEXECUTIVE.agc:206
//		CAE	TEMPDAP +1	# LEM IS OFF, PICK UP 2(TEMPDAP+1)
// slot 16935
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
// TVCEXECUTIVE.agc:207
//		AD	TEMPDAP +1
// slot 16936
                                if slot <> 16936 or instruction <> 25382 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 806).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCEXECUTIVE.agc:208
//		TS	TEMPDAP		# CG.CORR USES TEMPDAP
// slot 16937
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
// TVCEXECUTIVE.agc:209
//
// TVCEXECUTIVE.agc:210
//		CAF	NEGONE		# SET UP FOR CNTR = -1 (ONE-SHOT DONE)
// slot 16938
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
// TVCEXECUTIVE.agc:211
//		TS	CNTRTMP		#      (COPYCYCLE AT  .CNTRCOPY. )
// slot 16939
                            if slot <> 16939 or instruction <> 23486 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23486, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16940 {
// TVCEXECUTIVE.agc:212
//
// TVCEXECUTIVE.agc:213
//CG.CORR		EXTEND			# PITCH TMC LOOP
// slot 16940
                            if slot <> 16940 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16941 {
// TVCEXECUTIVE.agc:214
//		DCA	PDELOFF
// slot 16941
                                if slot <> 16941 or instruction <> 13190 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 902, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCEXECUTIVE.agc:215
//		DXCH	PACTTMP
// slot 16942
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
// TVCEXECUTIVE.agc:216
//		EXTEND
// slot 16943
                            if slot <> 16943 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16944 {
// TVCEXECUTIVE.agc:217
//		DCS	PDELOFF
// slot 16944
                                if slot <> 16944 or instruction <> 17286 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCS", 902, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCEXECUTIVE.agc:218
//		DDOUBL
// slot 16945
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
// TVCEXECUTIVE.agc:219
//		DDOUBL
// slot 16946
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
// TVCEXECUTIVE.agc:220
//		DXCH	TTMP1
// slot 16947
                                if slot <> 16947 or instruction <> 22410 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 906, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCEXECUTIVE.agc:221
//		EXTEND
// slot 16948
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
// TVCEXECUTIVE.agc:222
//		DCA	DELPBAR
// slot 16949
                            if slot <> 16949 or instruction <> 13186 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 898, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TVCEXECUTIVE.agc:223
//		DDOUBL
// slot 16950
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
// TVCEXECUTIVE.agc:224
//		DDOUBL
// slot 16951
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
// TVCEXECUTIVE.agc:225
//		DAS	TTMP1
// slot 16952
                                if slot <> 16952 or instruction <> 9098 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 906) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCEXECUTIVE.agc:226
//		EXTEND
// slot 16953
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
// TVCEXECUTIVE.agc:227
//		DCA	TTMP1
// slot 16954
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
// TVCEXECUTIVE.agc:228
//		EXTEND
// slot 16955
                                if slot <> 16955 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCEXECUTIVE.agc:229
//		MP	TEMPDAP
// slot 16956
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
// TVCEXECUTIVE.agc:230
//		DAS	PACTTMP
// slot 16957
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
// TVCEXECUTIVE.agc:231
//
// TVCEXECUTIVE.agc:232
//		EXTEND			# YAW TMC LOOP
// slot 16958
                                if slot <> 16958 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCEXECUTIVE.agc:233
//		DCA	YDELOFF
// slot 16959
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
// TVCEXECUTIVE.agc:234
//		DXCH	YACTTMP
// slot 16960
                            if slot <> 16960 or instruction <> 22461 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 957, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TVCEXECUTIVE.agc:235
//		EXTEND
// slot 16961
                            if slot <> 16961 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 16962 {
// TVCEXECUTIVE.agc:236
//		DCS	YDELOFF
// slot 16962
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
// TVCEXECUTIVE.agc:237
//		DDOUBL
// slot 16963
                                if slot <> 16963 or instruction <> 8193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 1) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCEXECUTIVE.agc:238
//# Page 949
// TVCEXECUTIVE.agc:239
//		DDOUBL
// slot 16964
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
// TVCEXECUTIVE.agc:240
//		DXCH	TTMP1
// slot 16965
                            if slot <> 16965 or instruction <> 22410 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 906, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16966 {
// TVCEXECUTIVE.agc:241
//		EXTEND
// slot 16966
                                if slot <> 16966 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCEXECUTIVE.agc:242
//		DCA	DELYBAR
// slot 16967
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
// TVCEXECUTIVE.agc:243
//		DDOUBL
// slot 16968
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
// TVCEXECUTIVE.agc:244
//		DDOUBL
// slot 16969
                                if slot <> 16969 or instruction <> 8193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 1) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCEXECUTIVE.agc:245
//		DAS	TTMP1
// slot 16970
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
// TVCEXECUTIVE.agc:246
//		EXTEND
// slot 16971
                            if slot <> 16971 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16972 {
// TVCEXECUTIVE.agc:247
//		DCA	TTMP1
// slot 16972
                                if slot <> 16972 or instruction <> 13194 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 906, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCEXECUTIVE.agc:248
//		EXTEND
// slot 16973
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
// TVCEXECUTIVE.agc:249
//		MP	TEMPDAP
// slot 16974
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
// TVCEXECUTIVE.agc:250
//		DAS	YACTTMP
// slot 16975
                                if slot <> 16975 or instruction <> 9149 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 957) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCEXECUTIVE.agc:251
//
// TVCEXECUTIVE.agc:252
//CORCOPY		INCR	TVCEXPHS	# RESTART PROTECT THE COPYCYCLE		(5)
// slot 16976
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
// TVCEXECUTIVE.agc:253
//
// TVCEXECUTIVE.agc:254
//		EXTEND			# TRIM-ESTIMATES, AND
// slot 16977
                            if slot <> 16977 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16978 {
// TVCEXECUTIVE.agc:255
//		DCA	PACTTMP
// slot 16978
                                if slot <> 16978 or instruction <> 13243 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 955, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCEXECUTIVE.agc:256
//		TS	PACTOFF		#	TRIMS
// slot 16979
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
// TVCEXECUTIVE.agc:257
//		DXCH	PDELOFF
// slot 16980
                            if slot <> 16980 or instruction <> 22406 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 902, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 16981 {
// TVCEXECUTIVE.agc:258
//
// TVCEXECUTIVE.agc:259
//		EXTEND
// slot 16981
                                if slot <> 16981 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCEXECUTIVE.agc:260
//		DCA	YACTTMP
// slot 16982
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

// bank 16, slots 16983-16990
function agcAotUnit970 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16986 {
        if slot <= 16984 {
            if slot <= 16983 {
// TVCEXECUTIVE.agc:261
//		TS	YACTOFF
// slot 16983
                if slot <> 16983 or instruction <> 23316 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23316, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCEXECUTIVE.agc:262
//		DXCH	YDELOFF
// slot 16984
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
// TVCEXECUTIVE.agc:263
//
// TVCEXECUTIVE.agc:264
//		INCR	TVCEXPHS	# ENTRY FROM 1SHOTCHK AT NEXT LOCATION	(6)
// slot 16985
                if slot <> 16985 or instruction <> 11177 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 937).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCEXECUTIVE.agc:265
//
// TVCEXECUTIVE.agc:266
//CNTRCOPY	CAE	CNTRTMP		# UPDATE CNTR (RESTARTS OK, FOLLOWS CPYCY)
// slot 16986
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
// TVCEXECUTIVE.agc:267
//		TS	CNTR
// slot 16987
                if slot <> 16987 or instruction <> 23335 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23335, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCEXECUTIVE.agc:268
//
// TVCEXECUTIVE.agc:269
//TVCEXFIN	CAF	ZERO		# RESET TVCEXPHS
// slot 16988
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
// TVCEXECUTIVE.agc:270
//		TS	TVCEXPHS
// slot 16989
                if slot <> 16989 or instruction <> 23465 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23465, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCEXECUTIVE.agc:271
//		TCF	TASKOVER	# TVCEXECUTIVE FINISHED
// slot 16990
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
// TVCEXECUTIVE.agc:272
//
// TVCEXECUTIVE.agc:273
//FCORFRAC	OCT	10000		# ONE-SHOT CORRECTION FRACTION
// slot 16991
    16991, 8192
)).

// no code for the lines below
// TVCEXECUTIVE.agc:274
//
// TVCEXECUTIVE.agc:275
//# Page 950 (page is empty)
// TVCEXECUTIVE.agc:276
//
