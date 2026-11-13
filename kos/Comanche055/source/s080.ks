// PORT: Original source unit TVCRESTARTS.agc.
// PORT: Physical bank 16. Shared continuation entries, slots 16992–16999.
function agcAotUnit971 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 16995 {
        if slot <= 16993 {
            if slot <= 16992 {
// PORT: SOURCE TVCRESTARTS.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE TVCRESTARTS.agc:2
//# Filename:	TVCRESTARTS.agc
// PORT: SOURCE TVCRESTARTS.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// PORT: SOURCE TVCRESTARTS.agc:4
//#		It is part of the source code for the Command Module's (CM)
// PORT: SOURCE TVCRESTARTS.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE TVCRESTARTS.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE TVCRESTARTS.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE TVCRESTARTS.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE TVCRESTARTS.agc:9
//# Pages:	956-960
// PORT: SOURCE TVCRESTARTS.agc:10
//# Mod history:	2009-05-13 RSB	Adapted from the Colossus249/ file of the
// PORT: SOURCE TVCRESTARTS.agc:11
//#				same name, using Comanche055 page images.
// PORT: SOURCE TVCRESTARTS.agc:12
//#		2009-05-20 RSB	Corrections:  TCF -> BZF in one place.
// PORT: SOURCE TVCRESTARTS.agc:13
//#		2009-05-21 RSB	In PHSCHK2, CS TVCPHASE corrected to
// PORT: SOURCE TVCRESTARTS.agc:14
//#				CCS TVCPHASE and CCS 4 corrected to CCS A.
// PORT: SOURCE TVCRESTARTS.agc:15
//#				Page 924 corrected to 961.  CORCOPY +2
// PORT: SOURCE TVCRESTARTS.agc:16
//#				corrected to CORCOPY +1.
// PORT: SOURCE TVCRESTARTS.agc:17
//#
// PORT: SOURCE TVCRESTARTS.agc:18
//# This source code has been transcribed or otherwise adapted from digitized
// PORT: SOURCE TVCRESTARTS.agc:19
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// PORT: SOURCE TVCRESTARTS.agc:20
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// PORT: SOURCE TVCRESTARTS.agc:21
//# thanks to both.  The images (with suitable reduction in storage size and
// PORT: SOURCE TVCRESTARTS.agc:22
//# consequent reduction in image quality as well) are available online at
// PORT: SOURCE TVCRESTARTS.agc:23
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// PORT: SOURCE TVCRESTARTS.agc:24
//# illegible, contact me at info@sandroid.org about getting access to the
// PORT: SOURCE TVCRESTARTS.agc:25
//# (much) higher-quality images which Paul actually created.
// PORT: SOURCE TVCRESTARTS.agc:26
//#
// PORT: SOURCE TVCRESTARTS.agc:27
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE TVCRESTARTS.agc:28
//#
// PORT: SOURCE TVCRESTARTS.agc:29
//#	Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE TVCRESTARTS.agc:30
//#	2021113-051.  10:28 APR. 1, 1969
// PORT: SOURCE TVCRESTARTS.agc:31
//#
// PORT: SOURCE TVCRESTARTS.agc:32
//#	This AGC program shall also be referred to as
// PORT: SOURCE TVCRESTARTS.agc:33
//#			Colossus 2A
// PORT: SOURCE TVCRESTARTS.agc:34
//
// PORT: SOURCE TVCRESTARTS.agc:35
//# Page 956
// PORT: SOURCE TVCRESTARTS.agc:36
//# NAME....TVCRESTART PACKAGE,  CONSISTING OF REDOTVC, ENABL1, 2, CMDSOUT, PHSCHK2, ETC.
// PORT: SOURCE TVCRESTARTS.agc:37
//# LOG SECTION...TVCRESTARTS			SUBROUTINE....DAPCSM
// PORT: SOURCE TVCRESTARTS.agc:38
//# MODIFIED BY SCHLUNDT				21 OCTOBER 1968
// PORT: SOURCE TVCRESTARTS.agc:39
//# FUNCTIONAL DESCRIPTION....
// PORT: SOURCE TVCRESTARTS.agc:40
//#
// PORT: SOURCE TVCRESTARTS.agc:41
//#      *RESTART-PROOFS THE TVC DAPS, INCLUDING PITCHDAP, YAWDAP,
// PORT: SOURCE TVCRESTARTS.agc:42
//#	TVCEXECUTIVE, ROLLDAP, TVCINIT4, TVCDAPON, AND CSM/LM V46 SWTCHOVR.
// PORT: SOURCE TVCRESTARTS.agc:43
//#      *TVC RESTARTS DESERVE SPECIAL CONSIDERATION IN SEVERAL AREAS.
// PORT: SOURCE TVCRESTARTS.agc:44
//#	RESTART DOWN-TIME IS IMPORTANT BECAUSE OF THE TRANSIENTS INTRODUCED
// PORT: SOURCE TVCRESTARTS.agc:45
//#	BY THE THRUST VECTOR RETURN TO THE ACTUATOR MECHANICAL NULLS
// PORT: SOURCE TVCRESTARTS.agc:46
//#	FOLLOWING TVC- AND OPTICS-ERROR-COUNTER-DISENABLES (CHANNEL 12).
// PORT: SOURCE TVCRESTARTS.agc:47
//#	TVC    USES A MIXTURE OF WAITLIST, T5, T6, AND JOB CALLS. THERE IS
// PORT: SOURCE TVCRESTARTS.agc:48
//#	FILTER MEMORY (UP TO 6TH ORDER) TO BE PROTECTED IF WILD TRANSIENTS
// PORT: SOURCE TVCRESTARTS.agc:49
//#	ARE TO BE AVOIDED. COUNTERS ARE INVOLVED FOR ONE-SHOT
// PORT: SOURCE TVCRESTARTS.agc:50
//#	CORRECTIONS AND GAIN UPDATES. THE GIMBAL TRIM ESTIMATORS AND THE
// PORT: SOURCE TVCRESTARTS.agc:51
//#	BODY AXIS ATTITUDE ERROR INTEGRATORS INVOLVE DIGITAL SUMMATION.
// PORT: SOURCE TVCRESTARTS.agc:52
//#	DIGITAL DIFFERENTIATORS ARE INVOLVED IN THE BODY AXIS RATE ESTIMA-
// PORT: SOURCE TVCRESTARTS.agc:53
//#	TIONS AND IN THE OUTPUTTING OF ACTUATOR COMMANDS. THERE IS AN
// PORT: SOURCE TVCRESTARTS.agc:54
//#	OFFSET-TRACKER-FILTER TO PROTECT. ETC., ETC.
// PORT: SOURCE TVCRESTARTS.agc:55
//#      *THOSE QUANTITIES WHICH MUST BE PROTECTED ARE STORED IN TEMPORARY
// PORT: SOURCE TVCRESTARTS.agc:56
//#	REGISTERS AS THEY ARE COMPUTED, FOR UPDATING THE REAL REGISTERS
// PORT: SOURCE TVCRESTARTS.agc:57
//#	DURING COPYCYCLES.
// PORT: SOURCE TVCRESTARTS.agc:58
//#      *THE SEVERAL COPYCYCLES ARE EACH PROTECTED BY PHASE POINTS AT THEIR
// PORT: SOURCE TVCRESTARTS.agc:59
//#	BEGINNING AND AT THEIR TERMINATION. THE PHASE POINTS ARE SIMPLY
// PORT: SOURCE TVCRESTARTS.agc:60
//#	..INCR.. INSTRUCTIONS,   EITHER ..INCR TVCEXPHS.. FOR COPYCYCLES
// PORT: SOURCE TVCRESTARTS.agc:61
//#	IN THE TVCEXECUTIVE, OR ..INCR TVCPHASE.. FOR THE PITCH AND YAW
// PORT: SOURCE TVCRESTARTS.agc:62
//#	COPYCYCLES. INDEXING ON EACH OF THESE POINTERS THEN PERMITS A
// PORT: SOURCE TVCRESTARTS.agc:63
//#	RETURN TO THE APPROPRIATE RESTART POINTS.
// PORT: SOURCE TVCRESTARTS.agc:64
//#      *IF A RESTART OCCURS DURING EITHER COPYCYCLE, THAT COPYCYCLE IS
// PORT: SOURCE TVCRESTARTS.agc:65
//#	COMPLETED. THEN THE NORMAL TVCINIT4....DAPINIT....PITCHDAP STARTUP
// PORT: SOURCE TVCRESTARTS.agc:66
//#	SEQUENCE IS CALLED UPON TO GET THINGS GOING AGAIN.
// PORT: SOURCE TVCRESTARTS.agc:67
//#      *TVC-ENABLE AND OPTICS-ERROR-COUNTER ENABLE MUST BE SET ASAP
// PORT: SOURCE TVCRESTARTS.agc:68
//#	(ALLOWING FOR PROCEDURAL DELAYS). THEN THE ENGINES ARE COMMANDED
// PORT: SOURCE TVCRESTARTS.agc:69
//#	TO THE P,YACTOFF TRIM VALUES. THE DAPS ARE THEN READY TO GO ON THE
// PORT: SOURCE TVCRESTARTS.agc:70
//#	AIR, WITH THE REGULAR STARTUP SEQUENCE, EITHER AT MRCLEAN FOR A
// PORT: SOURCE TVCRESTARTS.agc:71
//#	COMPLETE INITIALIZATION OR AT TVCINIT4 FOR A PARTIAL INITIALIZATION
// PORT: SOURCE TVCRESTARTS.agc:72
//#      *FOR RESTARTS PRIOR TO THE SETTING OF THE T5 BITS AT DOTVCON THE
// PORT: SOURCE TVCRESTARTS.agc:73
//#	PRE40.6 SECTION OF S40.6 TAKES CARE OF RE-ESTABLISHING TRIMS.
// PORT: SOURCE TVCRESTARTS.agc:74
//#      *IF A RESTART OCCURS DURING THE TVCEXEC....TVCEXFIN SEQUENCE THE
// PORT: SOURCE TVCRESTARTS.agc:75
//#	COMPUTATIONS WILL BE COMPLETED, STARTING AT THE APPROPRIATE RESTART
// PORT: SOURCE TVCRESTARTS.agc:76
//#	POINT, AFTER THE DAPS ARE READY TO GO ON THE AIR.
// PORT: SOURCE TVCRESTARTS.agc:77
//#      *IF A RESTART OCCURS PRIOR TO TVCINIT4 (TVCPHASE = -1) E.G. DURING
// PORT: SOURCE TVCRESTARTS.agc:78
//#	THE EARLY DAP INITIALIZATION PHASE, THE DAP STARTUP SEQUENCE IS
// PORT: SOURCE TVCRESTARTS.agc:79
//#	ENTERED AT MRCLEAN FOR A FULL INITIALIZATION.
// PORT: SOURCE TVCRESTARTS.agc:80
//#      *FOR RESTARTS DURING CSM/LM V46 SWITCH-OVER, TVCPHASE IS SET TO -2,
// PORT: SOURCE TVCRESTARTS.agc:81
//#	AND THE RESTART LOGIC GOES BACK TO REDO SWITCH-OVER (AFTER THE
// PORT: SOURCE TVCRESTARTS.agc:82
//#	NORMAL DAP RESTART SEQUENCE IS FOLLOWED).
// PORT: SOURCE TVCRESTARTS.agc:83
//#      *RESTARTS ARE NOT CRITICAL TO THE ROLL DAP PERFORMANCES HENCE THE
// PORT: SOURCE TVCRESTARTS.agc:84
//#	ROLL DAP IS MERELY RESTARTED.
// PORT: SOURCE TVCRESTARTS.agc:85
//#      *RESTARTS DURING A STROKE TEST (STROKER IS NON-ZERO) WILL CAUSE THE
// PORT: SOURCE TVCRESTARTS.agc:86
//# Page 957
// PORT: SOURCE TVCRESTARTS.agc:87
//#	STROKE TEST TO BE TERMINATED. A NEW V68 ENTRY WILL BE REQUIRED
// PORT: SOURCE TVCRESTARTS.agc:88
//#	TO GET IT GOING AGAIN (NO AUTOMATIC RESTART).
// PORT: SOURCE TVCRESTARTS.agc:89
//#      *REDOTVC IS REACHED FOLLOWING ANY RESTART WHICH FINDS THE T5 BITS
// PORT: SOURCE TVCRESTARTS.agc:90
//#	(BITS 15,14 OF FLAGWRD6) SET FOR TVC. DOTVCON SETS TVCPHASE = -1
// PORT: SOURCE TVCRESTARTS.agc:91
//#	AND TVC EXPHS = 0 JUST BEFORE SETTING THESE BITS, JUST BEFORE
// PORT: SOURCE TVCRESTARTS.agc:92
//#	MAKING THE T5 CALL TO TVCDAPON. ON A NORMAL SHUTDOWN DOTVCRCS
// PORT: SOURCE TVCRESTARTS.agc:93
//#	CALLS RCSDAPON, WHICH RESETS THE T5 BIT FOR RCS.
// PORT: SOURCE TVCRESTARTS.agc:94
//# CALLING SEQUENCE....T5, IN PARTICULAR BY ELRSKIP OF FRESH START/RESTART
// PORT: SOURCE TVCRESTARTS.agc:95
//#
// PORT: SOURCE TVCRESTARTS.agc:96
//# NORMAL EXIT MODES....RESUME, NOQRSM, POSTJUMP (TO TVCINIT4 OR MRCLEAN)
// PORT: SOURCE TVCRESTARTS.agc:97
//#
// PORT: SOURCE TVCRESTARTS.agc:98
//# ALARM OR ABORT EXIT MODES....NONE
// PORT: SOURCE TVCRESTARTS.agc:99
//#
// PORT: SOURCE TVCRESTARTS.agc:100
//# SUBROUTINES CALLED....
// PORT: SOURCE TVCRESTARTS.agc:101
//#
// PORT: SOURCE TVCRESTARTS.agc:102
//#      *PCOPY+1, YCOPY+1 (PITCH AND YAW COPYCYCLES)
// PORT: SOURCE TVCRESTARTS.agc:103
//#      *ENABLE1,2, CMDSOUT (RE-ESTABLISH ACTUATOR TRIMS)
// PORT: SOURCE TVCRESTARTS.agc:104
//#      *MRCLEAN OR TVCINIT4 (TVCDAP INITIALIZATIONS)
// PORT: SOURCE TVCRESTARTS.agc:105
//#      *SWICHOVR +5  (CSM/LM V46 SWITCH-OVER)
// PORT: SOURCE TVCRESTARTS.agc:106
//#      *EXRSTRT AND TVCEXECUTIVE PHASE POINTS 1 THRU 6
// PORT: SOURCE TVCRESTARTS.agc:107
//#      *WAITLIST, IBNKCALL, POSTJUMP, ISWCALL
// PORT: SOURCE TVCRESTARTS.agc:108
//#
// PORT: SOURCE TVCRESTARTS.agc:109
//# OTHER INTERFACES....DOTVCON AND RCSDAPON (T5 BITS), ELRSKIP (CALLS IT)
// PORT: SOURCE TVCRESTARTS.agc:110
//# ERASABLE INITIALIZATION REQUIRED....
// PORT: SOURCE TVCRESTARTS.agc:111
//#
// PORT: SOURCE TVCRESTARTS.agc:112
//#      *T5 BITS (1,0), TVCPHASE (-2,-1,0,1,2,3), TVCEXPHS (1 THRU 6)
// PORT: SOURCE TVCRESTARTS.agc:113
//#      *TVC DAP VARIABLES
// PORT: SOURCE TVCRESTARTS.agc:114
//#      *OPERATIONS PERFORMED BY REDOTVC ARE BASED ON THE ASSUMPTION THAT
// PORT: SOURCE TVCRESTARTS.agc:115
//#	THE TVC DAPS ARE RUNNING NORMALLY
// PORT: SOURCE TVCRESTARTS.agc:116
//#
// PORT: SOURCE TVCRESTARTS.agc:117
//# OUTPUT....
// PORT: SOURCE TVCRESTARTS.agc:118
//#
// PORT: SOURCE TVCRESTARTS.agc:119
//#      *PITCH AND YAW TVC DAP COPYCYCLES COMPLETED IF INTERUPTED
// PORT: SOURCE TVCRESTARTS.agc:120
//#      *TVCEXECUTIVE COMPLETED IF INTERUPTED
// PORT: SOURCE TVCRESTARTS.agc:121
//#      *STROKE TEST TERMINATED IF INTERRUPTED
// PORT: SOURCE TVCRESTARTS.agc:122
//#      *CSM/LM V46 SWITCH-OVER REPEATED IF INTERRUPTED
// PORT: SOURCE TVCRESTARTS.agc:123
//#      *ACTUATOR TRIMS RE-ESTABLISHED (ACTUATORS BACK ON THE AIR)
// PORT: SOURCE TVCRESTARTS.agc:124
//#      *TVC DAP INITIALIZATION AS REQUIRED
// PORT: SOURCE TVCRESTARTS.agc:125
//#      *ALL TVC DAP OPERATIONS ON THE AIR
// PORT: SOURCE TVCRESTARTS.agc:126
//#
// PORT: SOURCE TVCRESTARTS.agc:127
//# DEBRIS....TVC TEMPORARIES IN EBANK6
// PORT: SOURCE TVCRESTARTS.agc:128
//
// PORT: SOURCE TVCRESTARTS.agc:129
//# Page 958
// PORT: SOURCE TVCRESTARTS.agc:130
//
// PORT: SOURCE TVCRESTARTS.agc:131
//		BANK	16
// PORT: SOURCE TVCRESTARTS.agc:132
//		SETLOC	DAPROLL
// PORT: SOURCE TVCRESTARTS.agc:133
//		BANK
// PORT: SOURCE TVCRESTARTS.agc:134
//		EBANK=	TVCPHASE
// PORT: SOURCE TVCRESTARTS.agc:135
//		COUNT*	$$/RSRT
// PORT: SOURCE TVCRESTARTS.agc:136
//
// PORT: SOURCE TVCRESTARTS.agc:137
//REDOTVC		LXCH	BANKRUPT	# TVC RESTART PACKAGE
// PORT: Fixed ROM slots 16992.
                if slot <> 16992 or instruction <> 9230 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 14, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCRESTARTS.agc:138
//		EXTEND
// PORT: Fixed ROM slots 16993.
                if slot <> 16993 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 16994 {
// PORT: SOURCE TVCRESTARTS.agc:139
//		QXCH	QRUPT		# (  ..TCR..  IN  ..FINCOPY..  )
// PORT: Fixed ROM slots 16994.
                if slot <> 16994 or instruction <> 9226 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 10, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCRESTARTS.agc:140
//
// PORT: SOURCE TVCRESTARTS.agc:141
//EXECPHS		CCS	TVCEXPHS	# CHECK TVCEXECUTIVE PHASE
// PORT: Fixed ROM slots 16995.
                if slot <> 16995 or instruction <> 5033 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 937).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 16997 {
            if slot <= 16996 {
// PORT: SOURCE TVCRESTARTS.agc:142
//		TCF	+2		#	MUST RESTART TVCEXECUTIVE
// PORT: Fixed ROM slots 16996.
                if slot <> 16996 or instruction <> 5734 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5734, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCRESTARTS.agc:143
//		TCF	TVCDAPHS	#	NO NEED TO RESTART TVCEXECUTIVE
// PORT: Fixed ROM slots 16997.
                if slot <> 16997 or instruction <> 5738 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5738, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 16998 {
// PORT: SOURCE TVCRESTARTS.agc:144
//
// PORT: SOURCE TVCRESTARTS.agc:145
//		CAF	NINE		# 9CS DELAY TO FORCE EXRSTRT TO OCCUR
// PORT: Fixed ROM slots 16998.
                if slot <> 16998 or instruction <> 14556 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2268), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCRESTARTS.agc:146
//		TC	WAITLIST	#	BEFORE PITCHDAP, AFTER CMDSOUT
// PORT: Fixed ROM slots 16999.
                if slot <> 16999 or instruction <> 2725 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2725, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[971] to agcAotUnit971@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TVCRESTARTS.agc:147
//		EBANK=	TVCEXPHS
// PORT: SOURCE TVCRESTARTS.agc:148
//		2CADR	EXRSTRT
// PORT: Fixed ROM slots 17000 17001.
    17000, 3414, 17001, 28780
)).

// PORT: Physical bank 16. Shared continuation entries, slots 17002–17046.
function agcAotUnit972 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17023 {
        if slot <= 17012 {
            if slot <= 17006 {
                if slot <= 17003 {
                    if slot <= 17002 {
// PORT: SOURCE TVCRESTARTS.agc:149
//
// PORT: SOURCE TVCRESTARTS.agc:150
//TVCDAPHS	CS	OCT37776	# CHECK BITS 15 AND 1 OF TVCPHASE TO SEE
// PORT: Fixed ROM slots 17002.
                        if slot <> 17002 or instruction <> 20416 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 4032), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCRESTARTS.agc:151
//		MASK	TVCPHASE	#	DAP RESTART LOCATION (-1,1,2,3)
// PORT: Fixed ROM slots 17003.
                        if slot <> 17003 or instruction <> 29604 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 932).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17004 {
// PORT: SOURCE TVCRESTARTS.agc:152
//		CCS	A
// PORT: Fixed ROM slots 17004.
                        if slot <> 17004 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17005 {
// PORT: SOURCE TVCRESTARTS.agc:153
//		TCF	FINCOPY		#	FINISH THE COPYCYCLE FIRST
// PORT: Fixed ROM slots 17005.
                            if slot <> 17005 or instruction <> 5792 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5792, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCRESTARTS.agc:154
//		TCF	ENABL1		#	JUST PREPARE THE OUTCOUNTERS AND GO
// PORT: Fixed ROM slots 17006.
                            if slot <> 17006 or instruction <> 5747 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5747, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 17009 {
                    if slot <= 17007 {
// PORT: SOURCE TVCRESTARTS.agc:155
//
// PORT: SOURCE TVCRESTARTS.agc:156
//		CS	TVCPHASE	# TEST FOR TVCPHASE = -2
// PORT: Fixed ROM slots 17007.
                        if slot <> 17007 or instruction <> 17316 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 932).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17008 {
// PORT: SOURCE TVCRESTARTS.agc:157
//		MASK	BIT2		#	(THIS INDICATES RESTART OCCURRED
// PORT: Fixed ROM slots 17008.
                            if slot <> 17008 or instruction <> 31246 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                                if fixedOperand = 2 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 2), 2) * 2).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCRESTARTS.agc:158
//		EXTEND			#	 DURING CSM/LM V46 SWITCH-OVER)
// PORT: Fixed ROM slots 17009.
                            if slot <> 17009 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17010 {
// PORT: SOURCE TVCRESTARTS.agc:159
//		BZF	TRIM/CMD	# NO. TVCPHASE = -1. RSTRT WAS IN TVCINIT
// PORT: Fixed ROM slots 17010.
                        if slot <> 17010 or instruction <> 5796 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5796, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17011 {
// PORT: SOURCE TVCRESTARTS.agc:160
//
// PORT: SOURCE TVCRESTARTS.agc:161
//ENABL1		CAF	BIT8		# TVC ENABLE, FOLLOWED BY 40 MS (MIN) WAIT
// PORT: Fixed ROM slots 17011.
                            if slot <> 17011 or instruction <> 14856 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2568), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCRESTARTS.agc:162
//		AD	BIT11		# SET BIT FOR OPTICS-DAC-ENABLE ALSO
// PORT: Fixed ROM slots 17012.
                            if slot <> 17012 or instruction <> 27141 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2565), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 17017 {
                if slot <= 17014 {
                    if slot <= 17013 {
// PORT: SOURCE TVCRESTARTS.agc:163
//		EXTEND			# (ENABL1 ENTERED FROM TVCDAPHS / FINCOPY)
// PORT: Fixed ROM slots 17013.
                        if slot <> 17013 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCRESTARTS.agc:164
//		WOR	CHAN12
// PORT: Fixed ROM slots 17014.
                        if slot <> 17014 or instruction <> 2570 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17015 {
// PORT: SOURCE TVCRESTARTS.agc:165
//		CAF	TVCADDR		# WAIT.  CALLING ENABL2  (BBCON THERE)
// PORT: Fixed ROM slots 17015.
                        if slot <> 17015 or instruction <> 13999 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1711), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17016 {
// PORT: SOURCE TVCRESTARTS.agc:166
//		TS	T5LOC
// PORT: Fixed ROM slots 17016.
                            if slot <> 17016 or instruction <> 23242 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23242, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCRESTARTS.agc:167
//		CAF	TVCADDR +4	#	60 MS (TVCEXADR)
// PORT: Fixed ROM slots 17017.
                            if slot <> 17017 or instruction <> 14003 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1715), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 17020 {
                    if slot <= 17018 {
// PORT: SOURCE TVCRESTARTS.agc:168
//		TS	TIME5
// PORT: Fixed ROM slots 17018.
                        if slot <> 17018 or instruction <> 22552 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22552, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17019 {
// PORT: SOURCE TVCRESTARTS.agc:169
//
// PORT: SOURCE TVCRESTARTS.agc:170
//		TCF	RESUME
// PORT: Fixed ROM slots 17019.
                            if slot <> 17019 or instruction <> 6875 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6875, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCRESTARTS.agc:171
//
// PORT: SOURCE TVCRESTARTS.agc:172
//ENABL2		LXCH	BANKRUPT	# CONTINUE PREPARATION OF OUTCOUNTERS
// PORT: Fixed ROM slots 17020.
                            if slot <> 17020 or instruction <> 9230 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 14, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17021 {
// PORT: SOURCE TVCRESTARTS.agc:173
//
// PORT: SOURCE TVCRESTARTS.agc:174
//		CAF	BIT2		# OPTICS ERROR CNTR ENABLE. 4MS MIN WAIT
// PORT: Fixed ROM slots 17021.
                        if slot <> 17021 or instruction <> 14862 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17022 {
// PORT: SOURCE TVCRESTARTS.agc:175
//		EXTEND
// PORT: Fixed ROM slots 17022.
                            if slot <> 17022 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCRESTARTS.agc:176
//		WOR	CHAN12
// PORT: Fixed ROM slots 17023.
                            if slot <> 17023 or instruction <> 2570 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 17034 {
            if slot <= 17028 {
                if slot <= 17025 {
                    if slot <= 17024 {
// PORT: SOURCE TVCRESTARTS.agc:177
//# Page 959
// PORT: SOURCE TVCRESTARTS.agc:178
//		CAF	TVCADDR +2	# WAIT, CALLING CMDSOUT (BBCON THERE)
// PORT: Fixed ROM slots 17024.
                        if slot <> 17024 or instruction <> 14001 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1713), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCRESTARTS.agc:179
//		TS	T5LOC
// PORT: Fixed ROM slots 17025.
                        if slot <> 17025 or instruction <> 23242 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23242, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17026 {
// PORT: SOURCE TVCRESTARTS.agc:180
//		CAF	OCT37776	#	20MS
// PORT: Fixed ROM slots 17026.
                        if slot <> 17026 or instruction <> 16320 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 4032), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17027 {
// PORT: SOURCE TVCRESTARTS.agc:181
//		TS	TIME5
// PORT: Fixed ROM slots 17027.
                            if slot <> 17027 or instruction <> 22552 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22552, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCRESTARTS.agc:182
//
// PORT: SOURCE TVCRESTARTS.agc:183
//		TCF	NOQRSM
// PORT: Fixed ROM slots 17028.
                            if slot <> 17028 or instruction <> 6877 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6877, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 17031 {
                    if slot <= 17029 {
// PORT: SOURCE TVCRESTARTS.agc:184
//
// PORT: SOURCE TVCRESTARTS.agc:185
//CMDSOUT		LXCH	BANKRUPT	# CONTINUE PREPARATION OF OUTCOUNTERS
// PORT: Fixed ROM slots 17029.
                        if slot <> 17029 or instruction <> 9230 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 14, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17030 {
// PORT: SOURCE TVCRESTARTS.agc:186
//		EXTEND
// PORT: Fixed ROM slots 17030.
                            if slot <> 17030 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCRESTARTS.agc:187
//		QXCH	QRUPT
// PORT: Fixed ROM slots 17031.
                            if slot <> 17031 or instruction <> 9226 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 2, 10, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17032 {
// PORT: SOURCE TVCRESTARTS.agc:188
//
// PORT: SOURCE TVCRESTARTS.agc:189
//		CS	ZERO		# MOST RECENT ACTUATOR COMMANDS
// PORT: Fixed ROM slots 17032.
                        if slot <> 17032 or instruction <> 18961 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17033 {
// PORT: SOURCE TVCRESTARTS.agc:190
//		AD	PCMD		#	(AVOID +0)
// PORT: Fixed ROM slots 17033.
                            if slot <> 17033 or instruction <> 25491 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 915).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCRESTARTS.agc:191
//		TS	TVCPITCH
// PORT: Fixed ROM slots 17034.
                            if slot <> 17034 or instruction <> 22572 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22572, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 17040 {
                if slot <= 17037 {
                    if slot <= 17035 {
// PORT: SOURCE TVCRESTARTS.agc:192
//		CS	ZERO
// PORT: Fixed ROM slots 17035.
                        if slot <> 17035 or instruction <> 18961 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17036 {
// PORT: SOURCE TVCRESTARTS.agc:193
//		AD	YCMD
// PORT: Fixed ROM slots 17036.
                            if slot <> 17036 or instruction <> 25492 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 916).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCRESTARTS.agc:194
//		TS	TVCYAW
// PORT: Fixed ROM slots 17037.
                            if slot <> 17037 or instruction <> 22571 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22571, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17038 {
// PORT: SOURCE TVCRESTARTS.agc:195
//
// PORT: SOURCE TVCRESTARTS.agc:196
//		CAF	PRIO6		# RELEASE THE COUNTERS (BITS 11,12)
// PORT: Fixed ROM slots 17038.
                        if slot <> 17038 or instruction <> 14898 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2610), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17039 {
// PORT: SOURCE TVCRESTARTS.agc:197
//		EXTEND
// PORT: Fixed ROM slots 17039.
                            if slot <> 17039 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCRESTARTS.agc:198
//		WOR	CHAN14
// PORT: Fixed ROM slots 17040.
                            if slot <> 17040 or instruction <> 2572 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 5, 12, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 17043 {
                    if slot <= 17041 {
// PORT: SOURCE TVCRESTARTS.agc:199
//
// PORT: SOURCE TVCRESTARTS.agc:200
//PHSCHK2		CCS	TVCPHASE	# CHECK TVCPHASE AGAIN
// PORT: Fixed ROM slots 17041.
                        if slot <> 17041 or instruction <> 5028 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 932).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17042 {
// PORT: SOURCE TVCRESTARTS.agc:201
//		TCF	CHKSTRK
// PORT: Fixed ROM slots 17042.
                            if slot <> 17042 or instruction <> 5786 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5786, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCRESTARTS.agc:202
//		TCF	CHKSTRK
// PORT: Fixed ROM slots 17043.
                            if slot <> 17043 or instruction <> 5786 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5786, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17044 {
// PORT: SOURCE TVCRESTARTS.agc:203
//		CCS	A		# A CONTAINS THE DIMINISHED ABSOLUTE OF
// PORT: Fixed ROM slots 17044.
                        if slot <> 17044 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17045 {
// PORT: SOURCE TVCRESTARTS.agc:204
//		TC	+3		# TVCPHASE (-2 BECOMES +1, -1 BECOMES +0)
// PORT: Fixed ROM slots 17045.
                            if slot <> 17045 or instruction <> 1688 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1688, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCRESTARTS.agc:205
//
// PORT: SOURCE TVCRESTARTS.agc:206
//		TC	POSTJUMP	#	REPEAT TVC INITIALIZATION
// PORT: Fixed ROM slots 17046.
                            if slot <> 17046 or instruction <> 2497 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2497, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[972] to agcAotUnit972@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TVCRESTARTS.agc:207
//		CADR	MRCLEAN		#	(DO NOT RETURN)
// PORT: Fixed ROM slots 17047.
    17047, 30932
)).

// PORT: Physical bank 16. Shared continuation entries, slots 17048–17048.
function agcAotUnit973 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE TVCRESTARTS.agc:208
//
// PORT: SOURCE TVCRESTARTS.agc:209
//	+3	TC	IBNKCALL	#	REPEAT CSM/LM V46 SWITCH-OVER
// PORT: Fixed ROM slots 17048.
    if slot <> 17048 or instruction <> 2528 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2528, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[973] to agcAotUnit973@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TVCRESTARTS.agc:210
//		CADR	SWICHOVR +5	#	(RETURN TO CHECK FOR STROKE TEST)
// PORT: Fixed ROM slots 17049.
    17049, 31202
)).

// PORT: Physical bank 16. Shared continuation entries, slots 17050–17054.
function agcAotUnit974 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17051 {
        if slot <= 17050 {
// PORT: SOURCE TVCRESTARTS.agc:211
//
// PORT: SOURCE TVCRESTARTS.agc:212
//CHKSTRK		CCS	STROKER		# CHECK FOR STROKE TEST IN PROGRESS
// PORT: Fixed ROM slots 17050.
            if slot <> 17050 or instruction <> 4988 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 892).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TVCRESTARTS.agc:213
//		TCF	TSTINITJ	# YES, KILL IT
// PORT: Fixed ROM slots 17051.
            if slot <> 17051 or instruction <> 5800 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5800, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17052 {
// PORT: SOURCE TVCRESTARTS.agc:214
//		TCF	+2		# NO, PROCEED
// PORT: Fixed ROM slots 17052.
            if slot <> 17052 or instruction <> 5790 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5790, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 17053 {
// PORT: SOURCE TVCRESTARTS.agc:215
//		TCF	TSTINITJ	# YES, KILL IT
// PORT: Fixed ROM slots 17053.
                if slot <> 17053 or instruction <> 5800 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5800, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCRESTARTS.agc:216
//
// PORT: SOURCE TVCRESTARTS.agc:217
//	+4	TC	POSTJUMP	#	IF POSITIVE OR ZERO, RESTART AT
// PORT: Fixed ROM slots 17054.
                if slot <> 17054 or instruction <> 2497 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2497, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[974] to agcAotUnit974@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TVCRESTARTS.agc:218
//		CADR	TVCINIT4	#		TVCINIT4 (ZEROS TVCPHASE, AND
// PORT: Fixed ROM slots 17055.
    17055, 31144
)).

// PORT: Physical bank 16. Shared continuation entries, slots 17056–17056.
function agcAotUnit975 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE TVCRESTARTS.agc:219
//					#		CALLS TVC DAPS VIA DAPINIT)
// PORT: SOURCE TVCRESTARTS.agc:220
//FINCOPY		INDEX	TVCPHASE	# PICK UP THE APPROPRIATE COPYCYCLE
// PORT: Fixed ROM slots 17056.
    if slot <> 17056 or instruction <> 21412 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21412, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21412, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[975] to agcAotUnit975@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TVCRESTARTS.agc:221
//		CAF	TVCCADR
// PORT: Fixed ROM slots 17057.
    17057, 27998
)).

// PORT: Physical bank 16. Shared continuation entries, slots 17058–17067.
function agcAotUnit976 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17062 {
        if slot <= 17059 {
            if slot <= 17058 {
// PORT: SOURCE TVCRESTARTS.agc:222
//		TCR	ISWCALL		# RE-ENTER THE COPYCYCLE, RETURN AT END
// PORT: Fixed ROM slots 17058.
                if slot <> 17058 or instruction <> 2532 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2532, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCRESTARTS.agc:223
//		TCF	ENABL1		# NOW PREPARE THE OUTCOUNTERS
// PORT: Fixed ROM slots 17059.
                if slot <> 17059 or instruction <> 5747 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5747, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17060 {
// PORT: SOURCE TVCRESTARTS.agc:224
//
// PORT: SOURCE TVCRESTARTS.agc:225
//TRIM/CMD	EXTEND			# TVCDAPON INITIALIZATION NOT COMPLETED,
// PORT: Fixed ROM slots 17060.
                if slot <> 17060 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17061 {
// PORT: SOURCE TVCRESTARTS.agc:226
//# Page 960
// PORT: SOURCE TVCRESTARTS.agc:227
//		DCA	PACTOFF		#	EG.  P,YCMD MAY NOT BE SET.  SET...
// PORT: Fixed ROM slots 17061.
                    if slot <> 17061 or instruction <> 13076 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 788, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCRESTARTS.agc:228
//		DXCH	PCMD
// PORT: Fixed ROM slots 17062.
                    if slot <> 17062 or instruction <> 22420 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 916, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 17064 {
            if slot <= 17063 {
// PORT: SOURCE TVCRESTARTS.agc:229
//		TCF	ENABL1		# NOW PREPARE THE OUTCOUNTERS
// PORT: Fixed ROM slots 17063.
                if slot <> 17063 or instruction <> 5747 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5747, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCRESTARTS.agc:230
//
// PORT: SOURCE TVCRESTARTS.agc:231
//TSTINITJ	CAF	ZERO		# DISABLE STROKE TEST (-0 SHOWS PRIOR V68)
// PORT: Fixed ROM slots 17064.
                if slot <> 17064 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
            if slot <= 17065 {
// PORT: SOURCE TVCRESTARTS.agc:232
//		TS	STROKER		# (+0 MEANS NEW V68 REQUIRED FOR STARTUP)
// PORT: Fixed ROM slots 17065.
                if slot <> 17065 or instruction <> 23420 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23420, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17066 {
// PORT: SOURCE TVCRESTARTS.agc:233
//
// PORT: SOURCE TVCRESTARTS.agc:234
//		TCF	CHKSTRK +4
// PORT: Fixed ROM slots 17066.
                    if slot <> 17066 or instruction <> 5790 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5790, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCRESTARTS.agc:235
//
// PORT: SOURCE TVCRESTARTS.agc:236
//EXRSTRT		INDEX	TVCEXPHS	# TVCEXECUTIVE RESTARTS....GO TO
// PORT: Fixed ROM slots 17067.
                    if slot <> 17067 or instruction <> 21417 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21417, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21417, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[976] to agcAotUnit976@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TVCRESTARTS.agc:237
//		CAF	TVCEXADR	#	APPROPRIATE RESTART POINT
// PORT: Fixed ROM slots 17068.
    17068, 28006
)).

// PORT: Physical bank 16. Shared continuation entries, slots 17069–17069.
function agcAotUnit977 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE TVCRESTARTS.agc:238
//		INDEX	A
// PORT: Fixed ROM slots 17069.
    if slot <> 17069 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[977] to agcAotUnit977@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TVCRESTARTS.agc:239
//		TCF	0
// PORT: Fixed ROM slots 17070.
    17070, 8192,
// PORT: SOURCE TVCRESTARTS.agc:240
//
// PORT: SOURCE TVCRESTARTS.agc:241
//# TVC RESTART TABLES.... ORDER IS REQUIRED.   HI-ORDER WORDS ONLY, OF 2CADRS, SINCE BBCON IS ALREADY THERE.
// PORT: SOURCE TVCRESTARTS.agc:242
//
// PORT: SOURCE TVCRESTARTS.agc:243
//TVCADDR		=	TVCCADR		# TABLE OF CADRS, UNUSED LOCS FOR GENADRS
// PORT: SOURCE TVCRESTARTS.agc:244
//TVCCADR		GENADR	ENABL2		# (FOR T5 CALL, UNUSED TABLE LOC)
// PORT: Fixed ROM slots 17071.
    17071, 3320,
// PORT: SOURCE TVCRESTARTS.agc:245
//	+1	CADR	PCOPY +1	# PITCH COPYCYCLE
// PORT: Fixed ROM slots 17072.
    17072, 33658,
// PORT: SOURCE TVCRESTARTS.agc:246
//	+2	GENADR	CMDSOUT		# (FOR T5 CALL, UNUSED TABLE LOC)
// PORT: Fixed ROM slots 17073.
    17073, 3338,
// PORT: SOURCE TVCRESTARTS.agc:247
//	+3	CADR	YCOPY +1	# YAW COPYCYCLE
// PORT: Fixed ROM slots 17074.
    17074, 33874,
// PORT: SOURCE TVCRESTARTS.agc:248
//TVCEXADR	OCT	37772		# (UNUSED TABLE LOC, FILL WITH 60MS, T5)
// PORT: Fixed ROM slots 17075.
    17075, 32756,
// PORT: SOURCE TVCRESTARTS.agc:249
//	+1	GENADR	EXECCOPY +1	# TVCEXECUTIVE RESTART POINTS (ORDERED)
// PORT: Fixed ROM slots 17076.
    17076, 3078,
// PORT: SOURCE TVCRESTARTS.agc:250
//	+2	GENADR	1SHOTCHK
// PORT: Fixed ROM slots 17077.
    17077, 3090,
// PORT: SOURCE TVCRESTARTS.agc:251
//	+3	GENADR	TEMPSET
// PORT: Fixed ROM slots 17078.
    17078, 3136,
// PORT: SOURCE TVCRESTARTS.agc:252
//	+4	GENADR	CORSETUP
// PORT: Fixed ROM slots 17079.
    17079, 3142,
// PORT: SOURCE TVCRESTARTS.agc:253
//	+5	GENADR	CORCOPY +1
// PORT: Fixed ROM slots 17080.
    17080, 3234,
// PORT: SOURCE TVCRESTARTS.agc:254
//	+6	GENADR	CNTRCOPY
// PORT: Fixed ROM slots 17081.
    17081, 3252
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE TVCRESTARTS.agc:255
//
// PORT: SOURCE TVCRESTARTS.agc:256
//
