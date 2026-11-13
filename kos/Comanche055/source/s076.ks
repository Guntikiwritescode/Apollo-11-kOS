// PORT: Original source unit TVCDAPS.agc.
// PORT: Physical bank 20. Shared continuation entries, slots 18776–18903.
function agcAotUnit1102 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18839 {
        if slot <= 18807 {
            if slot <= 18791 {
                if slot <= 18783 {
                    if slot <= 18779 {
                        if slot <= 18777 {
                            if slot <= 18776 {
// PORT: SOURCE TVCDAPS.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE TVCDAPS.agc:2
//# Filename:	TVCDAPS.agc
// PORT: SOURCE TVCDAPS.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// PORT: SOURCE TVCDAPS.agc:4
//#		It is part of the source code for the Command Module's (CM)
// PORT: SOURCE TVCDAPS.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE TVCDAPS.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE TVCDAPS.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE TVCDAPS.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE TVCDAPS.agc:9
//# Pages:	961-978
// PORT: SOURCE TVCDAPS.agc:10
//# Mod history:	2009-05-13 RSB	Adapted from the Colossus249/ file of the
// PORT: SOURCE TVCDAPS.agc:11
//#				same name, using Comanche055 page images.
// PORT: SOURCE TVCDAPS.agc:12
//#		2009-05-20 RSB	Corrections:  Eliminated an extraneous EXTEND,
// PORT: SOURCE TVCDAPS.agc:13
//#				added a missing instruction to PFORWARD.
// PORT: SOURCE TVCDAPS.agc:14
//#		2000-05-21 RSB	Wrong opcode was used with DELBRTMP and
// PORT: SOURCE TVCDAPS.agc:15
//#				DELBRTMP +1 operands in 4 places.  Corrected
// PORT: SOURCE TVCDAPS.agc:16
//#				an MP operation in 2CASFLTR.
// PORT: SOURCE TVCDAPS.agc:17
//#
// PORT: SOURCE TVCDAPS.agc:18
//# This source code has been transcribed or otherwise adapted from digitized
// PORT: SOURCE TVCDAPS.agc:19
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// PORT: SOURCE TVCDAPS.agc:20
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// PORT: SOURCE TVCDAPS.agc:21
//# thanks to both.  The images (with suitable reduction in storage size and
// PORT: SOURCE TVCDAPS.agc:22
//# consequent reduction in image quality as well) are available online at
// PORT: SOURCE TVCDAPS.agc:23
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// PORT: SOURCE TVCDAPS.agc:24
//# illegible, contact me at info@sandroid.org about getting access to the
// PORT: SOURCE TVCDAPS.agc:25
//# (much) higher-quality images which Paul actually created.
// PORT: SOURCE TVCDAPS.agc:26
//#
// PORT: SOURCE TVCDAPS.agc:27
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE TVCDAPS.agc:28
//#
// PORT: SOURCE TVCDAPS.agc:29
//#	Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE TVCDAPS.agc:30
//#	2021113-051.  10:28 APR. 1, 1969
// PORT: SOURCE TVCDAPS.agc:31
//#
// PORT: SOURCE TVCDAPS.agc:32
//#	This AGC program shall also be referred to as
// PORT: SOURCE TVCDAPS.agc:33
//#			Colossus 2A
// PORT: SOURCE TVCDAPS.agc:34
//
// PORT: SOURCE TVCDAPS.agc:35
//# Page 961
// PORT: SOURCE TVCDAPS.agc:36
//# PROGRAM NAME....TVCDAP, CONSISTING OF PITCHDAP, YAWDAP, ETC.
// PORT: SOURCE TVCDAPS.agc:37
//# LOG SECTION...TVCDAPS				SUBROUTINE...DAPCSM
// PORT: SOURCE TVCDAPS.agc:38
//# MODIFIED BY SCHLUNDT				21 OCTOBER 1968
// PORT: SOURCE TVCDAPS.agc:39
//# FUNCTIONAL DESCRIPTION....
// PORT: SOURCE TVCDAPS.agc:40
//
// PORT: SOURCE TVCDAPS.agc:41
//#	SELF-PERPETUATING T5 TASKS WHICH GENERATE THE COMMAND SIGNALS
// PORT: SOURCE TVCDAPS.agc:42
//#	FOR THE PITCH AND YAW SPS GIMBAL ACTUATORS DURING TVC (SPS) BURNS,
// PORT: SOURCE TVCDAPS.agc:43
//#	IN RESPONSE TO BODY-AXIS RATE COMMANDS FROM CROSS-PRODUCT STEERING
// PORT: SOURCE TVCDAPS.agc:44
//#	(S40.8).  IF NO STEERING (IMPULSIVE BURNS) MAINTAINS ATTITUDE-HOLD
// PORT: SOURCE TVCDAPS.agc:45
//#	ABOUT THE REFERENCE (INITIAL) DIRECTIONS (ZERO RATE COMMANDS).
// PORT: SOURCE TVCDAPS.agc:46
//
// PORT: SOURCE TVCDAPS.agc:47
//#	THE PITCH AND YAW LOOPS ARE SEPARATE, BUT STRUCTURED IDENTICALLY.
// PORT: SOURCE TVCDAPS.agc:48
//#	EACH ATTITUDE-RATE LOOP INCLUDES GIMBAL ANGLE RATE DERIVATION,
// PORT: SOURCE TVCDAPS.agc:49
//#	GIMBAL/BODY AXIS TRANSFORMATION, BODY-AXIS ATTITUDE ERROR
// PORT: SOURCE TVCDAPS.agc:50
//#	INTEGRATION WITH ERROR LIMITING, THE GENERALIZED 6TH-ORDER FILTER
// PORT: SOURCE TVCDAPS.agc:51
//#	FOR CSM OR CSM/LM OPERATION. A FILTER OUTPUT LIMITER.
// PORT: SOURCE TVCDAPS.agc:52
//#	CG-OFFSET TRACKER FILTER, AND THE CG-TRACKER MINOR LOOP.
// PORT: SOURCE TVCDAPS.agc:53
//
// PORT: SOURCE TVCDAPS.agc:54
//#	THE DAPS ARE CYCLIC, CALLING EACH OTHER AT 1/2 THE DAP SAMPLE
// PORT: SOURCE TVCDAPS.agc:55
//#	TIME, AS DETERMINED BY T5TVCDT.  THE ACTUATOR COMMANDS ARE
// PORT: SOURCE TVCDAPS.agc:56
//#	REGENERATED AS ANALOG VOLTAGES BY THE OPTICS ERROR COUNTERS, WHICH
// PORT: SOURCE TVCDAPS.agc:57
//#	TRANSMIT THE SIGNAL TO THE ACTUATOR SERVOS WHEN THERE IS PROPER CDU
// PORT: SOURCE TVCDAPS.agc:58
//#	MODING.
// PORT: SOURCE TVCDAPS.agc:59
//
// PORT: SOURCE TVCDAPS.agc:60
//# CALLING SEQUENCE.... (TYPICALLY)
// PORT: SOURCE TVCDAPS.agc:61
//
// PORT: SOURCE TVCDAPS.agc:62
//#	T5 CALL OF TVCDAPON (TVCINITIALIZE) BY DOTVCON (P40)
// PORT: SOURCE TVCDAPS.agc:63
//#	T5 CALL OF DAPINIT (TVCDAPS) BY TVCINIT4 (TVCINITIALIZE)
// PORT: SOURCE TVCDAPS.agc:64
//#	T5 CALL OF PITCHDAP BY DAPINIT
// PORT: SOURCE TVCDAPS.agc:65
//#	T5 CALL OF YAWDAP BY PITCHDAP
// PORT: SOURCE TVCDAPS.agc:66
//#	T5 CALL OF PITCHDAP BY YAWDAP
// PORT: SOURCE TVCDAPS.agc:67
//#		   ETC.
// PORT: SOURCE TVCDAPS.agc:68
//#	(AUTOMATIC SEQUENCING FROM TVCDAPON)
// PORT: SOURCE TVCDAPS.agc:69
//
// PORT: SOURCE TVCDAPS.agc:70
//# NORMAL EXIT MODE....RESUME
// PORT: SOURCE TVCDAPS.agc:71
//
// PORT: SOURCE TVCDAPS.agc:72
//# ALARM OR ABORT EXIT MODES....NONE
// PORT: SOURCE TVCDAPS.agc:73
//
// PORT: SOURCE TVCDAPS.agc:74
//# SUBROUTINES CALLED....
// PORT: SOURCE TVCDAPS.agc:75
//
// PORT: SOURCE TVCDAPS.agc:76
//#	HACK FOR STROKE TEST (V68) WAVEFORM GENERATION
// PORT: SOURCE TVCDAPS.agc:77
//#	PCOPY, YCOPY FOR COPY-CYCLES (USED ALSO BY TVC RESTART PACKAGE)
// PORT: SOURCE TVCDAPS.agc:78
//#	DAPINIT FOR INITIAL CDUS FOR RATE MEASUREMENTS
// PORT: SOURCE TVCDAPS.agc:79
//#	ERRORLIM, ACTLIM FOR INPUT (ATTITUDE-ERROR INTEGRATION) AND
// PORT: SOURCE TVCDAPS.agc:80
//#		OUTPUT (ACTUATOR COMMAND) LIMITING, COMMON TO PITCH AND
// PORT: SOURCE TVCDAPS.agc:81
//#		YAW DAPS
// PORT: SOURCE TVCDAPS.agc:82
//#	FWDFLTR (INCLUDING OPTVARK) AND PRECOMP, TO COMPUTE FILTER
// PORT: SOURCE TVCDAPS.agc:83
//#		OUTPUTS AND STORAGE VALUES
// PORT: SOURCE TVCDAPS.agc:84
//#	RESUME
// PORT: SOURCE TVCDAPS.agc:85
//
// PORT: SOURCE TVCDAPS.agc:86
//# Page 962
// PORT: SOURCE TVCDAPS.agc:87
//# OTHER INTERFACES....
// PORT: SOURCE TVCDAPS.agc:88
//
// PORT: SOURCE TVCDAPS.agc:89
//#	S40.8 CROSS-PRODUCT STEERING FOR BODY AXIS RATE COMMANDS OMEGAY,ZC
// PORT: SOURCE TVCDAPS.agc:90
//#	S40.15 FOR THE INITIAL DAP GAINS VARK AND 1/CONACC
// PORT: SOURCE TVCDAPS.agc:91
//#	TVCEXECUTIVE FOR DAP GAIN UPDATES AND TMC LOOP OPERATIONS
// PORT: SOURCE TVCDAPS.agc:92
//#	TVCRESTART PACKAGE FOR TVC RESTART PROTECTION.
// PORT: SOURCE TVCDAPS.agc:93
//
// PORT: SOURCE TVCDAPS.agc:94
//# ERASABLE INITIALIZATION REQUIRED....
// PORT: SOURCE TVCDAPS.agc:95
//
// PORT: SOURCE TVCDAPS.agc:96
//# 	PAD-LOAD ERASABLES ( SEE ERASABLE ASSIGNMENTS )
// PORT: SOURCE TVCDAPS.agc:97
//#	CONFIGURATION BITS (14, 13) OF DAPDATR1 AS IN R03
// PORT: SOURCE TVCDAPS.agc:98
//#	ENGINE-ON BIT (11.13) FOR RESTARTS
// PORT: SOURCE TVCDAPS.agc:99
//#	TVCPHASE FOR RESTARTS ( SEE DOTVCON, AND TVCINIT4 )
// PORT: SOURCE TVCDAPS.agc:100
//#	T5 BITS (15,14 OF FLAGWRD6) FOR RESTARTS
// PORT: SOURCE TVCDAPS.agc:101
//#	MISCELLANEOUS VARIABLES SET UP OR COMPUTED BY TVCDAPON....TVCINIT4,
// PORT: SOURCE TVCDAPS.agc:102
//#		INCLUDING THE ZEROING OF TEMPORARIES BY MRCLEAN
// PORT: SOURCE TVCDAPS.agc:103
//#	CDUX,Y,Z AND SINCDUX....COSCDUX AS PREPARED BY QUICTRIG (WITH
// PORT: SOURCE TVCDAPS.agc:104
//#		UPDATES EVERY 1/2 SECOND)
// PORT: SOURCE TVCDAPS.agc:105
//#	ALSO G+N PRIMARY, TVC ENABLE, AND OPTICS ERROR COUNTER ENABLE
// PORT: SOURCE TVCDAPS.agc:106
//#		UNLESS BENCH-TESTING.
// PORT: SOURCE TVCDAPS.agc:107
//#
// PORT: SOURCE TVCDAPS.agc:108
//# OUTPUT....
// PORT: SOURCE TVCDAPS.agc:109
//#
// PORT: SOURCE TVCDAPS.agc:110
//#	TVCPITCH AND TVCYAW WITH COUNTER RELEASE (11.14 AND 11.13 INCREMEN-
// PORT: SOURCE TVCDAPS.agc:111
//#		TAL COMMANDS TO OPTICS ERROR COUNTERS), FILTER NODES, BODY-
// PORT: SOURCE TVCDAPS.agc:112
//#		AXIS ATTITUDE ERROR INTEGRATOR, TOTAL ACTUATOR COMMANDS,
// PORT: SOURCE TVCDAPS.agc:113
//#		OFFSET-TRACKER-FILTER OUTPUTS, ETC.
// PORT: SOURCE TVCDAPS.agc:114
//# DEBRIS....
// PORT: SOURCE TVCDAPS.agc:115
//
// PORT: SOURCE TVCDAPS.agc:116
//#	MUCH, SHAREABLE WITH RCS/ENTRY, IN EBANK6 ONLY
// PORT: SOURCE TVCDAPS.agc:117
//
// PORT: SOURCE TVCDAPS.agc:118
//		BANK	17
// PORT: SOURCE TVCDAPS.agc:119
//		SETLOC	DAPS2
// PORT: SOURCE TVCDAPS.agc:120
//		BANK
// PORT: SOURCE TVCDAPS.agc:121
//
// PORT: SOURCE TVCDAPS.agc:122
//		EBANK=	BZERO
// PORT: SOURCE TVCDAPS.agc:123
//
// PORT: SOURCE TVCDAPS.agc:124
//		COUNT*	$$/DAPS
// PORT: SOURCE TVCDAPS.agc:125
//
// PORT: SOURCE TVCDAPS.agc:126
//# Page 963
// PORT: SOURCE TVCDAPS.agc:127
//# PITCH TVCDAP STARTS HERE....(INCORPORATES CSM/LEM DAP FILTER, MODOR DESIGN)
// PORT: SOURCE TVCDAPS.agc:128
//
// PORT: SOURCE TVCDAPS.agc:129
//PITCHDAP	LXCH	BANKRUPT	# T5 ENTRY, NORMAL OR VIA DAPINIT
// PORT: Fixed ROM slots 18776.
                                if slot <> 18776 or instruction <> 9230 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreExchange(words, 1, 14, readPhysical).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:130
//		EXTEND
// PORT: Fixed ROM slots 18777.
                                if slot <> 18777 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18778 {
// PORT: SOURCE TVCDAPS.agc:131
//		QXCH	QRUPT
// PORT: Fixed ROM slots 18778.
                                if slot <> 18778 or instruction <> 9226 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreExchange(words, 2, 10, readPhysical).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:132
//
// PORT: SOURCE TVCDAPS.agc:133
//		CAF	YAWT5		# SET UP T5 CALL FOR YAW AUTOPILOT (LOW-
// PORT: Fixed ROM slots 18779.
                                if slot <> 18779 or instruction <> 14141 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1853), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18781 {
                            if slot <= 18780 {
// PORT: SOURCE TVCDAPS.agc:134
//		TS	T5LOC		#	ORDER PART OF 2CADR ALREADY THERE)
// PORT: Fixed ROM slots 18780.
                                if slot <> 18780 or instruction <> 23242 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23242, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:135
//		CAE	T5TVCDT
// PORT: Fixed ROM slots 18781.
                                if slot <> 18781 or instruction <> 13205 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 917).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18782 {
// PORT: SOURCE TVCDAPS.agc:136
//		TS	TIME5
// PORT: Fixed ROM slots 18782.
                                if slot <> 18782 or instruction <> 22552 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22552, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:137
//
// PORT: SOURCE TVCDAPS.agc:138
//PSTROKER	CCS	STROKER		# (STRKFLG) CHECK FOR STROKE TEST
// PORT: Fixed ROM slots 18783.
                                if slot <> 18783 or instruction <> 4988 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 892).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 18787 {
                        if slot <= 18785 {
                            if slot <= 18784 {
// PORT: SOURCE TVCDAPS.agc:139
//		TC	HACK		# TEST-START OR TEST-IN-PROGRESS
// PORT: Fixed ROM slots 18784.
                                if slot <> 18784 or instruction <> 1883 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1883, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:140
//		TCF	+2		# NO-TEST
// PORT: Fixed ROM slots 18785.
                                if slot <> 18785 or instruction <> 5475 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5475, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18786 {
// PORT: SOURCE TVCDAPS.agc:141
//		TC	HACK		# TEST-IN-PROGRESS
// PORT: Fixed ROM slots 18786.
                                if slot <> 18786 or instruction <> 1883 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1883, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:142
//
// PORT: SOURCE TVCDAPS.agc:143
//PCDUDOTS	CAE	CDUY		# COMPUTE CDUYDOT (USED BY PITCH AND YAW)
// PORT: Fixed ROM slots 18787.
                                if slot <> 18787 or instruction <> 12315 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 27).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18789 {
                            if slot <= 18788 {
// PORT: SOURCE TVCDAPS.agc:144
//		XCH	PCDUYPST
// PORT: Fixed ROM slots 18788.
                                if slot <> 18788 or instruction <> 24485 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreExchange(words, 0, 933, readPhysical).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:145
//		EXTEND
// PORT: Fixed ROM slots 18789.
                                if slot <> 18789 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18790 {
// PORT: SOURCE TVCDAPS.agc:146
//		MSU	PCDUYPST
// PORT: Fixed ROM slots 18790.
                                if slot <> 18790 or instruction <> 9125 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMSU(words, 933).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:147
//		TCR	RLIMTEST	#	RATE TEST
// PORT: Fixed ROM slots 18791.
                                if slot <> 18791 or instruction <> 1392 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1392, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 18799 {
                    if slot <= 18795 {
                        if slot <= 18793 {
                            if slot <= 18792 {
// PORT: SOURCE TVCDAPS.agc:148
//		TS	MCDUYDOT	#	(MINUS, SC.AT 1/2TVCDT REVS/SEC)
// PORT: Fixed ROM slots 18792.
                                if slot <> 18792 or instruction <> 23463 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23463, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:149
//
// PORT: SOURCE TVCDAPS.agc:150
//		CAE	CDUZ		# COMPUTE CDUZDOT (USED BY PITCH AND YAW)
// PORT: Fixed ROM slots 18793.
                                if slot <> 18793 or instruction <> 12316 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 28).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18794 {
// PORT: SOURCE TVCDAPS.agc:151
//		XCH	PCDUZPST
// PORT: Fixed ROM slots 18794.
                                if slot <> 18794 or instruction <> 24486 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreExchange(words, 0, 934, readPhysical).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:152
//		EXTEND
// PORT: Fixed ROM slots 18795.
                                if slot <> 18795 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18797 {
                            if slot <= 18796 {
// PORT: SOURCE TVCDAPS.agc:153
//		MSU	PCDUZPST
// PORT: Fixed ROM slots 18796.
                                if slot <> 18796 or instruction <> 9126 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMSU(words, 934).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:154
//		TCR	RLIMTEST	#	RATE TEST
// PORT: Fixed ROM slots 18797.
                                if slot <> 18797 or instruction <> 1392 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1392, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18798 {
// PORT: SOURCE TVCDAPS.agc:155
//		TS	MCDUZDOT	#	(MINUS, SC.AT 1/2TVCDT REVS/SEC)
// PORT: Fixed ROM slots 18798.
                                if slot <> 18798 or instruction <> 23464 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23464, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:156
//		TCF	PINTEGRL
// PORT: Fixed ROM slots 18799.
                                if slot <> 18799 or instruction <> 5497 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5497, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 18803 {
                        if slot <= 18801 {
                            if slot <= 18800 {
// PORT: SOURCE TVCDAPS.agc:157
//
// PORT: SOURCE TVCDAPS.agc:158
//RLIMTEST	TS	TTMP1		# TEST FOR EXCESSIVE CDU RATES (GREATER
// PORT: Fixed ROM slots 18800.
                                if slot <> 18800 or instruction <> 23433 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23433, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:159
//		EXTEND			#	THAN 2.33 DEG IN ONE SAMPLE PERIOD)
// PORT: Fixed ROM slots 18801.
                                if slot <> 18801 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18802 {
// PORT: SOURCE TVCDAPS.agc:160
//		MP	1/RTLIM
// PORT: Fixed ROM slots 18802.
                                if slot <> 18802 or instruction <> 30526 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 1854, readEffective:call(words, 1854)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:161
//		EXTEND
// PORT: Fixed ROM slots 18803.
                                if slot <> 18803 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18805 {
                            if slot <= 18804 {
// PORT: SOURCE TVCDAPS.agc:162
//		BZF	+3
// PORT: Fixed ROM slots 18804.
                                if slot <> 18804 or instruction <> 5495 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5495, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:163
//		CAF	ZERO
// PORT: Fixed ROM slots 18805.
                                if slot <> 18805 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
                            if slot <= 18806 {
// PORT: SOURCE TVCDAPS.agc:164
//		TS	TTMP1
// PORT: Fixed ROM slots 18806.
                                if slot <> 18806 or instruction <> 23433 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23433, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:165
//		CAE	TTMP1
// PORT: Fixed ROM slots 18807.
                                if slot <> 18807 or instruction <> 13193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 905).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 18823 {
                if slot <= 18815 {
                    if slot <= 18811 {
                        if slot <= 18809 {
                            if slot <= 18808 {
// PORT: SOURCE TVCDAPS.agc:166
//		TC	Q
// PORT: Fixed ROM slots 18808.
                                if slot <> 18808 or instruction <> 2 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:167
//
// PORT: SOURCE TVCDAPS.agc:168
//PINTEGRL	EXTEND			# COMPUTE INTEGRAL OF BODY-AXIS PITCH-RATE
// PORT: Fixed ROM slots 18809.
                                if slot <> 18809 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18810 {
// PORT: SOURCE TVCDAPS.agc:169
//		DCA	PERRB		#	ERROR, SC.AT B-1 REVS
// PORT: Fixed ROM slots 18810.
                                if slot <> 18810 or instruction <> 13182 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 894, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:170
//		DXCH	ERRBTMP
// PORT: Fixed ROM slots 18811.
                                if slot <> 18811 or instruction <> 22467 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 963, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18813 {
                            if slot <= 18812 {
// PORT: SOURCE TVCDAPS.agc:171
//
// PORT: SOURCE TVCDAPS.agc:172
//		EXTEND
// PORT: Fixed ROM slots 18812.
                                if slot <> 18812 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:173
//		DCA	OMEGAYC
// PORT: Fixed ROM slots 18813.
                                if slot <> 18813 or instruction <> 13144 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 856, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18814 {
// PORT: SOURCE TVCDAPS.agc:174
//		DAS	ERRBTMP
// PORT: Fixed ROM slots 18814.
                                if slot <> 18814 or instruction <> 9155 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 963) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:175
//
// PORT: SOURCE TVCDAPS.agc:176
//# Page 964
// PORT: SOURCE TVCDAPS.agc:177
//		CS	COSCDUZ		# PREPARE BODY-AXIS PITCH RATE, OMEGAYB
// PORT: Fixed ROM slots 18815.
                                if slot <> 18815 or instruction <> 16870 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 486).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 18819 {
                        if slot <= 18817 {
                            if slot <= 18816 {
// PORT: SOURCE TVCDAPS.agc:178
//		EXTEND
// PORT: Fixed ROM slots 18816.
                                if slot <> 18816 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:179
//		MP	COSCDUX
// PORT: Fixed ROM slots 18817.
                                if slot <> 18817 or instruction <> 29160 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 488, readEffective:call(words, 488)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18818 {
// PORT: SOURCE TVCDAPS.agc:180
//		DDOUBL
// PORT: Fixed ROM slots 18818.
                                if slot <> 18818 or instruction <> 8193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 1) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:181
//		EXTEND
// PORT: Fixed ROM slots 18819.
                                if slot <> 18819 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18821 {
                            if slot <= 18820 {
// PORT: SOURCE TVCDAPS.agc:182
//		MP	MCDUYDOT
// PORT: Fixed ROM slots 18820.
                                if slot <> 18820 or instruction <> 29607 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 935, readEffective:call(words, 935)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:183
//		DDOUBL
// PORT: Fixed ROM slots 18821.
                                if slot <> 18821 or instruction <> 8193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 1) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18822 {
// PORT: SOURCE TVCDAPS.agc:184
//		DXCH	OMEGAYB
// PORT: Fixed ROM slots 18822.
                                if slot <> 18822 or instruction <> 22366 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 862, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:185
//
// PORT: SOURCE TVCDAPS.agc:186
//		CS	MCDUZDOT
// PORT: Fixed ROM slots 18823.
                                if slot <> 18823 or instruction <> 17320 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 936).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 18831 {
                    if slot <= 18827 {
                        if slot <= 18825 {
                            if slot <= 18824 {
// PORT: SOURCE TVCDAPS.agc:187
//		EXTEND
// PORT: Fixed ROM slots 18824.
                                if slot <> 18824 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:188
//		MP	SINCDUX
// PORT: Fixed ROM slots 18825.
                                if slot <> 18825 or instruction <> 29154 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 482, readEffective:call(words, 482)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18826 {
// PORT: SOURCE TVCDAPS.agc:189
//		DDOUBL
// PORT: Fixed ROM slots 18826.
                                if slot <> 18826 or instruction <> 8193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 1) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:190
//		DAS	OMEGAYB		# (COMPLETED OMEGAYB, SC.AT 1/2TVCDT REVS)
// PORT: Fixed ROM slots 18827.
                                if slot <> 18827 or instruction <> 9054 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 862) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18829 {
                            if slot <= 18828 {
// PORT: SOURCE TVCDAPS.agc:191
//
// PORT: SOURCE TVCDAPS.agc:192
//		EXTEND			# PICK UP -OMEGAYB (SIGN CHNG, INTEGRATE)
// PORT: Fixed ROM slots 18828.
                                if slot <> 18828 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:193
//		DCS	OMEGAYB
// PORT: Fixed ROM slots 18829.
                                if slot <> 18829 or instruction <> 17246 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCS", 862, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18830 {
// PORT: SOURCE TVCDAPS.agc:194
//		DAS	ERRBTMP
// PORT: Fixed ROM slots 18830.
                                if slot <> 18830 or instruction <> 9155 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 963) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:195
//
// PORT: SOURCE TVCDAPS.agc:196
//PERORLIM	TCR	ERRORLIM	# PITCH BODY-AXIS-ERROR INPUT LIMITER
// PORT: Fixed ROM slots 18831.
                                if slot <> 18831 or instruction <> 1620 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1620, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 18835 {
                        if slot <= 18833 {
                            if slot <= 18832 {
// PORT: SOURCE TVCDAPS.agc:197
//
// PORT: SOURCE TVCDAPS.agc:198
//PFORWARD	EXTEND			# 	PREPARE THE FILTER STORAGE LOCATIONS
// PORT: Fixed ROM slots 18832.
                                if slot <> 18832 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:199
//		DCA	PTMP1		#	FOR THE PITCH CHANNEL
// PORT: Fixed ROM slots 18833.
                                if slot <> 18833 or instruction <> 13154 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 866, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18834 {
// PORT: SOURCE TVCDAPS.agc:200
//		DXCH	TMP1
// PORT: Fixed ROM slots 18834.
                                if slot <> 18834 or instruction <> 22471 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 967, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:201
//		EXTEND
// PORT: Fixed ROM slots 18835.
                                if slot <> 18835 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18837 {
                            if slot <= 18836 {
// PORT: SOURCE TVCDAPS.agc:202
//		DCA	PTMP3
// PORT: Fixed ROM slots 18836.
                                if slot <> 18836 or instruction <> 13158 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 870, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:203
//		DXCH	TMP3
// PORT: Fixed ROM slots 18837.
                                if slot <> 18837 or instruction <> 22475 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 971, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18838 {
// PORT: SOURCE TVCDAPS.agc:204
//		EXTEND
// PORT: Fixed ROM slots 18838.
                                if slot <> 18838 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:205
//		DCA	PTMP5
// PORT: Fixed ROM slots 18839.
                                if slot <> 18839 or instruction <> 13162 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 874, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 18871 {
            if slot <= 18855 {
                if slot <= 18847 {
                    if slot <= 18843 {
                        if slot <= 18841 {
                            if slot <= 18840 {
// PORT: SOURCE TVCDAPS.agc:206
//		DXCH	TMP5
// PORT: Fixed ROM slots 18840.
                                if slot <> 18840 or instruction <> 22479 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 975, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:207
//
// PORT: SOURCE TVCDAPS.agc:208
//		TCR	FWDFLTR		# GO COMPUTE PRESENT OUTPUT
// PORT: Fixed ROM slots 18841.
                                if slot <> 18841 or instruction <> 1646 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1646, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18842 {
// PORT: SOURCE TVCDAPS.agc:209
//					# (INCLUDES VARIABLE GAIN PACKAGE)
// PORT: SOURCE TVCDAPS.agc:210
//
// PORT: SOURCE TVCDAPS.agc:211
//POFFSET		EXTEND
// PORT: Fixed ROM slots 18842.
                                if slot <> 18842 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:212
//		DCA	PDELOFF
// PORT: Fixed ROM slots 18843.
                                if slot <> 18843 or instruction <> 13190 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 902, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18845 {
                            if slot <= 18844 {
// PORT: SOURCE TVCDAPS.agc:213
//		DAS	CMDTMP		# NO SCALED AT B+0 ASCREV
// PORT: Fixed ROM slots 18844.
                                if slot <> 18844 or instruction <> 9157 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 965) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:214
//
// PORT: SOURCE TVCDAPS.agc:215
//PACLIM		TCR	ACTLIM		# ROUND OFF & LIMIT PITCH ACTUATOR COMMAND
// PORT: Fixed ROM slots 18845.
                                if slot <> 18845 or instruction <> 1631 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1631, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18846 {
// PORT: SOURCE TVCDAPS.agc:216
//
// PORT: SOURCE TVCDAPS.agc:217
//POUT		CS	PCMD		# INCREMENTAL PITCH COMMAND
// PORT: Fixed ROM slots 18846.
                                if slot <> 18846 or instruction <> 17299 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 915).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:218
//		AD	CMDTMP
// PORT: Fixed ROM slots 18847.
                                if slot <> 18847 or instruction <> 25540 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 964).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 18851 {
                        if slot <= 18849 {
                            if slot <= 18848 {
// PORT: SOURCE TVCDAPS.agc:219
//		ADS	TVCPITCH	# UPDATE THE ERROR COUNTER (NO RESTART-
// PORT: Fixed ROM slots 18848.
                                if slot <> 18848 or instruction <> 11308 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 44).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:220
//					#	PROTECT. SINCE ERROR CNTR ZEROED)
// PORT: SOURCE TVCDAPS.agc:221
//
// PORT: SOURCE TVCDAPS.agc:222
//		CAF	BIT11		# BIT FOR TVCPITCH COUNT RELEASE
// PORT: Fixed ROM slots 18849.
                                if slot <> 18849 or instruction <> 14853 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2565), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18850 {
// PORT: SOURCE TVCDAPS.agc:223
//		EXTEND
// PORT: Fixed ROM slots 18850.
                                if slot <> 18850 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:224
//		WOR	CHAN14
// PORT: Fixed ROM slots 18851.
                                if slot <> 18851 or instruction <> 2572 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 5, 12, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18853 {
                            if slot <= 18852 {
// PORT: SOURCE TVCDAPS.agc:225
//
// PORT: SOURCE TVCDAPS.agc:226
//PPRECOMP	EXTEND			#	PREPARE THE FILTER STORAGE FOR PITCH
// PORT: Fixed ROM slots 18852.
                                if slot <> 18852 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:227
//# Page 965
// PORT: SOURCE TVCDAPS.agc:228
//		DCA	PTMP2
// PORT: Fixed ROM slots 18853.
                                if slot <> 18853 or instruction <> 13156 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 868, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18854 {
// PORT: SOURCE TVCDAPS.agc:229
//		DXCH	TMP2
// PORT: Fixed ROM slots 18854.
                                if slot <> 18854 or instruction <> 22473 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 969, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:230
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
                    }
                }
            } else {
                if slot <= 18863 {
                    if slot <= 18859 {
                        if slot <= 18857 {
                            if slot <= 18856 {
// PORT: SOURCE TVCDAPS.agc:231
//		DCA	PTMP4
// PORT: Fixed ROM slots 18856.
                                if slot <> 18856 or instruction <> 13160 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 872, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:232
//		DXCH	TMP4
// PORT: Fixed ROM slots 18857.
                                if slot <> 18857 or instruction <> 22477 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 973, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18858 {
// PORT: SOURCE TVCDAPS.agc:233
//		EXTEND
// PORT: Fixed ROM slots 18858.
                                if slot <> 18858 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:234
//		DCA	PTMP6
// PORT: Fixed ROM slots 18859.
                                if slot <> 18859 or instruction <> 13164 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 876, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18861 {
                            if slot <= 18860 {
// PORT: SOURCE TVCDAPS.agc:235
//		DXCH	TMP6
// PORT: Fixed ROM slots 18860.
                                if slot <> 18860 or instruction <> 22481 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 977, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:236
//
// PORT: SOURCE TVCDAPS.agc:237
//		TCR	PRECOMP		#	TO THE FILTER FOR PRECOMPUTATION
// PORT: Fixed ROM slots 18861.
                                if slot <> 18861 or instruction <> 1703 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1703, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18862 {
// PORT: SOURCE TVCDAPS.agc:238
//
// PORT: SOURCE TVCDAPS.agc:239
//DELBARP		CAE	DELPBAR +1	# UPDATE PITCH OFFSET-TRACKER-FILTER
// PORT: Fixed ROM slots 18862.
                                if slot <> 18862 or instruction <> 13186 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 898).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:240
//		EXTEND
// PORT: Fixed ROM slots 18863.
                                if slot <> 18863 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 18867 {
                        if slot <= 18865 {
                            if slot <= 18864 {
// PORT: SOURCE TVCDAPS.agc:241
//		MP	E(-AT)
// PORT: Fixed ROM slots 18864.
                                if slot <> 18864 or instruction <> 30528 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 1856, readEffective:call(words, 1856)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:242
//		TS	DELBRTMP +1
// PORT: Fixed ROM slots 18865.
                                if slot <> 18865 or instruction <> 23489 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23489, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18866 {
// PORT: SOURCE TVCDAPS.agc:243
//		CAE	DELPBAR
// PORT: Fixed ROM slots 18866.
                                if slot <> 18866 or instruction <> 13185 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 897).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:244
//		EXTEND
// PORT: Fixed ROM slots 18867.
                                if slot <> 18867 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18869 {
                            if slot <= 18868 {
// PORT: SOURCE TVCDAPS.agc:245
//		MP	E(-AT)
// PORT: Fixed ROM slots 18868.
                                if slot <> 18868 or instruction <> 30528 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 1856, readEffective:call(words, 1856)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:246
//		DAS	DELBRTMP
// PORT: Fixed ROM slots 18869.
                                if slot <> 18869 or instruction <> 9153 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 961) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18870 {
// PORT: SOURCE TVCDAPS.agc:247
//		CAE	CMDTMP
// PORT: Fixed ROM slots 18870.
                                if slot <> 18870 or instruction <> 13252 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 964).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:248
//		EXTEND
// PORT: Fixed ROM slots 18871.
                                if slot <> 18871 or instruction <> 6 { return choose false if checkOnly else -1. }
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
            if slot <= 18887 {
                if slot <= 18879 {
                    if slot <= 18875 {
                        if slot <= 18873 {
                            if slot <= 18872 {
// PORT: SOURCE TVCDAPS.agc:249
//		MP	1-E(-AT)
// PORT: Fixed ROM slots 18872.
                                if slot <> 18872 or instruction <> 30527 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 1855, readEffective:call(words, 1855)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:250
//		DAS	DELBRTMP
// PORT: Fixed ROM slots 18873.
                                if slot <> 18873 or instruction <> 9153 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 961) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18874 {
// PORT: SOURCE TVCDAPS.agc:251
//
// PORT: SOURCE TVCDAPS.agc:252
//PCOPYCYC	TCR	PCOPY		# PITCH COPYCYCLE
// PORT: Fixed ROM slots 18874.
                                if slot <> 18874 or instruction <> 1468 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1468, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:253
//
// PORT: SOURCE TVCDAPS.agc:254
//PDAPEND		TCF	RESUME		# PITCH DAP COMPLETED
// PORT: Fixed ROM slots 18875.
                                if slot <> 18875 or instruction <> 6875 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6875, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18877 {
                            if slot <= 18876 {
// PORT: SOURCE TVCDAPS.agc:255
//# Page 966
// PORT: SOURCE TVCDAPS.agc:256
//# PITCH TVCDAP COPYCYCLE SUBROUTINE (CALLED VIA PITCH TVCDAP OR TVC RESTART PACKAGE)
// PORT: SOURCE TVCDAPS.agc:257
//
// PORT: SOURCE TVCDAPS.agc:258
//PCOPY		INCR	TVCPHASE	# RESTART-PROTECT THE COPYCYCLE.	(1)
// PORT: Fixed ROM slots 18876.
                                if slot <> 18876 or instruction <> 11172 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreINCR(words, 932).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:259
//					#	NOTE POSSIBLE RE-ENTRY FROM RESTART
// PORT: SOURCE TVCDAPS.agc:260
//					#	PACKAGE, SHOULD A RESTART OCCUR
// PORT: SOURCE TVCDAPS.agc:261
//					#	DURING PITCH COPYCYCLE.
// PORT: SOURCE TVCDAPS.agc:262
//
// PORT: SOURCE TVCDAPS.agc:263
//		EXTEND
// PORT: Fixed ROM slots 18877.
                                if slot <> 18877 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18878 {
// PORT: SOURCE TVCDAPS.agc:264
//		DCA	TMP1
// PORT: Fixed ROM slots 18878.
                                if slot <> 18878 or instruction <> 13255 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 967, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:265
//		DXCH	PTMP1
// PORT: Fixed ROM slots 18879.
                                if slot <> 18879 or instruction <> 22370 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 866, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 18883 {
                        if slot <= 18881 {
                            if slot <= 18880 {
// PORT: SOURCE TVCDAPS.agc:266
//		EXTEND
// PORT: Fixed ROM slots 18880.
                                if slot <> 18880 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:267
//		DCA	TMP2
// PORT: Fixed ROM slots 18881.
                                if slot <> 18881 or instruction <> 13257 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 969, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18882 {
// PORT: SOURCE TVCDAPS.agc:268
//		DXCH	PTMP2
// PORT: Fixed ROM slots 18882.
                                if slot <> 18882 or instruction <> 22372 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 868, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:269
//		EXTEND
// PORT: Fixed ROM slots 18883.
                                if slot <> 18883 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18885 {
                            if slot <= 18884 {
// PORT: SOURCE TVCDAPS.agc:270
//		DCA	TMP3
// PORT: Fixed ROM slots 18884.
                                if slot <> 18884 or instruction <> 13259 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 971, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:271
//		DXCH	PTMP3
// PORT: Fixed ROM slots 18885.
                                if slot <> 18885 or instruction <> 22374 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 870, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18886 {
// PORT: SOURCE TVCDAPS.agc:272
//		EXTEND
// PORT: Fixed ROM slots 18886.
                                if slot <> 18886 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:273
//		DCA	TMP4
// PORT: Fixed ROM slots 18887.
                                if slot <> 18887 or instruction <> 13261 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 973, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 18895 {
                    if slot <= 18891 {
                        if slot <= 18889 {
                            if slot <= 18888 {
// PORT: SOURCE TVCDAPS.agc:274
//		DXCH	PTMP4
// PORT: Fixed ROM slots 18888.
                                if slot <> 18888 or instruction <> 22376 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 872, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:275
//		EXTEND
// PORT: Fixed ROM slots 18889.
                                if slot <> 18889 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18890 {
// PORT: SOURCE TVCDAPS.agc:276
//		DCA	TMP5
// PORT: Fixed ROM slots 18890.
                                if slot <> 18890 or instruction <> 13263 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 975, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:277
//		DXCH	PTMP5
// PORT: Fixed ROM slots 18891.
                                if slot <> 18891 or instruction <> 22378 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 874, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18893 {
                            if slot <= 18892 {
// PORT: SOURCE TVCDAPS.agc:278
//		EXTEND
// PORT: Fixed ROM slots 18892.
                                if slot <> 18892 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:279
//		DCA	TMP6
// PORT: Fixed ROM slots 18893.
                                if slot <> 18893 or instruction <> 13265 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 977, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18894 {
// PORT: SOURCE TVCDAPS.agc:280
//		DXCH	PTMP6
// PORT: Fixed ROM slots 18894.
                                if slot <> 18894 or instruction <> 22380 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 876, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:281
//
// PORT: SOURCE TVCDAPS.agc:282
//PMISC		EXTEND			# MISC....PITCH-RATE-ERROR INTEGRATOR
// PORT: Fixed ROM slots 18895.
                                if slot <> 18895 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 18899 {
                        if slot <= 18897 {
                            if slot <= 18896 {
// PORT: SOURCE TVCDAPS.agc:283
//		DCA	ERRBTMP
// PORT: Fixed ROM slots 18896.
                                if slot <> 18896 or instruction <> 13251 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 963, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:284
//		TS	AK1		#	FOR PITCH NEEDLES, SC.AT B-1 REVS
// PORT: Fixed ROM slots 18897.
                                if slot <> 18897 or instruction <> 23359 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23359, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18898 {
// PORT: SOURCE TVCDAPS.agc:285
//		DXCH	PERRB
// PORT: Fixed ROM slots 18898.
                                if slot <> 18898 or instruction <> 22398 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 894, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:286
//
// PORT: SOURCE TVCDAPS.agc:287
//		CAE	CMDTMP		#	PITCH ACTUATOR COMMAND
// PORT: Fixed ROM slots 18899.
                                if slot <> 18899 or instruction <> 13252 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 964).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18901 {
                            if slot <= 18900 {
// PORT: SOURCE TVCDAPS.agc:288
//		TS	PCMD
// PORT: Fixed ROM slots 18900.
                                if slot <> 18900 or instruction <> 23443 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23443, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:289
//
// PORT: SOURCE TVCDAPS.agc:290
//		EXTEND			# 	PITCH OFFSET-TRACKER-FILTER
// PORT: Fixed ROM slots 18901.
                                if slot <> 18901 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18902 {
// PORT: SOURCE TVCDAPS.agc:291
//		DCA	DELBRTMP
// PORT: Fixed ROM slots 18902.
                                if slot <> 18902 or instruction <> 13249 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 961, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:292
//		DXCH	DELPBAR
// PORT: Fixed ROM slots 18903.
                                if slot <> 18903 or instruction <> 22402 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 898, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
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
set agcAotRoutes[1102] to agcAotUnit1102@.

// PORT: Physical bank 20. Shared continuation entries, slots 18904–19031.
function agcAotUnit1103 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18967 {
        if slot <= 18935 {
            if slot <= 18919 {
                if slot <= 18911 {
                    if slot <= 18907 {
                        if slot <= 18905 {
                            if slot <= 18904 {
// PORT: SOURCE TVCDAPS.agc:293
//
// PORT: SOURCE TVCDAPS.agc:294
//		INCR	TVCPHASE	# PITCH COPYCYCLE COMPLETED		(2)
// PORT: Fixed ROM slots 18904.
                                if slot <> 18904 or instruction <> 11172 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreINCR(words, 932).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:295
//
// PORT: SOURCE TVCDAPS.agc:296
//		TC	Q
// PORT: Fixed ROM slots 18905.
                                if slot <> 18905 or instruction <> 2 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18906 {
// PORT: SOURCE TVCDAPS.agc:297
//
// PORT: SOURCE TVCDAPS.agc:298
//# Page 967
// PORT: SOURCE TVCDAPS.agc:299
//# YAW TVCDAP STARTS HERE....(INCORPORATES CSM/LEM DAP FILTER, MODOR DESIGN)
// PORT: SOURCE TVCDAPS.agc:300
//
// PORT: SOURCE TVCDAPS.agc:301
//YAWDAP		LXCH	BANKRUPT	# T5 ENTRY, NORMAL
// PORT: Fixed ROM slots 18906.
                                if slot <> 18906 or instruction <> 9230 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreExchange(words, 1, 14, readPhysical).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:302
//		EXTEND
// PORT: Fixed ROM slots 18907.
                                if slot <> 18907 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18909 {
                            if slot <= 18908 {
// PORT: SOURCE TVCDAPS.agc:303
//		QXCH	QRUPT
// PORT: Fixed ROM slots 18908.
                                if slot <> 18908 or instruction <> 9226 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreExchange(words, 2, 10, readPhysical).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:304
//
// PORT: SOURCE TVCDAPS.agc:305
//		CAF	PITCHT5		# SET UP T5 CALL FOR PITCH AUTOPILOT (LOW-
// PORT: Fixed ROM slots 18909.
                                if slot <> 18909 or instruction <> 14139 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1851), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18910 {
// PORT: SOURCE TVCDAPS.agc:306
//		TS	T5LOC		#	ORDER PART OF 2CADR ALREADY THERE)
// PORT: Fixed ROM slots 18910.
                                if slot <> 18910 or instruction <> 23242 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23242, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:307
//		CAE	T5TVCDT
// PORT: Fixed ROM slots 18911.
                                if slot <> 18911 or instruction <> 13205 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 917).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 18915 {
                        if slot <= 18913 {
                            if slot <= 18912 {
// PORT: SOURCE TVCDAPS.agc:308
//		TS	TIME5
// PORT: Fixed ROM slots 18912.
                                if slot <> 18912 or instruction <> 22552 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22552, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:309
//
// PORT: SOURCE TVCDAPS.agc:310
//YSTROKER	CCS	STROKER		# (STRKFLG) CHECK FOR STROKE TEST
// PORT: Fixed ROM slots 18913.
                                if slot <> 18913 or instruction <> 4988 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 892).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18914 {
// PORT: SOURCE TVCDAPS.agc:311
//		TC	HACK		# TEST-START OR TEST-IN-PROGRESS
// PORT: Fixed ROM slots 18914.
                                if slot <> 18914 or instruction <> 1883 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1883, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:312
//		TCF	+2		# NO-TEST
// PORT: Fixed ROM slots 18915.
                                if slot <> 18915 or instruction <> 5605 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5605, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18917 {
                            if slot <= 18916 {
// PORT: SOURCE TVCDAPS.agc:313
//		TC	HACK		# TEST-IN-PROGRESS
// PORT: Fixed ROM slots 18916.
                                if slot <> 18916 or instruction <> 1883 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1883, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:314
//
// PORT: SOURCE TVCDAPS.agc:315
//					# USE BODY RATES FROM PITCHDAP (PCDUDOTS)
// PORT: SOURCE TVCDAPS.agc:316
//
// PORT: SOURCE TVCDAPS.agc:317
//YINTEGRL	EXTEND			# COMPUTE INTEGRAL OF BODY-AXIS YAW-RATE
// PORT: Fixed ROM slots 18917.
                                if slot <> 18917 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18918 {
// PORT: SOURCE TVCDAPS.agc:318
//		DCA	YERRB		# 	ERROR, SC.AT B-1 REVS
// PORT: Fixed ROM slots 18918.
                                if slot <> 18918 or instruction <> 13184 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 896, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:319
//		DXCH	ERRBTMP
// PORT: Fixed ROM slots 18919.
                                if slot <> 18919 or instruction <> 22467 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 963, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 18927 {
                    if slot <= 18923 {
                        if slot <= 18921 {
                            if slot <= 18920 {
// PORT: SOURCE TVCDAPS.agc:320
//
// PORT: SOURCE TVCDAPS.agc:321
//		EXTEND
// PORT: Fixed ROM slots 18920.
                                if slot <> 18920 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:322
//		DCA	OMEGAZC
// PORT: Fixed ROM slots 18921.
                                if slot <> 18921 or instruction <> 13146 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 858, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18922 {
// PORT: SOURCE TVCDAPS.agc:323
//		DAS	ERRBTMP
// PORT: Fixed ROM slots 18922.
                                if slot <> 18922 or instruction <> 9155 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 963) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:324
//
// PORT: SOURCE TVCDAPS.agc:325
//		CAE	COSCDUZ		# PREPARE BODY-AXIS YAW-RATE, OMEGAZB
// PORT: Fixed ROM slots 18923.
                                if slot <> 18923 or instruction <> 12774 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 486).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18925 {
                            if slot <= 18924 {
// PORT: SOURCE TVCDAPS.agc:326
//		EXTEND
// PORT: Fixed ROM slots 18924.
                                if slot <> 18924 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:327
//		MP	SINCDUX
// PORT: Fixed ROM slots 18925.
                                if slot <> 18925 or instruction <> 29154 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 482, readEffective:call(words, 482)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18926 {
// PORT: SOURCE TVCDAPS.agc:328
//		DDOUBL
// PORT: Fixed ROM slots 18926.
                                if slot <> 18926 or instruction <> 8193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 1) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:329
//		EXTEND
// PORT: Fixed ROM slots 18927.
                                if slot <> 18927 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 18931 {
                        if slot <= 18929 {
                            if slot <= 18928 {
// PORT: SOURCE TVCDAPS.agc:330
//		MP	MCDUYDOT
// PORT: Fixed ROM slots 18928.
                                if slot <> 18928 or instruction <> 29607 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 935, readEffective:call(words, 935)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:331
//		DDOUBL
// PORT: Fixed ROM slots 18929.
                                if slot <> 18929 or instruction <> 8193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 1) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18930 {
// PORT: SOURCE TVCDAPS.agc:332
//		DXCH	OMEGAZB
// PORT: Fixed ROM slots 18930.
                                if slot <> 18930 or instruction <> 22368 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 864, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:333
//
// PORT: SOURCE TVCDAPS.agc:334
//		CS	MCDUZDOT
// PORT: Fixed ROM slots 18931.
                                if slot <> 18931 or instruction <> 17320 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 936).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18933 {
                            if slot <= 18932 {
// PORT: SOURCE TVCDAPS.agc:335
//		EXTEND
// PORT: Fixed ROM slots 18932.
                                if slot <> 18932 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:336
//		MP	COSCDUX
// PORT: Fixed ROM slots 18933.
                                if slot <> 18933 or instruction <> 29160 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 488, readEffective:call(words, 488)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18934 {
// PORT: SOURCE TVCDAPS.agc:337
//		DDOUBL
// PORT: Fixed ROM slots 18934.
                                if slot <> 18934 or instruction <> 8193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 1) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:338
//		DAS	OMEGAZB		# (COMPLETED OMEGAZB, SC.AT 1/2TVCDT REVS)
// PORT: Fixed ROM slots 18935.
                                if slot <> 18935 or instruction <> 9056 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 864) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 18951 {
                if slot <= 18943 {
                    if slot <= 18939 {
                        if slot <= 18937 {
                            if slot <= 18936 {
// PORT: SOURCE TVCDAPS.agc:339
//
// PORT: SOURCE TVCDAPS.agc:340
//		EXTEND			# PICK UP -OMEGAZB (SIGN CHNG, INTEGRATE)
// PORT: Fixed ROM slots 18936.
                                if slot <> 18936 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:341
//		DCS	OMEGAZB
// PORT: Fixed ROM slots 18937.
                                if slot <> 18937 or instruction <> 17248 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCS", 864, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18938 {
// PORT: SOURCE TVCDAPS.agc:342
//		DAS	ERRBTMP
// PORT: Fixed ROM slots 18938.
                                if slot <> 18938 or instruction <> 9155 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 963) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:343
//
// PORT: SOURCE TVCDAPS.agc:344
//YERORLIM	TCR	ERRORLIM	# YAW	  BODY-AXIS-ERROR INPUT LIMITER
// PORT: Fixed ROM slots 18939.
                                if slot <> 18939 or instruction <> 1620 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1620, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18941 {
                            if slot <= 18940 {
// PORT: SOURCE TVCDAPS.agc:345
//
// PORT: SOURCE TVCDAPS.agc:346
//YFORWARD	EXTEND			# 	PREPARE THE FILTER STORAGE LOCATIONS
// PORT: Fixed ROM slots 18940.
                                if slot <> 18940 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:347
//		DCA	YTMP1		#	FOR THE YAW CHANNEL
// PORT: Fixed ROM slots 18941.
                                if slot <> 18941 or instruction <> 13166 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 878, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18942 {
// PORT: SOURCE TVCDAPS.agc:348
//# Page 968
// PORT: SOURCE TVCDAPS.agc:349
//		DXCH	TMP1
// PORT: Fixed ROM slots 18942.
                                if slot <> 18942 or instruction <> 22471 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 967, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:350
//		EXTEND
// PORT: Fixed ROM slots 18943.
                                if slot <> 18943 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 18947 {
                        if slot <= 18945 {
                            if slot <= 18944 {
// PORT: SOURCE TVCDAPS.agc:351
//		DCA	YTMP3
// PORT: Fixed ROM slots 18944.
                                if slot <> 18944 or instruction <> 13170 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 882, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:352
//		DXCH	TMP3
// PORT: Fixed ROM slots 18945.
                                if slot <> 18945 or instruction <> 22475 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 971, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18946 {
// PORT: SOURCE TVCDAPS.agc:353
//		EXTEND
// PORT: Fixed ROM slots 18946.
                                if slot <> 18946 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:354
//		DCA	YTMP5
// PORT: Fixed ROM slots 18947.
                                if slot <> 18947 or instruction <> 13174 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 886, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18949 {
                            if slot <= 18948 {
// PORT: SOURCE TVCDAPS.agc:355
//		DXCH	TMP5
// PORT: Fixed ROM slots 18948.
                                if slot <> 18948 or instruction <> 22479 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 975, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:356
//
// PORT: SOURCE TVCDAPS.agc:357
//		TCR	FWDFLTR		# GO COMPUTE PRESENT OUTPUT
// PORT: Fixed ROM slots 18949.
                                if slot <> 18949 or instruction <> 1646 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1646, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18950 {
// PORT: SOURCE TVCDAPS.agc:358
//					# (INCLUDES VARIABLE GAIN PACKAGE)
// PORT: SOURCE TVCDAPS.agc:359
//
// PORT: SOURCE TVCDAPS.agc:360
//YOFFSET		EXTEND
// PORT: Fixed ROM slots 18950.
                                if slot <> 18950 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:361
//		DCA	YDELOFF
// PORT: Fixed ROM slots 18951.
                                if slot <> 18951 or instruction <> 13192 { return choose false if checkOnly else -1. }
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
            } else {
                if slot <= 18959 {
                    if slot <= 18955 {
                        if slot <= 18953 {
                            if slot <= 18952 {
// PORT: SOURCE TVCDAPS.agc:362
//		DAS	CMDTMP		# NOW SCALED AT B+0 ASCREV
// PORT: Fixed ROM slots 18952.
                                if slot <> 18952 or instruction <> 9157 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 965) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:363
//
// PORT: SOURCE TVCDAPS.agc:364
//YACLIM		TCR	ACTLIM		# ROUND OFF & LIMIT YAW ACTUATOR COMMAND
// PORT: Fixed ROM slots 18953.
                                if slot <> 18953 or instruction <> 1631 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1631, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18954 {
// PORT: SOURCE TVCDAPS.agc:365
//
// PORT: SOURCE TVCDAPS.agc:366
//YOUT		CS	YCMD		# INCREMENTAL YAW COMMAND
// PORT: Fixed ROM slots 18954.
                                if slot <> 18954 or instruction <> 17300 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 916).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:367
//		AD	CMDTMP
// PORT: Fixed ROM slots 18955.
                                if slot <> 18955 or instruction <> 25540 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 964).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18957 {
                            if slot <= 18956 {
// PORT: SOURCE TVCDAPS.agc:368
//		ADS	TVCYAW		# UPDATE THE ERROR COUNTER (NO RESTART-
// PORT: Fixed ROM slots 18956.
                                if slot <> 18956 or instruction <> 11307 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 43).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:369
//					#	PROTECT, SINCE ERROR CNTR ZEROED)
// PORT: SOURCE TVCDAPS.agc:370
//
// PORT: SOURCE TVCDAPS.agc:371
//		CAF	BIT12		# BIT FOR TVCYAW COUNT RELEASE
// PORT: Fixed ROM slots 18957.
                                if slot <> 18957 or instruction <> 14852 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2564), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18958 {
// PORT: SOURCE TVCDAPS.agc:372
//		EXTEND
// PORT: Fixed ROM slots 18958.
                                if slot <> 18958 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:373
//		WOR	CHAN14
// PORT: Fixed ROM slots 18959.
                                if slot <> 18959 or instruction <> 2572 { return choose false if checkOnly else -1. }
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
                    if slot <= 18963 {
                        if slot <= 18961 {
                            if slot <= 18960 {
// PORT: SOURCE TVCDAPS.agc:374
//
// PORT: SOURCE TVCDAPS.agc:375
//YPRECOMP	EXTEND			#	PREPARE THE FILTER STORAGE FOR YAW
// PORT: Fixed ROM slots 18960.
                                if slot <> 18960 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:376
//		DCA	YTMP2
// PORT: Fixed ROM slots 18961.
                                if slot <> 18961 or instruction <> 13168 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 880, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18962 {
// PORT: SOURCE TVCDAPS.agc:377
//		DXCH	TMP2
// PORT: Fixed ROM slots 18962.
                                if slot <> 18962 or instruction <> 22473 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 969, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:378
//		EXTEND
// PORT: Fixed ROM slots 18963.
                                if slot <> 18963 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18965 {
                            if slot <= 18964 {
// PORT: SOURCE TVCDAPS.agc:379
//		DCA	YTMP4
// PORT: Fixed ROM slots 18964.
                                if slot <> 18964 or instruction <> 13172 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 884, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:380
//		DXCH	TMP4
// PORT: Fixed ROM slots 18965.
                                if slot <> 18965 or instruction <> 22477 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 973, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18966 {
// PORT: SOURCE TVCDAPS.agc:381
//		EXTEND
// PORT: Fixed ROM slots 18966.
                                if slot <> 18966 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:382
//		DCA	YTMP6
// PORT: Fixed ROM slots 18967.
                                if slot <> 18967 or instruction <> 13176 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 888, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 18999 {
            if slot <= 18983 {
                if slot <= 18975 {
                    if slot <= 18971 {
                        if slot <= 18969 {
                            if slot <= 18968 {
// PORT: SOURCE TVCDAPS.agc:383
//		DXCH	TMP6
// PORT: Fixed ROM slots 18968.
                                if slot <> 18968 or instruction <> 22481 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 977, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:384
//
// PORT: SOURCE TVCDAPS.agc:385
//		TCR	PRECOMP		#	TO THE FILTER FOR PRECOMPUTATION
// PORT: Fixed ROM slots 18969.
                                if slot <> 18969 or instruction <> 1703 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1703, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18970 {
// PORT: SOURCE TVCDAPS.agc:386
//
// PORT: SOURCE TVCDAPS.agc:387
//DELBARY		CAE	DELYBAR +1	# UPDATE YAW OFFSET-TRACKER-FILTER
// PORT: Fixed ROM slots 18970.
                                if slot <> 18970 or instruction <> 13188 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 900).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:388
//		EXTEND
// PORT: Fixed ROM slots 18971.
                                if slot <> 18971 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18973 {
                            if slot <= 18972 {
// PORT: SOURCE TVCDAPS.agc:389
//		MP	E(-AT)
// PORT: Fixed ROM slots 18972.
                                if slot <> 18972 or instruction <> 30528 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 1856, readEffective:call(words, 1856)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:390
//		TS	DELBRTMP +1
// PORT: Fixed ROM slots 18973.
                                if slot <> 18973 or instruction <> 23489 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23489, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18974 {
// PORT: SOURCE TVCDAPS.agc:391
//		CAE	DELYBAR
// PORT: Fixed ROM slots 18974.
                                if slot <> 18974 or instruction <> 13187 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 899).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:392
//		EXTEND
// PORT: Fixed ROM slots 18975.
                                if slot <> 18975 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 18979 {
                        if slot <= 18977 {
                            if slot <= 18976 {
// PORT: SOURCE TVCDAPS.agc:393
//		MP	E(-AT)
// PORT: Fixed ROM slots 18976.
                                if slot <> 18976 or instruction <> 30528 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 1856, readEffective:call(words, 1856)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:394
//		DAS	DELBRTMP
// PORT: Fixed ROM slots 18977.
                                if slot <> 18977 or instruction <> 9153 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 961) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18978 {
// PORT: SOURCE TVCDAPS.agc:395
//		CAE	CMDTMP
// PORT: Fixed ROM slots 18978.
                                if slot <> 18978 or instruction <> 13252 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 964).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:396
//		EXTEND
// PORT: Fixed ROM slots 18979.
                                if slot <> 18979 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18981 {
                            if slot <= 18980 {
// PORT: SOURCE TVCDAPS.agc:397
//		MP	1-E(-AT)
// PORT: Fixed ROM slots 18980.
                                if slot <> 18980 or instruction <> 30527 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 1855, readEffective:call(words, 1855)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:398
//		DAS	DELBRTMP
// PORT: Fixed ROM slots 18981.
                                if slot <> 18981 or instruction <> 9153 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 961) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18982 {
// PORT: SOURCE TVCDAPS.agc:399
//
// PORT: SOURCE TVCDAPS.agc:400
//# Page 969
// PORT: SOURCE TVCDAPS.agc:401
//YCOPYCYC	TCR	YCOPY		# YAW COPYCYCLE
// PORT: Fixed ROM slots 18982.
                                if slot <> 18982 or instruction <> 1576 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1576, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:402
//
// PORT: SOURCE TVCDAPS.agc:403
//YDAPEND		TCF	RESUME		# YAW DAP COMPLETED
// PORT: Fixed ROM slots 18983.
                                if slot <> 18983 or instruction <> 6875 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6875, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 18991 {
                    if slot <= 18987 {
                        if slot <= 18985 {
                            if slot <= 18984 {
// PORT: SOURCE TVCDAPS.agc:404
//
// PORT: SOURCE TVCDAPS.agc:405
//# Page 970
// PORT: SOURCE TVCDAPS.agc:406
//# TVCDAP COPYCYCLE SUBROUTINE (CALLED VIA YAW   TVCDAP OR TVC RESTART PACKAGE)
// PORT: SOURCE TVCDAPS.agc:407
//
// PORT: SOURCE TVCDAPS.agc:408
//YCOPY		INCR	TVCPHASE	# RESTART-PROTECT THE COPYCYCLE.	(3)
// PORT: Fixed ROM slots 18984.
                                if slot <> 18984 or instruction <> 11172 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreINCR(words, 932).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:409
//					#	NOTE POSSIBLE RE-ENTRY FROM RESTART
// PORT: SOURCE TVCDAPS.agc:410
//					#	PACKAGE, SHOULD A RESTART OCCUR
// PORT: SOURCE TVCDAPS.agc:411
//					#	DURING YAW   COPYCYCLE.
// PORT: SOURCE TVCDAPS.agc:412
//
// PORT: SOURCE TVCDAPS.agc:413
//		EXTEND
// PORT: Fixed ROM slots 18985.
                                if slot <> 18985 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18986 {
// PORT: SOURCE TVCDAPS.agc:414
//		DCA	TMP1
// PORT: Fixed ROM slots 18986.
                                if slot <> 18986 or instruction <> 13255 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 967, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:415
//		DXCH	YTMP1
// PORT: Fixed ROM slots 18987.
                                if slot <> 18987 or instruction <> 22382 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 878, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18989 {
                            if slot <= 18988 {
// PORT: SOURCE TVCDAPS.agc:416
//		EXTEND
// PORT: Fixed ROM slots 18988.
                                if slot <> 18988 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:417
//		DCA	TMP2
// PORT: Fixed ROM slots 18989.
                                if slot <> 18989 or instruction <> 13257 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 969, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18990 {
// PORT: SOURCE TVCDAPS.agc:418
//		DXCH	YTMP2
// PORT: Fixed ROM slots 18990.
                                if slot <> 18990 or instruction <> 22384 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 880, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:419
//		EXTEND
// PORT: Fixed ROM slots 18991.
                                if slot <> 18991 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 18995 {
                        if slot <= 18993 {
                            if slot <= 18992 {
// PORT: SOURCE TVCDAPS.agc:420
//		DCA	TMP3
// PORT: Fixed ROM slots 18992.
                                if slot <> 18992 or instruction <> 13259 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 971, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:421
//		DXCH	YTMP3
// PORT: Fixed ROM slots 18993.
                                if slot <> 18993 or instruction <> 22386 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 882, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18994 {
// PORT: SOURCE TVCDAPS.agc:422
//		EXTEND
// PORT: Fixed ROM slots 18994.
                                if slot <> 18994 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:423
//		DCA	TMP4
// PORT: Fixed ROM slots 18995.
                                if slot <> 18995 or instruction <> 13261 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 973, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 18997 {
                            if slot <= 18996 {
// PORT: SOURCE TVCDAPS.agc:424
//		DXCH	YTMP4
// PORT: Fixed ROM slots 18996.
                                if slot <> 18996 or instruction <> 22388 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 884, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:425
//		EXTEND
// PORT: Fixed ROM slots 18997.
                                if slot <> 18997 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 18998 {
// PORT: SOURCE TVCDAPS.agc:426
//		DCA	TMP5
// PORT: Fixed ROM slots 18998.
                                if slot <> 18998 or instruction <> 13263 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 975, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:427
//		DXCH	YTMP5
// PORT: Fixed ROM slots 18999.
                                if slot <> 18999 or instruction <> 22390 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 886, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 19015 {
                if slot <= 19007 {
                    if slot <= 19003 {
                        if slot <= 19001 {
                            if slot <= 19000 {
// PORT: SOURCE TVCDAPS.agc:428
//		EXTEND
// PORT: Fixed ROM slots 19000.
                                if slot <> 19000 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:429
//		DCA	TMP6
// PORT: Fixed ROM slots 19001.
                                if slot <> 19001 or instruction <> 13265 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 977, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19002 {
// PORT: SOURCE TVCDAPS.agc:430
//		DXCH	YTMP6
// PORT: Fixed ROM slots 19002.
                                if slot <> 19002 or instruction <> 22392 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 888, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:431
//
// PORT: SOURCE TVCDAPS.agc:432
//YMISC		EXTEND			# MISC....YAW-RATE-ERROR INTEGRATOR
// PORT: Fixed ROM slots 19003.
                                if slot <> 19003 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19005 {
                            if slot <= 19004 {
// PORT: SOURCE TVCDAPS.agc:433
//		DCA	ERRBTMP
// PORT: Fixed ROM slots 19004.
                                if slot <> 19004 or instruction <> 13251 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 963, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:434
//		TS	AK2		#	FOR YAW   NEEDLES, SC.AT B-1 REVS
// PORT: Fixed ROM slots 19005.
                                if slot <> 19005 or instruction <> 23360 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23360, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19006 {
// PORT: SOURCE TVCDAPS.agc:435
//		DXCH	YERRB
// PORT: Fixed ROM slots 19006.
                                if slot <> 19006 or instruction <> 22400 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 896, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:436
//
// PORT: SOURCE TVCDAPS.agc:437
//		CAE	CMDTMP
// PORT: Fixed ROM slots 19007.
                                if slot <> 19007 or instruction <> 13252 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 964).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19011 {
                        if slot <= 19009 {
                            if slot <= 19008 {
// PORT: SOURCE TVCDAPS.agc:438
//		TS	YCMD
// PORT: Fixed ROM slots 19008.
                                if slot <> 19008 or instruction <> 23444 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23444, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:439
//
// PORT: SOURCE TVCDAPS.agc:440
//		EXTEND
// PORT: Fixed ROM slots 19009.
                                if slot <> 19009 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19010 {
// PORT: SOURCE TVCDAPS.agc:441
//		DCA	DELBRTMP
// PORT: Fixed ROM slots 19010.
                                if slot <> 19010 or instruction <> 13249 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 961, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:442
//		DXCH	DELYBAR
// PORT: Fixed ROM slots 19011.
                                if slot <> 19011 or instruction <> 22404 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 900, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19013 {
                            if slot <= 19012 {
// PORT: SOURCE TVCDAPS.agc:443
//
// PORT: SOURCE TVCDAPS.agc:444
//		CAF	ZERO		# YAW	 COPYCYCLE COMPLETED
// PORT: Fixed ROM slots 19012.
                                if slot <> 19012 or instruction <> 14865 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:445
//		TS	TVCPHASE	#	RESET TVCPHASE
// PORT: Fixed ROM slots 19013.
                                if slot <> 19013 or instruction <> 23460 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23460, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19014 {
// PORT: SOURCE TVCDAPS.agc:446
//
// PORT: SOURCE TVCDAPS.agc:447
//		TC	Q
// PORT: Fixed ROM slots 19014.
                                if slot <> 19014 or instruction <> 2 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:448
//
// PORT: SOURCE TVCDAPS.agc:449
//# Page 971
// PORT: SOURCE TVCDAPS.agc:450
//# SUBROUTINES COMMON TO BOTH PITCH AND YAW DAPS....
// PORT: SOURCE TVCDAPS.agc:451
//
// PORT: SOURCE TVCDAPS.agc:452
//
// PORT: SOURCE TVCDAPS.agc:453
//# INITIALIZATION PACKAGE FOR CDURATES....
// PORT: SOURCE TVCDAPS.agc:454
//
// PORT: SOURCE TVCDAPS.agc:455
//DAPINIT		LXCH	BANKRUPT	# T5 RUPT ENTRY (CALLED BY TVCINT4)
// PORT: Fixed ROM slots 19015.
                                if slot <> 19015 or instruction <> 9230 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreExchange(words, 1, 14, readPhysical).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 19023 {
                    if slot <= 19019 {
                        if slot <= 19017 {
                            if slot <= 19016 {
// PORT: SOURCE TVCDAPS.agc:456
//
// PORT: SOURCE TVCDAPS.agc:457
//		CAF	NEGONE		# 	SET UP
// PORT: Fixed ROM slots 19016.
                                if slot <> 19016 or instruction <> 16334 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 4046), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:458
//		AD	T5TVCDT		#	T5 CALL FOR PITCHDAP IN TVCDT SECS
// PORT: Fixed ROM slots 19017.
                                if slot <> 19017 or instruction <> 25493 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 917).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19018 {
// PORT: SOURCE TVCDAPS.agc:459
//		AD	NEGMAX		#	(T5TVCDT = POSMAX - TVCDT/2 +1)
// PORT: Fixed ROM slots 19018.
                                if slot <> 19018 or instruction <> 27137 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:460
//		AD	T5TVCDT
// PORT: Fixed ROM slots 19019.
                                if slot <> 19019 or instruction <> 25493 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 917).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19021 {
                            if slot <= 19020 {
// PORT: SOURCE TVCDAPS.agc:461
//		TS	TIME5
// PORT: Fixed ROM slots 19020.
                                if slot <> 19020 or instruction <> 22552 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22552, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:462
//		CAF	PITCHT5		#	(BBCON ALREADY THERE)
// PORT: Fixed ROM slots 19021.
                                if slot <> 19021 or instruction <> 14139 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1851), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19022 {
// PORT: SOURCE TVCDAPS.agc:463
//		TS	T5LOC
// PORT: Fixed ROM slots 19022.
                                if slot <> 19022 or instruction <> 23242 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23242, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:464
//
// PORT: SOURCE TVCDAPS.agc:465
//		CAE	CDUY		# READ AND STORE CDUS FOR DIFFERENTIATOR
// PORT: Fixed ROM slots 19023.
                                if slot <> 19023 or instruction <> 12315 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 27).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19027 {
                        if slot <= 19025 {
                            if slot <= 19024 {
// PORT: SOURCE TVCDAPS.agc:466
//		TS	PCDUYPST	#	PAST-VALUES
// PORT: Fixed ROM slots 19024.
                                if slot <> 19024 or instruction <> 23461 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23461, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:467
//		CAE	CDUZ
// PORT: Fixed ROM slots 19025.
                                if slot <> 19025 or instruction <> 12316 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 28).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19026 {
// PORT: SOURCE TVCDAPS.agc:468
//		TS	PCDUZPST
// PORT: Fixed ROM slots 19026.
                                if slot <> 19026 or instruction <> 23462 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23462, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:469
//
// PORT: SOURCE TVCDAPS.agc:470
//		TCF	NOQRSM
// PORT: Fixed ROM slots 19027.
                                if slot <> 19027 or instruction <> 6877 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6877, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19029 {
                            if slot <= 19028 {
// PORT: SOURCE TVCDAPS.agc:471
//
// PORT: SOURCE TVCDAPS.agc:472
//# BODY-AXIS-ERROR   INPUT LIMITER PACKAGE....
// PORT: SOURCE TVCDAPS.agc:473
//
// PORT: SOURCE TVCDAPS.agc:474
//ERRORLIM	CAE	ERRBTMP		# CHECK FOR INPUT-ERROR LIMIT
// PORT: Fixed ROM slots 19028.
                                if slot <> 19028 or instruction <> 13250 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 962).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:475
//		EXTEND			#	CHECKS UPPER WORD ONLY
// PORT: Fixed ROM slots 19029.
                                if slot <> 19029 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19030 {
// PORT: SOURCE TVCDAPS.agc:476
//		MP	1/ERRLIM
// PORT: Fixed ROM slots 19030.
                                if slot <> 19030 or instruction <> 31245 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 2573, readEffective:call(words, 2573)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:477
//		EXTEND
// PORT: Fixed ROM slots 19031.
                                if slot <> 19031 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        }
    }
}
set agcAotRoutes[1103] to agcAotUnit1103@.

// PORT: Physical bank 20. Shared continuation entries, slots 19032–19159.
function agcAotUnit1104 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19095 {
        if slot <= 19063 {
            if slot <= 19047 {
                if slot <= 19039 {
                    if slot <= 19035 {
                        if slot <= 19033 {
                            if slot <= 19032 {
// PORT: SOURCE TVCDAPS.agc:478
//		BZF	+6
// PORT: Fixed ROM slots 19032.
                                if slot <> 19032 or instruction <> 5726 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5726, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:479
//		CCS	ERRBTMP
// PORT: Fixed ROM slots 19033.
                                if slot <> 19033 or instruction <> 5058 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 962).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19034 {
// PORT: SOURCE TVCDAPS.agc:480
//		CAF	ERRLIM
// PORT: Fixed ROM slots 19034.
                                if slot <> 19034 or instruction <> 14851 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:481
//		TCF	+2
// PORT: Fixed ROM slots 19035.
                                if slot <> 19035 or instruction <> 5725 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5725, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19037 {
                            if slot <= 19036 {
// PORT: SOURCE TVCDAPS.agc:482
//		CS	ERRLIM
// PORT: Fixed ROM slots 19036.
                                if slot <> 19036 or instruction <> 18947 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:483
//		TS	ERRBTMP		# LIMIT WRITES OVER UPPER WORD ONLY
// PORT: Fixed ROM slots 19037.
                                if slot <> 19037 or instruction <> 23490 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23490, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19038 {
// PORT: SOURCE TVCDAPS.agc:484
//
// PORT: SOURCE TVCDAPS.agc:485
//		TC	Q
// PORT: Fixed ROM slots 19038.
                                if slot <> 19038 or instruction <> 2 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:486
//
// PORT: SOURCE TVCDAPS.agc:487
//
// PORT: SOURCE TVCDAPS.agc:488
//# ACTUATOR-COMMAND LIMITER PACKAGE....
// PORT: SOURCE TVCDAPS.agc:489
//
// PORT: SOURCE TVCDAPS.agc:490
//ACTLIM		CAE	CMDTMP	+1	# ROUND UP FOR OUTPUT
// PORT: Fixed ROM slots 19039.
                                if slot <> 19039 or instruction <> 13253 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 965).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19043 {
                        if slot <= 19041 {
                            if slot <= 19040 {
// PORT: SOURCE TVCDAPS.agc:491
//		DOUBLE
// PORT: Fixed ROM slots 19040.
                                if slot <> 19040 or instruction <> 24576 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:492
//		TS	L
// PORT: Fixed ROM slots 19041.
                                if slot <> 19041 or instruction <> 22529 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19042 {
// PORT: SOURCE TVCDAPS.agc:493
//		CAF	ZERO
// PORT: Fixed ROM slots 19042.
                                if slot <> 19042 or instruction <> 14865 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:494
//		AD	CMDTMP
// PORT: Fixed ROM slots 19043.
                                if slot <> 19043 or instruction <> 25540 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 964).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19045 {
                            if slot <= 19044 {
// PORT: SOURCE TVCDAPS.agc:495
//
// PORT: SOURCE TVCDAPS.agc:496
//		EXTEND			# CHECK FOR ACTUATOR COMMAND LIMIT
// PORT: Fixed ROM slots 19044.
                                if slot <> 19044 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:497
//		MP	1/ACTSAT
// PORT: Fixed ROM slots 19045.
                                if slot <> 19045 or instruction <> 30522 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 1850, readEffective:call(words, 1850)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19046 {
// PORT: SOURCE TVCDAPS.agc:498
//		EXTEND
// PORT: Fixed ROM slots 19046.
                                if slot <> 19046 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:499
//# Page 972
// PORT: SOURCE TVCDAPS.agc:500
//		BZF	+6
// PORT: Fixed ROM slots 19047.
                                if slot <> 19047 or instruction <> 5741 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5741, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 19055 {
                    if slot <= 19051 {
                        if slot <= 19049 {
                            if slot <= 19048 {
// PORT: SOURCE TVCDAPS.agc:501
//		CCS	CMDTMP		# APPLY LIMITS
// PORT: Fixed ROM slots 19048.
                                if slot <> 19048 or instruction <> 5060 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 964).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:502
//		CAF	ACTSAT
// PORT: Fixed ROM slots 19049.
                                if slot <> 19049 or instruction <> 14137 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1849), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19050 {
// PORT: SOURCE TVCDAPS.agc:503
//		TCF	+2
// PORT: Fixed ROM slots 19050.
                                if slot <> 19050 or instruction <> 5740 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5740, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:504
//		CS	ACTSAT
// PORT: Fixed ROM slots 19051.
                                if slot <> 19051 or instruction <> 18233 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 1849), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19053 {
                            if slot <= 19052 {
// PORT: SOURCE TVCDAPS.agc:505
//		TS	CMDTMP		# LIMITS WRITE OVER CMDTMP
// PORT: Fixed ROM slots 19052.
                                if slot <> 19052 or instruction <> 23492 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23492, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:506
//
// PORT: SOURCE TVCDAPS.agc:507
//		TC	Q
// PORT: Fixed ROM slots 19053.
                                if slot <> 19053 or instruction <> 2 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19054 {
// PORT: SOURCE TVCDAPS.agc:508
//
// PORT: SOURCE TVCDAPS.agc:509
//
// PORT: SOURCE TVCDAPS.agc:510
//# FILTER COMPUTATIONS FOR PRESENT OUTPUT................
// PORT: SOURCE TVCDAPS.agc:511
//
// PORT: SOURCE TVCDAPS.agc:512
//FWDFLTR		CAF	ZERO
// PORT: Fixed ROM slots 19054.
                                if slot <> 19054 or instruction <> 14865 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:513
//		TS	DAP1
// PORT: Fixed ROM slots 19055.
                                if slot <> 19055 or instruction <> 23437 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23437, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19059 {
                        if slot <= 19057 {
                            if slot <= 19056 {
// PORT: SOURCE TVCDAPS.agc:514
//		TS	DAP2
// PORT: Fixed ROM slots 19056.
                                if slot <> 19056 or instruction <> 23439 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23439, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:515
//		TS	DAP3
// PORT: Fixed ROM slots 19057.
                                if slot <> 19057 or instruction <> 23441 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23441, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19058 {
// PORT: SOURCE TVCDAPS.agc:516
//		TS	CMDTMP
// PORT: Fixed ROM slots 19058.
                                if slot <> 19058 or instruction <> 23492 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23492, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:517
//
// PORT: SOURCE TVCDAPS.agc:518
//		TS	DELBRTMP
// PORT: Fixed ROM slots 19059.
                                if slot <> 19059 or instruction <> 23488 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23488, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19061 {
                            if slot <= 19060 {
// PORT: SOURCE TVCDAPS.agc:519
//
// PORT: SOURCE TVCDAPS.agc:520
//1DAPCAS		CAE	ERRBTMP +1	# FIRST DAP CASCADE
// PORT: Fixed ROM slots 19060.
                                if slot <> 19060 or instruction <> 13251 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 963).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:521
//		EXTEND
// PORT: Fixed ROM slots 19061.
                                if slot <> 19061 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19062 {
// PORT: SOURCE TVCDAPS.agc:522
//		MP	N10		#	N10
// PORT: Fixed ROM slots 19062.
                                if slot <> 19062 or instruction <> 29651 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 979, readEffective:call(words, 979)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:523
//		TS	DAP1	+1
// PORT: Fixed ROM slots 19063.
                                if slot <> 19063 or instruction <> 23438 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23438, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 19079 {
                if slot <= 19071 {
                    if slot <= 19067 {
                        if slot <= 19065 {
                            if slot <= 19064 {
// PORT: SOURCE TVCDAPS.agc:524
//		CA	ERRBTMP
// PORT: Fixed ROM slots 19064.
                                if slot <> 19064 or instruction <> 13250 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 962).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:525
//		EXTEND
// PORT: Fixed ROM slots 19065.
                                if slot <> 19065 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19066 {
// PORT: SOURCE TVCDAPS.agc:526
//		MP	N10		#	N10
// PORT: Fixed ROM slots 19066.
                                if slot <> 19066 or instruction <> 29651 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 979, readEffective:call(words, 979)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:527
//		DAS	DAP1
// PORT: Fixed ROM slots 19067.
                                if slot <> 19067 or instruction <> 9102 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 910) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19069 {
                            if slot <= 19068 {
// PORT: SOURCE TVCDAPS.agc:528
//		DXCH	TMP1
// PORT: Fixed ROM slots 19068.
                                if slot <> 19068 or instruction <> 22471 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 967, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:529
//		DAS	DAP1
// PORT: Fixed ROM slots 19069.
                                if slot <> 19069 or instruction <> 9102 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 910) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19070 {
// PORT: SOURCE TVCDAPS.agc:530
//
// PORT: SOURCE TVCDAPS.agc:531
//2DAPCAS		CAE	DAP1	+1	# SECOND DAP CASCADE
// PORT: Fixed ROM slots 19070.
                                if slot <> 19070 or instruction <> 13198 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 910).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:532
//		EXTEND
// PORT: Fixed ROM slots 19071.
                                if slot <> 19071 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19075 {
                        if slot <= 19073 {
                            if slot <= 19072 {
// PORT: SOURCE TVCDAPS.agc:533
//		MP	N10	+5	#	N20
// PORT: Fixed ROM slots 19072.
                                if slot <> 19072 or instruction <> 29656 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 984, readEffective:call(words, 984)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:534
//		TS	DAP2	+1
// PORT: Fixed ROM slots 19073.
                                if slot <> 19073 or instruction <> 23440 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23440, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19074 {
// PORT: SOURCE TVCDAPS.agc:535
//		CA	DAP1
// PORT: Fixed ROM slots 19074.
                                if slot <> 19074 or instruction <> 13197 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 909).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:536
//		EXTEND
// PORT: Fixed ROM slots 19075.
                                if slot <> 19075 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19077 {
                            if slot <= 19076 {
// PORT: SOURCE TVCDAPS.agc:537
//		MP	N10	+5	#	N20
// PORT: Fixed ROM slots 19076.
                                if slot <> 19076 or instruction <> 29656 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 984, readEffective:call(words, 984)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:538
//		DAS	DAP2
// PORT: Fixed ROM slots 19077.
                                if slot <> 19077 or instruction <> 9104 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 912) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19078 {
// PORT: SOURCE TVCDAPS.agc:539
//		DXCH	TMP3
// PORT: Fixed ROM slots 19078.
                                if slot <> 19078 or instruction <> 22475 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 971, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:540
//		DAS	DAP2
// PORT: Fixed ROM slots 19079.
                                if slot <> 19079 or instruction <> 9104 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 912) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 19087 {
                    if slot <= 19083 {
                        if slot <= 19081 {
                            if slot <= 19080 {
// PORT: SOURCE TVCDAPS.agc:541
//
// PORT: SOURCE TVCDAPS.agc:542
//		CAE	DAPDATR1	# TEST FOR LEM ON OR OFF
// PORT: Fixed ROM slots 19080.
                                if slot <> 19080 or instruction <> 13110 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 822).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:543
//		MASK	BIT14
// PORT: Fixed ROM slots 19081.
                                if slot <> 19081 or instruction <> 31234 { return choose false if checkOnly else -1. }
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
                        } else {
                            if slot <= 19082 {
// PORT: SOURCE TVCDAPS.agc:544
//		CCS	A
// PORT: Fixed ROM slots 19082.
                                if slot <> 19082 or instruction <> 4096 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:545
//		TCF	3DAPCAS		# LEM ON
// PORT: Fixed ROM slots 19083.
                                if slot <> 19083 or instruction <> 5776 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5776, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19085 {
                            if slot <= 19084 {
// PORT: SOURCE TVCDAPS.agc:546
//		EXTEND			# LEM OFF
// PORT: Fixed ROM slots 19084.
                                if slot <> 19084 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:547
//		DCA	DAP2
// PORT: Fixed ROM slots 19085.
                                if slot <> 19085 or instruction <> 13200 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 912, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19086 {
// PORT: SOURCE TVCDAPS.agc:548
//		DXCH	DAP3
// PORT: Fixed ROM slots 19086.
                                if slot <> 19086 or instruction <> 22418 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 914, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:549
//		TCF	OPTVARK
// PORT: Fixed ROM slots 19087.
                                if slot <> 19087 or instruction <> 5786 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5786, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19091 {
                        if slot <= 19089 {
                            if slot <= 19088 {
// PORT: SOURCE TVCDAPS.agc:550
//
// PORT: SOURCE TVCDAPS.agc:551
//# Page 973
// PORT: SOURCE TVCDAPS.agc:552
//3DAPCAS		CAE	DAP2	+1	# THIRD DAP CASCADE
// PORT: Fixed ROM slots 19088.
                                if slot <> 19088 or instruction <> 13200 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 912).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:553
//		EXTEND
// PORT: Fixed ROM slots 19089.
                                if slot <> 19089 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19090 {
// PORT: SOURCE TVCDAPS.agc:554
//		MP	N10	+10D	#	N30
// PORT: Fixed ROM slots 19090.
                                if slot <> 19090 or instruction <> 29661 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 989, readEffective:call(words, 989)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:555
//		TS	DAP3	+1
// PORT: Fixed ROM slots 19091.
                                if slot <> 19091 or instruction <> 23442 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23442, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19093 {
                            if slot <= 19092 {
// PORT: SOURCE TVCDAPS.agc:556
//		CA	DAP2
// PORT: Fixed ROM slots 19092.
                                if slot <> 19092 or instruction <> 13199 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 911).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:557
//		EXTEND
// PORT: Fixed ROM slots 19093.
                                if slot <> 19093 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19094 {
// PORT: SOURCE TVCDAPS.agc:558
//		MP	N10	+10D	#	N30
// PORT: Fixed ROM slots 19094.
                                if slot <> 19094 or instruction <> 29661 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 989, readEffective:call(words, 989)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:559
//		DAS	DAP3
// PORT: Fixed ROM slots 19095.
                                if slot <> 19095 or instruction <> 9106 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 914) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 19127 {
            if slot <= 19111 {
                if slot <= 19103 {
                    if slot <= 19099 {
                        if slot <= 19097 {
                            if slot <= 19096 {
// PORT: SOURCE TVCDAPS.agc:560
//		DXCH	TMP5
// PORT: Fixed ROM slots 19096.
                                if slot <> 19096 or instruction <> 22479 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 975, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:561
//		DAS	DAP3
// PORT: Fixed ROM slots 19097.
                                if slot <> 19097 or instruction <> 9106 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 914) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19098 {
// PORT: SOURCE TVCDAPS.agc:562
//
// PORT: SOURCE TVCDAPS.agc:563
//OPTVARK		CS	DAP3	+1	# VARIABLE GAIN PACKAGE
// PORT: Fixed ROM slots 19098.
                                if slot <> 19098 or instruction <> 17298 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 914).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:564
//		EXTEND			# (ALSO, SIGN CHANGE IN FORWARD LOOP)
// PORT: Fixed ROM slots 19099.
                                if slot <> 19099 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19101 {
                            if slot <= 19100 {
// PORT: SOURCE TVCDAPS.agc:565
//		MP	VARK		# SCALED AT 1/(8 ASCREV) OF ACTUAL VALUE
// PORT: Fixed ROM slots 19100.
                                if slot <> 19100 or instruction <> 29601 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 929, readEffective:call(words, 929)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:566
//		TS	CMDTMP	+1
// PORT: Fixed ROM slots 19101.
                                if slot <> 19101 or instruction <> 23493 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23493, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19102 {
// PORT: SOURCE TVCDAPS.agc:567
//		CS	DAP3
// PORT: Fixed ROM slots 19102.
                                if slot <> 19102 or instruction <> 17297 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 913).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:568
//		EXTEND
// PORT: Fixed ROM slots 19103.
                                if slot <> 19103 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19107 {
                        if slot <= 19105 {
                            if slot <= 19104 {
// PORT: SOURCE TVCDAPS.agc:569
//		MP	VARK
// PORT: Fixed ROM slots 19104.
                                if slot <> 19104 or instruction <> 29601 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 929, readEffective:call(words, 929)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:570
//		DAS	CMDTMP
// PORT: Fixed ROM slots 19105.
                                if slot <> 19105 or instruction <> 9157 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 965) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19106 {
// PORT: SOURCE TVCDAPS.agc:571
//
// PORT: SOURCE TVCDAPS.agc:572
//		DXCH	CMDTMP		# FIX UP SCALING - SCALED B+3 ASCREVS
// PORT: Fixed ROM slots 19106.
                                if slot <> 19106 or instruction <> 22469 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 965, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:573
//		DDOUBL
// PORT: Fixed ROM slots 19107.
                                if slot <> 19107 or instruction <> 8193 { return choose false if checkOnly else -1. }
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
                        if slot <= 19109 {
                            if slot <= 19108 {
// PORT: SOURCE TVCDAPS.agc:574
//		DDOUBL
// PORT: Fixed ROM slots 19108.
                                if slot <> 19108 or instruction <> 8193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 1) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:575
//		DXCH	CMDTMP		#		 - SCALED B+1 ASCREVS
// PORT: Fixed ROM slots 19109.
                                if slot <> 19109 or instruction <> 22469 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 965, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19110 {
// PORT: SOURCE TVCDAPS.agc:576
//					# NOTE - THERE IS AN INHERANT GAIN OF
// PORT: SOURCE TVCDAPS.agc:577
//					# (B+1 ASCREVS) ON THE OUTPUT DACS.
// PORT: SOURCE TVCDAPS.agc:578
//
// PORT: SOURCE TVCDAPS.agc:579
//		TC	Q
// PORT: Fixed ROM slots 19110.
                                if slot <> 19110 or instruction <> 2 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:580
//
// PORT: SOURCE TVCDAPS.agc:581
//
// PORT: SOURCE TVCDAPS.agc:582
//# FILTER PRECOMPUTATIONS FOR NEXT PASS................
// PORT: SOURCE TVCDAPS.agc:583
//
// PORT: SOURCE TVCDAPS.agc:584
//PRECOMP		CAF	ZERO		# ***** FIRST CASCADE FILTER **********
// PORT: Fixed ROM slots 19111.
                                if slot <> 19111 or instruction <> 14865 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 19119 {
                    if slot <= 19115 {
                        if slot <= 19113 {
                            if slot <= 19112 {
// PORT: SOURCE TVCDAPS.agc:585
//		TS	TTMP1
// PORT: Fixed ROM slots 19112.
                                if slot <> 19112 or instruction <> 23433 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23433, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:586
//		TS	TTMP2
// PORT: Fixed ROM slots 19113.
                                if slot <> 19113 or instruction <> 23435 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23435, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19114 {
// PORT: SOURCE TVCDAPS.agc:587
//
// PORT: SOURCE TVCDAPS.agc:588
//		CA	ERRBTMP +1	# MULTIPLY INPUT BY
// PORT: Fixed ROM slots 19114.
                                if slot <> 19114 or instruction <> 13251 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 963).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:589
//		EXTEND
// PORT: Fixed ROM slots 19115.
                                if slot <> 19115 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19117 {
                            if slot <= 19116 {
// PORT: SOURCE TVCDAPS.agc:590
//		MP	N10	+1	#	N11/2
// PORT: Fixed ROM slots 19116.
                                if slot <> 19116 or instruction <> 29652 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 980, readEffective:call(words, 980)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:591
//		TS	TTMP1	+1
// PORT: Fixed ROM slots 19117.
                                if slot <> 19117 or instruction <> 23434 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23434, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19118 {
// PORT: SOURCE TVCDAPS.agc:592
//		CA	ERRBTMP
// PORT: Fixed ROM slots 19118.
                                if slot <> 19118 or instruction <> 13250 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 962).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:593
//		EXTEND
// PORT: Fixed ROM slots 19119.
                                if slot <> 19119 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19123 {
                        if slot <= 19121 {
                            if slot <= 19120 {
// PORT: SOURCE TVCDAPS.agc:594
//		MP	N10	+1	#	N11/2
// PORT: Fixed ROM slots 19120.
                                if slot <> 19120 or instruction <> 29652 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 980, readEffective:call(words, 980)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:595
//		DAS	TTMP1
// PORT: Fixed ROM slots 19121.
                                if slot <> 19121 or instruction <> 9098 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 906) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19122 {
// PORT: SOURCE TVCDAPS.agc:596
//
// PORT: SOURCE TVCDAPS.agc:597
//		CS	DAP1	+1	# MULTIPLY OUTPUT BY
// PORT: Fixed ROM slots 19122.
                                if slot <> 19122 or instruction <> 17294 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 910).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:598
//		EXTEND
// PORT: Fixed ROM slots 19123.
                                if slot <> 19123 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19125 {
                            if slot <= 19124 {
// PORT: SOURCE TVCDAPS.agc:599
//		MP	N10	+3	# 	D11/2
// PORT: Fixed ROM slots 19124.
                                if slot <> 19124 or instruction <> 29654 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 982, readEffective:call(words, 982)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:600
//		TS	TTMP2	+1
// PORT: Fixed ROM slots 19125.
                                if slot <> 19125 or instruction <> 23436 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23436, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19126 {
// PORT: SOURCE TVCDAPS.agc:601
//		CS	DAP1
// PORT: Fixed ROM slots 19126.
                                if slot <> 19126 or instruction <> 17293 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 909).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:602
//
// PORT: SOURCE TVCDAPS.agc:603
//# Page 974
// PORT: SOURCE TVCDAPS.agc:604
//		EXTEND
// PORT: Fixed ROM slots 19127.
                                if slot <> 19127 or instruction <> 6 { return choose false if checkOnly else -1. }
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
            if slot <= 19143 {
                if slot <= 19135 {
                    if slot <= 19131 {
                        if slot <= 19129 {
                            if slot <= 19128 {
// PORT: SOURCE TVCDAPS.agc:605
//		MP	N10	+3	#	D11/2
// PORT: Fixed ROM slots 19128.
                                if slot <> 19128 or instruction <> 29654 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 982, readEffective:call(words, 982)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:606
//		DAS	TTMP2
// PORT: Fixed ROM slots 19129.
                                if slot <> 19129 or instruction <> 9100 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 908) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19130 {
// PORT: SOURCE TVCDAPS.agc:607
//
// PORT: SOURCE TVCDAPS.agc:608
//		DXCH	TTMP2
// PORT: Fixed ROM slots 19130.
                                if slot <> 19130 or instruction <> 22412 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 908, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:609
//		DAS	TTMP1
// PORT: Fixed ROM slots 19131.
                                if slot <> 19131 or instruction <> 9098 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 906) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19133 {
                            if slot <= 19132 {
// PORT: SOURCE TVCDAPS.agc:610
//		DXCH	TTMP1
// PORT: Fixed ROM slots 19132.
                                if slot <> 19132 or instruction <> 22410 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 906, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:611
//		DDOUBL
// PORT: Fixed ROM slots 19133.
                                if slot <> 19133 or instruction <> 8193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 1) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19134 {
// PORT: SOURCE TVCDAPS.agc:612
//		DAS	TMP2
// PORT: Fixed ROM slots 19134.
                                if slot <> 19134 or instruction <> 9161 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 969) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:613
//
// PORT: SOURCE TVCDAPS.agc:614
//		DXCH	TMP2
// PORT: Fixed ROM slots 19135.
                                if slot <> 19135 or instruction <> 22473 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 969, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19139 {
                        if slot <= 19137 {
                            if slot <= 19136 {
// PORT: SOURCE TVCDAPS.agc:615
//		DXCH	TMP1
// PORT: Fixed ROM slots 19136.
                                if slot <> 19136 or instruction <> 22471 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 967, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:616
//
// PORT: SOURCE TVCDAPS.agc:617
//		CAF	ZERO
// PORT: Fixed ROM slots 19137.
                                if slot <> 19137 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
                            if slot <= 19138 {
// PORT: SOURCE TVCDAPS.agc:618
//		TS	TTMP1
// PORT: Fixed ROM slots 19138.
                                if slot <> 19138 or instruction <> 23433 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23433, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:619
//		TS	TMP2
// PORT: Fixed ROM slots 19139.
                                if slot <> 19139 or instruction <> 23496 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23496, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19141 {
                            if slot <= 19140 {
// PORT: SOURCE TVCDAPS.agc:620
//
// PORT: SOURCE TVCDAPS.agc:621
//		CA	ERRBTMP	+1	# MULTIPLY INPUT BY
// PORT: Fixed ROM slots 19140.
                                if slot <> 19140 or instruction <> 13251 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 963).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:622
//		EXTEND			# SECOND-ORDER NUMERATOR COEFF.
// PORT: Fixed ROM slots 19141.
                                if slot <> 19141 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19142 {
// PORT: SOURCE TVCDAPS.agc:623
//		MP	N10	+2	#	N12
// PORT: Fixed ROM slots 19142.
                                if slot <> 19142 or instruction <> 29653 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 981, readEffective:call(words, 981)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:624
//		TS	TTMP1	+1
// PORT: Fixed ROM slots 19143.
                                if slot <> 19143 or instruction <> 23434 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23434, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 19151 {
                    if slot <= 19147 {
                        if slot <= 19145 {
                            if slot <= 19144 {
// PORT: SOURCE TVCDAPS.agc:625
//		CA	ERRBTMP
// PORT: Fixed ROM slots 19144.
                                if slot <> 19144 or instruction <> 13250 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 962).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:626
//		EXTEND
// PORT: Fixed ROM slots 19145.
                                if slot <> 19145 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19146 {
// PORT: SOURCE TVCDAPS.agc:627
//		MP	N10	+2	# 	N12
// PORT: Fixed ROM slots 19146.
                                if slot <> 19146 or instruction <> 29653 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 981, readEffective:call(words, 981)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:628
//		DAS	TTMP1
// PORT: Fixed ROM slots 19147.
                                if slot <> 19147 or instruction <> 9098 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 906) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19149 {
                            if slot <= 19148 {
// PORT: SOURCE TVCDAPS.agc:629
//
// PORT: SOURCE TVCDAPS.agc:630
//		CS	DAP1	+1	# MULTIPLY OUTPUT BY
// PORT: Fixed ROM slots 19148.
                                if slot <> 19148 or instruction <> 17294 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 910).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:631
//		EXTEND
// PORT: Fixed ROM slots 19149.
                                if slot <> 19149 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19150 {
// PORT: SOURCE TVCDAPS.agc:632
//		MP	N10	+4	# 	D12
// PORT: Fixed ROM slots 19150.
                                if slot <> 19150 or instruction <> 29655 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 983, readEffective:call(words, 983)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:633
//		TS	TMP2	+1
// PORT: Fixed ROM slots 19151.
                                if slot <> 19151 or instruction <> 23497 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23497, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19155 {
                        if slot <= 19153 {
                            if slot <= 19152 {
// PORT: SOURCE TVCDAPS.agc:634
//		CS	DAP1
// PORT: Fixed ROM slots 19152.
                                if slot <> 19152 or instruction <> 17293 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 909).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:635
//		EXTEND
// PORT: Fixed ROM slots 19153.
                                if slot <> 19153 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19154 {
// PORT: SOURCE TVCDAPS.agc:636
//		MP	N10	+4	#	D12
// PORT: Fixed ROM slots 19154.
                                if slot <> 19154 or instruction <> 29655 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 983, readEffective:call(words, 983)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:637
//		DAS	TMP2
// PORT: Fixed ROM slots 19155.
                                if slot <> 19155 or instruction <> 9161 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 969) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19157 {
                            if slot <= 19156 {
// PORT: SOURCE TVCDAPS.agc:638
//
// PORT: SOURCE TVCDAPS.agc:639
//		DXCH	TTMP1
// PORT: Fixed ROM slots 19156.
                                if slot <> 19156 or instruction <> 22410 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 906, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:640
//		DAS	TMP2
// PORT: Fixed ROM slots 19157.
                                if slot <> 19157 or instruction <> 9161 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 969) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19158 {
// PORT: SOURCE TVCDAPS.agc:641
//
// PORT: SOURCE TVCDAPS.agc:642
//2CASFLTR	CAF	ZERO		# *****SECOND CASCADE FILTER*****
// PORT: Fixed ROM slots 19158.
                                if slot <> 19158 or instruction <> 14865 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:643
//		TS	TTMP1
// PORT: Fixed ROM slots 19159.
                                if slot <> 19159 or instruction <> 23433 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23433, words[0], readEffective).
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
set agcAotRoutes[1104] to agcAotUnit1104@.

// PORT: Physical bank 20. Shared continuation entries, slots 19160–19256.
function agcAotUnit1105 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19207 {
        if slot <= 19183 {
            if slot <= 19171 {
                if slot <= 19165 {
                    if slot <= 19162 {
                        if slot <= 19160 {
// PORT: SOURCE TVCDAPS.agc:644
//		TS	TTMP2
// PORT: Fixed ROM slots 19160.
                            if slot <> 19160 or instruction <> 23435 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23435, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19161 {
// PORT: SOURCE TVCDAPS.agc:645
//
// PORT: SOURCE TVCDAPS.agc:646
//		CA	DAP1	 +1	# MULTIPLY INPUT BY
// PORT: Fixed ROM slots 19161.
                                if slot <> 19161 or instruction <> 13198 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 910).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:647
//		EXTEND
// PORT: Fixed ROM slots 19162.
                                if slot <> 19162 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19163 {
// PORT: SOURCE TVCDAPS.agc:648
//		MP	N10	+6	#	N21/2
// PORT: Fixed ROM slots 19163.
                            if slot <> 19163 or instruction <> 29657 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 985, readEffective:call(words, 985)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19164 {
// PORT: SOURCE TVCDAPS.agc:649
//		TS	TTMP1	+1
// PORT: Fixed ROM slots 19164.
                                if slot <> 19164 or instruction <> 23434 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23434, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:650
//		CA	DAP1
// PORT: Fixed ROM slots 19165.
                                if slot <> 19165 or instruction <> 13197 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 909).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19168 {
                        if slot <= 19166 {
// PORT: SOURCE TVCDAPS.agc:651
//		EXTEND
// PORT: Fixed ROM slots 19166.
                            if slot <> 19166 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19167 {
// PORT: SOURCE TVCDAPS.agc:652
//		MP	N10	+6	#	N21/2
// PORT: Fixed ROM slots 19167.
                                if slot <> 19167 or instruction <> 29657 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 985, readEffective:call(words, 985)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:653
//# Page 975
// PORT: SOURCE TVCDAPS.agc:654
//		DAS	TTMP1
// PORT: Fixed ROM slots 19168.
                                if slot <> 19168 or instruction <> 9098 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 906) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19169 {
// PORT: SOURCE TVCDAPS.agc:655
//
// PORT: SOURCE TVCDAPS.agc:656
//		CS	DAP2	+1	# MULTIPLY OUTPUT BY
// PORT: Fixed ROM slots 19169.
                            if slot <> 19169 or instruction <> 17296 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 912).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19170 {
// PORT: SOURCE TVCDAPS.agc:657
//		EXTEND
// PORT: Fixed ROM slots 19170.
                                if slot <> 19170 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:658
//		MP	N10	+8D	# 	D21/2
// PORT: Fixed ROM slots 19171.
                                if slot <> 19171 or instruction <> 29659 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 987, readEffective:call(words, 987)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 19177 {
                    if slot <= 19174 {
                        if slot <= 19172 {
// PORT: SOURCE TVCDAPS.agc:659
//		TS	TTMP2	+1
// PORT: Fixed ROM slots 19172.
                            if slot <> 19172 or instruction <> 23436 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23436, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19173 {
// PORT: SOURCE TVCDAPS.agc:660
//		CS	DAP2
// PORT: Fixed ROM slots 19173.
                                if slot <> 19173 or instruction <> 17295 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 911).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:661
//		EXTEND
// PORT: Fixed ROM slots 19174.
                                if slot <> 19174 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19175 {
// PORT: SOURCE TVCDAPS.agc:662
//		MP	N10	+8D	#	D21/2
// PORT: Fixed ROM slots 19175.
                            if slot <> 19175 or instruction <> 29659 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 987, readEffective:call(words, 987)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19176 {
// PORT: SOURCE TVCDAPS.agc:663
//		DAS	TTMP2
// PORT: Fixed ROM slots 19176.
                                if slot <> 19176 or instruction <> 9100 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 908) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:664
//
// PORT: SOURCE TVCDAPS.agc:665
//		DXCH	TTMP2
// PORT: Fixed ROM slots 19177.
                                if slot <> 19177 or instruction <> 22412 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 908, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19180 {
                        if slot <= 19178 {
// PORT: SOURCE TVCDAPS.agc:666
//		DAS	TTMP1
// PORT: Fixed ROM slots 19178.
                            if slot <> 19178 or instruction <> 9098 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 906) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19179 {
// PORT: SOURCE TVCDAPS.agc:667
//		DXCH	TTMP1
// PORT: Fixed ROM slots 19179.
                                if slot <> 19179 or instruction <> 22410 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 906, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:668
//		DDOUBL
// PORT: Fixed ROM slots 19180.
                                if slot <> 19180 or instruction <> 8193 { return choose false if checkOnly else -1. }
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
                        if slot <= 19181 {
// PORT: SOURCE TVCDAPS.agc:669
//		DAS	TMP4
// PORT: Fixed ROM slots 19181.
                            if slot <> 19181 or instruction <> 9165 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 973) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19182 {
// PORT: SOURCE TVCDAPS.agc:670
//
// PORT: SOURCE TVCDAPS.agc:671
//		DXCH	TMP4
// PORT: Fixed ROM slots 19182.
                                if slot <> 19182 or instruction <> 22477 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 973, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:672
//		DXCH	TMP3
// PORT: Fixed ROM slots 19183.
                                if slot <> 19183 or instruction <> 22475 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 971, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 19195 {
                if slot <= 19189 {
                    if slot <= 19186 {
                        if slot <= 19184 {
// PORT: SOURCE TVCDAPS.agc:673
//
// PORT: SOURCE TVCDAPS.agc:674
//		CAF	ZERO
// PORT: Fixed ROM slots 19184.
                            if slot <> 19184 or instruction <> 14865 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19185 {
// PORT: SOURCE TVCDAPS.agc:675
//		TS	TTMP1
// PORT: Fixed ROM slots 19185.
                                if slot <> 19185 or instruction <> 23433 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23433, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:676
//		TS	TMP4
// PORT: Fixed ROM slots 19186.
                                if slot <> 19186 or instruction <> 23500 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23500, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19187 {
// PORT: SOURCE TVCDAPS.agc:677
//
// PORT: SOURCE TVCDAPS.agc:678
//		CA	DAP1	+1	# MULTIPLY INPUT BY
// PORT: Fixed ROM slots 19187.
                            if slot <> 19187 or instruction <> 13198 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 910).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19188 {
// PORT: SOURCE TVCDAPS.agc:679
//		EXTEND
// PORT: Fixed ROM slots 19188.
                                if slot <> 19188 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:680
//		MP	N10	+7	#	N22
// PORT: Fixed ROM slots 19189.
                                if slot <> 19189 or instruction <> 29658 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 986, readEffective:call(words, 986)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19192 {
                        if slot <= 19190 {
// PORT: SOURCE TVCDAPS.agc:681
//		TS	TTMP1	+1
// PORT: Fixed ROM slots 19190.
                            if slot <> 19190 or instruction <> 23434 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23434, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19191 {
// PORT: SOURCE TVCDAPS.agc:682
//		CA	DAP1
// PORT: Fixed ROM slots 19191.
                                if slot <> 19191 or instruction <> 13197 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 909).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:683
//		EXTEND
// PORT: Fixed ROM slots 19192.
                                if slot <> 19192 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19193 {
// PORT: SOURCE TVCDAPS.agc:684
//		MP	N10	+7	# 	N22
// PORT: Fixed ROM slots 19193.
                            if slot <> 19193 or instruction <> 29658 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 986, readEffective:call(words, 986)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19194 {
// PORT: SOURCE TVCDAPS.agc:685
//		DAS	TTMP1
// PORT: Fixed ROM slots 19194.
                                if slot <> 19194 or instruction <> 9098 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 906) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:686
//
// PORT: SOURCE TVCDAPS.agc:687
//		CS	DAP2	+1	# MULTIPLY OUTPUT BY
// PORT: Fixed ROM slots 19195.
                                if slot <> 19195 or instruction <> 17296 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 912).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 19201 {
                    if slot <= 19198 {
                        if slot <= 19196 {
// PORT: SOURCE TVCDAPS.agc:688
//		EXTEND
// PORT: Fixed ROM slots 19196.
                            if slot <> 19196 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19197 {
// PORT: SOURCE TVCDAPS.agc:689
//		MP	N10	+9D	# 	D22
// PORT: Fixed ROM slots 19197.
                                if slot <> 19197 or instruction <> 29660 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 988, readEffective:call(words, 988)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:690
//		TS	TMP4	+1
// PORT: Fixed ROM slots 19198.
                                if slot <> 19198 or instruction <> 23501 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23501, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19199 {
// PORT: SOURCE TVCDAPS.agc:691
//		CS	DAP2
// PORT: Fixed ROM slots 19199.
                            if slot <> 19199 or instruction <> 17295 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 911).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19200 {
// PORT: SOURCE TVCDAPS.agc:692
//		EXTEND
// PORT: Fixed ROM slots 19200.
                                if slot <> 19200 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:693
//		MP	N10	+9D	#	D22
// PORT: Fixed ROM slots 19201.
                                if slot <> 19201 or instruction <> 29660 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 988, readEffective:call(words, 988)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19204 {
                        if slot <= 19202 {
// PORT: SOURCE TVCDAPS.agc:694
//		DAS	TMP4
// PORT: Fixed ROM slots 19202.
                            if slot <> 19202 or instruction <> 9165 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 973) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19203 {
// PORT: SOURCE TVCDAPS.agc:695
//
// PORT: SOURCE TVCDAPS.agc:696
//		DXCH	TTMP1
// PORT: Fixed ROM slots 19203.
                                if slot <> 19203 or instruction <> 22410 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 906, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:697
//		DAS	TMP4
// PORT: Fixed ROM slots 19204.
                                if slot <> 19204 or instruction <> 9165 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 973) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19205 {
// PORT: SOURCE TVCDAPS.agc:698
//
// PORT: SOURCE TVCDAPS.agc:699
//
// PORT: SOURCE TVCDAPS.agc:700
//		CAE	DAPDATR1	# TEST FOR LEM ON OR OFF
// PORT: Fixed ROM slots 19205.
                            if slot <> 19205 or instruction <> 13110 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 822).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19206 {
// PORT: SOURCE TVCDAPS.agc:701
//		MASK	BIT13
// PORT: Fixed ROM slots 19206.
                                if slot <> 19206 or instruction <> 31235 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE TVCDAPS.agc:702
//		CCS	A
// PORT: Fixed ROM slots 19207.
                                if slot <> 19207 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                }
            }
        }
    } else {
        if slot <= 19231 {
            if slot <= 19219 {
                if slot <= 19213 {
                    if slot <= 19210 {
                        if slot <= 19208 {
// PORT: SOURCE TVCDAPS.agc:703
//		TC	Q		# EXIT IF LEM OFF
// PORT: Fixed ROM slots 19208.
                            if slot <> 19208 or instruction <> 2 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19209 {
// PORT: SOURCE TVCDAPS.agc:704
//
// PORT: SOURCE TVCDAPS.agc:705
//# Page 976
// PORT: SOURCE TVCDAPS.agc:706
//3CASFLTR	CAF	ZERO		# *****THIRD CASCADE FILTER*****
// PORT: Fixed ROM slots 19209.
                                if slot <> 19209 or instruction <> 14865 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:707
//		TS	TTMP1
// PORT: Fixed ROM slots 19210.
                                if slot <> 19210 or instruction <> 23433 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23433, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19211 {
// PORT: SOURCE TVCDAPS.agc:708
//		TS	TTMP2
// PORT: Fixed ROM slots 19211.
                            if slot <> 19211 or instruction <> 23435 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23435, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19212 {
// PORT: SOURCE TVCDAPS.agc:709
//
// PORT: SOURCE TVCDAPS.agc:710
//		CA	DAP2	 +1	# MULTIPLY INPUT BY (1/2)
// PORT: Fixed ROM slots 19212.
                                if slot <> 19212 or instruction <> 13200 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 912).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:711
//		EXTEND
// PORT: Fixed ROM slots 19213.
                                if slot <> 19213 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19216 {
                        if slot <= 19214 {
// PORT: SOURCE TVCDAPS.agc:712
//		MP	N10	+11D	#	N31/2
// PORT: Fixed ROM slots 19214.
                            if slot <> 19214 or instruction <> 29662 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 990, readEffective:call(words, 990)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19215 {
// PORT: SOURCE TVCDAPS.agc:713
//		TS	TTMP1	+1
// PORT: Fixed ROM slots 19215.
                                if slot <> 19215 or instruction <> 23434 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23434, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:714
//		CA	DAP2
// PORT: Fixed ROM slots 19216.
                                if slot <> 19216 or instruction <> 13199 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 911).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19217 {
// PORT: SOURCE TVCDAPS.agc:715
//		EXTEND
// PORT: Fixed ROM slots 19217.
                            if slot <> 19217 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19218 {
// PORT: SOURCE TVCDAPS.agc:716
//		MP	N10	+11D	#	N31/2
// PORT: Fixed ROM slots 19218.
                                if slot <> 19218 or instruction <> 29662 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 990, readEffective:call(words, 990)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:717
//		DAS	TTMP1
// PORT: Fixed ROM slots 19219.
                                if slot <> 19219 or instruction <> 9098 { return choose false if checkOnly else -1. }
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
                if slot <= 19225 {
                    if slot <= 19222 {
                        if slot <= 19220 {
// PORT: SOURCE TVCDAPS.agc:718
//
// PORT: SOURCE TVCDAPS.agc:719
//		CS	DAP3	+1
// PORT: Fixed ROM slots 19220.
                            if slot <> 19220 or instruction <> 17298 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 914).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19221 {
// PORT: SOURCE TVCDAPS.agc:720
//		EXTEND
// PORT: Fixed ROM slots 19221.
                                if slot <> 19221 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:721
//		MP	N10	+13D	# 	D31/2
// PORT: Fixed ROM slots 19222.
                                if slot <> 19222 or instruction <> 29664 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 992, readEffective:call(words, 992)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19223 {
// PORT: SOURCE TVCDAPS.agc:722
//		TS	TTMP2	+1
// PORT: Fixed ROM slots 19223.
                            if slot <> 19223 or instruction <> 23436 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23436, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19224 {
// PORT: SOURCE TVCDAPS.agc:723
//		CS	DAP3
// PORT: Fixed ROM slots 19224.
                                if slot <> 19224 or instruction <> 17297 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 913).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:724
//		EXTEND
// PORT: Fixed ROM slots 19225.
                                if slot <> 19225 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19228 {
                        if slot <= 19226 {
// PORT: SOURCE TVCDAPS.agc:725
//		MP	N10	+13D	#	D31/2
// PORT: Fixed ROM slots 19226.
                            if slot <> 19226 or instruction <> 29664 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 992, readEffective:call(words, 992)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19227 {
// PORT: SOURCE TVCDAPS.agc:726
//		DAS	TTMP2
// PORT: Fixed ROM slots 19227.
                                if slot <> 19227 or instruction <> 9100 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 908) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:727
//
// PORT: SOURCE TVCDAPS.agc:728
//		DXCH	TTMP2
// PORT: Fixed ROM slots 19228.
                                if slot <> 19228 or instruction <> 22412 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 908, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19229 {
// PORT: SOURCE TVCDAPS.agc:729
//		DAS	TTMP1
// PORT: Fixed ROM slots 19229.
                            if slot <> 19229 or instruction <> 9098 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 906) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19230 {
// PORT: SOURCE TVCDAPS.agc:730
//		DXCH	TTMP1
// PORT: Fixed ROM slots 19230.
                                if slot <> 19230 or instruction <> 22410 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 906, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:731
//		DDOUBL
// PORT: Fixed ROM slots 19231.
                                if slot <> 19231 or instruction <> 8193 { return choose false if checkOnly else -1. }
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
                }
            }
        } else {
            if slot <= 19243 {
                if slot <= 19237 {
                    if slot <= 19234 {
                        if slot <= 19232 {
// PORT: SOURCE TVCDAPS.agc:732
//		DAS	TMP6
// PORT: Fixed ROM slots 19232.
                            if slot <> 19232 or instruction <> 9169 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 977) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19233 {
// PORT: SOURCE TVCDAPS.agc:733
//
// PORT: SOURCE TVCDAPS.agc:734
//		DXCH	TMP6
// PORT: Fixed ROM slots 19233.
                                if slot <> 19233 or instruction <> 22481 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 977, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:735
//		DXCH	TMP5
// PORT: Fixed ROM slots 19234.
                                if slot <> 19234 or instruction <> 22479 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 975, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19235 {
// PORT: SOURCE TVCDAPS.agc:736
//
// PORT: SOURCE TVCDAPS.agc:737
//		CAF	ZERO
// PORT: Fixed ROM slots 19235.
                            if slot <> 19235 or instruction <> 14865 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19236 {
// PORT: SOURCE TVCDAPS.agc:738
//		TS	TTMP1
// PORT: Fixed ROM slots 19236.
                                if slot <> 19236 or instruction <> 23433 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23433, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:739
//		TS	TMP6
// PORT: Fixed ROM slots 19237.
                                if slot <> 19237 or instruction <> 23504 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23504, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19240 {
                        if slot <= 19238 {
// PORT: SOURCE TVCDAPS.agc:740
//
// PORT: SOURCE TVCDAPS.agc:741
//		CA	DAP2	+1	# MULTIPLY INPUT BY
// PORT: Fixed ROM slots 19238.
                            if slot <> 19238 or instruction <> 13200 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 912).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19239 {
// PORT: SOURCE TVCDAPS.agc:742
//		EXTEND
// PORT: Fixed ROM slots 19239.
                                if slot <> 19239 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:743
//		MP	N10	+12D	#	N32
// PORT: Fixed ROM slots 19240.
                                if slot <> 19240 or instruction <> 29663 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 991, readEffective:call(words, 991)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19241 {
// PORT: SOURCE TVCDAPS.agc:744
//		TS	TTMP1	+1
// PORT: Fixed ROM slots 19241.
                            if slot <> 19241 or instruction <> 23434 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23434, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19242 {
// PORT: SOURCE TVCDAPS.agc:745
//		CA	DAP2
// PORT: Fixed ROM slots 19242.
                                if slot <> 19242 or instruction <> 13199 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 911).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:746
//		EXTEND
// PORT: Fixed ROM slots 19243.
                                if slot <> 19243 or instruction <> 6 { return choose false if checkOnly else -1. }
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
                if slot <= 19249 {
                    if slot <= 19246 {
                        if slot <= 19244 {
// PORT: SOURCE TVCDAPS.agc:747
//		MP	N10	+12D	# 	N32
// PORT: Fixed ROM slots 19244.
                            if slot <> 19244 or instruction <> 29663 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 991, readEffective:call(words, 991)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19245 {
// PORT: SOURCE TVCDAPS.agc:748
//		DAS	TTMP1
// PORT: Fixed ROM slots 19245.
                                if slot <> 19245 or instruction <> 9098 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 906) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:749
//
// PORT: SOURCE TVCDAPS.agc:750
//		CS	DAP3	+1
// PORT: Fixed ROM slots 19246.
                                if slot <> 19246 or instruction <> 17298 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 914).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19247 {
// PORT: SOURCE TVCDAPS.agc:751
//		EXTEND
// PORT: Fixed ROM slots 19247.
                            if slot <> 19247 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19248 {
// PORT: SOURCE TVCDAPS.agc:752
//		MP	N10	+14D	# 	D32
// PORT: Fixed ROM slots 19248.
                                if slot <> 19248 or instruction <> 29665 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 993, readEffective:call(words, 993)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:753
//		TS	TMP6	+1
// PORT: Fixed ROM slots 19249.
                                if slot <> 19249 or instruction <> 23505 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23505, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19252 {
                        if slot <= 19250 {
// PORT: SOURCE TVCDAPS.agc:754
//		CS	DAP3
// PORT: Fixed ROM slots 19250.
                            if slot <> 19250 or instruction <> 17297 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 913).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19251 {
// PORT: SOURCE TVCDAPS.agc:755
//		EXTEND
// PORT: Fixed ROM slots 19251.
                                if slot <> 19251 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:756
//# Page 977
// PORT: SOURCE TVCDAPS.agc:757
//		MP	N10	+14D	#	D32
// PORT: Fixed ROM slots 19252.
                                if slot <> 19252 or instruction <> 29665 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 993, readEffective:call(words, 993)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19254 {
                            if slot <= 19253 {
// PORT: SOURCE TVCDAPS.agc:758
//		DAS	TMP6
// PORT: Fixed ROM slots 19253.
                                if slot <> 19253 or instruction <> 9169 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 977) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:759
//
// PORT: SOURCE TVCDAPS.agc:760
//		DXCH	TTMP1
// PORT: Fixed ROM slots 19254.
                                if slot <> 19254 or instruction <> 22410 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 906, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19255 {
// PORT: SOURCE TVCDAPS.agc:761
//		DAS	TMP6
// PORT: Fixed ROM slots 19255.
                                if slot <> 19255 or instruction <> 9169 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 977) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCDAPS.agc:762
//
// PORT: SOURCE TVCDAPS.agc:763
//		TC	Q
// PORT: Fixed ROM slots 19256.
                                if slot <> 19256 or instruction <> 2 { return choose false if checkOnly else -1. }
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
    }
}
set agcAotRoutes[1105] to agcAotUnit1105@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TVCDAPS.agc:764
//
// PORT: SOURCE TVCDAPS.agc:765
//# Page 978
// PORT: SOURCE TVCDAPS.agc:766
//# CONSTANTS FOR AUTOPILOTS
// PORT: SOURCE TVCDAPS.agc:767
//
// PORT: SOURCE TVCDAPS.agc:768
//# NOTE....1 ASCREV (ACTUATOR CMD SCALING) = 85.41 ARCSEC/BIT OR 1.07975111 REVS (85.41x16384/3600/360)
// PORT: SOURCE TVCDAPS.agc:769
//
// PORT: SOURCE TVCDAPS.agc:770
//#	  1 SPASCREV (SPECIAL ACTUATOR CMD SCALING) = 1.04620942 REVS
// PORT: SOURCE TVCDAPS.agc:771
//
// PORT: SOURCE TVCDAPS.agc:772
//ACTSAT		DEC	253		# ACTUATOR LIMIT (6 DEG), SC.AT 1ASCREV
// PORT: Fixed ROM slots 19257.
    19257, 506,
// PORT: SOURCE TVCDAPS.agc:773
//1/ACTSAT	DEC	.0039525692	# RECIPROCAL (1/253)
// PORT: Fixed ROM slots 19258.
    19258, 130,
// PORT: SOURCE TVCDAPS.agc:774
//
// PORT: SOURCE TVCDAPS.agc:775
//ERRLIM		EQUALS	BIT13		# FILTER INPUT LIMIT....B-3 REVS (45DEG),
// PORT: SOURCE TVCDAPS.agc:776
//1/ERRLIM	EQUALS	BIT3		# 	SC.AT B-1 REV, AND ITS RECIPROCAL
// PORT: SOURCE TVCDAPS.agc:777
//
// PORT: SOURCE TVCDAPS.agc:778
//PITCHT5		GENADR	PITCHDAP	# UPPER WORDS OF T5 2CADRS, LOWER WORDS
// PORT: Fixed ROM slots 19259.
    19259, 2736,
// PORT: SOURCE TVCDAPS.agc:779
//DAPT5		GENADR	DAPINIT		#	(BBCON) ALREADY THERE.  ORDER IS
// PORT: Fixed ROM slots 19260.
    19260, 3214,
// PORT: SOURCE TVCDAPS.agc:780
//YAWT5		GENADR	YAWDAP		#	REQUIRED.
// PORT: Fixed ROM slots 19261.
    19261, 2996,
// PORT: SOURCE TVCDAPS.agc:781
//
// PORT: SOURCE TVCDAPS.agc:782
//1/RTLIM		DEC	0.004715	# .004715(CDUDIF) = 0 IF CDUIF < 2.33 DEG
// PORT: Fixed ROM slots 19262.
    19262, 154,
// PORT: SOURCE TVCDAPS.agc:783
//1-E(-AT)	OCT	00243		# AT = .01SEC....EITHER(1/A=4SEC, T=40MS),
// PORT: Fixed ROM slots 19263.
    19263, 326,
// PORT: SOURCE TVCDAPS.agc:784
//E(-AT)		OCT	37535		#		     OR(1/A=8SEC, T=80MS)
// PORT: Fixed ROM slots 19264.
    19264, 32442
)).

