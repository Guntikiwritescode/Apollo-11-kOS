// FRESH_START_AND_RESTART.agc
// bank 05, slots 7394-7398
function agcAotUnit418 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7395 {
        if slot <= 7394 {
// FRESH_START_AND_RESTART.agc:1
//# Copyright:	Public domain.
// FRESH_START_AND_RESTART.agc:2
//# Filename:	FRESH_START_AND_RESTART.agc
// FRESH_START_AND_RESTART.agc:3
//# Purpose:	Part of the source code for Comanche, build 055. It
// FRESH_START_AND_RESTART.agc:4
//#		is part of the source code for the Command Module's
// FRESH_START_AND_RESTART.agc:5
//#		(CM) Apollo Guidance Computer (AGC), Apollo 11.
// FRESH_START_AND_RESTART.agc:6
//# Assembler:	yaYUL
// FRESH_START_AND_RESTART.agc:7
//# Reference:	pp. 181-210
// FRESH_START_AND_RESTART.agc:8
//# Contact:	Ron Burkey <info@sandroid.org>,
// FRESH_START_AND_RESTART.agc:9
//#  		Fabrizio Bernardini <fabrizio@spacecraft.it>
// FRESH_START_AND_RESTART.agc:10
//# Website:	http://www.ibiblio.org/apollo.
// FRESH_START_AND_RESTART.agc:11
//# Mod history:	2009-05-16 FB	Transcription Batch 2 Assignment.
// FRESH_START_AND_RESTART.agc:12
//#		2009-05-20 RSB	Removed an extraneous "TC STARTSUB".
// FRESH_START_AND_RESTART.agc:13
//#		2009-05-21 RSB	Changed a "TC BANKCALL" to "TC STOPRATE"
// FRESH_START_AND_RESTART.agc:14
//#				in INITSUB.
// FRESH_START_AND_RESTART.agc:15
//#
// FRESH_START_AND_RESTART.agc:16
//# The contents of the "Comanche055" files, in general, are transcribed
// FRESH_START_AND_RESTART.agc:17
//# from scanned documents.
// FRESH_START_AND_RESTART.agc:18
//#
// FRESH_START_AND_RESTART.agc:19
//#	Assemble revision 055 of AGC program Comanche by NASA
// FRESH_START_AND_RESTART.agc:20
//#	2021113-051.  April 1, 1969.
// FRESH_START_AND_RESTART.agc:21
//#
// FRESH_START_AND_RESTART.agc:22
//#	This AGC program shall also be referred to as Colossus 2A
// FRESH_START_AND_RESTART.agc:23
//#
// FRESH_START_AND_RESTART.agc:24
//#	Prepared by
// FRESH_START_AND_RESTART.agc:25
//#			Massachusetts Institute of Technology
// FRESH_START_AND_RESTART.agc:26
//#			75 Cambridge Parkway
// FRESH_START_AND_RESTART.agc:27
//#			Cambridge, Massachusetts
// FRESH_START_AND_RESTART.agc:28
//#
// FRESH_START_AND_RESTART.agc:29
//#	under NASA contract NAS 9-4065.
// FRESH_START_AND_RESTART.agc:30
//#
// FRESH_START_AND_RESTART.agc:31
//# Refer directly to the online document mentioned above for further
// FRESH_START_AND_RESTART.agc:32
//# information.  Please report any errors to info@sandroid.org.
// FRESH_START_AND_RESTART.agc:33
//
// FRESH_START_AND_RESTART.agc:34
//# Page 181
// FRESH_START_AND_RESTART.agc:35
//# PROGRAM DESCRIPTION						8 APRIL, 1967
// FRESH_START_AND_RESTART.agc:36
//#								SUNDISK REV 120
// FRESH_START_AND_RESTART.agc:37
//# FUNCTIONAL DESCRIPTION
// FRESH_START_AND_RESTART.agc:38
//
// FRESH_START_AND_RESTART.agc:39
//#     SLAP1	MAN INITIATED FRESH START
// FRESH_START_AND_RESTART.agc:40
//#	1. EXECUTE STARTSUB
// FRESH_START_AND_RESTART.agc:41
//#	2. TURN OFF DSKY DISCRETE-LAMPS
// FRESH_START_AND_RESTART.agc:42
//#	3. CLEAR FAIL REGISTERS,SELF-CHECK ERROR COUNTER AND RESTART
// FRESH_START_AND_RESTART.agc:43
//#	   COUNTER
// FRESH_START_AND_RESTART.agc:44
//#	4. EXECUTE DOFSTART
// FRESH_START_AND_RESTART.agc:45
//
// FRESH_START_AND_RESTART.agc:46
//#     DOFSTART	MACHINE INITIATED FRESH START
// FRESH_START_AND_RESTART.agc:47
//
// FRESH_START_AND_RESTART.agc:48
//#	1. CLEAR SELF-CHECK REGISTERS, MODE REGISTER AND CDUZ REGISTER
// FRESH_START_AND_RESTART.agc:49
//#	2. CLEAR PHASE TABLE
// FRESH_START_AND_RESTART.agc:50
//#	3. INITIALIZE IMU FLAGS
// FRESH_START_AND_RESTART.agc:51
//#	4. INITIALIZE FLAGWORDS
// FRESH_START_AND_RESTART.agc:52
//#	5. TRANSFER CONTROL TO IDLE LOOP IN DUMMYJOB
// FRESH_START_AND_RESTART.agc:53
//
// FRESH_START_AND_RESTART.agc:54
//#     GOPROG	HARDWARE RESTART
// FRESH_START_AND_RESTART.agc:55
//
// FRESH_START_AND_RESTART.agc:56
//#	0. EXECUTE STARTSUB
// FRESH_START_AND_RESTART.agc:57
//#	1. TRANSFER CONTROL TO DOFSTART IF ANY OF THE FOLLOWING CONDITIONS
// FRESH_START_AND_RESTART.agc:58
//#	   EXIST.
// FRESH_START_AND_RESTART.agc:59
//#	   A. RESTART OCCURED DURING EXECUTION OF ERASCHK
// FRESH_START_AND_RESTART.agc:60
//#	   B. BOTH OSCILLATOR FAIL AND AGC WARNING ARE ON
// FRESH_START_AND_RESTART.agc:61
//#	   C. MARK REJECT AND EITHER NAV OR MAIN DSKY ERROR LIGHT RESET
// FRESH_START_AND_RESTART.agc:62
//#	      ARE ON.
// FRESH_START_AND_RESTART.agc:63
//#	2. SCHEDULE A T5RUPT PROGRAM FOR THE DAP
// FRESH_START_AND_RESTART.agc:64
//#	3. SET FLAGWRD5 BITS FOR INTWAKE ROUTINE
// FRESH_START_AND_RESTART.agc:65
//#	4. EXTINGUISH ALL DSKY LAMPS, EXCEPT FOR PROGRAM ALARM,GIMBAL LOCK AND
// FRESH_START_AND_RESTART.agc:66
//#	   NO ATT
// FRESH_START_AND_RESTART.agc:67
//#	5. INITIALIZE IMU FLAGS
// FRESH_START_AND_RESTART.agc:68
//#	6. IF ENGINE COMMAND IS ON (FLAGWRD5,BIT 7), SET ENGINE ON (CHAN-
// FRESH_START_AND_RESTART.agc:69
//#	   NEL 11, BIT 13)
// FRESH_START_AND_RESTART.agc:70
//#	7. TRANSFER CONTROL TO GOPROG3
// FRESH_START_AND_RESTART.agc:71
//
// FRESH_START_AND_RESTART.agc:72
//#     ENEMA	SOFTWARE RESTART	INITIATED BY MAJOR MODE CHANGE
// FRESH_START_AND_RESTART.agc:73
//
// FRESH_START_AND_RESTART.agc:74
//#	1. EXECUTE STARTSB2
// FRESH_START_AND_RESTART.agc:75
//#	2. KILL PROGRAMS THAT WERE INTEGRATING OR WAITING FOR INTEGRATION
// FRESH_START_AND_RESTART.agc:76
//#	   ROUTINE
// FRESH_START_AND_RESTART.agc:77
//#	3. TRANSFER CONTROL TO GOPROG3
// FRESH_START_AND_RESTART.agc:78
//
// FRESH_START_AND_RESTART.agc:79
//#     GOPROG3	SUBROUTINE COMMON TO GOPROG AND ENEMA
// FRESH_START_AND_RESTART.agc:80
//
// FRESH_START_AND_RESTART.agc:81
//#	1. TEST PHASE TABLES - IF INCORRECT, DISPLAY ALARM 1107 AND
// FRESH_START_AND_RESTART.agc:82
//#	   TRANSFER CONTROL TO DOFSTART
// FRESH_START_AND_RESTART.agc:83
//#	2. DISPLAY MAJOR MODE
// FRESH_START_AND_RESTART.agc:84
//#	3. IF ANY GROUPS WERE ACTIVE UPON RESTART,TRANSFER CONTROL TO THE
// FRESH_START_AND_RESTART.agc:85
//# Page 182
// FRESH_START_AND_RESTART.agc:86
//#	   RESTARTS SUBROUTINE TO RESCHEDULE PENDING TASKS, LONGCALLS, AND
// FRESH_START_AND_RESTART.agc:87
//#	   JOBS (P20 IS RESTARTED VIA FINDVAC)
// FRESH_START_AND_RESTART.agc:88
//#	4. IF NO GROUPS WERE ACTIVE UPON RESTART, DISPLAY ALARM CODE
// FRESH_START_AND_RESTART.agc:89
//#	   1110 (RESTART WITH NO ACTIVE GROUPS).
// FRESH_START_AND_RESTART.agc:90
//#	5. TRANSFER CONTROL TO IDLE LOOP IN DUMMYJOB
// FRESH_START_AND_RESTART.agc:91
//
// FRESH_START_AND_RESTART.agc:92
//#     STARTSUB	SUBROUTINE COMMON TO SLAP1 AND GOPROG
// FRESH_START_AND_RESTART.agc:93
//
// FRESH_START_AND_RESTART.agc:94
//#	1. CLEAR OUTBIT CHANNELS 5 AND 6
// FRESH_START_AND_RESTART.agc:95
//#	2. INITIALIZE TIME5,TIME4,TIME3
// FRESH_START_AND_RESTART.agc:96
//#	3. TRANSFER CONTROL TO STARTSB2
// FRESH_START_AND_RESTART.agc:97
//
// FRESH_START_AND_RESTART.agc:98
//#     STARTSB2	SUBROUTINE COMMON TO STARTSUB AND ENEMA
// FRESH_START_AND_RESTART.agc:99
//
// FRESH_START_AND_RESTART.agc:100
//#	1. INTIALIZE OUTBIT CHANNELS 11,12,13, AND 14
// FRESH_START_AND_RESTART.agc:101
//#	2. REPLACE ALL TASKS ON WAITLIST WITH ENDTASK
// FRESH_START_AND_RESTART.agc:102
//#	3. MAKE ALL EXECUTIVE REGISTERS AVAILABLE
// FRESH_START_AND_RESTART.agc:103
//#	4. MAKE ALL VAC AREAS AVAILABLE
// FRESH_START_AND_RESTART.agc:104
//#	5. CLEAR DSKY REGISTERS
// FRESH_START_AND_RESTART.agc:105
//#	6. ZERO NUMEROUS SWITCHES
// FRESH_START_AND_RESTART.agc:106
//#	7. INITIALIZE OPTICS FLAGS
// FRESH_START_AND_RESTART.agc:107
//#	8. INITIALIZE PIPA AND TELEMETRY FAIL FLAGS
// FRESH_START_AND_RESTART.agc:108
//#	9. INITIALIZE DOWN TELEMETRY
// FRESH_START_AND_RESTART.agc:109
//
// FRESH_START_AND_RESTART.agc:110
//
// FRESH_START_AND_RESTART.agc:111
//# INPUT/OUTPUT INITIALIZATION
// FRESH_START_AND_RESTART.agc:112
//
// FRESH_START_AND_RESTART.agc:113
//#	A. CALLING SEQUENCE
// FRESH_START_AND_RESTART.agc:114
//
// FRESH_START_AND_RESTART.agc:115
//#		SLAP1 -	TC	POSTJUMP	OR	VERB 36,ENTER
// FRESH_START_AND_RESTART.agc:116
//#			CADR 	SLAP1
// FRESH_START_AND_RESTART.agc:117
//
// FRESH_START_AND_RESTART.agc:118
//#		ENEMA -	TC 	POSTJUMP	*** DO NOT CALL ENEMA WITHOUT ***
// FRESH_START_AND_RESTART.agc:119
//#			CADR 	ENEMA		*** CONSULTING POOH PEOPLE   ***
// FRESH_START_AND_RESTART.agc:120
//
// FRESH_START_AND_RESTART.agc:121
//#	B. OUTPUT
// FRESH_START_AND_RESTART.agc:122
//
// FRESH_START_AND_RESTART.agc:123
//#		ERASABLE MEMORY INITIALIZATION
// FRESH_START_AND_RESTART.agc:124
//
// FRESH_START_AND_RESTART.agc:125
//# PROGRAM ANALYSIS
// FRESH_START_AND_RESTART.agc:126
//
// FRESH_START_AND_RESTART.agc:127
//#	A. SUBROUTINES CALLED
// FRESH_START_AND_RESTART.agc:128
//
// FRESH_START_AND_RESTART.agc:129
//#		MR.KLEAN,WAITLIST,DSPMM,ALARM,RESTARTS,FINDVAC
// FRESH_START_AND_RESTART.agc:130
//
// FRESH_START_AND_RESTART.agc:131
//#	B. ALARMS
// FRESH_START_AND_RESTART.agc:132
//
// FRESH_START_AND_RESTART.agc:133
//#		1107 PHASE TABLE ERROR
// FRESH_START_AND_RESTART.agc:134
//#		1110 RESTART WITH NO ACTIVE GROUPS
// FRESH_START_AND_RESTART.agc:135
//
// FRESH_START_AND_RESTART.agc:136
//# Page 183
// FRESH_START_AND_RESTART.agc:137
//		BANK	10
// FRESH_START_AND_RESTART.agc:138
//		SETLOC	FRANDRES
// FRESH_START_AND_RESTART.agc:139
//		BANK
// FRESH_START_AND_RESTART.agc:140
//
// FRESH_START_AND_RESTART.agc:141
//		EBANK=	LST1
// FRESH_START_AND_RESTART.agc:142
//
// FRESH_START_AND_RESTART.agc:143
//		COUNT	05/START
// FRESH_START_AND_RESTART.agc:144
//
// FRESH_START_AND_RESTART.agc:145
//SLAP1		INHINT			# FRESH START.  COMES HERE FROM PINBALL.
// slot 7394
            if slot <> 7394 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// FRESH_START_AND_RESTART.agc:146
//		TC	STARTSUB	# SUBROUTINE DOES MOST OF THE WORK.
// slot 7395
            if slot <> 7395 or instruction <> 1534 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1534, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 7396 {
// FRESH_START_AND_RESTART.agc:147
//
// FRESH_START_AND_RESTART.agc:148
//STARTSW		TCF	SKIPSIM		# PATCH....TCF STARTSIM...FOR SIMULATION
// slot 7396
            if slot <> 7396 or instruction <> 5353 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5353, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 7397 {
// FRESH_START_AND_RESTART.agc:149
//STARTSIM	CAF	BIT14
// slot 7397
                if slot <> 7397 or instruction <> 14850 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// FRESH_START_AND_RESTART.agc:150
//		TC	FINDVAC
// slot 7398
                if slot <> 7398 or instruction <> 2663 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2663, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[418] to agcAotUnit418@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:151
//SIM2CADR	OCT	77777		# PATCH 2CADR (AND EBANK DESIGNATION) OF
// slot 7399
    7399, 65534,
// FRESH_START_AND_RESTART.agc:152
//		OCT	77777		# SIMULATION START ADDRESS.
// slot 7400
    7400, 65534
)).

// bank 05, slots 7401-7487
function agcAotUnit419 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7443 {
        if slot <= 7421 {
            if slot <= 7410 {
                if slot <= 7405 {
                    if slot <= 7402 {
                        if slot <= 7401 {
// FRESH_START_AND_RESTART.agc:153
//
// FRESH_START_AND_RESTART.agc:154
//SKIPSIM		CA	DSPTAB +11D
// slot 7401
                            if slot <> 7401 or instruction <> 12830 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 542).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FRESH_START_AND_RESTART.agc:155
//		MASK	BITS4&6
// slot 7402
                            if slot <> 7402 or instruction <> 31259 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2587), 32768).
                                if fixedOperand = 40 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 8), 2) * 8 + mod(floor(words[0] / 32), 2) * 32).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7403 {
// FRESH_START_AND_RESTART.agc:156
//		AD	BIT15
// slot 7403
                            if slot <> 7403 or instruction <> 27137 { return choose false if checkOnly else -1. }
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
                            if slot <= 7404 {
// FRESH_START_AND_RESTART.agc:157
//		TS	DSPTAB +11D	# REQUESTED FRESH START.
// slot 7404
                                if slot <> 7404 or instruction <> 23070 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23070, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:158
//
// FRESH_START_AND_RESTART.agc:159
//		CA	ZERO		# SAME STORY ON ZEROING FAILREG.
// slot 7405
                                if slot <> 7405 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
                } else {
                    if slot <= 7407 {
                        if slot <= 7406 {
// FRESH_START_AND_RESTART.agc:160
//		TS	ERCOUNT
// slot 7406
                            if slot <> 7406 or instruction <> 23285 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23285, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FRESH_START_AND_RESTART.agc:161
//		TS	FAILREG
// slot 7407
                            if slot <> 7407 or instruction <> 22781 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22781, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7408 {
// FRESH_START_AND_RESTART.agc:162
//		TS	FAILREG +1
// slot 7408
                            if slot <> 7408 or instruction <> 22782 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22782, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7409 {
// FRESH_START_AND_RESTART.agc:163
//		TS	FAILREG +2
// slot 7409
                                if slot <> 7409 or instruction <> 22783 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22783, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:164
//		TS	REDOCTR
// slot 7410
                                if slot <> 7410 or instruction <> 23148 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23148, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 7415 {
                    if slot <= 7412 {
                        if slot <= 7411 {
// FRESH_START_AND_RESTART.agc:165
//
// FRESH_START_AND_RESTART.agc:166
//		CS	PRIO12
// slot 7411
                            if slot <> 7411 or instruction <> 18888 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2504), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FRESH_START_AND_RESTART.agc:167
//		TS	DSRUPTSW
// slot 7412
                            if slot <> 7412 or instruction <> 23234 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23234, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7413 {
// FRESH_START_AND_RESTART.agc:168
//
// FRESH_START_AND_RESTART.agc:169
//DOFSTART	CAF	ZERO		# DO A FRESH START.
// slot 7413
                            if slot <> 7413 or instruction <> 14865 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7414 {
// FRESH_START_AND_RESTART.agc:170
//		TS	ERESTORE	# ***** MUST NOT BE REMOVED FROM DOFSTART
// slot 7414
                                if slot <> 7414 or instruction <> 23280 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23280, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:171
//		TS	SMODE		# ***** MUST NOT BE REMOVED FROM DOFSTART
// slot 7415
                                if slot <> 7415 or instruction <> 23282 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23282, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7418 {
                        if slot <= 7416 {
// FRESH_START_AND_RESTART.agc:172
//		TS	UPSVFLAG	# UPDATE STATE VECTOR REQUEST FLAGWORD
// slot 7416
                            if slot <> 7416 or instruction <> 23361 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23361, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7417 {
// FRESH_START_AND_RESTART.agc:173
//		EXTEND
// slot 7417
                                if slot <> 7417 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:174
//		WRITE	CHAN5		# TURN OFF RCS JETS
// slot 7418
                                if slot <> 7418 or instruction <> 517 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 1, 5, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7419 {
// FRESH_START_AND_RESTART.agc:175
//		EXTEND
// slot 7419
                            if slot <> 7419 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7420 {
// FRESH_START_AND_RESTART.agc:176
//		WRITE	CHAN6		# TURN OFF RCS JETS
// slot 7420
                                if slot <> 7420 or instruction <> 518 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 1, 6, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:177
//		EXTEND
// slot 7421
                                if slot <> 7421 or instruction <> 6 { return choose false if checkOnly else -1. }
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
            if slot <= 7432 {
                if slot <= 7426 {
                    if slot <= 7423 {
                        if slot <= 7422 {
// FRESH_START_AND_RESTART.agc:178
//		WRITE	DSALMOUT	# ZERO CHANNEL 11
// slot 7422
                            if slot <> 7422 or instruction <> 521 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 1, 9, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FRESH_START_AND_RESTART.agc:179
//		EXTEND
// slot 7423
                            if slot <> 7423 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7424 {
// FRESH_START_AND_RESTART.agc:180
//		WRITE	CHAN12		# ZERO CHANNEL 12
// slot 7424
                            if slot <> 7424 or instruction <> 522 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 1, 10, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7425 {
// FRESH_START_AND_RESTART.agc:181
//		EXTEND
// slot 7425
                                if slot <> 7425 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:182
//		WRITE	CHAN13		# ZERO CHANNEL 13
// slot 7426
                                if slot <> 7426 or instruction <> 523 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 1, 11, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7429 {
                        if slot <= 7427 {
// FRESH_START_AND_RESTART.agc:183
//		EXTEND
// slot 7427
                            if slot <> 7427 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7428 {
// FRESH_START_AND_RESTART.agc:184
//		WRITE	CHAN14		# ZERO CHANNEL 14
// slot 7428
                                if slot <> 7428 or instruction <> 524 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 1, 12, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:185
//		TS	WTOPTION
// slot 7429
                                if slot <> 7429 or instruction <> 23246 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23246, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7430 {
// FRESH_START_AND_RESTART.agc:186
//		TS	DNLSTCOD
// slot 7430
                            if slot <> 7430 or instruction <> 22746 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22746, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7431 {
// FRESH_START_AND_RESTART.agc:187
//# Page 184
// FRESH_START_AND_RESTART.agc:188
//		TS	NVSAVE
// slot 7431
                                if slot <> 7431 or instruction <> 22777 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22777, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:189
//		TS	EBANKTEM
// slot 7432
                                if slot <> 7432 or instruction <> 23097 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23097, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 7437 {
                    if slot <= 7434 {
                        if slot <= 7433 {
// FRESH_START_AND_RESTART.agc:190
//		TS	RATEINDX
// slot 7433
                            if slot <> 7433 or instruction <> 23128 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23128, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FRESH_START_AND_RESTART.agc:191
//		TS	TRKMKCNT
// slot 7434
                            if slot <> 7434 or instruction <> 23126 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23126, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7435 {
// FRESH_START_AND_RESTART.agc:192
//		TS	VHFCNT
// slot 7435
                            if slot <> 7435 or instruction <> 23125 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23125, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7436 {
// FRESH_START_AND_RESTART.agc:193
//		TS	EXTVBACT
// slot 7436
                                if slot <> 7436 or instruction <> 23076 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23076, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:194
//
// FRESH_START_AND_RESTART.agc:195
//		CS	DSPTAB +11D
// slot 7437
                                if slot <> 7437 or instruction <> 16926 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 542).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7440 {
                        if slot <= 7438 {
// FRESH_START_AND_RESTART.agc:196
//		MASK	BITS4&6
// slot 7438
                            if slot <> 7438 or instruction <> 31259 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2587), 32768).
                                if fixedOperand = 40 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 8), 2) * 8 + mod(floor(words[0] / 32), 2) * 32).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7439 {
// FRESH_START_AND_RESTART.agc:197
//		CCS	A
// slot 7439
                                if slot <> 7439 or instruction <> 4096 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:198
//		TC	+4
// slot 7440
                                if slot <> 7440 or instruction <> 1300 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1300, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7441 {
// FRESH_START_AND_RESTART.agc:199
//		CA	BITS4&6
// slot 7441
                            if slot <> 7441 or instruction <> 14875 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2587), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7442 {
// FRESH_START_AND_RESTART.agc:200
//		EXTEND			# THE IMU WAS IN COARSE ALIGN IN GIMBAL
// slot 7442
                                if slot <> 7442 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:201
//		WOR	CHAN12		# LOCK, SO PUT IT BACK INTO COARSE ALIGN.
// slot 7443
                                if slot <> 7443 or instruction <> 2570 { return choose false if checkOnly else -1. }
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
        }
    } else {
        if slot <= 7465 {
            if slot <= 7454 {
                if slot <= 7448 {
                    if slot <= 7445 {
                        if slot <= 7444 {
// FRESH_START_AND_RESTART.agc:202
//		TC	MR.KLEAN
// slot 7444
                            if slot <> 7444 or instruction <> 1345 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1345, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FRESH_START_AND_RESTART.agc:203
//
// FRESH_START_AND_RESTART.agc:204
//		CS	ZERO
// slot 7445
                            if slot <> 7445 or instruction <> 18961 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7446 {
// FRESH_START_AND_RESTART.agc:205
//		TS	MODREG
// slot 7446
                            if slot <> 7446 or instruction <> 23049 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23049, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7447 {
// FRESH_START_AND_RESTART.agc:206
//
// FRESH_START_AND_RESTART.agc:207
//		CAF	PRIO30
// slot 7447
                                if slot <> 7447 or instruction <> 14585 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2297), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:208
//		TS	RESTREG
// slot 7448
                                if slot <> 7448 or instruction <> 22774 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22774, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7451 {
                        if slot <= 7449 {
// FRESH_START_AND_RESTART.agc:209
//
// FRESH_START_AND_RESTART.agc:210
//		CAF	IM30INIF	# FRESH START IMU INITIALIZATION.
// slot 7449
                            if slot <> 7449 or instruction <> 13951 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1663), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7450 {
// FRESH_START_AND_RESTART.agc:211
//		TS	IMODES30
// slot 7450
                                if slot <> 7450 or instruction <> 23248 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23248, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:212
//
// FRESH_START_AND_RESTART.agc:213
//		CAF	NEGONE
// slot 7451
                                if slot <> 7451 or instruction <> 16334 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 4046), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7452 {
// FRESH_START_AND_RESTART.agc:214
//		TS	OPTIND		# KILL COARSE OPTICS
// slot 7452
                            if slot <> 7452 or instruction <> 23235 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23235, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7453 {
// FRESH_START_AND_RESTART.agc:215
//
// FRESH_START_AND_RESTART.agc:216
//		CAF	OPTINITF
// slot 7453
                                if slot <> 7453 or instruction <> 13954 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1666), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:217
//		TS	OPTMODES
// slot 7454
                                if slot <> 7454 or instruction <> 23257 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23257, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 7459 {
                    if slot <= 7456 {
                        if slot <= 7455 {
// FRESH_START_AND_RESTART.agc:218
//
// FRESH_START_AND_RESTART.agc:219
//		CAF	IM33INIT
// slot 7455
                            if slot <> 7455 or instruction <> 14904 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2616), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FRESH_START_AND_RESTART.agc:220
//		TS	IMODES33
// slot 7456
                            if slot <> 7456 or instruction <> 23249 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23249, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7457 {
// FRESH_START_AND_RESTART.agc:221
//
// FRESH_START_AND_RESTART.agc:222
//		EXTEND			# LET T5 IDLE.
// slot 7457
                            if slot <> 7457 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7458 {
// FRESH_START_AND_RESTART.agc:223
//		DCA	T5IDLER
// slot 7458
                                if slot <> 7458 or instruction <> 13934 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 1646, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:224
//		DXCH	T5LOC
// slot 7459
                                if slot <> 7459 or instruction <> 22219 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 715, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7462 {
                        if slot <= 7460 {
// FRESH_START_AND_RESTART.agc:225
//
// FRESH_START_AND_RESTART.agc:226
//		CA	SWINIT
// slot 7460
                            if slot <> 7460 or instruction <> 13956 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1668), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7461 {
// FRESH_START_AND_RESTART.agc:227
//		TS	STATE
// slot 7461
                                if slot <> 7461 or instruction <> 22588 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22588, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:228
//
// FRESH_START_AND_RESTART.agc:229
//		CA	FLAGWRD1
// slot 7462
                                if slot <> 7462 or instruction <> 12349 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 61).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7463 {
// FRESH_START_AND_RESTART.agc:230
//		MASK	NOP01BIT	# LEAVE NODOP01 FLAG UNTOUCHED
// slot 7463
                            if slot <> 7463 or instruction <> 31236 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2564), 32768).
                                if fixedOperand = 2048 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 2048), 2) * 2048).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7464 {
// FRESH_START_AND_RESTART.agc:231
//		AD	SWINIT +1
// slot 7464
                                if slot <> 7464 or instruction <> 26245 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 1669), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:232
//		TS	FLAGWRD1
// slot 7465
                                if slot <> 7465 or instruction <> 22589 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22589, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 7476 {
                if slot <= 7470 {
                    if slot <= 7467 {
                        if slot <= 7466 {
// FRESH_START_AND_RESTART.agc:233
//
// FRESH_START_AND_RESTART.agc:234
//		CA 	SWINIT +2
// slot 7466
                            if slot <> 7466 or instruction <> 13958 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1670), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FRESH_START_AND_RESTART.agc:235
//		TS	STATE +2
// slot 7467
                            if slot <> 7467 or instruction <> 22590 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22590, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7468 {
// FRESH_START_AND_RESTART.agc:236
//
// FRESH_START_AND_RESTART.agc:237
//		CA	FLAGWRD3
// slot 7468
                            if slot <> 7468 or instruction <> 12351 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 63).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7469 {
// FRESH_START_AND_RESTART.agc:238
//# Page 185
// FRESH_START_AND_RESTART.agc:239
//		MASK	BIT13		# REFSMMAT FLAG
// slot 7469
                                if slot <> 7469 or instruction <> 31235 { return choose false if checkOnly else -1. }
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
// FRESH_START_AND_RESTART.agc:240
//		AD	SWINIT +3
// slot 7470
                                if slot <> 7470 or instruction <> 26247 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 1671), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7473 {
                        if slot <= 7471 {
// FRESH_START_AND_RESTART.agc:241
//		TS	FLAGWRD3
// slot 7471
                            if slot <> 7471 or instruction <> 22591 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22591, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7472 {
// FRESH_START_AND_RESTART.agc:242
//
// FRESH_START_AND_RESTART.agc:243
//		EXTEND
// slot 7472
                                if slot <> 7472 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:244
//		DCA	SWINIT +4
// slot 7473
                                if slot <> 7473 or instruction <> 13961 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 1673, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7474 {
// FRESH_START_AND_RESTART.agc:245
//		DXCH	STATE +4
// slot 7474
                            if slot <> 7474 or instruction <> 21569 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 65, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7475 {
// FRESH_START_AND_RESTART.agc:246
//		EXTEND
// slot 7475
                                if slot <> 7475 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:247
//		DCA	SWINIT +6
// slot 7476
                                if slot <> 7476 or instruction <> 13963 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 1675, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 7481 {
                    if slot <= 7478 {
                        if slot <= 7477 {
// FRESH_START_AND_RESTART.agc:248
//		DXCH	STATE +6
// slot 7477
                            if slot <> 7477 or instruction <> 21571 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 67, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FRESH_START_AND_RESTART.agc:249
//		CA	FLAGWRD8
// slot 7478
                            if slot <> 7478 or instruction <> 12356 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 68).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7479 {
// FRESH_START_AND_RESTART.agc:250
//		MASK	OCT6200		# CMOONFLG, LMOONFLG, AND SUFFLAG
// slot 7479
                            if slot <> 7479 or instruction <> 30037 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 1365), 32768).
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7480 {
// FRESH_START_AND_RESTART.agc:251
//		AD	SWINIT	+8D
// slot 7480
                                if slot <> 7480 or instruction <> 26252 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 1676), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:252
//		TS	FLAGWRD8
// slot 7481
                                if slot <> 7481 or instruction <> 22596 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22596, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7484 {
                        if slot <= 7482 {
// FRESH_START_AND_RESTART.agc:253
//
// FRESH_START_AND_RESTART.agc:254
//		CA	SWINIT +9D
// slot 7482
                            if slot <> 7482 or instruction <> 13965 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1677), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7483 {
// FRESH_START_AND_RESTART.agc:255
//		TS	STATE +9D
// slot 7483
                                if slot <> 7483 or instruction <> 22597 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22597, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:256
//
// FRESH_START_AND_RESTART.agc:257
//		EXTEND
// slot 7484
                                if slot <> 7484 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7485 {
// FRESH_START_AND_RESTART.agc:258
//		DCA	SWINIT +10D
// slot 7485
                            if slot <> 7485 or instruction <> 13967 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 1679, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7486 {
// FRESH_START_AND_RESTART.agc:259
//		DXCH	STATE +10D
// slot 7486
                                if slot <> 7486 or instruction <> 21575 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 71, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:260
//
// FRESH_START_AND_RESTART.agc:261
//ENDRSTRT	TC	POSTJUMP
// slot 7487
                                if slot <> 7487 or instruction <> 2497 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[419] to agcAotUnit419@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:262
//		CADR	DUMMYJOB +2	# DOES A RELINT.  (IN A SWITCHED BANK.)
// slot 7488
    7488, 3370
)).

// bank 05, slots 7489-7508
function agcAotUnit420 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7498 {
        if slot <= 7493 {
            if slot <= 7490 {
                if slot <= 7489 {
// FRESH_START_AND_RESTART.agc:263
//
// FRESH_START_AND_RESTART.agc:264
//MR.KLEAN	INHINT
// slot 7489
                    if slot <> 7489 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:265
//		EXTEND
// slot 7490
                    if slot <> 7490 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7491 {
// FRESH_START_AND_RESTART.agc:266
//		DCA	NEG0
// slot 7491
                    if slot <> 7491 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 2577, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7492 {
// FRESH_START_AND_RESTART.agc:267
//		DXCH	-PHASE2
// slot 7492
                        if slot <> 7492 or instruction <> 21997 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 493, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:268
//P00KLEAN	EXTEND
// slot 7493
                        if slot <> 7493 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 7495 {
                if slot <= 7494 {
// FRESH_START_AND_RESTART.agc:269
//		DCA	NEG0
// slot 7494
                    if slot <> 7494 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 2577, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:270
//		DXCH	-PHASE4
// slot 7495
                    if slot <> 7495 or instruction <> 22001 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 497, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7496 {
// FRESH_START_AND_RESTART.agc:271
//		EXTEND
// slot 7496
                    if slot <> 7496 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7497 {
// FRESH_START_AND_RESTART.agc:272
//		DCA	NEG0
// slot 7497
                        if slot <> 7497 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 2577, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:273
//		DXCH	-PHASE1
// slot 7498
                        if slot <> 7498 or instruction <> 21995 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 491, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 7503 {
            if slot <= 7500 {
                if slot <= 7499 {
// FRESH_START_AND_RESTART.agc:274
//V37KLEAN	EXTEND
// slot 7499
                    if slot <> 7499 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:275
//		DCA	NEG0
// slot 7500
                    if slot <> 7500 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 2577, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7501 {
// FRESH_START_AND_RESTART.agc:276
//		DXCH	-PHASE3
// slot 7501
                    if slot <> 7501 or instruction <> 21999 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 495, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7502 {
// FRESH_START_AND_RESTART.agc:277
//		EXTEND
// slot 7502
                        if slot <> 7502 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:278
//		DCA	NEG0
// slot 7503
                        if slot <> 7503 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 2577, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 7505 {
                if slot <= 7504 {
// FRESH_START_AND_RESTART.agc:279
//		DXCH	-PHASE5
// slot 7504
                    if slot <> 7504 or instruction <> 22003 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 499, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:280
//		EXTEND
// slot 7505
                    if slot <> 7505 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7506 {
// FRESH_START_AND_RESTART.agc:281
//		DCA	NEG0
// slot 7506
                    if slot <> 7506 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 2577, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7507 {
// FRESH_START_AND_RESTART.agc:282
//		DXCH	-PHASE6
// slot 7507
                        if slot <> 7507 or instruction <> 22005 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 501, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:283
//		TC	Q
// slot 7508
                        if slot <> 7508 or instruction <> 2 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[420] to agcAotUnit420@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:284
//
// FRESH_START_AND_RESTART.agc:285
//OCT6200	OCT	6200
// slot 7509
    7509, 6400
)).

// bank 05, slots 7510-7515
function agcAotUnit421 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7512 {
        if slot <= 7510 {
// FRESH_START_AND_RESTART.agc:286
//
// FRESH_START_AND_RESTART.agc:287
//# Page 186
// FRESH_START_AND_RESTART.agc:288
//# COMES HERE FROM LOCATION 4000, GOJAM, RESTART ANY PROGRAMS WHICH MAY HAVE BEEN RUNNING AT THE TIME.
// FRESH_START_AND_RESTART.agc:289
//
// FRESH_START_AND_RESTART.agc:290
//GOPROG		INCR	REDOCTR		# ADVANCE RESTART COUNTER.
// slot 7510
            if slot <> 7510 or instruction <> 10860 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 620).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 7511 {
// FRESH_START_AND_RESTART.agc:291
//
// FRESH_START_AND_RESTART.agc:292
//		LXCH	Q
// slot 7511
                if slot <> 7511 or instruction <> 9218 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 2, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// FRESH_START_AND_RESTART.agc:293
//		EXTEND
// slot 7512
                if slot <> 7512 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 7513 {
// FRESH_START_AND_RESTART.agc:294
//		ROR	SUPERBNK
// slot 7513
            if slot <> 7513 or instruction <> 2055 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreChannelInstruction(words, 4, 7, channelAdapter).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 7514 {
// FRESH_START_AND_RESTART.agc:295
//		DXCH	RSBBQ
// slot 7514
                if slot <> 7514 or instruction <> 22299 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 795, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// FRESH_START_AND_RESTART.agc:296
//		TC	BANKCALL	# STORE ERASABLES FOR DEBUGGING PURPOSES.
// slot 7515
                if slot <> 7515 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[421] to agcAotUnit421@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:297
//		CADR	VAC5STOR
// slot 7516
    7516, 32768
)).

// bank 05, slots 7517-7526
function agcAotUnit422 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7521 {
        if slot <= 7518 {
            if slot <= 7517 {
// FRESH_START_AND_RESTART.agc:298
//		CA	BIT15		# TEST OSC FAIL BIT TO SEE IF WE HAVE
// slot 7517
                if slot <> 7517 or instruction <> 14849 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// FRESH_START_AND_RESTART.agc:299
//		EXTEND			# HAD A POWER TRANSIENT.  IF SO, ATTEMPT
// slot 7518
                if slot <> 7518 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 7519 {
// FRESH_START_AND_RESTART.agc:300
//		WAND	CHAN33		# A RESTART.  IF NOT, CHECK THE PRESENT
// slot 7519
                if slot <> 7519 or instruction <> 1563 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 3, 27, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 7520 {
// FRESH_START_AND_RESTART.agc:301
//		EXTEND			# STATE OF AGC WARNING BIT.
// slot 7520
                    if slot <> 7520 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:302
//		BZF	BUTTONS
// slot 7521
                    if slot <> 7521 or instruction <> 5479 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5479, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 7523 {
            if slot <= 7522 {
// FRESH_START_AND_RESTART.agc:303
//
// FRESH_START_AND_RESTART.agc:304
//		CA	BIT14		# IF AGC WARNING ON (BIT = 0), DO A
// slot 7522
                if slot <> 7522 or instruction <> 14850 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// FRESH_START_AND_RESTART.agc:305
//		EXTEND			# FRESH START ON THE ASSUMPTION THAT
// slot 7523
                if slot <> 7523 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 7524 {
// FRESH_START_AND_RESTART.agc:306
//		RAND	CHAN33		# WE ARE IN A RESTART LOOP.
// slot 7524
                if slot <> 7524 or instruction <> 1051 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 2, 27, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 7525 {
// FRESH_START_AND_RESTART.agc:307
//		EXTEND
// slot 7525
                    if slot <> 7525 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:308
//		BZF	NONAVKEY +1
// slot 7526
                    if slot <> 7526 or instruction <> 5628 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5628, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[422] to agcAotUnit422@.

// bank 05, slots 7527-7544
function agcAotUnit423 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7535 {
        if slot <= 7530 {
            if slot <= 7528 {
                if slot <= 7527 {
// FRESH_START_AND_RESTART.agc:309
//
// FRESH_START_AND_RESTART.agc:310
//BUTTONS		TC	LIGHTSET	# MAKE FRESH START CHECKS BEFORE ERESTORE.
// slot 7527
                    if slot <> 7527 or instruction <> 1515 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1515, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:311
//
// FRESH_START_AND_RESTART.agc:312
//# ERASCHK TEMPORARILY STORES THE CONTENTS OF TWO ERASABLE LOCATIONS, X
// FRESH_START_AND_RESTART.agc:313
//# AND X+1 INTO SKEEP5 AND SKEEP6.  IT ALSO STORES X INTO SKEEP7 AND
// FRESH_START_AND_RESTART.agc:314
//# ERESTORE.  IF ERASCHK IS INTERRUPTED BY A RESTART, C(ERESTORE) SHOULD
// FRESH_START_AND_RESTART.agc:315
//# EQUAL C(SKEEP7),AND SHOULD BE A + NUMBER LESS THAN 2000 OCT.  OTHERWISE
// FRESH_START_AND_RESTART.agc:316
//# C(ERESTORE) SHOULD EQUAL +0.
// FRESH_START_AND_RESTART.agc:317
//
// FRESH_START_AND_RESTART.agc:318
//		CAF	HI5
// slot 7528
                    if slot <> 7528 or instruction <> 14580 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2292), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7529 {
// FRESH_START_AND_RESTART.agc:319
//		MASK	ERESTORE
// slot 7529
                    if slot <> 7529 or instruction <> 29424 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 752).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:320
//		EXTEND
// slot 7530
                    if slot <> 7530 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 7532 {
                if slot <= 7531 {
// FRESH_START_AND_RESTART.agc:321
//		BZF	+2		# IF ERESTORE NOT = +0 OR +N LESS THAN 2K,
// slot 7531
                    if slot <> 7531 or instruction <> 5485 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5485, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:322
//		TCF	NONAVKEY +1	# DOUBT E MEMORY AND DO A FRESH START.
// slot 7532
                    if slot <> 7532 or instruction <> 5628 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5628, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7533 {
// FRESH_START_AND_RESTART.agc:323
//		CS	ERESTORE
// slot 7533
                    if slot <> 7533 or instruction <> 17136 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 752).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7534 {
// FRESH_START_AND_RESTART.agc:324
//		EXTEND
// slot 7534
                        if slot <> 7534 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:325
//		BZF	ELRSKIP -1
// slot 7535
                        if slot <> 7535 or instruction <> 5500 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5500, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 7539 {
            if slot <= 7537 {
                if slot <= 7536 {
// FRESH_START_AND_RESTART.agc:326
//		AD	SKEEP7
// slot 7536
                    if slot <> 7536 or instruction <> 25343 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 767).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:327
//		EXTEND
// slot 7537
                    if slot <> 7537 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7538 {
// FRESH_START_AND_RESTART.agc:328
//		BZF	+2		# = SKEEP7, RESTORE E MEMORY.
// slot 7538
                    if slot <> 7538 or instruction <> 5492 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5492, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:329
//		TCF	NONAVKEY +1	# NOT=SKEEP7, DOUBT EMEM, DO FRESH START
// slot 7539
                    if slot <> 7539 or instruction <> 5628 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5628, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 7541 {
                if slot <= 7540 {
// FRESH_START_AND_RESTART.agc:330
//		CA	SKEEP4
// slot 7540
                    if slot <> 7540 or instruction <> 13052 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 764).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:331
//		TS	EBANK		# EBANK OF E MEMORY THAT WAS UNDER TEST.
// slot 7541
                    if slot <> 7541 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7542 {
// FRESH_START_AND_RESTART.agc:332
//		EXTEND			# (NOT DXCH SINCE THIS MIGHT HAPPEN AGAIN)
// slot 7542
                    if slot <> 7542 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7543 {
// FRESH_START_AND_RESTART.agc:333
//		DCA	SKEEP5
// slot 7543
                        if slot <> 7543 or instruction <> 13054 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 766, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:334
//		INDEX	SKEEP7
// slot 7544
                        if slot <> 7544 or instruction <> 21247 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21247, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21247, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[423] to agcAotUnit423@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:335
//		DXCH	0000		# E MEMORY RESTORED.
// slot 7545
    7545, 43010
)).

// bank 05, slots 7546-7554
function agcAotUnit424 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7549 {
        if slot <= 7547 {
            if slot <= 7546 {
// FRESH_START_AND_RESTART.agc:336
//		CA	ZERO
// slot 7546
                if slot <> 7546 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// FRESH_START_AND_RESTART.agc:337
//		TS	ERESTORE
// slot 7547
                if slot <> 7547 or instruction <> 23280 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23280, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 7548 {
// FRESH_START_AND_RESTART.agc:338
//# Page 187
// FRESH_START_AND_RESTART.agc:339
//		TC	STARTSUB	# DO INITIALIZATION AFTER ERASE RESTORE.
// slot 7548
                if slot <> 7548 or instruction <> 1534 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1534, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// FRESH_START_AND_RESTART.agc:340
//ELRSKIP		CA	FLAGWRD6	# RESTART AUTOPILOTS
// slot 7549
                if slot <> 7549 or instruction <> 12354 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 66).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 7551 {
            if slot <= 7550 {
// FRESH_START_AND_RESTART.agc:341
//		EXTEND
// slot 7550
                if slot <> 7550 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// FRESH_START_AND_RESTART.agc:342
//		MP	BIT3		# BITS 15,14	00 T5IDLOC
// slot 7551
                if slot <> 7551 or instruction <> 31245 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 2573, readEffective:call(words, 2573)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 7552 {
// FRESH_START_AND_RESTART.agc:343
//		MASK	SIX		#		01 REDORCS
// slot 7552
                if slot <> 7552 or instruction <> 31881 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 3209), 32768).
                    if fixedOperand = 6 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 2), 4) * 2).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 7553 {
// FRESH_START_AND_RESTART.agc:344
//		EXTEND			#		10 REDOTVC
// slot 7553
                    if slot <> 7553 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:345
//		INDEX	A		#		11 REDOSAT
// slot 7554
                    if slot <> 7554 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[424] to agcAotUnit424@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:346
//		DCA	T5IDLER
// slot 7555
    7555, 27868
)).

// bank 05, slots 7556-7575
function agcAotUnit425 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7565 {
        if slot <= 7560 {
            if slot <= 7557 {
                if slot <= 7556 {
// FRESH_START_AND_RESTART.agc:347
//		DXCH	T5LOC
// slot 7556
                    if slot <> 7556 or instruction <> 22219 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 715, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:348
//
// FRESH_START_AND_RESTART.agc:349
//		CS	INTFLBIT
// slot 7557
                    if slot <> 7557 or instruction <> 18946 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7558 {
// FRESH_START_AND_RESTART.agc:350
//		MASK	RASFLAG
// slot 7558
                    if slot <> 7558 or instruction <> 28742 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 70).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7559 {
// FRESH_START_AND_RESTART.agc:351
//		TS	RASFLAG
// slot 7559
                        if slot <> 7559 or instruction <> 22598 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22598, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:352
//
// FRESH_START_AND_RESTART.agc:353
//		CA	OPTMODES
// slot 7560
                        if slot <> 7560 or instruction <> 13017 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 729).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 7562 {
                if slot <= 7561 {
// FRESH_START_AND_RESTART.agc:354
//		MASK	OPTINITR
// slot 7561
                    if slot <> 7561 or instruction <> 30339 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 1667), 32768).
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:355
//		AD	BIT7
// slot 7562
                    if slot <> 7562 or instruction <> 27145 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2569), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7563 {
// FRESH_START_AND_RESTART.agc:356
//		TS	OPTMODES
// slot 7563
                    if slot <> 7563 or instruction <> 23257 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23257, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7564 {
// FRESH_START_AND_RESTART.agc:357
//
// FRESH_START_AND_RESTART.agc:358
//		CAF	BIT6
// slot 7564
                        if slot <> 7564 or instruction <> 14858 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:359
//		MASK	IMODES33
// slot 7565
                        if slot <> 7565 or instruction <> 29393 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 721).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 7570 {
            if slot <= 7567 {
                if slot <= 7566 {
// FRESH_START_AND_RESTART.agc:360
//		AD	IM33INIT
// slot 7566
                    if slot <> 7566 or instruction <> 27192 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2616), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:361
//		TS	IMODES33
// slot 7567
                    if slot <> 7567 or instruction <> 23249 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23249, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7568 {
// FRESH_START_AND_RESTART.agc:362
//
// FRESH_START_AND_RESTART.agc:363
//		CA	9,6,4		# LEAVE PROG ALARM,GIMBAL LOCK, NO ATT
// slot 7568
                    if slot <> 7568 or instruction <> 13953 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1665), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7569 {
// FRESH_START_AND_RESTART.agc:364
//		MASK	DSPTAB +11D	# LAMPS INTACT ON HARDWARE RESTART
// slot 7569
                        if slot <> 7569 or instruction <> 29214 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 542).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:365
//		AD	BIT15
// slot 7570
                        if slot <> 7570 or instruction <> 27137 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 7572 {
                if slot <= 7571 {
// FRESH_START_AND_RESTART.agc:366
//		XCH	DSPTAB +11D
// slot 7571
                    if slot <> 7571 or instruction <> 24094 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 542, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:367
//		MASK	BIT4		# IF NO ATT LAMP WAS ON, LEAVE ISS IN
// slot 7572
                    if slot <> 7572 or instruction <> 31244 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                        if fixedOperand = 8 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 8), 2) * 8).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7573 {
// FRESH_START_AND_RESTART.agc:368
//		EXTEND			# COURSE ALIGN
// slot 7573
                    if slot <> 7573 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7574 {
// FRESH_START_AND_RESTART.agc:369
//		BZF	NOCOARSE
// slot 7574
                        if slot <> 7574 or instruction <> 5533 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5533, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:370
//		TC	IBNKCALL	# IF NO ATT LAMP ON, RETURN ISS TO
// slot 7575
                        if slot <> 7575 or instruction <> 2528 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[425] to agcAotUnit425@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:371
//		CADR	SETCOARS	#	COARSE ALIGN.
// slot 7576
    7576, 15406
)).

// bank 05, slots 7577-7578
function agcAotUnit426 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7577 {
// FRESH_START_AND_RESTART.agc:372
//
// FRESH_START_AND_RESTART.agc:373
//		CAF	SIX
// slot 7577
        if slot <> 7577 or instruction <> 15497 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 3209), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// FRESH_START_AND_RESTART.agc:374
//		TC	WAITLIST
// slot 7578
        if slot <> 7578 or instruction <> 2725 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2725, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[426] to agcAotUnit426@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:375
//		EBANK=	CDUIND
// FRESH_START_AND_RESTART.agc:376
//		2CADR	CA+ECE
// slot 7579 7580
    7579, 3110, 7580, 14438
)).

// bank 05, slots 7581-7604
function agcAotUnit427 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7592 {
        if slot <= 7586 {
            if slot <= 7583 {
                if slot <= 7581 {
// FRESH_START_AND_RESTART.agc:377
//
// FRESH_START_AND_RESTART.agc:378
//NOCOARSE	CAF	IFAILINH	# LEAVE FAILURE INHIBITS INTACT ON
// slot 7581
                    if slot <> 7581 or instruction <> 13941 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1653), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7582 {
// FRESH_START_AND_RESTART.agc:379
//		MASK	IMODES30	#	HARDWARE RESTART.  RESET ALL
// slot 7582
                        if slot <> 7582 or instruction <> 29392 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 720).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:380
//		AD	IM30INIR	#	FAILURE CODES.
// slot 7583
                        if slot <> 7583 or instruction <> 26240 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1664), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 7584 {
// FRESH_START_AND_RESTART.agc:381
//		TS	IMODES30
// slot 7584
                    if slot <> 7584 or instruction <> 23248 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23248, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7585 {
// FRESH_START_AND_RESTART.agc:382
//
// FRESH_START_AND_RESTART.agc:383
//		CS	FLAGWRD5
// slot 7585
                        if slot <> 7585 or instruction <> 16449 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 65).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:384
//		MASK	ENGONBIT
// slot 7586
                        if slot <> 7586 or instruction <> 31241 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2569), 32768).
                            if fixedOperand = 64 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 64), 2) * 64).
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
            if slot <= 7589 {
                if slot <= 7587 {
// FRESH_START_AND_RESTART.agc:385
//		CCS	A
// slot 7587
                    if slot <> 7587 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7588 {
// FRESH_START_AND_RESTART.agc:386
//		TCF	GOPROG3
// slot 7588
                        if slot <> 7588 or instruction <> 5559 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5559, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:387
//		CAF	BIT13
// slot 7589
                        if slot <> 7589 or instruction <> 14851 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 7590 {
// FRESH_START_AND_RESTART.agc:388
//		EXTEND
// slot 7590
                    if slot <> 7590 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7591 {
// FRESH_START_AND_RESTART.agc:389
//# Page 188
// FRESH_START_AND_RESTART.agc:390
//		WOR	DSALMOUT	# TURN ENGINE ON
// slot 7591
                        if slot <> 7591 or instruction <> 2569 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 5, 9, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:391
//		TCF	GOPROG3
// slot 7592
                        if slot <> 7592 or instruction <> 5559 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5559, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 7598 {
            if slot <= 7595 {
                if slot <= 7593 {
// FRESH_START_AND_RESTART.agc:392
//
// FRESH_START_AND_RESTART.agc:393
//ENEMA		INHINT
// slot 7593
                    if slot <> 7593 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7594 {
// FRESH_START_AND_RESTART.agc:394
//		TC	LIGHTSET	# EXIT TO DOFSTART IF ERROR RESET AND
// slot 7594
                        if slot <> 7594 or instruction <> 1515 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1515, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:395
//		TC	STARTSB2	# MARK REJECT DEPRESSED SIMULTANEOUSLY
// slot 7595
                        if slot <> 7595 or instruction <> 1542 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1542, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 7596 {
// FRESH_START_AND_RESTART.agc:396
//		CS	INTMASK		# RESET INTEGRATION BITS
// slot 7596
                    if slot <> 7596 or instruction <> 18042 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 1658), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7597 {
// FRESH_START_AND_RESTART.agc:397
//		MASK	RASFLAG
// slot 7597
                        if slot <> 7597 or instruction <> 28742 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 70).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:398
//		TS	RASFLAG
// slot 7598
                        if slot <> 7598 or instruction <> 22598 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22598, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 7601 {
                if slot <= 7599 {
// FRESH_START_AND_RESTART.agc:399
//
// FRESH_START_AND_RESTART.agc:400
//		CS	FLAGWRD6	# IS TVC ON
// slot 7599
                    if slot <> 7599 or instruction <> 16450 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 66).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7600 {
// FRESH_START_AND_RESTART.agc:401
//		MASK	OCT60000
// slot 7600
                        if slot <> 7600 or instruction <> 30789 { return choose false if checkOnly else -1. }
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
// FRESH_START_AND_RESTART.agc:402
//		EXTEND
// slot 7601
                        if slot <> 7601 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 7602 {
// FRESH_START_AND_RESTART.agc:403
//		BZMF	GOPROG3		# NO
// slot 7602
                    if slot <> 7602 or instruction <> 26039 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26039, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7603 {
// FRESH_START_AND_RESTART.agc:404
//
// FRESH_START_AND_RESTART.agc:405
//		CAF	.5SEC		# YES, CALL TVCEXEC TASK WHICH WAS KILLED
// slot 7603
                        if slot <> 7603 or instruction <> 14878 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2590), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:406
//		TC	WAITLIST	# 	IN STARTSB2.
// slot 7604
                        if slot <> 7604 or instruction <> 2725 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[427] to agcAotUnit427@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:407
//		EBANK=	BZERO
// FRESH_START_AND_RESTART.agc:408
//		2CADR	TVCEXEC
// slot 7605 7606
    7605, 2976, 7606, 28780
)).

// bank 05, slots 7607-7611
function agcAotUnit428 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7608 {
        if slot <= 7607 {
// FRESH_START_AND_RESTART.agc:409
//
// FRESH_START_AND_RESTART.agc:410
//GOPROG3		CAF	NUMGRPS		# VERIFY PHASE TABLE AGREEMENTS
// slot 7607
            if slot <> 7607 or instruction <> 14866 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2578), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// FRESH_START_AND_RESTART.agc:411
//PCLOOP		TS	MPAC +5
// slot 7608
            if slot <> 7608 or instruction <> 22641 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22641, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 7609 {
// FRESH_START_AND_RESTART.agc:412
//		DOUBLE
// slot 7609
            if slot <> 7609 or instruction <> 24576 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 7610 {
// FRESH_START_AND_RESTART.agc:413
//		EXTEND
// slot 7610
                if slot <> 7610 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// FRESH_START_AND_RESTART.agc:414
//		INDEX	A
// slot 7611
                if slot <> 7611 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[428] to agcAotUnit428@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:415
//		DCA	-PHASE1		# COMPLEMENT INTO A, DIRECT INTO L.
// slot 7612
    7612, 25558
)).

// bank 05, slots 7613-7636
function agcAotUnit429 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7624 {
        if slot <= 7618 {
            if slot <= 7615 {
                if slot <= 7613 {
// FRESH_START_AND_RESTART.agc:416
//		EXTEND
// slot 7613
                    if slot <> 7613 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7614 {
// FRESH_START_AND_RESTART.agc:417
//		RXOR	LCHAN		# RESULT MUST BE -0 FOR AGREEMENT.
// slot 7614
                        if slot <> 7614 or instruction <> 3073 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:418
//		CCS	A
// slot 7615
                        if slot <> 7615 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                if slot <= 7616 {
// FRESH_START_AND_RESTART.agc:419
//		TCF	PTBAD		# RESTART FAILURE.
// slot 7616
                    if slot <> 7616 or instruction <> 5606 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5606, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7617 {
// FRESH_START_AND_RESTART.agc:420
//		TCF	PTBAD
// slot 7617
                        if slot <> 7617 or instruction <> 5606 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5606, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:421
//		TCF	PTBAD
// slot 7618
                        if slot <> 7618 or instruction <> 5606 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5606, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 7621 {
                if slot <= 7619 {
// FRESH_START_AND_RESTART.agc:422
//
// FRESH_START_AND_RESTART.agc:423
//		CCS	MPAC +5		# PROCESS ALL RESTART GROUPS.
// slot 7619
                    if slot <> 7619 or instruction <> 4209 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 113).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7620 {
// FRESH_START_AND_RESTART.agc:424
//		TCF	PCLOOP
// slot 7620
                        if slot <> 7620 or instruction <> 5560 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5560, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:425
//
// FRESH_START_AND_RESTART.agc:426
//		TS	MPAC +6		# SET TO +0.
// slot 7621
                        if slot <> 7621 or instruction <> 22642 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22642, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 7622 {
// FRESH_START_AND_RESTART.agc:427
//		TC	MMDSPLAY	# DISPLAY MAJOR MODE
// slot 7622
                    if slot <> 7622 or instruction <> 2800 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2800, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7623 {
// FRESH_START_AND_RESTART.agc:428
//
// FRESH_START_AND_RESTART.agc:429
//		INHINT			# RELINT DONE IN MMDSPLAY
// slot 7623
                        if slot <> 7623 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:430
//
// FRESH_START_AND_RESTART.agc:431
//		CAE	FLAGWRD6	# IS RCS DAP RUNNING (BITS 15 14 OF
// slot 7624
                        if slot <> 7624 or instruction <> 12354 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 66).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 7630 {
            if slot <= 7627 {
                if slot <= 7625 {
// FRESH_START_AND_RESTART.agc:432
//		MASK	OCT60000	# FLAGWORD6 = 01)
// slot 7625
                    if slot <> 7625 or instruction <> 30789 { return choose false if checkOnly else -1. }
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
                    if slot <= 7626 {
// FRESH_START_AND_RESTART.agc:433
//		EXTEND			# YES, DO STOPRATE
// slot 7626
                        if slot <> 7626 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:434
//		BZMF	NXTRST -1	# NO, SKIP TO NXTRST -1
// slot 7627
                        if slot <> 7627 or instruction <> 26065 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26065, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 7628 {
// FRESH_START_AND_RESTART.agc:435
//		CAF	EBANK6		# STOPRATE IS DONE IN EBANK 6
// slot 7628
                    if slot <> 7628 or instruction <> 14895 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2607), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7629 {
// FRESH_START_AND_RESTART.agc:436
//		TS	EBANK
// slot 7629
                        if slot <> 7629 or instruction <> 22531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22531, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:437
//		TC	STOPRATE	# ZERO DELCDUS, WBODYS, AND BIASES THUS
// slot 7630
                        if slot <> 7630 or instruction <> 2390 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2390, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 7633 {
                if slot <= 7631 {
// FRESH_START_AND_RESTART.agc:438
//					# STOPPING AUTOMATIC MANEUVERING
// FRESH_START_AND_RESTART.agc:439
//
// FRESH_START_AND_RESTART.agc:440
//		CAF	EBANK3
// slot 7631
                    if slot <> 7631 or instruction <> 14889 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2601), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7632 {
// FRESH_START_AND_RESTART.agc:441
//		TS	EBANK
// slot 7632
                        if slot <> 7632 or instruction <> 22531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22531, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:442
//# Page 189
// FRESH_START_AND_RESTART.agc:443
//		CAF	NUMGRPS		# SEE IF ANY GROUPS RUNNING.
// slot 7633
                        if slot <> 7633 or instruction <> 14866 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2578), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 7634 {
// FRESH_START_AND_RESTART.agc:444
//NXTRST		TS	MPAC +5
// slot 7634
                    if slot <> 7634 or instruction <> 22641 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22641, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7635 {
// FRESH_START_AND_RESTART.agc:445
//		DOUBLE
// slot 7635
                        if slot <> 7635 or instruction <> 24576 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:446
//		INDEX	A
// slot 7636
                        if slot <> 7636 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[429] to agcAotUnit429@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:447
//		CCS	PHASE1
// slot 7637
    7637, 9174
)).

// bank 05, slots 7638-7654
function agcAotUnit430 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7645 {
        if slot <= 7641 {
            if slot <= 7639 {
                if slot <= 7638 {
// FRESH_START_AND_RESTART.agc:448
//		TCF	PACTIVE		# PNZ - GROUP ACTIVE.
// slot 7638
                    if slot <> 7638 or instruction <> 5592 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5592, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:449
//		TCF	PINACT		# +0 - GROUP NOT RUNNING.
// slot 7639
                    if slot <> 7639 or instruction <> 5597 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5597, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7640 {
// FRESH_START_AND_RESTART.agc:450
//
// FRESH_START_AND_RESTART.agc:451
//PACTIVE		TS	MPAC
// slot 7640
                    if slot <> 7640 or instruction <> 22636 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22636, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:452
//		INCR	MPAC		# ABS OF PHASE.
// slot 7641
                    if slot <> 7641 or instruction <> 10348 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 108).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 7643 {
                if slot <= 7642 {
// FRESH_START_AND_RESTART.agc:453
//		INCR	MPAC +6		# INDICATE GROUP DEMANDS PRESENT.
// slot 7642
                    if slot <> 7642 or instruction <> 10354 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 114).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:454
//		CA	RACTCADR
// slot 7643
                    if slot <> 7643 or instruction <> 13802 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1514), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7644 {
// FRESH_START_AND_RESTART.agc:455
//		TC	SWCALL		# MUST RETURN TO SWRETURN.
// slot 7644
                    if slot <> 7644 or instruction <> 2486 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2486, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:456
//
// FRESH_START_AND_RESTART.agc:457
//PINACT		CCS	MPAC +5		# PROCESS ALL RESTART GROUPS.
// slot 7645
                    if slot <> 7645 or instruction <> 4209 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 113).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 7649 {
            if slot <= 7647 {
                if slot <= 7646 {
// FRESH_START_AND_RESTART.agc:458
//		TCF	NXTRST
// slot 7646
                    if slot <> 7646 or instruction <> 5586 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5586, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:459
//
// FRESH_START_AND_RESTART.agc:460
//		CCS	MPAC +6		# NO, CHECK PHASE ACTIVITY FLAG
// slot 7647
                    if slot <> 7647 or instruction <> 4210 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 114).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7648 {
// FRESH_START_AND_RESTART.agc:461
//		TCF	ENDRSTRT	# PHASE ACTIVE
// slot 7648
                    if slot <> 7648 or instruction <> 5439 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5439, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:462
//		CAF	BIT15		# IS MODE -0
// slot 7649
                    if slot <> 7649 or instruction <> 14849 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 7651 {
                if slot <= 7650 {
// FRESH_START_AND_RESTART.agc:463
//		MASK	MODREG
// slot 7650
                    if slot <> 7650 or instruction <> 29193 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 521).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:464
//		EXTEND
// slot 7651
                    if slot <> 7651 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7652 {
// FRESH_START_AND_RESTART.agc:465
//		BZF	GOTOPOOH	# NO
// slot 7652
                    if slot <> 7652 or instruction <> 6214 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6214, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7653 {
// FRESH_START_AND_RESTART.agc:466
//		TCF	ENDRSTRT	# YES
// slot 7653
                        if slot <> 7653 or instruction <> 5439 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5439, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:467
//PTBAD		TC	ALARM		# SET ALARM TO SHOW PHASE TABLE FAILURE.
// slot 7654
                        if slot <> 7654 or instruction <> 2984 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2984, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[430] to agcAotUnit430@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:468
//		OCT	1107
// slot 7655
    7655, 1166
)).

// bank 05, slots 7656-7656
function agcAotUnit431 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// FRESH_START_AND_RESTART.agc:469
//
// FRESH_START_AND_RESTART.agc:470
//		TCF	DOFSTART	# IN R2).
// slot 7656
    if slot <> 7656 or instruction <> 5365 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5365, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[431] to agcAotUnit431@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:471
//
// FRESH_START_AND_RESTART.agc:472
//# ******** ****** ******
// FRESH_START_AND_RESTART.agc:473
//#
// FRESH_START_AND_RESTART.agc:474
//# DO NOT USE GOPROG2 OR ENEMA WITHOUT CONSULTING POOH PEOPLE
// FRESH_START_AND_RESTART.agc:475
//#
// FRESH_START_AND_RESTART.agc:476
//GOPROG2		EQUALS	ENEMA
// FRESH_START_AND_RESTART.agc:477
//OCT10000	=	BIT13
// FRESH_START_AND_RESTART.agc:478
//OCT30000	=	PRIO30
// FRESH_START_AND_RESTART.agc:479
//OCT7777		OCT	7777
// slot 7657
    7657, 8190,
// FRESH_START_AND_RESTART.agc:480
//RACTCADR	CADR	RESTARTS
// slot 7658
    7658, 3744
)).

// bank 05, slots 7659-7666
function agcAotUnit432 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7662 {
        if slot <= 7660 {
            if slot <= 7659 {
// FRESH_START_AND_RESTART.agc:481
//
// FRESH_START_AND_RESTART.agc:482
//LIGHTSET	CAF	BIT7		# DOFSTART IF MARK REJECT AND EITHER
// slot 7659
                if slot <> 7659 or instruction <> 14857 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2569), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// FRESH_START_AND_RESTART.agc:483
//		EXTEND			# ERROR LIGHT RESET BUTTONS ARE DEPRESSED
// slot 7660
                if slot <> 7660 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 7661 {
// FRESH_START_AND_RESTART.agc:484
//		RAND	NAVKEYIN
// slot 7661
                if slot <> 7661 or instruction <> 1038 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 2, 14, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// FRESH_START_AND_RESTART.agc:485
//		EXTEND
// slot 7662
                if slot <> 7662 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 7664 {
            if slot <= 7663 {
// FRESH_START_AND_RESTART.agc:486
//		BZF	NONAVKEY	# NO MARK REJECT
// slot 7663
                if slot <> 7663 or instruction <> 5627 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5627, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// FRESH_START_AND_RESTART.agc:487
//		CAF	OCT37
// slot 7664
                if slot <> 7664 or instruction <> 14578 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2290), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 7665 {
// FRESH_START_AND_RESTART.agc:488
//		EXTEND
// slot 7665
                if slot <> 7665 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// FRESH_START_AND_RESTART.agc:489
//		RAND	NAVKEYIN	# NAV DSKY KEYCODES,MARK,MARK REJECT
// slot 7666
                if slot <> 7666 or instruction <> 1038 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 2, 14, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[432] to agcAotUnit432@.

// bank 05, slots 7667-7750
function agcAotUnit433 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7708 {
        if slot <= 7687 {
            if slot <= 7676 {
                if slot <= 7671 {
                    if slot <= 7668 {
                        if slot <= 7667 {
// FRESH_START_AND_RESTART.agc:490
//		AD	-ELR
// slot 7667
                            if slot <> 7667 or instruction <> 26238 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1662), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FRESH_START_AND_RESTART.agc:491
//		EXTEND
// slot 7668
                            if slot <> 7668 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7669 {
// FRESH_START_AND_RESTART.agc:492
//		BZF	NONAVKEY +1
// slot 7669
                            if slot <> 7669 or instruction <> 5628 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5628, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7670 {
// FRESH_START_AND_RESTART.agc:493
//		EXTEND
// slot 7670
                                if slot <> 7670 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:494
//# Page 190
// FRESH_START_AND_RESTART.agc:495
//		READ	MNKEYIN		# MAIN DSKY KEYCODES
// slot 7671
                                if slot <> 7671 or instruction <> 13 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 0, 13, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7673 {
                        if slot <= 7672 {
// FRESH_START_AND_RESTART.agc:496
//		AD	-ELR
// slot 7672
                            if slot <> 7672 or instruction <> 26238 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1662), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FRESH_START_AND_RESTART.agc:497
//		EXTEND
// slot 7673
                            if slot <> 7673 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7674 {
// FRESH_START_AND_RESTART.agc:498
//		BZF	+2
// slot 7674
                            if slot <> 7674 or instruction <> 5628 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5628, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7675 {
// FRESH_START_AND_RESTART.agc:499
//
// FRESH_START_AND_RESTART.agc:500
//NONAVKEY	TC	Q
// slot 7675
                                if slot <> 7675 or instruction <> 2 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:501
//
// FRESH_START_AND_RESTART.agc:502
//		TC	STARTSUB
// slot 7676
                                if slot <> 7676 or instruction <> 1534 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1534, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 7681 {
                    if slot <= 7678 {
                        if slot <= 7677 {
// FRESH_START_AND_RESTART.agc:503
//		TCF	DOFSTART
// slot 7677
                            if slot <> 7677 or instruction <> 5365 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5365, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FRESH_START_AND_RESTART.agc:504
//STARTSUB	CAF	LDNPHAS1	# SET POINTER SO NEXT 20MS DOWNRUPT WILL
// slot 7678
                            if slot <> 7678 or instruction <> 13942 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1654), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7679 {
// FRESH_START_AND_RESTART.agc:505
//		TS	DNTMGOTO	# CAUSE THE CURRENT DOWNLIST TO BE
// slot 7679
                            if slot <> 7679 or instruction <> 22749 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22749, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7680 {
// FRESH_START_AND_RESTART.agc:506
//					# INTERRUPTED AND START SENDING FROM THE
// FRESH_START_AND_RESTART.agc:507
//					# BEGINNING OF THE CURRENT DOWNLIST.
// FRESH_START_AND_RESTART.agc:508
//		CAF	POSMAX
// slot 7680
                                if slot <> 7680 or instruction <> 14847 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:509
//		TS	TIME3		# 37777 TO TIME3.
// slot 7681
                                if slot <> 7681 or instruction <> 22550 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22550, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7684 {
                        if slot <= 7682 {
// FRESH_START_AND_RESTART.agc:510
//		AD	MINUS2
// slot 7682
                            if slot <> 7682 or instruction <> 28621 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 4045), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7683 {
// FRESH_START_AND_RESTART.agc:511
//		TS	TIME4		# 37775 TO TIME4.
// slot 7683
                                if slot <> 7683 or instruction <> 22551 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22551, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:512
//		AD	NEGONE
// slot 7684
                                if slot <> 7684 or instruction <> 28622 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 4046), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7685 {
// FRESH_START_AND_RESTART.agc:513
//		TS	TIME5		# 37774 TO TIME5.
// slot 7685
                            if slot <> 7685 or instruction <> 22552 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22552, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7686 {
// FRESH_START_AND_RESTART.agc:514
//
// FRESH_START_AND_RESTART.agc:515
//STARTSB2	CAF	OCT77603	# TURN OFF UPLINK ACTY, TEMP CAUTION, KR,
// slot 7686
                                if slot <> 7686 or instruction <> 13947 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1659), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:516
//		EXTEND			# FLASH, OP. ERROR, LEAVE OTHERS UNCHANGED
// slot 7687
                                if slot <> 7687 or instruction <> 6 { return choose false if checkOnly else -1. }
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
            if slot <= 7697 {
                if slot <= 7692 {
                    if slot <= 7689 {
                        if slot <= 7688 {
// FRESH_START_AND_RESTART.agc:517
//		WAND	DSALMOUT
// slot 7688
                            if slot <> 7688 or instruction <> 1545 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 3, 9, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FRESH_START_AND_RESTART.agc:518
//
// FRESH_START_AND_RESTART.agc:519
//		CAF	OCT74777	# TURN OFF TEST ALARMS, STANDBY ENABLE.
// slot 7689
                            if slot <> 7689 or instruction <> 13948 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1660), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7690 {
// FRESH_START_AND_RESTART.agc:520
//		EXTEND
// slot 7690
                            if slot <> 7690 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7691 {
// FRESH_START_AND_RESTART.agc:521
//		WAND	CHAN13
// slot 7691
                                if slot <> 7691 or instruction <> 1547 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 3, 11, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:522
//		CS	PRIO25		# CLEAR R21MARK, P21FLAG, AND SKIPVHF BIT.
// slot 7692
                                if slot <> 7692 or instruction <> 20402 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 4018), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7694 {
                        if slot <= 7693 {
// FRESH_START_AND_RESTART.agc:523
//		MASK	FLAGWRD2
// slot 7693
                            if slot <> 7693 or instruction <> 28734 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 62).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FRESH_START_AND_RESTART.agc:524
//		AD	SKIPVBIT	# NOW SET SKIPVHF FLAG.
// slot 7694
                            if slot <> 7694 or instruction <> 27142 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2566), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7695 {
// FRESH_START_AND_RESTART.agc:525
//		TS	FLAGWRD2
// slot 7695
                            if slot <> 7695 or instruction <> 22590 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22590, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7696 {
// FRESH_START_AND_RESTART.agc:526
//		EBANK=	LST1
// FRESH_START_AND_RESTART.agc:527
//		CAF	STARTEB
// slot 7696
                                if slot <> 7696 or instruction <> 13949 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1661), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:528
//		TS	EBANK		# SET FOR E3
// slot 7697
                                if slot <> 7697 or instruction <> 22531 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 7702 {
                    if slot <= 7699 {
                        if slot <= 7698 {
// FRESH_START_AND_RESTART.agc:529
//
// FRESH_START_AND_RESTART.agc:530
//		CAF	NEG1/2		# INITIALIZE WAITLIST DELTA-TS.
// slot 7698
                            if slot <> 7698 or instruction <> 14848 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2560), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FRESH_START_AND_RESTART.agc:531
//		TS	LST1 +7
// slot 7699
                            if slot <> 7699 or instruction <> 23303 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23303, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7700 {
// FRESH_START_AND_RESTART.agc:532
//		TS	LST1 +6
// slot 7700
                            if slot <> 7700 or instruction <> 23302 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23302, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7701 {
// FRESH_START_AND_RESTART.agc:533
//		TS	LST1 +5
// slot 7701
                                if slot <> 7701 or instruction <> 23301 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23301, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:534
//		TS	LST1 +4
// slot 7702
                                if slot <> 7702 or instruction <> 23300 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23300, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7705 {
                        if slot <= 7703 {
// FRESH_START_AND_RESTART.agc:535
//		TS	LST1 +3
// slot 7703
                            if slot <> 7703 or instruction <> 23299 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23299, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7704 {
// FRESH_START_AND_RESTART.agc:536
//		TS	LST1 +2
// slot 7704
                                if slot <> 7704 or instruction <> 23298 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23298, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:537
//		TS	LST1 +1
// slot 7705
                                if slot <> 7705 or instruction <> 23297 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23297, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7706 {
// FRESH_START_AND_RESTART.agc:538
//		TS	LST1
// slot 7706
                            if slot <> 7706 or instruction <> 23296 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23296, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7707 {
// FRESH_START_AND_RESTART.agc:539
//
// FRESH_START_AND_RESTART.agc:540
//		CS	ENDTASK
// slot 7707
                                if slot <> 7707 or instruction <> 19140 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2756), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:541
//		TS	LST2
// slot 7708
                                if slot <> 7708 or instruction <> 23304 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23304, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 7729 {
            if slot <= 7718 {
                if slot <= 7713 {
                    if slot <= 7710 {
                        if slot <= 7709 {
// FRESH_START_AND_RESTART.agc:542
//		TS	LST2 +2
// slot 7709
                            if slot <> 7709 or instruction <> 23306 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23306, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FRESH_START_AND_RESTART.agc:543
//		TS	LST2 +4
// slot 7710
                            if slot <> 7710 or instruction <> 23308 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23308, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7711 {
// FRESH_START_AND_RESTART.agc:544
//# Page 191
// FRESH_START_AND_RESTART.agc:545
//		TS	LST2 +6
// slot 7711
                            if slot <> 7711 or instruction <> 23310 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23310, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7712 {
// FRESH_START_AND_RESTART.agc:546
//		TS	LST2 +8D
// slot 7712
                                if slot <> 7712 or instruction <> 23312 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23312, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:547
//		TS	LST2 +10D
// slot 7713
                                if slot <> 7713 or instruction <> 23314 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23314, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7715 {
                        if slot <= 7714 {
// FRESH_START_AND_RESTART.agc:548
//		TS	LST2 +12D
// slot 7714
                            if slot <> 7714 or instruction <> 23316 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23316, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FRESH_START_AND_RESTART.agc:549
//		TS	LST2 +14D
// slot 7715
                            if slot <> 7715 or instruction <> 23318 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23318, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7716 {
// FRESH_START_AND_RESTART.agc:550
//		TS	LST2 +16D
// slot 7716
                            if slot <> 7716 or instruction <> 23320 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23320, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7717 {
// FRESH_START_AND_RESTART.agc:551
//		CS	ENDTASK +1
// slot 7717
                                if slot <> 7717 or instruction <> 19141 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2757), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:552
//		TS	LST2 +1
// slot 7718
                                if slot <> 7718 or instruction <> 23305 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23305, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 7723 {
                    if slot <= 7720 {
                        if slot <= 7719 {
// FRESH_START_AND_RESTART.agc:553
//		TS	LST2 +3
// slot 7719
                            if slot <> 7719 or instruction <> 23307 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23307, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FRESH_START_AND_RESTART.agc:554
//		TS	LST2 +5
// slot 7720
                            if slot <> 7720 or instruction <> 23309 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23309, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7721 {
// FRESH_START_AND_RESTART.agc:555
//		TS	LST2 +7
// slot 7721
                            if slot <> 7721 or instruction <> 23311 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23311, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7722 {
// FRESH_START_AND_RESTART.agc:556
//		TS	LST2 +9D
// slot 7722
                                if slot <> 7722 or instruction <> 23313 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23313, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:557
//		TS	LST2 +11D
// slot 7723
                                if slot <> 7723 or instruction <> 23315 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23315, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7726 {
                        if slot <= 7724 {
// FRESH_START_AND_RESTART.agc:558
//		TS	LST2 +13D
// slot 7724
                            if slot <> 7724 or instruction <> 23317 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23317, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7725 {
// FRESH_START_AND_RESTART.agc:559
//		TS	LST2 +15D
// slot 7725
                                if slot <> 7725 or instruction <> 23319 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23319, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:560
//		TS	LST2 +17D
// slot 7726
                                if slot <> 7726 or instruction <> 23321 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23321, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7727 {
// FRESH_START_AND_RESTART.agc:561
//
// FRESH_START_AND_RESTART.agc:562
//		CS	ZERO		# MAKE ALL EXECUTIVE REGISTER SETS
// slot 7727
                            if slot <> 7727 or instruction <> 18961 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7728 {
// FRESH_START_AND_RESTART.agc:563
//		TS	PRIORITY	# AVAILABLE.
// slot 7728
                                if slot <> 7728 or instruction <> 22647 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22647, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:564
//		TS	PRIORITY +12D
// slot 7729
                                if slot <> 7729 or instruction <> 22659 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22659, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 7739 {
                if slot <= 7734 {
                    if slot <= 7731 {
                        if slot <= 7730 {
// FRESH_START_AND_RESTART.agc:565
//		TS	PRIORITY +24D
// slot 7730
                            if slot <> 7730 or instruction <> 22671 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22671, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FRESH_START_AND_RESTART.agc:566
//		TS	PRIORITY +36D
// slot 7731
                            if slot <> 7731 or instruction <> 22683 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22683, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7732 {
// FRESH_START_AND_RESTART.agc:567
//		TS	PRIORITY +48D
// slot 7732
                            if slot <> 7732 or instruction <> 22695 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22695, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7733 {
// FRESH_START_AND_RESTART.agc:568
//		TS	PRIORITY +60D
// slot 7733
                                if slot <> 7733 or instruction <> 22707 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22707, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:569
//		TS	PRIORITY +72D
// slot 7734
                                if slot <> 7734 or instruction <> 22719 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22719, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7736 {
                        if slot <= 7735 {
// FRESH_START_AND_RESTART.agc:570
//
// FRESH_START_AND_RESTART.agc:571
//		TS	DSRUPTSW
// slot 7735
                            if slot <> 7735 or instruction <> 23234 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23234, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FRESH_START_AND_RESTART.agc:572
//		TS	NEWJOB		# SHOWS NO ACTIVE JOBS.
// slot 7736
                            if slot <> 7736 or instruction <> 22583 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22583, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7737 {
// FRESH_START_AND_RESTART.agc:573
//
// FRESH_START_AND_RESTART.agc:574
//		CAF	VAC1ADRC	# MAKE ALL VAC AREAS AVAILABLE.
// slot 7737
                            if slot <> 7737 or instruction <> 13944 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1656), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7738 {
// FRESH_START_AND_RESTART.agc:575
//		TS	VAC1USE
// slot 7738
                                if slot <> 7738 or instruction <> 22784 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22784, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:576
//		AD	LTHVACA
// slot 7739
                                if slot <> 7739 or instruction <> 26233 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 1657), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 7744 {
                    if slot <= 7741 {
                        if slot <= 7740 {
// FRESH_START_AND_RESTART.agc:577
//		TS	VAC2USE
// slot 7740
                            if slot <> 7740 or instruction <> 22828 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22828, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FRESH_START_AND_RESTART.agc:578
//		AD	LTHVACA
// slot 7741
                            if slot <> 7741 or instruction <> 26233 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1657), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7742 {
// FRESH_START_AND_RESTART.agc:579
//		TS	VAC3USE
// slot 7742
                            if slot <> 7742 or instruction <> 22872 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22872, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7743 {
// FRESH_START_AND_RESTART.agc:580
//		AD	LTHVACA
// slot 7743
                                if slot <> 7743 or instruction <> 26233 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 1657), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:581
//		TS	VAC4USE
// slot 7744
                                if slot <> 7744 or instruction <> 22916 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22916, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 7747 {
                        if slot <= 7745 {
// FRESH_START_AND_RESTART.agc:582
//		AD	LTHVACA
// slot 7745
                            if slot <> 7745 or instruction <> 26233 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1657), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7746 {
// FRESH_START_AND_RESTART.agc:583
//		TS	VAC5USE
// slot 7746
                                if slot <> 7746 or instruction <> 22960 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22960, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:584
//
// FRESH_START_AND_RESTART.agc:585
//		CAF	TEN		# BLANK DSKY REGISTERS (PROGRAM,VERB,NOUN,
// slot 7747
                                if slot <> 7747 or instruction <> 14591 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2303), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 7748 {
// FRESH_START_AND_RESTART.agc:586
//					# R1,R2,R3)
// FRESH_START_AND_RESTART.agc:587
//DSPOFF		TS	MPAC
// slot 7748
                            if slot <> 7748 or instruction <> 22636 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22636, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7749 {
// FRESH_START_AND_RESTART.agc:588
//		CS	BIT12
// slot 7749
                                if slot <> 7749 or instruction <> 18948 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2564), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// FRESH_START_AND_RESTART.agc:589
//		INDEX	MPAC
// slot 7750
                                if slot <> 7750 or instruction <> 20588 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[433] to agcAotUnit433@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:590
//		TS	DSPTAB
// slot 7751
    7751, 46118
)).

// bank 05, slots 7752-7788
function agcAotUnit434 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7769 {
        if slot <= 7760 {
            if slot <= 7755 {
                if slot <= 7753 {
                    if slot <= 7752 {
// FRESH_START_AND_RESTART.agc:591
//		CCS	MPAC
// slot 7752
                        if slot <> 7752 or instruction <> 4204 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 108).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:592
//		TCF	DSPOFF
// slot 7753
                        if slot <> 7753 or instruction <> 5700 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5700, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7754 {
// FRESH_START_AND_RESTART.agc:593
//
// FRESH_START_AND_RESTART.agc:594
//		TS	DELAYLOC
// slot 7754
                        if slot <> 7754 or instruction <> 23137 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23137, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:595
//# Page 192
// FRESH_START_AND_RESTART.agc:596
//		TS	DELAYLOC +1
// slot 7755
                        if slot <> 7755 or instruction <> 23138 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23138, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 7757 {
                    if slot <= 7756 {
// FRESH_START_AND_RESTART.agc:597
//		TS	DELAYLOC +2
// slot 7756
                        if slot <> 7756 or instruction <> 23139 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23139, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:598
//		TS	DELAYLOC +3
// slot 7757
                        if slot <> 7757 or instruction <> 23140 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23140, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7758 {
// FRESH_START_AND_RESTART.agc:599
//		TS	R1SAVE
// slot 7758
                        if slot <> 7758 or instruction <> 23099 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23099, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7759 {
// FRESH_START_AND_RESTART.agc:600
//		TS	INLINK
// slot 7759
                            if slot <> 7759 or instruction <> 22565 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22565, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FRESH_START_AND_RESTART.agc:601
//		TS	DSPCNT
// slot 7760
                            if slot <> 7760 or instruction <> 23038 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23038, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 7764 {
                if slot <= 7762 {
                    if slot <= 7761 {
// FRESH_START_AND_RESTART.agc:602
//		TS	CADRSTOR
// slot 7761
                        if slot <> 7761 or instruction <> 23074 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23074, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:603
//		TS	REQRET
// slot 7762
                        if slot <> 7762 or instruction <> 23051 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23051, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7763 {
// FRESH_START_AND_RESTART.agc:604
//		TS	CLPASS
// slot 7763
                        if slot <> 7763 or instruction <> 23053 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23053, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:605
//		TS	DSPLOCK
// slot 7764
                        if slot <> 7764 or instruction <> 23050 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23050, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 7766 {
                    if slot <= 7765 {
// FRESH_START_AND_RESTART.agc:606
//		TS	MONSAVE		# KILL MONITOR
// slot 7765
                        if slot <> 7765 or instruction <> 23056 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23056, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:607
//		TS	MONSAVE1
// slot 7766
                        if slot <> 7766 or instruction <> 23057 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23057, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7767 {
// FRESH_START_AND_RESTART.agc:608
//		TS	VERBREG
// slot 7767
                        if slot <> 7767 or instruction <> 23041 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23041, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7768 {
// FRESH_START_AND_RESTART.agc:609
//		TS	NOUNREG
// slot 7768
                            if slot <> 7768 or instruction <> 23042 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23042, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FRESH_START_AND_RESTART.agc:610
//		TS	DSPLIST
// slot 7769
                            if slot <> 7769 or instruction <> 23075 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23075, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 7778 {
            if slot <= 7773 {
                if slot <= 7771 {
                    if slot <= 7770 {
// FRESH_START_AND_RESTART.agc:611
//		TS	MARKSTAT
// slot 7770
                        if slot <> 7770 or instruction <> 23256 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23256, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:612
//		TS	IMUCADR
// slot 7771
                        if slot <> 7771 or instruction <> 23250 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23250, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7772 {
// FRESH_START_AND_RESTART.agc:613
//		TS	OPTCADR
// slot 7772
                        if slot <> 7772 or instruction <> 23251 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23251, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:614
//		TS	RADCADR
// slot 7773
                        if slot <> 7773 or instruction <> 23252 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23252, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 7775 {
                    if slot <= 7774 {
// FRESH_START_AND_RESTART.agc:615
//		TS	ATTCADR
// slot 7774
                        if slot <> 7774 or instruction <> 23253 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23253, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:616
//		TS	LGYRO
// slot 7775
                        if slot <> 7775 or instruction <> 23236 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23236, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7776 {
// FRESH_START_AND_RESTART.agc:617
//		TS	FLAGWRD4	# KILL INTERFACE DISPLAYS
// slot 7776
                        if slot <> 7776 or instruction <> 22592 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22592, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7777 {
// FRESH_START_AND_RESTART.agc:618
//		CAF	NOUTCON
// slot 7777
                            if slot <> 7777 or instruction <> 14868 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2580), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FRESH_START_AND_RESTART.agc:619
//		TS	NOUT
// slot 7778
                            if slot <> 7778 or instruction <> 23054 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23054, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 7783 {
                if slot <= 7780 {
                    if slot <= 7779 {
// FRESH_START_AND_RESTART.agc:620
//
// FRESH_START_AND_RESTART.agc:621
//		CAF	BIT14
// slot 7779
                        if slot <> 7779 or instruction <> 14850 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:622
//		MASK	EXTVBACT
// slot 7780
                        if slot <> 7780 or instruction <> 29220 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 548).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7781 {
// FRESH_START_AND_RESTART.agc:623
//		TS	EXTVBACT
// slot 7781
                        if slot <> 7781 or instruction <> 23076 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23076, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7782 {
// FRESH_START_AND_RESTART.agc:624
//		CAF	LESCHK		# SELF CHECK GO-TO REGISTER.
// slot 7782
                            if slot <> 7782 or instruction <> 13943 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 1655), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FRESH_START_AND_RESTART.agc:625
//		TS	SELFRET
// slot 7783
                            if slot <> 7783 or instruction <> 23281 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23281, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 7785 {
                    if slot <= 7784 {
// FRESH_START_AND_RESTART.agc:626
//
// FRESH_START_AND_RESTART.agc:627
//		CS	VD1
// slot 7784
                        if slot <> 7784 or instruction <> 18684 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2300), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:628
//		TS	DSPCOUNT
// slot 7785
                        if slot <> 7785 or instruction <> 23039 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23039, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7786 {
// FRESH_START_AND_RESTART.agc:629
//
// FRESH_START_AND_RESTART.agc:630
//		TC	Q
// slot 7786
                        if slot <> 7786 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7787 {
// FRESH_START_AND_RESTART.agc:631
//
// FRESH_START_AND_RESTART.agc:632
//T5IDLOC		CA	L		# T5RUPT COMES HERE EVERY 163.84 SECS
// slot 7787
                            if slot <> 7787 or instruction <> 12289 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 1).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FRESH_START_AND_RESTART.agc:633
//		TCF	NOQRSM	+1	# WHEN NOBODY IS USING IT.
// slot 7788
                            if slot <> 7788 or instruction <> 6878 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6878, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[434] to agcAotUnit434@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:634
//
// FRESH_START_AND_RESTART.agc:635
//		EBANK=	OGANOW
// FRESH_START_AND_RESTART.agc:636
//T5IDLER		2CADR	T5IDLOC
// slot 7789 7790
    7789, 3286, 7790, 10348,
// FRESH_START_AND_RESTART.agc:637
//
// FRESH_START_AND_RESTART.agc:638
//		EBANK=	OGANOW
// FRESH_START_AND_RESTART.agc:639
//		2CADR	REDORCS
// slot 7791 7792
    7791, 2186, 7792, 34924,
// FRESH_START_AND_RESTART.agc:640
//
// FRESH_START_AND_RESTART.agc:641
//		EBANK=	OGANOW
// FRESH_START_AND_RESTART.agc:642
//		2CADR	REDOTVC
// slot 7793 7794
    7793, 3264, 7794, 28780,
// FRESH_START_AND_RESTART.agc:643
//
// FRESH_START_AND_RESTART.agc:644
//		EBANK=	OGANOW
// FRESH_START_AND_RESTART.agc:645
//		2CADR	REDOSAT
// slot 7795 7796
    7795, 3050, 7796, 39020,
// FRESH_START_AND_RESTART.agc:646
//# Page 193
// FRESH_START_AND_RESTART.agc:647
//
// FRESH_START_AND_RESTART.agc:648
//IFAILINH	OCT	435
// slot 7797
    7797, 570,
// FRESH_START_AND_RESTART.agc:649
//LDNPHAS1	GENADR	DNPHASE1
// slot 7798
    7798, 3760,
// FRESH_START_AND_RESTART.agc:650
//LESCHK		GENADR	SELFCHK
// slot 7799
    7799, 3520,
// FRESH_START_AND_RESTART.agc:651
//VAC1ADRC	ADRES	VAC1USE
// slot 7800
    7800, 512,
// FRESH_START_AND_RESTART.agc:652
//LTHVACA		DEC	44
// slot 7801
    7801, 88,
// FRESH_START_AND_RESTART.agc:653
//
// FRESH_START_AND_RESTART.agc:654
//INTMASK		OCT	20100
// slot 7802
    7802, 16512,
// FRESH_START_AND_RESTART.agc:655
//OCT77603	OCT	77603
// slot 7803
    7803, 65286,
// FRESH_START_AND_RESTART.agc:656
//OCT74777	OCT	74777
// slot 7804
    7804, 62462,
// FRESH_START_AND_RESTART.agc:657
//STARTEB		ECADR	LST1
// slot 7805
    7805, 1536,
// FRESH_START_AND_RESTART.agc:658
//NUMGRPS		EQUALS	FIVE
// FRESH_START_AND_RESTART.agc:659
//-ELR		OCT	-22		# -ERROR LIGHT RESET KEY CODE.
// slot 7806
    7806, 65498,
// FRESH_START_AND_RESTART.agc:660
//IM30INIF	OCT	37411		# INHIBITS IMU FAIL FOR 5 SEC AND PIP ISSW
// slot 7807
    7807, 32274,
// FRESH_START_AND_RESTART.agc:661
//IM30INIR	OCT	37000
// slot 7808
    7808, 31744,
// FRESH_START_AND_RESTART.agc:662
//IM33INIT	=	PRIO16		# NO PIP OR TM FAIL SIGNALS.
// FRESH_START_AND_RESTART.agc:663
//9,6,4		OCT	450
// slot 7809
    7809, 592,
// FRESH_START_AND_RESTART.agc:664
//OPTINITF	OCT	130
// slot 7810
    7810, 176,
// FRESH_START_AND_RESTART.agc:665
//OPTINITR	OCT	430
// slot 7811
    7811, 560,
// FRESH_START_AND_RESTART.agc:666
//SWINIT		OCT	0
// slot 7812
    7812, 0,
// FRESH_START_AND_RESTART.agc:667
//		OCT	0
// slot 7813
    7813, 0,
// FRESH_START_AND_RESTART.agc:668
//		OCT	0
// slot 7814
    7814, 0,
// FRESH_START_AND_RESTART.agc:669
//		OCT	0
// slot 7815
    7815, 0,
// FRESH_START_AND_RESTART.agc:670
//
// FRESH_START_AND_RESTART.agc:671
//		OCT	0
// slot 7816
    7816, 0,
// FRESH_START_AND_RESTART.agc:672
//		OCT	00200
// slot 7817
    7817, 256,
// FRESH_START_AND_RESTART.agc:673
//		OCT	0
// slot 7818
    7818, 0,
// FRESH_START_AND_RESTART.agc:674
//		OCT	0
// slot 7819
    7819, 0,
// FRESH_START_AND_RESTART.agc:675
//		OCT	0
// slot 7820
    7820, 0,
// FRESH_START_AND_RESTART.agc:676
//		OCT	0
// slot 7821
    7821, 0,
// FRESH_START_AND_RESTART.agc:677
//		OCT	0
// slot 7822
    7822, 0,
// FRESH_START_AND_RESTART.agc:678
//		OCT	0
// slot 7823
    7823, 0
)).

// bank 02, slots 4166-4166
function agcAotUnit142 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// FRESH_START_AND_RESTART.agc:679
//# Page 194
// FRESH_START_AND_RESTART.agc:680
//# PROGRAM NAME		GOTOPOOH	ASSEMBLY	SUNDISK
// FRESH_START_AND_RESTART.agc:681
//# LOG SECTION		FRESH START AND RESTART
// FRESH_START_AND_RESTART.agc:682
//
// FRESH_START_AND_RESTART.agc:683
//# FUNCTIONAL DESCRIPTION
// FRESH_START_AND_RESTART.agc:684
//
// FRESH_START_AND_RESTART.agc:685
//#	1. DISPLAY MAJOR MODE NUMBER 00 IN DSKY REGISTER R1 AND R3.  FLASH V50 N07 ON DSKY.  (M M CHANGE REQUEST)
// FRESH_START_AND_RESTART.agc:686
//#	2. PERMIT A CURRENT PENDING REQUEST (FLASH ON DSKY) TO BE REPLACED (WITHOUT AN ABORT) BY THE MAJOR MODE
// FRESH_START_AND_RESTART.agc:687
//#	   CHANGE REQUEST.
// FRESH_START_AND_RESTART.agc:688
//
// FRESH_START_AND_RESTART.agc:689
//# INPUT/OUTPUT INFORMATION
// FRESH_START_AND_RESTART.agc:690
//
// FRESH_START_AND_RESTART.agc:691
//#	A. CALLING SEQUENCE		TC GOTOPOOH
// FRESH_START_AND_RESTART.agc:692
//
// FRESH_START_AND_RESTART.agc:693
//#	B. ERASABLE INITIALIZATION		NONE
// FRESH_START_AND_RESTART.agc:694
//
// FRESH_START_AND_RESTART.agc:695
//#	C. OUTPUT 		FLASH VERB 50 NOUN 07 ON DSKY
// FRESH_START_AND_RESTART.agc:696
//
// FRESH_START_AND_RESTART.agc:697
//#	D. DEBRIS		L
// FRESH_START_AND_RESTART.agc:698
//
// FRESH_START_AND_RESTART.agc:699
//# PROGRAM ANALYSIS
// FRESH_START_AND_RESTART.agc:700
//
// FRESH_START_AND_RESTART.agc:701
//#	A. SUBROUTINES CALLED		GOPERF3, LINUS
// FRESH_START_AND_RESTART.agc:702
//
// FRESH_START_AND_RESTART.agc:703
//#	B. NORMAL EXIT		    TCF ENDOFJOB
// FRESH_START_AND_RESTART.agc:704
//
// FRESH_START_AND_RESTART.agc:705
//#	C. ALARM AND ABORT EXITS		NONE
// FRESH_START_AND_RESTART.agc:706
//
// FRESH_START_AND_RESTART.agc:707
//		BLOCK	02
// FRESH_START_AND_RESTART.agc:708
//		SETLOC	FFTAG10
// FRESH_START_AND_RESTART.agc:709
//		BANK
// FRESH_START_AND_RESTART.agc:710
//
// FRESH_START_AND_RESTART.agc:711
//		COUNT	02/P00
// FRESH_START_AND_RESTART.agc:712
//
// FRESH_START_AND_RESTART.agc:713
//GOTOPOOH	TC	PHASCHNG		# RESTART GOTOPOOH
// slot 4166
    if slot <> 4166 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[142] to agcAotUnit142@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:714
//		OCT	14
// slot 4167
    4167, 24
)).

// bank 02, slots 4168-4168
function agcAotUnit143 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// FRESH_START_AND_RESTART.agc:715
//
// FRESH_START_AND_RESTART.agc:716
//		TC	POSTJUMP
// slot 4168
    if slot <> 4168 or instruction <> 2497 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2497, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[143] to agcAotUnit143@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:717
//		CADR	GOP00FIX
// slot 4169
    4169, 8192
)).

// bank 04, slots 6144-6147
function agcAotUnit357 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6145 {
        if slot <= 6144 {
// FRESH_START_AND_RESTART.agc:718
//		BANK	10
// FRESH_START_AND_RESTART.agc:719
//		SETLOC	VERB37
// FRESH_START_AND_RESTART.agc:720
//		BANK
// FRESH_START_AND_RESTART.agc:721
//
// FRESH_START_AND_RESTART.agc:722
//		COUNT	04/P00
// FRESH_START_AND_RESTART.agc:723
//
// FRESH_START_AND_RESTART.agc:724
//GOP00FIX	TC	INITSUB
// slot 6144
            if slot <> 6144 or instruction <> 1240 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1240, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// FRESH_START_AND_RESTART.agc:725
//		TC	CLEARMRK +2
// slot 6145
            if slot <> 6145 or instruction <> 2912 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2912, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6146 {
// FRESH_START_AND_RESTART.agc:726
//		CAF	V37N99
// slot 6146
            if slot <> 6146 or instruction <> 13320 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1032), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// FRESH_START_AND_RESTART.agc:727
//		TC	BANKCALL
// slot 6147
            if slot <> 6147 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[357] to agcAotUnit357@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:728
//		CADR	GOFLASH
// slot 6148
    6148, 17312
)).

// bank 04, slots 6149-6151
function agcAotUnit358 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6149 {
// FRESH_START_AND_RESTART.agc:729
//		TCF	-3
// slot 6149
        if slot <> 6149 or instruction <> 5122 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5122, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 6150 {
// FRESH_START_AND_RESTART.agc:730
//# Page 195
// FRESH_START_AND_RESTART.agc:731
//		TCF	-4
// slot 6150
            if slot <> 6150 or instruction <> 5122 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5122, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// FRESH_START_AND_RESTART.agc:732
//		TCF	-5
// slot 6151
            if slot <> 6151 or instruction <> 5122 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5122, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[358] to agcAotUnit358@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:733
//V37N99		VN	3799
// slot 6152
    6152, 9670,
// FRESH_START_AND_RESTART.agc:734
//
// FRESH_START_AND_RESTART.agc:735
//# Page 196
// FRESH_START_AND_RESTART.agc:736
//# PROGRAM NAME	V37			ASSEMBLY	SUNDISK
// FRESH_START_AND_RESTART.agc:737
//# LOG SECTION	FRESH START AND RESTART
// FRESH_START_AND_RESTART.agc:738
//
// FRESH_START_AND_RESTART.agc:739
//# FUNCTIONAL DESCRIPTION
// FRESH_START_AND_RESTART.agc:740
//
// FRESH_START_AND_RESTART.agc:741
//#	1. CHECK IF NEW PROGRAM ALLOWED.  IF BIT 1 OF FLAGWRD2(NODOFLAG) ISSET, AN ALARM 1520 IS CALLED.
// FRESH_START_AND_RESTART.agc:742
//#	2. CHECK FOR VALIDITY OF PROGRAM SELECTED.  IF AN INVALID PROGRAM IS SELECTED, THE OPERATOR ERROR LIGHT IS
// FRESH_START_AND_RESTART.agc:743
//#	   SET AND CURRENT ACTIVITY, IF ANY, CONTINUES.
// FRESH_START_AND_RESTART.agc:744
//#	3. SERVICER IS TERMINATED IF IT HAS BEEN RUNNING.
// FRESH_START_AND_RESTART.agc:745
//#	4. INSTALL IS EXECUTED TO AVOID INTERRUPTING INTEGRATION.
// FRESH_START_AND_RESTART.agc:746
//#	5. THE ENGINE IS TURNED OFF AND THE DAP IS INITIALIZED FOR COAST.
// FRESH_START_AND_RESTART.agc:747
//#	6. TRACK, UPDATE AND TARG1 FLAGS ARE SET TO ZERO.
// FRESH_START_AND_RESTART.agc:748
//#	7. DISPLAY SYSTEM IS RELEASED.
// FRESH_START_AND_RESTART.agc:749
//#	8. THE FOLLOWING ARE PERFORMED FOR EACH OF THE THREE CASES.
// FRESH_START_AND_RESTART.agc:750
//#	   A. PROGRAM SELECTED IS P00.
// FRESH_START_AND_RESTART.agc:751
//#	      1. RENDEZVOUS FLAG IS RESET (KILL P20).
// FRESH_START_AND_RESTART.agc:752
//#	      2. STATINT1	IS SCHEDULED BY SETTING RESTART GROUP 2.
// FRESH_START_AND_RESTART.agc:753
//#	      3. MAJOR MODE 00 IS STORED IN THE MODE REGISTER(MODREG).
// FRESH_START_AND_RESTART.agc:754
//#	      4. SUPERBANK 3 IS SELECTED.
// FRESH_START_AND_RESTART.agc:755
//#	      5. NODOFLAG IS RESET.
// FRESH_START_AND_RESTART.agc:756
//#	      6. ALL RESTART GROUPS EXCEPT GROUP 2 ARE CLEARED.  CONTROL ISTRANSFERRED TO RESTART PROGRAM (GOPROG2)
// FRESH_START_AND_RESTART.agc:757
//#		 WHICH CAUSES ALL CURRENT ACTIVITY TO BE DISCONTINUED AND A 9 MINUTE INTEGRATION CYCLE TO BE
// FRESH_START_AND_RESTART.agc:758
//#		 INITIATED.
// FRESH_START_AND_RESTART.agc:759
//#	   B. PROGRAM SELECTES IS P20.
// FRESH_START_AND_RESTART.agc:760
//#	      1. IF THE CURRENT MAJOR MODE IS THE SAME AS THE SELECTED NEWPROGRAM.  THE PROGRAM IS RE-INITIALIZED
// FRESH_START_AND_RESTART.agc:761
//#		 VIA V37XEQ, ALL RESTART GROUPS, EXCEPT GROUP 4 ARE CLEARED.
// FRESH_START_AND_RESTART.agc:762
//#	      2. IF THE CURRENT MAJOR MODE IS NOT EQUAL TO THE NEW REQUEST, A CHECK IS MADE TO SEE IF THE REQUEST-
// FRESH_START_AND_RESTART.agc:763
//#		 ED MAJOR MODE HAS BEEN RUNNING THE BACKGROUND,
// FRESH_START_AND_RESTART.agc:764
//#		 AND IF IT HAS, NO NEW PROGRAM IS SCHEDULED, THE EXISTING
// FRESH_START_AND_RESTART.agc:765
//#		 P20 IS RESTARTED TO CONTINUE, AND ITS MAJOR MODE IS SET.
// FRESH_START_AND_RESTART.agc:766
//#	      3. CONTROL IS TRANSFERRED TO GOPROG2.
// FRESH_START_AND_RESTART.agc:767
//#	   C. PROGRAM SELECTED IS NEITHER P00 NOR P20
// FRESH_START_AND_RESTART.agc:768
//#	      1. V37XEQ IS SCHEDULED (AS A JOB) BY SETTING RESTART GROUP 4
// FRESH_START_AND_RESTART.agc:769
//#	      2. ALL CURRENT ACTIVITY EXCEPT RENDEZVOUS AND TRACKING IS DISCONTINUED BY CLEARING ALL RESTART
// FRESH_START_AND_RESTART.agc:770
//#		 GROUPS.  GROUP 2 IS CLEARED.  IF THE RENDEZVOUS FLAG IS ON P20 IS RESTARTED IN GOPROG2 VIA REDOP20,
// FRESH_START_AND_RESTART.agc:771
//#		 TO CONTINUE.
// FRESH_START_AND_RESTART.agc:772
//
// FRESH_START_AND_RESTART.agc:773
//# INPUT/OUTPUT INFORMATION
// FRESH_START_AND_RESTART.agc:774
//
// FRESH_START_AND_RESTART.agc:775
//#	   A. CALLING SEQUENCE
// FRESH_START_AND_RESTART.agc:776
//
// FRESH_START_AND_RESTART.agc:777
//#		CONTROL IS DIRECTED TO V37 BY THE VERBFAN ROUTINE.
// FRESH_START_AND_RESTART.agc:778
//#			VERBFAN GOES TO C(VERBTAB+C(VERBREG)).  VERB 37 = MMCHANG.
// FRESH_START_AND_RESTART.agc:779
//#			MMCHANG EXECUTES A	TC POSTJUMP, CADR V37.
// FRESH_START_AND_RESTART.agc:780
//
// FRESH_START_AND_RESTART.agc:781
//#	   B. ERASABLE INITIALIZATION		NONE
// FRESH_START_AND_RESTART.agc:782
//
// FRESH_START_AND_RESTART.agc:783
//# 	   C. OUTPUT
// FRESH_START_AND_RESTART.agc:784
//#		MAJOR MODE CHANGE
// FRESH_START_AND_RESTART.agc:785
//# Page 197
// FRESH_START_AND_RESTART.agc:786
//#
// FRESH_START_AND_RESTART.agc:787
//#	   D. DEBRIS
// FRESH_START_AND_RESTART.agc:788
//#		MMNUMBER, MPAC +1, MINDEX, BASETEMP +C(MINDEX), FLAGWRD0, FLAGWRD1, FLAGWRD2, MODREG, GOLOC -1,
// FRESH_START_AND_RESTART.agc:789
//#		GOLOC, GOLOC +1, GOLOC +2, BASETEMP, -PHASE2, PHASE2, -PHASE4
// FRESH_START_AND_RESTART.agc:790
//
// FRESH_START_AND_RESTART.agc:791
//# PROGRAM ANALYSIS
// FRESH_START_AND_RESTART.agc:792
//
// FRESH_START_AND_RESTART.agc:793
//#	   A. SUBROUTINES CALLED
// FRESH_START_AND_RESTART.agc:794
//#		ALARM, RELDSP, PINBRNCH, INTSTALL, ENGINOF2, ALLCOAST, V37KLEAN, GOPROG2, FALTON, FINDVAC, SUPERSW,
// FRESH_START_AND_RESTART.agc:795
//#		DSPMM
// FRESH_START_AND_RESTART.agc:796
//
// FRESH_START_AND_RESTART.agc:797
//#	   B. NORMAL EXIT		TC ENDOFJOB
// FRESH_START_AND_RESTART.agc:798
//
// FRESH_START_AND_RESTART.agc:799
//#	   C. ALARMS		1520 (MAJOR MODE CHANGE NOT PERMITTED)
// FRESH_START_AND_RESTART.agc:800
//
// FRESH_START_AND_RESTART.agc:801
//		BLOCK	02
// FRESH_START_AND_RESTART.agc:802
//		SETLOC	FFTAG10
// FRESH_START_AND_RESTART.agc:803
//		BANK
// FRESH_START_AND_RESTART.agc:804
//
// FRESH_START_AND_RESTART.agc:805
//		COUNT	02/V37
// FRESH_START_AND_RESTART.agc:806
//
// FRESH_START_AND_RESTART.agc:807
//OCT24		MM	20
// slot 4170
    4170, 40,
// FRESH_START_AND_RESTART.agc:808
//OCT31		MM	25
// slot 4171
    4171, 50
)).

// bank 04, slots 6153-6174
function agcAotUnit359 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6163 {
        if slot <= 6157 {
            if slot <= 6154 {
                if slot <= 6153 {
// FRESH_START_AND_RESTART.agc:809
//		BANK	27
// FRESH_START_AND_RESTART.agc:810
//		SETLOC	VERB37
// FRESH_START_AND_RESTART.agc:811
//		BANK
// FRESH_START_AND_RESTART.agc:812
//
// FRESH_START_AND_RESTART.agc:813
//		COUNT	04/V37
// FRESH_START_AND_RESTART.agc:814
//
// FRESH_START_AND_RESTART.agc:815
//V37		TS	MMNUMBER		# SAVE MAJOR MODE
// slot 6153
                    if slot <> 6153 or instruction <> 23037 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23037, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:816
//		CAF	PRIO30			# RESTART AT PINBALL PRIORITY
// slot 6154
                    if slot <> 6154 or instruction <> 14585 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2297), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6155 {
// FRESH_START_AND_RESTART.agc:817
//		TS	RESTREG
// slot 6155
                    if slot <> 6155 or instruction <> 22774 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22774, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6156 {
// FRESH_START_AND_RESTART.agc:818
//
// FRESH_START_AND_RESTART.agc:819
//		CA	IMODES30		# IS IMU BEING INITIALIZED
// slot 6156
                        if slot <> 6156 or instruction <> 13008 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 720).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:820
//		MASK	BIT6
// slot 6157
                        if slot <> 6157 or instruction <> 31242 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2570), 32768).
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
            }
        } else {
            if slot <= 6160 {
                if slot <= 6158 {
// FRESH_START_AND_RESTART.agc:821
//		CCS	A
// slot 6158
                    if slot <> 6158 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6159 {
// FRESH_START_AND_RESTART.agc:822
//		TCF	CANTR00
// slot 6159
                        if slot <> 6159 or instruction <> 5177 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5177, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:823
//
// FRESH_START_AND_RESTART.agc:824
//		CAF	BIT13			# IS ENGINE ON
// slot 6160
                        if slot <> 6160 or instruction <> 14851 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 6161 {
// FRESH_START_AND_RESTART.agc:825
//		EXTEND
// slot 6161
                    if slot <> 6161 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6162 {
// FRESH_START_AND_RESTART.agc:826
//		RAND	DSALMOUT
// slot 6162
                        if slot <> 6162 or instruction <> 1033 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 9, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:827
//		CCS	A
// slot 6163
                        if slot <> 6163 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
    } else {
        if slot <= 6168 {
            if slot <= 6165 {
                if slot <= 6164 {
// FRESH_START_AND_RESTART.agc:828
//		TCF	R00TOP00		# YES, SET UP FOR P00
// slot 6164
                    if slot <> 6164 or instruction <> 5145 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5145, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:829
//
// FRESH_START_AND_RESTART.agc:830
//		CS	FLAGWRD6		# NO, IS TVC DAP ON
// slot 6165
                    if slot <> 6165 or instruction <> 16450 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 66).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6166 {
// FRESH_START_AND_RESTART.agc:831
//		MASK	OCT60000
// slot 6166
                    if slot <> 6166 or instruction <> 30789 { return choose false if checkOnly else -1. }
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
                    if slot <= 6167 {
// FRESH_START_AND_RESTART.agc:832
//		EXTEND
// slot 6167
                        if slot <> 6167 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:833
//		BZMF	ISITP00			# NO, CONTINUE WITH R00
// slot 6168
                        if slot <> 6168 or instruction <> 25650 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 25650, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 6171 {
                if slot <= 6169 {
// FRESH_START_AND_RESTART.agc:834
//
// FRESH_START_AND_RESTART.agc:835
//R00TOP00	INHINT
// slot 6169
                    if slot <> 6169 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6170 {
// FRESH_START_AND_RESTART.agc:836
//		CAF	EBANK6
// slot 6170
                        if slot <> 6170 or instruction <> 14895 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2607), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:837
//# Page 198
// FRESH_START_AND_RESTART.agc:838
//		TS	EBANK
// slot 6171
                        if slot <> 6171 or instruction <> 22531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22531, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 6172 {
// FRESH_START_AND_RESTART.agc:839
//		EBANK=	DAPDATR1
// FRESH_START_AND_RESTART.agc:840
//		CAE	CSMMASS
// slot 6172
                    if slot <> 6172 or instruction <> 13116 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 828).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6173 {
// FRESH_START_AND_RESTART.agc:841
//		TS	MASSTMP
// slot 6173
                        if slot <> 6173 or instruction <> 23466 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23466, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:842
//		TC	IBNKCALL
// slot 6174
                        if slot <> 6174 or instruction <> 2528 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[359] to agcAotUnit359@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:843
//		CADR	SPSOFF
// slot 6175
    6175, 42014
)).

// bank 04, slots 6176-6176
function agcAotUnit360 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// FRESH_START_AND_RESTART.agc:844
//		TC	IBNKCALL
// slot 6176
    if slot <> 6176 or instruction <> 2528 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2528, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[360] to agcAotUnit360@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:845
//		CADR	MASSPROP
// slot 6177
    6177, 11756
)).

// bank 04, slots 6178-6179
function agcAotUnit361 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6178 {
// FRESH_START_AND_RESTART.agc:846
//		CAF	3.1SEC
// slot 6178
        if slot <> 6178 or instruction <> 13581 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1293), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// FRESH_START_AND_RESTART.agc:847
//		TC	IBNKCALL
// slot 6179
        if slot <> 6179 or instruction <> 2528 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2528, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[361] to agcAotUnit361@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:848
//		CADR	RCSDAPON +1
// slot 6180
    6180, 34858
)).

// bank 04, slots 6181-6181
function agcAotUnit362 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// FRESH_START_AND_RESTART.agc:849
//
// FRESH_START_AND_RESTART.agc:850
//		TC	IBNKCALL
// slot 6181
    if slot <> 6181 or instruction <> 2528 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2528, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[362] to agcAotUnit362@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:851
//		CADR	TVCZAP			# DISABLE TVC
// slot 6182
    6182, 42098
)).

// bank 04, slots 6183-6187
function agcAotUnit363 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6184 {
        if slot <= 6183 {
// FRESH_START_AND_RESTART.agc:852
//		CAF	ZERO
// slot 6183
            if slot <> 6183 or instruction <> 14865 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// FRESH_START_AND_RESTART.agc:853
//		TS	MMNUMBER
// slot 6184
            if slot <> 6184 or instruction <> 23037 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23037, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6185 {
// FRESH_START_AND_RESTART.agc:854
//		RELINT
// slot 6185
            if slot <> 6185 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6186 {
// FRESH_START_AND_RESTART.agc:855
//		CAF	FIVE
// slot 6186
                if slot <> 6186 or instruction <> 14866 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2578), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// FRESH_START_AND_RESTART.agc:856
//		TC	BANKCALL
// slot 6187
                if slot <> 6187 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[363] to agcAotUnit363@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:857
//		CADR	DELAYJOB
// slot 6188
    6188, 1972
)).

// bank 04, slots 6189-6201
function agcAotUnit364 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6194 {
        if slot <= 6191 {
            if slot <= 6189 {
// FRESH_START_AND_RESTART.agc:858
//		CAF	ZERO
// slot 6189
                if slot <> 6189 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6190 {
// FRESH_START_AND_RESTART.agc:859
//		EXTEND
// slot 6190
                    if slot <> 6190 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:860
//		WRITE	5
// slot 6191
                    if slot <> 6191 or instruction <> 517 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 1, 5, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 6192 {
// FRESH_START_AND_RESTART.agc:861
//		EXTEND
// slot 6192
                if slot <> 6192 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6193 {
// FRESH_START_AND_RESTART.agc:862
//		WRITE	6
// slot 6193
                    if slot <> 6193 or instruction <> 518 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 1, 6, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:863
//ISITP00		CA	MMNUMBER
// slot 6194
                    if slot <> 6194 or instruction <> 12797 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 509).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 6197 {
            if slot <= 6195 {
// FRESH_START_AND_RESTART.agc:864
//		EXTEND
// slot 6195
                if slot <> 6195 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6196 {
// FRESH_START_AND_RESTART.agc:865
//		BZF	ISSERVON		# YES, CHECK SERVICER STATUS
// slot 6196
                    if slot <> 6196 or instruction <> 5195 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5195, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:866
//
// FRESH_START_AND_RESTART.agc:867
//		CS	FLAGWRD2		# NO, IS NODO V37 FLAG SET
// slot 6197
                    if slot <> 6197 or instruction <> 16446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 62).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 6199 {
                if slot <= 6198 {
// FRESH_START_AND_RESTART.agc:868
//		MASK	NODOBIT
// slot 6198
                    if slot <> 6198 or instruction <> 31247 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                        if fixedOperand = 1 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 1), 2) * 1).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:869
//		CCS	A
// slot 6199
                    if slot <> 6199 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6200 {
// FRESH_START_AND_RESTART.agc:870
//		TCF	CHECKTAB		# NO
// slot 6200
                    if slot <> 6200 or instruction <> 5182 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5182, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:871
//CANTR00		TC	ALARM
// slot 6201
                    if slot <> 6201 or instruction <> 2984 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2984, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[364] to agcAotUnit364@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:872
//		OCT	1520
// slot 6202
    6202, 1696
)).

// bank 04, slots 6203-6204
function agcAotUnit365 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6203 {
// FRESH_START_AND_RESTART.agc:873
//
// FRESH_START_AND_RESTART.agc:874
//V37BAD		TC	RELDSP			# RELEASES DISPLAY FROM ASTRONAUT
// slot 6203
        if slot <> 6203 or instruction <> 2363 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2363, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// FRESH_START_AND_RESTART.agc:875
//
// FRESH_START_AND_RESTART.agc:876
//		TC	POSTJUMP		# BRING BACK LAST NORMAL DISPLAY IF THERE
// slot 6204
        if slot <> 6204 or instruction <> 2497 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2497, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[365] to agcAotUnit365@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:877
//		CADR	PINBRNCH		# WAS ONE.  OY
// slot 6205
    6205, 17780
)).

// bank 04, slots 6206-6208
function agcAotUnit366 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6206 {
// FRESH_START_AND_RESTART.agc:878
//
// FRESH_START_AND_RESTART.agc:879
//CHECKTAB	CA	NOV37MM			# THE NO.  OF MM
// slot 6206
        if slot <> 6206 or instruction <> 13648 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1360), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 6207 {
// FRESH_START_AND_RESTART.agc:880
//AGAINMM		TS	MPAC +1
// slot 6207
            if slot <> 6207 or instruction <> 22637 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22637, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// FRESH_START_AND_RESTART.agc:881
//		NDX	MPAC +1
// slot 6208
            if slot <> 6208 or instruction <> 20589 { return choose false if checkOnly else -1. }
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
    }
}
set agcAotRoutes[366] to agcAotUnit366@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:882
//		CA	PREMM1			# OBTAIN WHICH MM THIS IS FOR
// slot 6209
    6209, 27230
)).

// bank 04, slots 6210-6230
function agcAotUnit367 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6219 {
        if slot <= 6214 {
            if slot <= 6211 {
                if slot <= 6210 {
// FRESH_START_AND_RESTART.agc:883
//		MASK	LOW7
// slot 6210
                    if slot <> 6210 or instruction <> 31779 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 3107), 32768).
                        if fixedOperand = 127 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 1), 128) * 1).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:884
//		COM
// slot 6211
                    if slot <> 6211 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6212 {
// FRESH_START_AND_RESTART.agc:885
//		AD	MMNUMBER
// slot 6212
                    if slot <> 6212 or instruction <> 25085 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 509).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6213 {
// FRESH_START_AND_RESTART.agc:886
//		CCS	A
// slot 6213
                        if slot <> 6213 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:887
//		CCS	MPAC +1			# IF GR, SEE IF ANY MORE IN LIST
// slot 6214
                        if slot <> 6214 or instruction <> 4205 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 109).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 6216 {
                if slot <= 6215 {
// FRESH_START_AND_RESTART.agc:888
//# Page 199
// FRESH_START_AND_RESTART.agc:889
//		TCF	AGAINMM			# YES, GET NEXT ONE
// slot 6215
                    if slot <> 6215 or instruction <> 5183 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5183, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:890
//		TCF	V37NONO			# LAST TIME OR PASSED MM
// slot 6216
                    if slot <> 6216 or instruction <> 5306 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5306, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6217 {
// FRESH_START_AND_RESTART.agc:891
//
// FRESH_START_AND_RESTART.agc:892
//		CA	MPAC +1
// slot 6217
                    if slot <> 6217 or instruction <> 12397 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 109).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6218 {
// FRESH_START_AND_RESTART.agc:893
//		TS	MINDEX			# SAVE INDEX FOR LATER
// slot 6218
                        if slot <> 6218 or instruction <> 23036 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23036, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:894
//
// FRESH_START_AND_RESTART.agc:895
//ISSERVON	CS	FLAGWRD7		# V37 FLAG SET - I.E. IS SERVICER GOING
// slot 6219
                        if slot <> 6219 or instruction <> 16451 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 67).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 6224 {
            if slot <= 6221 {
                if slot <= 6220 {
// FRESH_START_AND_RESTART.agc:896
//		MASK	V37FLBIT
// slot 6220
                    if slot <> 6220 or instruction <> 31242 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                        if fixedOperand = 32 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 32), 2) * 32).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:897
//		CCS	A
// slot 6221
                    if slot <> 6221 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6222 {
// FRESH_START_AND_RESTART.agc:898
//		TCF	CANV37			# NO
// slot 6222
                    if slot <> 6222 or instruction <> 5204 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5204, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6223 {
// FRESH_START_AND_RESTART.agc:899
//
// FRESH_START_AND_RESTART.agc:900
//		INHINT
// slot 6223
                        if slot <> 6223 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:901
//		CS	AVEGBIT			#   YES TURN OFF AVERAGE G FLAG AND WAIT
// slot 6224
                        if slot <> 6224 or instruction <> 18959 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 6227 {
                if slot <= 6225 {
// FRESH_START_AND_RESTART.agc:902
//		MASK	FLAGWRD1		# FOR SERVICER TO RETURN TO CANV37
// slot 6225
                    if slot <> 6225 or instruction <> 28733 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 61).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6226 {
// FRESH_START_AND_RESTART.agc:903
//		TS	FLAGWRD1
// slot 6226
                        if slot <> 6226 or instruction <> 22589 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22589, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:904
//
// FRESH_START_AND_RESTART.agc:905
//		TCF	ENDOFJOB
// slot 6227
                        if slot <> 6227 or instruction <> 6799 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6799, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 6228 {
// FRESH_START_AND_RESTART.agc:906
//
// FRESH_START_AND_RESTART.agc:907
//CANV37		CAF	R00AD
// slot 6228
                    if slot <> 6228 or instruction <> 13578 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1290), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6229 {
// FRESH_START_AND_RESTART.agc:908
//		TS	TEMPFLSH
// slot 6229
                        if slot <> 6229 or instruction <> 22780 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22780, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:909
//
// FRESH_START_AND_RESTART.agc:910
//		TC	PHASCHNG
// slot 6230
                        if slot <> 6230 or instruction <> 2826 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2826, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[367] to agcAotUnit367@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:911
//		OCT	14
// slot 6231
    6231, 24
)).

// bank 04, slots 6232-6232
function agcAotUnit368 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// FRESH_START_AND_RESTART.agc:912
//
// FRESH_START_AND_RESTART.agc:913
//ROC		TC	INTPRET
// slot 6232
    if slot <> 6232 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[368] to agcAotUnit368@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:914
//
// FRESH_START_AND_RESTART.agc:915
//		CALL				# WAIT FOR INTEGRATION TO FINISH
// slot 6233
    6233, 65320,
// FRESH_START_AND_RESTART.agc:916
//			INTSTALL
// slot 6234
    6234, 24132,
// FRESH_START_AND_RESTART.agc:917
//DUMMYAD		EXIT
// slot 6235
    6235, 65532
)).

// bank 04, slots 6236-6247
function agcAotUnit369 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6241 {
        if slot <= 6238 {
            if slot <= 6236 {
// FRESH_START_AND_RESTART.agc:918
//
// FRESH_START_AND_RESTART.agc:919
//		CS	OCT1400			# CLEAR CAUTION RESET
// slot 6236
                if slot <> 6236 or instruction <> 18985 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2601), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6237 {
// FRESH_START_AND_RESTART.agc:920
//		EXTEND				#   AND TEST CONNECTOR OUTBIT
// slot 6237
                    if slot <> 6237 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:921
//		WAND	11
// slot 6238
                    if slot <> 6238 or instruction <> 1545 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 9, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 6239 {
// FRESH_START_AND_RESTART.agc:922
//
// FRESH_START_AND_RESTART.agc:923
//		CAF	OCT44571		# CLEAR ENABLE OPTICS ERROR COUNTER, STAR
// slot 6239
                if slot <> 6239 or instruction <> 13571 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1283), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6240 {
// FRESH_START_AND_RESTART.agc:924
//		EXTEND				# TRAKERS ON BIT, TVC ENABLE, ZERO OPTICS,
// slot 6240
                    if slot <> 6240 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:925
//		WAND	12			# DISENGAGE OPTICS DAP, SIVB IN J SEQUENCE
// slot 6241
                    if slot <> 6241 or instruction <> 1546 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 6244 {
            if slot <= 6242 {
// FRESH_START_AND_RESTART.agc:926
//						# START, AND SIVB CUTOFF BIT.
// FRESH_START_AND_RESTART.agc:927
//
// FRESH_START_AND_RESTART.agc:928
//		CS	OCT600			# CLEAR UNUSED BITS
// slot 6242
                if slot <> 6242 or instruction <> 17668 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 1284), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6243 {
// FRESH_START_AND_RESTART.agc:929
//		EXTEND
// slot 6243
                    if slot <> 6243 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:930
//		WAND	13
// slot 6244
                    if slot <> 6244 or instruction <> 1547 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 11, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 6245 {
// FRESH_START_AND_RESTART.agc:931
//
// FRESH_START_AND_RESTART.agc:932
//		TC	INITSUB
// slot 6245
                if slot <> 6245 or instruction <> 1240 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1240, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6246 {
// FRESH_START_AND_RESTART.agc:933
//
// FRESH_START_AND_RESTART.agc:934
//		TC	CLEARMRK
// slot 6246
                    if slot <> 6246 or instruction <> 2910 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2910, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:935
//
// FRESH_START_AND_RESTART.agc:936
//		TC	DOWNFLAG
// slot 6247
                    if slot <> 6247 or instruction <> 2928 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2928, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[369] to agcAotUnit369@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:937
//		ADRES	STIKFLAG
// slot 6248
    6248, 32
)).

// bank 04, slots 6249-6249
function agcAotUnit370 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// FRESH_START_AND_RESTART.agc:938
//
// FRESH_START_AND_RESTART.agc:939
//# Page 200
// FRESH_START_AND_RESTART.agc:940
//		TC	BANKCALL
// slot 6249
    if slot <> 6249 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[370] to agcAotUnit370@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:941
//		CADR	UPACTOFF		# TURN OFF UPLINK ACTIV LIGHT
// slot 6250
    6250, 49118
)).

// bank 04, slots 6251-6251
function agcAotUnit371 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// FRESH_START_AND_RESTART.agc:942
//
// FRESH_START_AND_RESTART.agc:943
//		TC	DOWNFLAG
// slot 6251
    if slot <> 6251 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[371] to agcAotUnit371@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:944
//		ADRES	VHFRFLAG
// slot 6252
    6252, 282
)).

// bank 04, slots 6253-6253
function agcAotUnit372 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// FRESH_START_AND_RESTART.agc:945
//		TC	DOWNFLAG
// slot 6253
    if slot <> 6253 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[372] to agcAotUnit372@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:946
//		ADRES	R21MARK
// slot 6254
    6254, 62
)).

// bank 04, slots 6255-6277
function agcAotUnit373 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6265 {
        if slot <= 6259 {
            if slot <= 6256 {
                if slot <= 6255 {
// FRESH_START_AND_RESTART.agc:947
//
// FRESH_START_AND_RESTART.agc:948
//		CCS	MMNUMBER		# IS THIS A POOH REQUEST
// slot 6255
                    if slot <> 6255 or instruction <> 4605 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 509).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:949
//		TCF	NOUVEAU			# NO, PICK UP NEW PROGRAM
// slot 6256
                    if slot <> 6256 or instruction <> 5296 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5296, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6257 {
// FRESH_START_AND_RESTART.agc:950
//
// FRESH_START_AND_RESTART.agc:951
//		COUNT	04/P00
// FRESH_START_AND_RESTART.agc:952
//
// FRESH_START_AND_RESTART.agc:953
//POOH		TC	RELDSP			# RELEASE DISPLAY SYSTEM
// slot 6257
                    if slot <> 6257 or instruction <> 2363 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2363, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6258 {
// FRESH_START_AND_RESTART.agc:954
//
// FRESH_START_AND_RESTART.agc:955
//		CAF	PRIO5			# SET VARIABLE RESTART REGISTER FOR P00.
// slot 6258
                        if slot <> 6258 or instruction <> 14897 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2609), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:956
//		TS	PHSPRDT2
// slot 6259
                        if slot <> 6259 or instruction <> 23086 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23086, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 6262 {
                if slot <= 6260 {
// FRESH_START_AND_RESTART.agc:957
//
// FRESH_START_AND_RESTART.agc:958
//		INHINT
// slot 6260
                    if slot <> 6260 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6261 {
// FRESH_START_AND_RESTART.agc:959
//
// FRESH_START_AND_RESTART.agc:960
//		CS	NODOBIT			# TURN OFF NODOFLAG
// slot 6261
                        if slot <> 6261 or instruction <> 18959 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:961
//		MASK	FLAGWRD2
// slot 6262
                        if slot <> 6262 or instruction <> 28734 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 62).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 6263 {
// FRESH_START_AND_RESTART.agc:962
//		TS	FLAGWRD2
// slot 6263
                    if slot <> 6263 or instruction <> 22590 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22590, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6264 {
// FRESH_START_AND_RESTART.agc:963
//
// FRESH_START_AND_RESTART.agc:964
//		CA	FIVE			# SET 2.5 RESTART FOR STATEINT1
// slot 6264
                        if slot <> 6264 or instruction <> 14866 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2578), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:965
//		TS	L
// slot 6265
                        if slot <> 6265 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 6271 {
            if slot <= 6268 {
                if slot <= 6266 {
// FRESH_START_AND_RESTART.agc:966
//		COM
// slot 6266
                    if slot <> 6266 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6267 {
// FRESH_START_AND_RESTART.agc:967
//		DXCH	-PHASE2
// slot 6267
                        if slot <> 6267 or instruction <> 21997 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 493, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:968
//
// FRESH_START_AND_RESTART.agc:969
//		CS	BIT7-8			# RESET IMUSE + KILL P20 BY TURNING OFF
// slot 6268
                        if slot <> 6268 or instruction <> 17671 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 1287), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 6269 {
// FRESH_START_AND_RESTART.agc:970
//		MASK	FLAGWRD0
// slot 6269
                    if slot <> 6269 or instruction <> 28732 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 60).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6270 {
// FRESH_START_AND_RESTART.agc:971
//		TS	FLAGWRD0		#			 RENDFLG
// slot 6270
                        if slot <> 6270 or instruction <> 22588 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22588, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:972
//
// FRESH_START_AND_RESTART.agc:973
//		CAF	DNLADP00
// slot 6271
                        if slot <> 6271 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
        } else {
            if slot <= 6274 {
                if slot <= 6272 {
// FRESH_START_AND_RESTART.agc:974
//
// FRESH_START_AND_RESTART.agc:975
//		COUNT	04/V37
// FRESH_START_AND_RESTART.agc:976
//
// FRESH_START_AND_RESTART.agc:977
//SEUDOP00	TS	DNLSTCOD		# SET UP APPROPRIATE DOWNLIST.
// slot 6272
                    if slot <> 6272 or instruction <> 22746 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22746, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6273 {
// FRESH_START_AND_RESTART.agc:978
//
// FRESH_START_AND_RESTART.agc:979
//						#   (OLD ONE WILL BE FINISHED FIRST)
// FRESH_START_AND_RESTART.agc:980
//		CS	OCT01120		# TURN OFF TRACK, TARG1, UPDATE FLAGS
// slot 6273
                        if slot <> 6273 or instruction <> 17672 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 1288), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:981
//		TS	EBANKTEM
// slot 6274
                        if slot <> 6274 or instruction <> 23097 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23097, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 6275 {
// FRESH_START_AND_RESTART.agc:982
//		MASK	FLAGWRD1
// slot 6275
                    if slot <> 6275 or instruction <> 28733 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 61).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6276 {
// FRESH_START_AND_RESTART.agc:983
//		TS	FLAGWRD1
// slot 6276
                        if slot <> 6276 or instruction <> 22589 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22589, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:984
//
// FRESH_START_AND_RESTART.agc:985
//GROUPKIL	TC	IBNKCALL		# KILL GROUPS 3(5,6
// slot 6277
                        if slot <> 6277 or instruction <> 2528 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[373] to agcAotUnit373@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:986
//		CADR	V37KLEAN
// slot 6278
    6278, 10902
)).

// bank 04, slots 6279-6281
function agcAotUnit374 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6279 {
// FRESH_START_AND_RESTART.agc:987
//
// FRESH_START_AND_RESTART.agc:988
//		CCS	MMNUMBER		# IS IT POOH
// slot 6279
        if slot <> 6279 or instruction <> 4605 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCCS(words, 509).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 6280 {
// FRESH_START_AND_RESTART.agc:989
//		TCF	RENDV00			# NO
// slot 6280
            if slot <> 6280 or instruction <> 5263 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5263, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// FRESH_START_AND_RESTART.agc:990
//# Page 201
// FRESH_START_AND_RESTART.agc:991
//		TC	IBNKCALL
// slot 6281
            if slot <> 6281 or instruction <> 2528 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2528, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[374] to agcAotUnit374@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:992
//		CADR	P00KLEAN		# REDUNDANT EXCEPT FOR GROUP 4.
// slot 6282
    6282, 10890
)).

// bank 04, slots 6283-6285
function agcAotUnit375 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6283 {
// FRESH_START_AND_RESTART.agc:993
//
// FRESH_START_AND_RESTART.agc:994
//GOMOD		CA	MMNUMBER
// slot 6283
        if slot <> 6283 or instruction <> 12797 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreCA(words, 509).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 6284 {
// FRESH_START_AND_RESTART.agc:995
//		TS	MODREG
// slot 6284
            if slot <> 6284 or instruction <> 23049 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23049, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// FRESH_START_AND_RESTART.agc:996
//
// FRESH_START_AND_RESTART.agc:997
//GOGOPROG	TC	POSTJUMP
// slot 6285
            if slot <> 6285 or instruction <> 2497 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2497, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[375] to agcAotUnit375@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:998
//		CADR	GOPROG2
// slot 6286
    6286, 11090
)).

// bank 04, slots 6287-6292
function agcAotUnit376 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6289 {
        if slot <= 6287 {
// FRESH_START_AND_RESTART.agc:999
//
// FRESH_START_AND_RESTART.agc:1000
//RENDV00		CS	MMNUMBER		# IS NEW PROG = 20
// slot 6287
            if slot <> 6287 or instruction <> 16893 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 509).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6288 {
// FRESH_START_AND_RESTART.agc:1001
//		AD	OCT24			# 20
// slot 6288
                if slot <> 6288 or instruction <> 26698 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2122), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// FRESH_START_AND_RESTART.agc:1002
//		EXTEND
// slot 6289
                if slot <> 6289 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 6290 {
// FRESH_START_AND_RESTART.agc:1003
//		BZF	RENDN00			# YES
// slot 6290
            if slot <> 6290 or instruction <> 5268 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5268, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6291 {
// FRESH_START_AND_RESTART.agc:1004
//		TCF	P00FIZZ
// slot 6291
                if slot <> 6291 or instruction <> 5276 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5276, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// FRESH_START_AND_RESTART.agc:1005
//RENDN00		CS	MMNUMBER
// slot 6292
                if slot <> 6292 or instruction <> 16893 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 509).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[376] to agcAotUnit376@.

// bank 04, slots 6293-6324
function agcAotUnit377 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6308 {
        if slot <= 6300 {
            if slot <= 6296 {
                if slot <= 6294 {
                    if slot <= 6293 {
// FRESH_START_AND_RESTART.agc:1006
//		AD	MODREG
// slot 6293
                        if slot <> 6293 or instruction <> 25097 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 521).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:1007
//		EXTEND
// slot 6294
                        if slot <> 6294 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 6295 {
// FRESH_START_AND_RESTART.agc:1008
//		BZF	KILL20
// slot 6295
                        if slot <> 6295 or instruction <> 5280 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5280, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:1009
//
// FRESH_START_AND_RESTART.agc:1010
//		CA	FLAGWRD0		# IS RENDEZVOO FLAG SET
// slot 6296
                        if slot <> 6296 or instruction <> 12348 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 60).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 6298 {
                    if slot <= 6297 {
// FRESH_START_AND_RESTART.agc:1011
//		MASK	RNDVZBIT
// slot 6297
                        if slot <> 6297 or instruction <> 31241 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2569), 32768).
                            if fixedOperand = 64 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 64), 2) * 64).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:1012
//		CCS	A
// slot 6298
                        if slot <> 6298 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 6299 {
// FRESH_START_AND_RESTART.agc:1013
//		TCF	STATQUO
// slot 6299
                        if slot <> 6299 or instruction <> 5289 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5289, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:1014
//
// FRESH_START_AND_RESTART.agc:1015
//P00FIZZ		CAF	RNDVZBIT
// slot 6300
                        if slot <> 6300 or instruction <> 14857 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2569), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 6304 {
                if slot <= 6302 {
                    if slot <= 6301 {
// FRESH_START_AND_RESTART.agc:1016
//		MASK	FLAGWRD0
// slot 6301
                        if slot <> 6301 or instruction <> 28732 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 60).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:1017
//		CCS	A
// slot 6302
                        if slot <> 6302 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 6303 {
// FRESH_START_AND_RESTART.agc:1018
//		TCF	REV37
// slot 6303
                        if slot <> 6303 or instruction <> 5286 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5286, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:1019
//KILL20		EXTEND				# NO, KILL GROUPS 1 + 2
// slot 6304
                        if slot <> 6304 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 6306 {
                    if slot <= 6305 {
// FRESH_START_AND_RESTART.agc:1020
//		DCA	NEG0
// slot 6305
                        if slot <> 6305 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 2577, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:1021
//		DXCH	-PHASE1
// slot 6306
                        if slot <> 6306 or instruction <> 21995 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 491, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 6307 {
// FRESH_START_AND_RESTART.agc:1022
//
// FRESH_START_AND_RESTART.agc:1023
//		EXTEND
// slot 6307
                        if slot <> 6307 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:1024
//		DCA	NEG0
// slot 6308
                        if slot <> 6308 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 2577, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 6316 {
            if slot <= 6312 {
                if slot <= 6310 {
                    if slot <= 6309 {
// FRESH_START_AND_RESTART.agc:1025
//		DXCH	-PHASE2
// slot 6309
                        if slot <> 6309 or instruction <> 21997 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 493, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:1026
//
// FRESH_START_AND_RESTART.agc:1027
//REV37		CAF	V37QCAD			# SET RESTART POINT
// slot 6310
                        if slot <> 6310 or instruction <> 13577 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1289), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 6311 {
// FRESH_START_AND_RESTART.agc:1028
//		TS	TEMPFLSH
// slot 6311
                        if slot <> 6311 or instruction <> 22780 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22780, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:1029
//
// FRESH_START_AND_RESTART.agc:1030
//		TCF	GOGOPROG
// slot 6312
                        if slot <> 6312 or instruction <> 5261 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5261, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 6314 {
                    if slot <= 6313 {
// FRESH_START_AND_RESTART.agc:1031
//
// FRESH_START_AND_RESTART.agc:1032
//
// FRESH_START_AND_RESTART.agc:1033
//STATQUO		CS	FLAGWRD1		# SET TRACKFLAG AND UPDATE FLAG
// slot 6313
                        if slot <> 6313 or instruction <> 16445 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 61).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:1034
//		MASK	OCT120
// slot 6314
                        if slot <> 6314 or instruction <> 31263 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2591), 32768).
                            if fixedOperand = 80 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 16), 2) * 16 + mod(floor(words[0] / 64), 2) * 64).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 6315 {
// FRESH_START_AND_RESTART.agc:1035
//		ADS	FLAGWRD1
// slot 6315
                        if slot <> 6315 or instruction <> 11325 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 61).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:1036
//
// FRESH_START_AND_RESTART.agc:1037
//		EXTEND				# KILL GROUP 4
// slot 6316
                        if slot <> 6316 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 6320 {
                if slot <= 6318 {
                    if slot <= 6317 {
// FRESH_START_AND_RESTART.agc:1038
//		DCA	NEG0
// slot 6317
                        if slot <> 6317 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 2577, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:1039
//		DXCH	-PHASE4
// slot 6318
                        if slot <> 6318 or instruction <> 22001 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 497, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 6319 {
// FRESH_START_AND_RESTART.agc:1040
//
// FRESH_START_AND_RESTART.agc:1041
//# Page 202
// FRESH_START_AND_RESTART.agc:1042
//		TCF	GOMOD
// slot 6319
                        if slot <> 6319 or instruction <> 5259 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5259, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:1043
//
// FRESH_START_AND_RESTART.agc:1044
//NOUVEAU		CAF	RNDVZBIT
// slot 6320
                        if slot <> 6320 or instruction <> 14857 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2569), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 6322 {
                    if slot <= 6321 {
// FRESH_START_AND_RESTART.agc:1045
//		MASK	FLAGWRD0
// slot 6321
                        if slot <> 6321 or instruction <> 28732 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 60).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:1046
//		CCS	A
// slot 6322
                        if slot <> 6322 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 6323 {
// FRESH_START_AND_RESTART.agc:1047
//		TCF	+3
// slot 6323
                        if slot <> 6323 or instruction <> 5302 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5302, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:1048
//		TC	DOWNFLAG		# NO, RESET IMUSE FLAG.
// slot 6324
                        if slot <> 6324 or instruction <> 2928 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2928, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[377] to agcAotUnit377@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:1049
//		ADRES	IMUSE			# BIT 8 FLAG 0
// slot 6325
    6325, 14
)).

// bank 04, slots 6326-6326
function agcAotUnit378 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// FRESH_START_AND_RESTART.agc:1050
//	+3	INDEX	MINDEX
// slot 6326
    if slot <> 6326 or instruction <> 20988 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20988, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20988, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[378] to agcAotUnit378@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:1051
//		CAF	DNLADMM1		# OBTAIN NEW DOWNLIST ADDRESS
// slot 6327
    6327, 27298
)).

// bank 04, slots 6328-6333
function agcAotUnit379 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6330 {
        if slot <= 6328 {
// FRESH_START_AND_RESTART.agc:1052
//
// FRESH_START_AND_RESTART.agc:1053
//		INHINT
// slot 6328
            if slot <> 6328 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6329 {
// FRESH_START_AND_RESTART.agc:1054
//		TCF	SEUDOP00
// slot 6329
                if slot <> 6329 or instruction <> 5248 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5248, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// FRESH_START_AND_RESTART.agc:1055
//
// FRESH_START_AND_RESTART.agc:1056
//V37NONO		TC	FALTON			# COME HERE IF MM REQUESTED DOESNT EXIST
// slot 6330
                if slot <> 6330 or instruction <> 2304 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2304, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 6331 {
// FRESH_START_AND_RESTART.agc:1057
//		TCF	V37BAD
// slot 6331
            if slot <> 6331 or instruction <> 5179 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5179, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6332 {
// FRESH_START_AND_RESTART.agc:1058
//
// FRESH_START_AND_RESTART.agc:1059
//OCT00010	EQUALS	BIT4
// FRESH_START_AND_RESTART.agc:1060
//V37XEQ		INHINT
// slot 6332
                if slot <> 6332 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// FRESH_START_AND_RESTART.agc:1061
//		INDEX	MINDEX
// slot 6333
                if slot <> 6333 or instruction <> 20988 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20988, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20988, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[379] to agcAotUnit379@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:1062
//		CAF	PREMM1
// slot 6334
    6334, 27230
)).

// bank 04, slots 6335-6346
function agcAotUnit380 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6340 {
        if slot <= 6337 {
            if slot <= 6335 {
// FRESH_START_AND_RESTART.agc:1063
//		TS	MMTEMP			# OBTAIN PRIORITY BITS 15 - 11
// slot 6335
                if slot <> 6335 or instruction <> 23088 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23088, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6336 {
// FRESH_START_AND_RESTART.agc:1064
//		TS	CYR			# SHIFT RIGHT TO BITS 14 - 10
// slot 6336
                    if slot <> 6336 or instruction <> 22544 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22544, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:1065
//
// FRESH_START_AND_RESTART.agc:1066
//		CA	CYR
// slot 6337
                    if slot <> 6337 or instruction <> 12304 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 16).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 6338 {
// FRESH_START_AND_RESTART.agc:1067
//		MASK	PRIO37
// slot 6338
                if slot <> 6338 or instruction <> 32700 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 4028), 32768).
                    if fixedOperand = 15872 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 512), 32) * 512).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6339 {
// FRESH_START_AND_RESTART.agc:1068
//		TS	PHSPRDT4		# PRESET GROUP4 RESTART PRIORITY
// slot 6339
                    if slot <> 6339 or instruction <> 23090 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23090, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:1069
//		TS	NEWPRIO			# STORE PRIO FOR SPVAC
// slot 6340
                    if slot <> 6340 or instruction <> 22579 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22579, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 6343 {
            if slot <= 6341 {
// FRESH_START_AND_RESTART.agc:1070
//
// FRESH_START_AND_RESTART.agc:1071
//		CA	MMTEMP			# OBTAIN EBANK - BITS 8, 9, 10 OF MMTEMP.
// slot 6341
                if slot <> 6341 or instruction <> 12848 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 560).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6342 {
// FRESH_START_AND_RESTART.agc:1072
//		EXTEND
// slot 6342
                    if slot <> 6342 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:1073
//		MP	BIT8
// slot 6343
                    if slot <> 6343 or instruction <> 31240 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 2568, readEffective:call(words, 2568)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 6344 {
// FRESH_START_AND_RESTART.agc:1074
//		MASK	LOW3
// slot 6344
                if slot <> 6344 or instruction <> 31251 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2579), 32768).
                    if fixedOperand = 7 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 1), 8) * 1).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6345 {
// FRESH_START_AND_RESTART.agc:1075
//		TS	L
// slot 6345
                    if slot <> 6345 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:1076
//		INDEX	MINDEX
// slot 6346
                    if slot <> 6346 or instruction <> 20988 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20988, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20988, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[380] to agcAotUnit380@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:1077
//		CAF	FCADRMM1
// slot 6347
    6347, 27164
)).

// bank 04, slots 6348-6370
function agcAotUnit381 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6358 {
        if slot <= 6352 {
            if slot <= 6349 {
                if slot <= 6348 {
// FRESH_START_AND_RESTART.agc:1078
//		TS	BASETEMP
// slot 6348
                    if slot <> 6348 or instruction <> 23089 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23089, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:1079
//		MASK	HI5
// slot 6349
                    if slot <> 6349 or instruction <> 30964 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2292), 32768).
                        if fixedOperand = 31744 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 1024), 32) * 1024).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6350 {
// FRESH_START_AND_RESTART.agc:1080
//		ADS	L
// slot 6350
                    if slot <> 6350 or instruction <> 11265 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6351 {
// FRESH_START_AND_RESTART.agc:1081
//
// FRESH_START_AND_RESTART.agc:1082
//		CA	BASETEMP		# OBTAIN GENADR PORTION OF 2CADR.
// slot 6351
                        if slot <> 6351 or instruction <> 12849 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 561).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:1083
//		MASK	LOW10
// slot 6352
                        if slot <> 6352 or instruction <> 31276 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2604), 32768).
                            if fixedOperand = 1023 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 1), 1024) * 1).
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
            if slot <= 6355 {
                if slot <= 6353 {
// FRESH_START_AND_RESTART.agc:1084
//		AD	BIT11
// slot 6353
                    if slot <> 6353 or instruction <> 27141 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2565), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6354 {
// FRESH_START_AND_RESTART.agc:1085
//
// FRESH_START_AND_RESTART.agc:1086
//		TC	SPVAC
// slot 6354
                        if slot <> 6354 or instruction <> 2672 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2672, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:1087
//
// FRESH_START_AND_RESTART.agc:1088
//V37XEQC		CA	MMTEMP			# UPON RETURN FROM FINDVAC PLACE THE
// slot 6355
                        if slot <> 6355 or instruction <> 12848 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 560).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 6356 {
// FRESH_START_AND_RESTART.agc:1089
//		MASK	LOW7			# NEW MM IN MODREG (THE LOW 7 BITS OF
// slot 6356
                    if slot <> 6356 or instruction <> 31779 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 3107), 32768).
                        if fixedOperand = 127 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 1), 128) * 1).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6357 {
// FRESH_START_AND_RESTART.agc:1090
//		TC	NEWMODEA		# PHSBRDT1)
// slot 6357
                        if slot <> 6357 or instruction <> 2799 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2799, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:1091
//
// FRESH_START_AND_RESTART.agc:1092
//# Page 203
// FRESH_START_AND_RESTART.agc:1093
//# FOR SUNDISK ONLY
// FRESH_START_AND_RESTART.agc:1094
//		TC	RELDSP			# RELEASE DISPLAY
// slot 6358
                        if slot <> 6358 or instruction <> 2363 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2363, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 6364 {
            if slot <= 6361 {
                if slot <= 6359 {
// FRESH_START_AND_RESTART.agc:1095
//		TC	ENDOFJOB		# AND EXIT
// slot 6359
                    if slot <> 6359 or instruction <> 2703 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2703, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6360 {
// FRESH_START_AND_RESTART.agc:1096
//
// FRESH_START_AND_RESTART.agc:1097
//INITSUB		EXTEND
// slot 6360
                        if slot <> 6360 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:1098
//		QXCH	MPAC	+1
// slot 6361
                        if slot <> 6361 or instruction <> 9325 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 2, 109, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 6362 {
// FRESH_START_AND_RESTART.agc:1099
//
// FRESH_START_AND_RESTART.agc:1100
//		CAF	EBANK6			# SET E6 FOR DEADBAND CODING
// slot 6362
                    if slot <> 6362 or instruction <> 14895 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2607), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6363 {
// FRESH_START_AND_RESTART.agc:1101
//		TS	EBANK			# WILL BE RESET IN STARTSB2.
// slot 6363
                        if slot <> 6363 or instruction <> 22531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22531, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:1102
//		INHINT
// slot 6364
                        if slot <> 6364 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 6367 {
                if slot <= 6365 {
// FRESH_START_AND_RESTART.agc:1103
//		TC	STOPRATE
// slot 6365
                    if slot <> 6365 or instruction <> 2390 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2390, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6366 {
// FRESH_START_AND_RESTART.agc:1104
//
// FRESH_START_AND_RESTART.agc:1105
//		CA	FLAGWRD9		# RESTORE DEADBAND
// slot 6366
                        if slot <> 6366 or instruction <> 12357 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 69).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:1106
//		MASK	MAXDBBIT
// slot 6367
                        if slot <> 6367 or instruction <> 31236 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2564), 32768).
                            if fixedOperand = 2048 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 2048), 2) * 2048).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 6368 {
// FRESH_START_AND_RESTART.agc:1107
//		CCS	A
// slot 6368
                    if slot <> 6368 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6369 {
// FRESH_START_AND_RESTART.agc:1108
//		TCF	SETMAXER		# MAX DB SELECTED
// slot 6369
                        if slot <> 6369 or instruction <> 5349 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5349, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:1109
//		TC	BANKCALL		# MIN DB SELECTED
// slot 6370
                        if slot <> 6370 or instruction <> 2482 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2482, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[381] to agcAotUnit381@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:1110
//		CADR	SETMINDB
// slot 6371
    6371, 41352
)).

// bank 04, slots 6372-6373
function agcAotUnit382 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6372 {
// FRESH_START_AND_RESTART.agc:1111
//		TCF	RAKE
// slot 6372
        if slot <> 6372 or instruction <> 5351 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5351, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// FRESH_START_AND_RESTART.agc:1112
//SETMAXER	TC	BANKCALL
// slot 6373
        if slot <> 6373 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[382] to agcAotUnit382@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:1113
//		CADR	SETMAXDB
// slot 6374
    6374, 41376
)).

// bank 04, slots 6375-6377
function agcAotUnit383 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6375 {
// FRESH_START_AND_RESTART.agc:1114
//
// FRESH_START_AND_RESTART.agc:1115
//RAKE		CAF	ELEVEN			# THIS PART CLEARS FLAGWORD BITS.
// slot 6375
        if slot <> 6375 or instruction <> 14868 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2580), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 6376 {
// FRESH_START_AND_RESTART.agc:1116
//	+1	TS	MPAC			# LOOP COMES HERE.
// slot 6376
            if slot <> 6376 or instruction <> 22636 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22636, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// FRESH_START_AND_RESTART.agc:1117
//		INDEX	MPAC
// slot 6377
            if slot <> 6377 or instruction <> 20588 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[383] to agcAotUnit383@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:1118
//		CS	FLAGTABL
// slot 6378
    6378, 35310
)).

// bank 04, slots 6379-6379
function agcAotUnit384 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// FRESH_START_AND_RESTART.agc:1119
//		INDEX	MPAC
// slot 6379
    if slot <> 6379 or instruction <> 20588 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[384] to agcAotUnit384@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:1120
//		MASK	FLAGWRD0
// slot 6380
    6380, 57464
)).

// bank 04, slots 6381-6381
function agcAotUnit385 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// FRESH_START_AND_RESTART.agc:1121
//		INDEX	MPAC			# PUT REVISED FLAGWORD BACK.
// slot 6381
    if slot <> 6381 or instruction <> 20588 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[385] to agcAotUnit385@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:1122
//		TS	FLAGWRD0
// slot 6382
    6382, 45176
)).

// bank 04, slots 6383-6386
function agcAotUnit386 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6384 {
        if slot <= 6383 {
// FRESH_START_AND_RESTART.agc:1123
//		CCS	MPAC
// slot 6383
            if slot <> 6383 or instruction <> 4204 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 108).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// FRESH_START_AND_RESTART.agc:1124
//		TCF	RAKE	+1		# GET THE NEXT FLAGWORD.
// slot 6384
            if slot <> 6384 or instruction <> 5352 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5352, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6385 {
// FRESH_START_AND_RESTART.agc:1125
//		RELINT
// slot 6385
            if slot <> 6385 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// FRESH_START_AND_RESTART.agc:1126
//
// FRESH_START_AND_RESTART.agc:1127
//		TC	UPFLAG			# NOW SET IMPULSW
// slot 6386
            if slot <> 6386 or instruction <> 2918 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2918, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[386] to agcAotUnit386@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:1128
//		ADRES	IMPULSW
// slot 6387
    6387, 72
)).

// bank 04, slots 6388-6390
function agcAotUnit387 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6388 {
// FRESH_START_AND_RESTART.agc:1129
//
// FRESH_START_AND_RESTART.agc:1130
//		CA	NEGONE
// slot 6388
        if slot <> 6388 or instruction <> 16334 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 4046), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 6389 {
// FRESH_START_AND_RESTART.agc:1131
//		TS	OPTIND
// slot 6389
            if slot <> 6389 or instruction <> 23235 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23235, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// FRESH_START_AND_RESTART.agc:1132
//		TC	MPAC	+1		# RETURN FROM INITSUB
// slot 6390
            if slot <> 6390 or instruction <> 109 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 109, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[387] to agcAotUnit387@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:1133
//
// FRESH_START_AND_RESTART.agc:1134
//FLAGTABL	OCT	0
// slot 6391
    6391, 0,
// FRESH_START_AND_RESTART.agc:1135
//		OCT	00040			# IDLEFAIL
// slot 6392
    6392, 64,
// FRESH_START_AND_RESTART.agc:1136
//		OCT	06000			# P21FLAG, STEERSW
// slot 6393
    6393, 6144,
// FRESH_START_AND_RESTART.agc:1137
//		OCT	0
// slot 6394
    6394, 0,
// FRESH_START_AND_RESTART.agc:1138
//		OCT	0
// slot 6395
    6395, 0,
// FRESH_START_AND_RESTART.agc:1139
//		OCT	04140			# V59FLAG, ENGONFLG, 3AXISFLG
// slot 6396
    6396, 4288,
// FRESH_START_AND_RESTART.agc:1140
//		OCT	10000			# STRULLSW
// slot 6397
    6397, 8192,
// FRESH_START_AND_RESTART.agc:1141
//		OCT	16000
// slot 6398
    6398, 14336,
// FRESH_START_AND_RESTART.agc:1142
//		OCT	0
// slot 6399
    6399, 0,
// FRESH_START_AND_RESTART.agc:1143
//# Page 204
// FRESH_START_AND_RESTART.agc:1144
//		OCT	42000			# SWTOVER, V94FLAG
// slot 6400
    6400, 34816,
// FRESH_START_AND_RESTART.agc:1145
//		OCT	0
// slot 6401
    6401, 0,
// FRESH_START_AND_RESTART.agc:1146
//		OCT	0
// slot 6402
    6402, 0
)).

// bank 20, slots 18432-18436
function agcAotUnit1073 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18433 {
        if slot <= 18432 {
// FRESH_START_AND_RESTART.agc:1147
//
// FRESH_START_AND_RESTART.agc:1148
//		SETLOC	VAC5LOC
// FRESH_START_AND_RESTART.agc:1149
//		BANK
// FRESH_START_AND_RESTART.agc:1150
//VAC5STOR	CA	ZERO			# INITIALIZE INDEX REGISTERS
// slot 18432
            if slot <> 18432 or instruction <> 14865 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// FRESH_START_AND_RESTART.agc:1151
//		TS	ITEMP1
// slot 18433
            if slot <> 18433 or instruction <> 22577 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22577, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 18434 {
// FRESH_START_AND_RESTART.agc:1152
//		TS	ITEMP2
// slot 18434
            if slot <> 18434 or instruction <> 22578 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22578, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18435 {
// FRESH_START_AND_RESTART.agc:1153
//
// FRESH_START_AND_RESTART.agc:1154
//V5LOOP1		EXTEND				# LOOP TO STORE LOCS, BANKSETS, AND PRIOS.
// slot 18435
                if slot <> 18435 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// FRESH_START_AND_RESTART.agc:1155
//		INDEX	ITEMP1
// slot 18436
                if slot <> 18436 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1073] to agcAotUnit1073@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:1156
//		DCA	LOC
// slot 18437
    18437, 24810
)).

// bank 20, slots 18438-18438
function agcAotUnit1074 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// FRESH_START_AND_RESTART.agc:1157
//		INDEX	ITEMP2
// slot 18438
    if slot <> 18438 or instruction <> 20530 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1074] to agcAotUnit1074@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:1158
//		DXCH	VAC5
// slot 18439
    18439, 43876
)).

// bank 20, slots 18440-18440
function agcAotUnit1075 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// FRESH_START_AND_RESTART.agc:1159
//
// FRESH_START_AND_RESTART.agc:1160
//		INDEX	ITEMP1
// slot 18440
    if slot <> 18440 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1075] to agcAotUnit1075@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:1161
//		CA	PRIORITY
// slot 18441
    18441, 24814
)).

// bank 20, slots 18442-18442
function agcAotUnit1076 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// FRESH_START_AND_RESTART.agc:1162
//		INDEX	ITEMP2
// slot 18442
    if slot <> 18442 or instruction <> 20530 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1076] to agcAotUnit1076@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:1163
//		TS	VAC5 +2
// slot 18443
    18443, 45926
)).

// bank 20, slots 18444-18456
function agcAotUnit1077 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18449 {
        if slot <= 18446 {
            if slot <= 18444 {
// FRESH_START_AND_RESTART.agc:1164
//
// FRESH_START_AND_RESTART.agc:1165
//		CS	ITEMP2			# HAVE WE STORED THEM ALL?
// slot 18444
                if slot <> 18444 or instruction <> 16434 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 50).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18445 {
// FRESH_START_AND_RESTART.agc:1166
//		AD	EIGHTEEN
// slot 18445
                    if slot <> 18445 or instruction <> 25652 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 1076), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:1167
//		EXTEND
// slot 18446
                    if slot <> 18446 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 18447 {
// FRESH_START_AND_RESTART.agc:1168
//		BZF	V5OUT1			# YES, GET PHASE INFORMATION.
// slot 18447
                if slot <> 18447 or instruction <> 5141 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5141, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18448 {
// FRESH_START_AND_RESTART.agc:1169
//
// FRESH_START_AND_RESTART.agc:1170
//		CA	TWELVE			# NO, INCREMENT INDEXES AND LOOP.
// slot 18448
                    if slot <> 18448 or instruction <> 15353 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 3065), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:1171
//		ADS	ITEMP1
// slot 18449
                    if slot <> 18449 or instruction <> 11313 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 49).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 18452 {
            if slot <= 18450 {
// FRESH_START_AND_RESTART.agc:1172
//		CA	THREE
// slot 18450
                if slot <> 18450 or instruction <> 15500 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 3212), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18451 {
// FRESH_START_AND_RESTART.agc:1173
//		ADS	ITEMP2
// slot 18451
                    if slot <> 18451 or instruction <> 11314 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 50).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:1174
//		TCF	V5LOOP1
// slot 18452
                    if slot <> 18452 or instruction <> 5123 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5123, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 18454 {
                if slot <= 18453 {
// FRESH_START_AND_RESTART.agc:1175
//
// FRESH_START_AND_RESTART.agc:1176
//		EBANK=	PHSNAME1
// FRESH_START_AND_RESTART.agc:1177
//V5OUT1		CA	EBANK3			# PHSNAME REGISTERS ARE IN EBANK3.
// slot 18453
                    if slot <> 18453 or instruction <> 14889 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2601), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:1178
//		TS	EBANK
// slot 18454
                    if slot <> 18454 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18455 {
// FRESH_START_AND_RESTART.agc:1179
//
// FRESH_START_AND_RESTART.agc:1180
//		CA	ELEVEN			# GET PHASE 2CADRS.
// slot 18455
                    if slot <> 18455 or instruction <> 14868 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2580), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:1181
//		TC	GENTRAN
// slot 18456
                    if slot <> 18456 or instruction <> 2950 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2950, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1077] to agcAotUnit1077@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:1182
//		ADRES	PHSNAME1
// slot 18457
    18457, 1596,
// FRESH_START_AND_RESTART.agc:1183
//		ADRES	VAC5 +21D
// slot 18458
    18458, 908
)).

// bank 20, slots 18459-18462
function agcAotUnit1078 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18460 {
        if slot <= 18459 {
// FRESH_START_AND_RESTART.agc:1184
//
// FRESH_START_AND_RESTART.agc:1185
//		CA	ZERO			# NOW INITIALIZE INDEXES AGAIN.
// slot 18459
            if slot <> 18459 or instruction <> 14865 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// FRESH_START_AND_RESTART.agc:1186
//		TS	ITEMP1
// slot 18460
            if slot <> 18460 or instruction <> 22577 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22577, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 18461 {
// FRESH_START_AND_RESTART.agc:1187
//		TS	ITEMP2
// slot 18461
            if slot <> 18461 or instruction <> 22578 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22578, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// FRESH_START_AND_RESTART.agc:1188
//
// FRESH_START_AND_RESTART.agc:1189
//V5LOOP2		INDEX	ITEMP1			# LOOP TO GET PHASE TABLES.
// slot 18462
            if slot <> 18462 or instruction <> 20529 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1078] to agcAotUnit1078@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:1190
//		CA	PHASE1
// slot 18463
    18463, 25558
)).

// bank 20, slots 18464-18464
function agcAotUnit1079 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// FRESH_START_AND_RESTART.agc:1191
//		INDEX	ITEMP2
// slot 18464
    if slot <> 18464 or instruction <> 20530 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1079] to agcAotUnit1079@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:1192
//		TS	VAC5 +33D
// slot 18465
    18465, 45988
)).

// bank 20, slots 18466-18483
function agcAotUnit1080 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18474 {
        if slot <= 18469 {
            if slot <= 18467 {
                if slot <= 18466 {
// FRESH_START_AND_RESTART.agc:1193
//
// FRESH_START_AND_RESTART.agc:1194
//# Page 205
// FRESH_START_AND_RESTART.agc:1195
//		CS	ITEMP2			# DO WE HAVE THEM ALL?
// slot 18466
                    if slot <> 18466 or instruction <> 16434 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 50).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:1196
//		AD	FIVE
// slot 18467
                    if slot <> 18467 or instruction <> 27154 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2578), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18468 {
// FRESH_START_AND_RESTART.agc:1197
//		EXTEND
// slot 18468
                    if slot <> 18468 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:1198
//		BZF	V5OUT2			# YES, GO FINISH UP.
// slot 18469
                    if slot <> 18469 or instruction <> 5162 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5162, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 18471 {
                if slot <= 18470 {
// FRESH_START_AND_RESTART.agc:1199
//
// FRESH_START_AND_RESTART.agc:1200
//		CA	TWO			# NO, INCREMENT INDEXES AND LOOP.
// slot 18470
                    if slot <> 18470 or instruction <> 14862 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:1201
//		ADS	ITEMP1
// slot 18471
                    if slot <> 18471 or instruction <> 11313 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 49).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18472 {
// FRESH_START_AND_RESTART.agc:1202
//		INCR	ITEMP2
// slot 18472
                    if slot <> 18472 or instruction <> 10290 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 50).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18473 {
// FRESH_START_AND_RESTART.agc:1203
//		TCF	V5LOOP2
// slot 18473
                        if slot <> 18473 or instruction <> 5150 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5150, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:1204
//
// FRESH_START_AND_RESTART.agc:1205
//V5OUT2		CA	MPAC +3
// slot 18474
                        if slot <> 18474 or instruction <> 12399 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 111).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 18478 {
            if slot <= 18476 {
                if slot <= 18475 {
// FRESH_START_AND_RESTART.agc:1206
//		TS	VAC5 +39D
// slot 18475
                    if slot <> 18475 or instruction <> 23000 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23000, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:1207
//
// FRESH_START_AND_RESTART.agc:1208
//		EXTEND
// slot 18476
                    if slot <> 18476 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18477 {
// FRESH_START_AND_RESTART.agc:1209
//		DCA	NEWLOC
// slot 18477
                    if slot <> 18477 or instruction <> 12342 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 54, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:1210
//		DXCH	VAC5 +40D
// slot 18478
                    if slot <> 18478 or instruction <> 21978 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 474, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 18480 {
                if slot <= 18479 {
// FRESH_START_AND_RESTART.agc:1211
//
// FRESH_START_AND_RESTART.agc:1212
//		CA	NEWJOB
// slot 18479
                    if slot <> 18479 or instruction <> 12343 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 55).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FRESH_START_AND_RESTART.agc:1213
//		TS	VAC5 +22D
// slot 18480
                    if slot <> 18480 or instruction <> 22983 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22983, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18481 {
// FRESH_START_AND_RESTART.agc:1214
//
// FRESH_START_AND_RESTART.agc:1215
//		CA	NEWPRIO
// slot 18481
                    if slot <> 18481 or instruction <> 12339 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 51).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18482 {
// FRESH_START_AND_RESTART.agc:1216
//		TS	VAC5 +26D
// slot 18482
                        if slot <> 18482 or instruction <> 22987 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22987, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FRESH_START_AND_RESTART.agc:1217
//
// FRESH_START_AND_RESTART.agc:1218
//		TC	SWRETURN
// slot 18483
                        if slot <> 18483 or instruction <> 2493 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2493, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1080] to agcAotUnit1080@.

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:1219
//
// FRESH_START_AND_RESTART.agc:1220
//EIGHTEEN	OCT	22
// slot 18484
    18484, 36,
// FRESH_START_AND_RESTART.agc:1221
//		SETLOC	VERB37
// FRESH_START_AND_RESTART.agc:1222
//		BANK
// FRESH_START_AND_RESTART.agc:1223
//
// FRESH_START_AND_RESTART.agc:1224
//NEG7		EQUALS	OCT77770
// FRESH_START_AND_RESTART.agc:1225
//
// FRESH_START_AND_RESTART.agc:1226
//OCT44571	OCT	44571			# CONSTANTS TO CLEAR CHANNEL BITS IN V37
// slot 6403
    6403, 37618,
// FRESH_START_AND_RESTART.agc:1227
//OCT600		OCT	600
// slot 6404
    6404, 768,
// FRESH_START_AND_RESTART.agc:1228
//		EBANK=	PACTOFF
// FRESH_START_AND_RESTART.agc:1229
//P00DAPAD	2CADR	T5IDLOC
// slot 6405 6406
    6405, 3286, 6406, 10348,
// FRESH_START_AND_RESTART.agc:1230
//
// FRESH_START_AND_RESTART.agc:1231
//MMTEMP		EQUALS	PHSPRDT3
// FRESH_START_AND_RESTART.agc:1232
//BASETEMP	EQUALS	TBASE4
// FRESH_START_AND_RESTART.agc:1233
//BIT7-8		OCT	300
// slot 6407
    6407, 384,
// FRESH_START_AND_RESTART.agc:1234
//OCT01120	OCT	01120
// slot 6408
    6408, 1184,
// FRESH_START_AND_RESTART.agc:1235
//
// FRESH_START_AND_RESTART.agc:1236
//V37QCAD		CADR	V37XEQ +3
// slot 6409
    6409, 8574,
// FRESH_START_AND_RESTART.agc:1237
//R00AD		CADR	DUMMYAD
// slot 6410
    6410, 8374,
// FRESH_START_AND_RESTART.agc:1238
//		EBANK=	DAPDATR1
// FRESH_START_AND_RESTART.agc:1239
//RCSADDR4	2CADR	RCSATT
// slot 6411 6412
    6411, 2212, 6412, 34924,
// FRESH_START_AND_RESTART.agc:1240
//
// FRESH_START_AND_RESTART.agc:1241
//3.1SEC		OCT	37312			# 2.5 + 0.6 SEC
// slot 6413
    6413, 32148,
// FRESH_START_AND_RESTART.agc:1242
//
// FRESH_START_AND_RESTART.agc:1243
//# FOR VERB 37 TWO TABLES ARE MAINTAINED.  EACH TABLE HAS AN ENTRY FOR EACH
// FRESH_START_AND_RESTART.agc:1244
//# MAJOR MODE THAT CAN BE STARTED FROM THE KEYBOARD.  THE ENTRIES ARE PUT
// FRESH_START_AND_RESTART.agc:1245
//# INTO THE TABLE WITH THE ENTRY FOR THE HIGHEST MAJOR MODE COMING FIRST,
// FRESH_START_AND_RESTART.agc:1246
//# Page 206
// FRESH_START_AND_RESTART.agc:1247
//# TO THE LOWEST MAJOR MODE WHICH IS THE LAST ENTRY IN EACH TABLE.
// FRESH_START_AND_RESTART.agc:1248
//
// FRESH_START_AND_RESTART.agc:1249
//# 	THE FCADRMM TABLE CONTAINS THE FCADR OF THE STARTING JOB OF
// FRESH_START_AND_RESTART.agc:1250
//# THE MAJOR MODE.  FOR EXAMPLE,
// FRESH_START_AND_RESTART.agc:1251
//
// FRESH_START_AND_RESTART.agc:1252
//#	FCADRMM1	FCADR	P79		# START OF P 79
// FRESH_START_AND_RESTART.agc:1253
//#			FCADR	PROG18		# START OF P 18
// FRESH_START_AND_RESTART.agc:1254
//#			FCADR	P01		# START OF P 01
// FRESH_START_AND_RESTART.agc:1255
//
// FRESH_START_AND_RESTART.agc:1256
//FCADRMM1	EQUALS
// FRESH_START_AND_RESTART.agc:1257
//		FCADR	P79
// slot 6414
    6414, 9460,
// FRESH_START_AND_RESTART.agc:1258
//		FCADR	P78
// slot 6415
    6415, 9160,
// FRESH_START_AND_RESTART.agc:1259
//		FCADR	P77
// slot 6416
    6416, 60630,
// FRESH_START_AND_RESTART.agc:1260
//		FCADR	P76
// slot 6417
    6417, 22642,
// FRESH_START_AND_RESTART.agc:1261
//		FCADR	P75
// slot 6418
    6418, 59622,
// FRESH_START_AND_RESTART.agc:1262
//		FCADR	P74
// slot 6419
    6419, 59396,
// FRESH_START_AND_RESTART.agc:1263
//		FCADR	P73
// slot 6420
    6420, 9794,
// FRESH_START_AND_RESTART.agc:1264
//		FCADR	P72
// slot 6421
    6421, 9610,
// FRESH_START_AND_RESTART.agc:1265
//		FCADR	P62
// slot 6422
    6422, 45472,
// FRESH_START_AND_RESTART.agc:1266
//		FCADR	P61
// slot 6423
    6423, 45342,
// FRESH_START_AND_RESTART.agc:1267
//		FCADR	P54
// slot 6424
    6424, 26624,
// FRESH_START_AND_RESTART.agc:1268
//		FCADR	P53
// slot 6425
    6425, 25710,
// FRESH_START_AND_RESTART.agc:1269
//		FCADR	PROG52
// slot 6426
    6426, 26624,
// FRESH_START_AND_RESTART.agc:1270
//		FCADR	P51
// slot 6427
    6427, 25710,
// FRESH_START_AND_RESTART.agc:1271
//		FCADR	P47CSM
// slot 6428
    6428, 41574,
// FRESH_START_AND_RESTART.agc:1272
//		FCADR	P41CSM
// slot 6429
    6429, 47896,
// FRESH_START_AND_RESTART.agc:1273
//		FCADR	P40CSM
// slot 6430
    6430, 41078,
// FRESH_START_AND_RESTART.agc:1274
//		FCADR	P39
// slot 6431
    6431, 9452,
// FRESH_START_AND_RESTART.agc:1275
//		FCADR	P38
// slot 6432
    6432, 9156,
// FRESH_START_AND_RESTART.agc:1276
//		FCADR	P37
// slot 6433
    6433, 62060,
// FRESH_START_AND_RESTART.agc:1277
//		FCADR	P35
// slot 6434
    6434, 59614,
// FRESH_START_AND_RESTART.agc:1278
//		FCADR	P34
// slot 6435
    6435, 59392,
// FRESH_START_AND_RESTART.agc:1279
//		FCADR	P33
// slot 6436
    6436, 9790,
// FRESH_START_AND_RESTART.agc:1280
//		FCADR	P32
// slot 6437
    6437, 9606,
// FRESH_START_AND_RESTART.agc:1281
//		FCADR	P31
// slot 6438
    6438, 60862,
// FRESH_START_AND_RESTART.agc:1282
//		FCADR	P30
// slot 6439
    6439, 60838,
// FRESH_START_AND_RESTART.agc:1283
//		FCADR	P23
// slot 6440
    6440, 51718,
// FRESH_START_AND_RESTART.agc:1284
//		FCADR	PROG22
// slot 6441
    6441, 49152,
// FRESH_START_AND_RESTART.agc:1285
//		FCADR	PROG21
// slot 6442
    6442, 63490,
// FRESH_START_AND_RESTART.agc:1286
//		FCADR	PROG20
// slot 6443
    6443, 63842,
// FRESH_START_AND_RESTART.agc:1287
//		FCADR	P17
// slot 6444
    6444, 60626,
// FRESH_START_AND_RESTART.agc:1288
//		FCADR	P06
// slot 6445
    6445, 46944,
// FRESH_START_AND_RESTART.agc:1289
//		FCADR	GTSCPSS1			# GYROCOMPASS STANDARD LEAD IN.
// slot 6446
    6446, 55298,
// FRESH_START_AND_RESTART.agc:1290
//
// FRESH_START_AND_RESTART.agc:1291
//# THE PREMM TABLE CONTAINS THE E-BANK,MAJOR MODE, AND PRIORITY
// FRESH_START_AND_RESTART.agc:1292
//# INFORMATION, IT IS IN THE FOLLOWING FORM,
// FRESH_START_AND_RESTART.agc:1293
//
// FRESH_START_AND_RESTART.agc:1294
//#	PPP PPE EEM MMM MMM
// FRESH_START_AND_RESTART.agc:1295
//#
// FRESH_START_AND_RESTART.agc:1296
//# Page 207
// FRESH_START_AND_RESTART.agc:1297
//#	WHERE THE 7 M BITS CONTAIN THE MAJOR MODE NUMBER
// FRESH_START_AND_RESTART.agc:1298
//#		   3 E BITS CONTAIN THE E-BANK NUMBER
// FRESH_START_AND_RESTART.agc:1299
//#		   5 P BITS CONTAIN THE PRIORITY AT WHICH THE JOB IS
// FRESH_START_AND_RESTART.agc:1300
//#			TO BE STARTED
// FRESH_START_AND_RESTART.agc:1301
//
// FRESH_START_AND_RESTART.agc:1302
//#	FOR EXAMPLE,
// FRESH_START_AND_RESTART.agc:1303
//
// FRESH_START_AND_RESTART.agc:1304
//#		PREMM1		OCT	67213		# PRIORITY	33
// FRESH_START_AND_RESTART.agc:1305
//#							# E-BANK	 5
// FRESH_START_AND_RESTART.agc:1306
//#							# MAJOR MODE	11
// FRESH_START_AND_RESTART.agc:1307
//#				OCT	25437		# PRIORITY	 12
// FRESH_START_AND_RESTART.agc:1308
//#							# E-BANK	 6
// FRESH_START_AND_RESTART.agc:1309
//#							# MAJOR MODE	31
// FRESH_START_AND_RESTART.agc:1310
//
// FRESH_START_AND_RESTART.agc:1311
//PREMM1		EQUALS
// FRESH_START_AND_RESTART.agc:1312
//		OCT	27117		# MM 79		EBANK 4		PRIO 13
// slot 6447
    6447, 23710,
// FRESH_START_AND_RESTART.agc:1313
//		OCT	27116		# MM 78		EBANK 4		PR23 13
// slot 6448
    6448, 23708,
// FRESH_START_AND_RESTART.agc:1314
//		OCT	27115		# MM 77		EBANK 4		PRIO 13
// slot 6449
    6449, 23706,
// FRESH_START_AND_RESTART.agc:1315
//		OCT	27714		# MM 76		EBANK 4		PRIO 13
// slot 6450
    6450, 24472,
// FRESH_START_AND_RESTART.agc:1316
//		OCT	27113		# MM 75		EBANK 4		PRIO 13
// slot 6451
    6451, 23702,
// FRESH_START_AND_RESTART.agc:1317
//		OCT	27112		# MM 74		EBANK 4		PRIO 13
// slot 6452
    6452, 23700,
// FRESH_START_AND_RESTART.agc:1318
//		OCT	27111		# MM 73		EBANK 4		PRIO 13
// slot 6453
    6453, 23698,
// FRESH_START_AND_RESTART.agc:1319
//		OCT	27110		# MM 72		EBANK 4		PRIO 13
// slot 6454
    6454, 23696,
// FRESH_START_AND_RESTART.agc:1320
//		OCT	27476		# MM 62		EBANK 6		PRIO 13
// slot 6455
    6455, 24188,
// FRESH_START_AND_RESTART.agc:1321
//		OCT	27475		# MM 61		EBANK 6		PRIO 13
// slot 6456
    6456, 24186,
// FRESH_START_AND_RESTART.agc:1322
//		OCT	27266		# MM 54		EBANK 5		PRIO 13
// slot 6457
    6457, 23916,
// FRESH_START_AND_RESTART.agc:1323
//		OCT	27265		# MM 53		EBANK 5		PRIO 13
// slot 6458
    6458, 23914,
// FRESH_START_AND_RESTART.agc:1324
//		OCT	27264		# MM 52		EBANK 5		PRIO 13
// slot 6459
    6459, 23912,
// FRESH_START_AND_RESTART.agc:1325
//		OCT	27263		# MM 51		EBANK 5		PRIO 13
// slot 6460
    6460, 23910,
// FRESH_START_AND_RESTART.agc:1326
//		OCT	27657		# MM 47		EBANK 7		PRIO 13
// slot 6461
    6461, 24414,
// FRESH_START_AND_RESTART.agc:1327
//		OCT	27451		# MM 41		EBANK 6		PRIO 13
// slot 6462
    6462, 24146,
// FRESH_START_AND_RESTART.agc:1328
//		OCT	27450		# MM 40		EBANK 6		PRIO 13
// slot 6463
    6463, 24144,
// FRESH_START_AND_RESTART.agc:1329
//		OCT	27047		# MM 39		EBANK 4		PRIO 13
// slot 6464
    6464, 23630,
// FRESH_START_AND_RESTART.agc:1330
//		OCT	27046		# MM 38		EBANK 4		PRIO 13
// slot 6465
    6465, 23628,
// FRESH_START_AND_RESTART.agc:1331
//		OCT	27645		# MM 37		EBANK 7		PRIO 13
// slot 6466
    6466, 24394,
// FRESH_START_AND_RESTART.agc:1332
//		OCT	27043		# MM 35		EBANK 4		PRIO 13
// slot 6467
    6467, 23622,
// FRESH_START_AND_RESTART.agc:1333
//		OCT	27042		# MM 34		EBANK 4		PRIO 13
// slot 6468
    6468, 23620,
// FRESH_START_AND_RESTART.agc:1334
//		OCT	27041		# MM 33		EBANK 4		PRIO 13
// slot 6469
    6469, 23618,
// FRESH_START_AND_RESTART.agc:1335
//		OCT	27040		# MM 32		EBANK 4		PRIO 13
// slot 6470
    6470, 23616,
// FRESH_START_AND_RESTART.agc:1336
//		OCT	27637		# MM 31		EBANK 7		PRIO 13
// slot 6471
    6471, 24382,
// FRESH_START_AND_RESTART.agc:1337
//		OCT	27636		# MM 30		EBANK 7		PRIO 13
// slot 6472
    6472, 24380,
// FRESH_START_AND_RESTART.agc:1338
//		OCT	27227		# MM 23		EBANK 5		PRIO 13
// slot 6473
    6473, 23854,
// FRESH_START_AND_RESTART.agc:1339
//		OCT	27226		# MM 22		EBANK 5		PRIO 13
// slot 6474
    6474, 23852,
// FRESH_START_AND_RESTART.agc:1340
//		OCT	27025		# MM 21		EBANK 4		PRIO 13
// slot 6475
    6475, 23594,
// FRESH_START_AND_RESTART.agc:1341
//		OCT	27424		# MM 20		EBANK 6		PRIO 13
// slot 6476
    6476, 24104,
// FRESH_START_AND_RESTART.agc:1342
//		OCT	27021		# MM 17		EBANK 6		PRIO 13
// slot 6477
    6477, 23586,
// FRESH_START_AND_RESTART.agc:1343
//		OCT	27006		# MM 06		EBANK 4		PRIO 13
// slot 6478
    6478, 23564,
// FRESH_START_AND_RESTART.agc:1344
//		OCT	41201		# MM 01		EBANK 5		PRIO 20
// slot 6479
    6479, 34050,
// FRESH_START_AND_RESTART.agc:1345
//
// FRESH_START_AND_RESTART.agc:1346
//# Page 208
// FRESH_START_AND_RESTART.agc:1347
//# THE FOLLOWING LIST IS FOR THE PURPOSE OF VERIFYING THAT THE EBA
// FRESH_START_AND_RESTART.agc:1348
//
// FRESH_START_AND_RESTART.agc:1349
//		EBANK=	TIG		# EBANK SETTING REQUIRED BY MM 76
// FRESH_START_AND_RESTART.agc:1350
//		EBANK=	KT		# EBANK SETTING REQUIRED BY MM 75
// FRESH_START_AND_RESTART.agc:1351
//		EBANK=	SUBEXIT		# EBANK SETTING REQUIRED BY MM 74
// FRESH_START_AND_RESTART.agc:1352
//		EBANK=	SUBEXIT		# EBANK SETTING REQUIRED BY MM 73
// FRESH_START_AND_RESTART.agc:1353
//		EBANK=	SUBEXIT		# EBANK SETTING REQUIRED BY MM 72
// FRESH_START_AND_RESTART.agc:1354
//		EBANK=	AOG		# EBANK SETTING REQUIRED BY MM 62
// FRESH_START_AND_RESTART.agc:1355
//		EBANK=	AOG		# EBANK SETTING REQUIRED BY MM 61
// FRESH_START_AND_RESTART.agc:1356
//		EBANK=	BESTI		# EBANK SETTING REQUIRED BY MM 54
// FRESH_START_AND_RESTART.agc:1357
//		EBANK=	STARIND		# EBANK SETTING REQUIRED BY MM 53
// FRESH_START_AND_RESTART.agc:1358
//		EBANK=	BESTI		# EBANK SETTING REQUIRED BY MM 52
// FRESH_START_AND_RESTART.agc:1359
//		EBANK=	STARIND		# EBANK SETTING REQUIRED BY MM 51
// FRESH_START_AND_RESTART.agc:1360
//		EBANK=	P40TMP		# EBANK SETTING REQUIRED BY MM 47
// FRESH_START_AND_RESTART.agc:1361
//		EBANK=	DAPDATR1	# EBANK SETTING REQUIRED BY MM 41
// FRESH_START_AND_RESTART.agc:1362
//		EBANK=	KMPAC		# EBANK SETTING REQUIRED BY MM 40
// FRESH_START_AND_RESTART.agc:1363
//		EBANK=	KT		# EBANK SETTING REQUIRED BY MM 35
// FRESH_START_AND_RESTART.agc:1364
//		EBANK=	SUBEXIT		# EBANK SETTING REQUIRED BY MM 34
// FRESH_START_AND_RESTART.agc:1365
//		EBANK=	SUBEXIT		# EBANK SETTING REQUIRED BY MM 33
// FRESH_START_AND_RESTART.agc:1366
//		EBANK=	SUBEXIT		# EBANK SETTING REQUIRED BY MM 32
// FRESH_START_AND_RESTART.agc:1367
//		EBANK=	+MGA		# EBANK SETTING REQUIRED BY MM 30
// FRESH_START_AND_RESTART.agc:1368
//		EBANK=	LANDMARK	# EBANK SETTING REQUIRED BY MM 23
// FRESH_START_AND_RESTART.agc:1369
//		EBANK=	MARKINDX	# EBANK SETTING REQUIRED BY MM 22
// FRESH_START_AND_RESTART.agc:1370
//		EBANK=	WHOCARES	# EBANK SETTING REQUIRED BY MM 21
// FRESH_START_AND_RESTART.agc:1371
//		EBANK=	ESTROKER	# EBANK SETTING REQUIRED BY MM 20
// FRESH_START_AND_RESTART.agc:1372
//		EBANK=	TIME2SAV	# EBANK SETTING REQUIRED BY MM 06
// FRESH_START_AND_RESTART.agc:1373
//		EBANK=	QPLACE		# EBANK SETTING REQUIRED BY MM 01
// FRESH_START_AND_RESTART.agc:1374
//
// FRESH_START_AND_RESTART.agc:1375
//
// FRESH_START_AND_RESTART.agc:1376
//# NOTE,		THE FOLLOWING CONSTANT IS THE NUMBER OF ENTRIES IN EACH OF
// FRESH_START_AND_RESTART.agc:1377
//# ----		THE ABOVE LISTS-1(IE, THE NUMBER OF MAJOR MODES(EXCEPT P00)
// FRESH_START_AND_RESTART.agc:1378
//#		THAT CAN BE CALLED FROM THE KEYBOARD MINUS ONE)
// FRESH_START_AND_RESTART.agc:1379
//
// FRESH_START_AND_RESTART.agc:1380
//EPREMM1		EQUALS			# END OF PREMM1 TABLE
// FRESH_START_AND_RESTART.agc:1381
//		SETLOC	PREMM1		# THIS CODING WILL AUTOMATICALLY CHANGE
// FRESH_START_AND_RESTART.agc:1382
//NO.MMS		=MINUS	EPREMM1		# THE "NOV37MM" CONSTANT AS ENTRIES ARE
// FRESH_START_AND_RESTART.agc:1383
//		SETLOC	VERB37		# INSERTED(IN) OR DELETED(FROM) THE
// FRESH_START_AND_RESTART.agc:1384
//		BANK			# "PREMM1" TABLE.
// FRESH_START_AND_RESTART.agc:1385
//
// FRESH_START_AND_RESTART.agc:1386
//NOV37MM		ADRES	NO.MMS	-1	# ITEMS IN "PREMM1"TABLE - 1.  *DON'T MOVE*
// slot 6480
    6480, 64
)).

agcAotInstallSourceRope(list(
// FRESH_START_AND_RESTART.agc:1387
//
// FRESH_START_AND_RESTART.agc:1388
//
// FRESH_START_AND_RESTART.agc:1389
//DNLADMM1	EQUALS
// FRESH_START_AND_RESTART.agc:1390
//		ADRES	RENDEZVU	# P79
// slot 6481
    6481, 4,
// FRESH_START_AND_RESTART.agc:1391
//		ADRES	RENDEZVU	# P78
// slot 6482
    6482, 4,
// FRESH_START_AND_RESTART.agc:1392
//		ADRES	RENDEZVU	# P77
// slot 6483
    6483, 4,
// FRESH_START_AND_RESTART.agc:1393
//		ADRES	RENDEZVU	# P76
// slot 6484
    6484, 4,
// FRESH_START_AND_RESTART.agc:1394
//		ADRES	RENDEZVU	# P75
// slot 6485
    6485, 4,
// FRESH_START_AND_RESTART.agc:1395
//		ADRES	RENDEZVU	# P74
// slot 6486
    6486, 4,
// FRESH_START_AND_RESTART.agc:1396
//		ADRES	RENDEZVU	# P73
// slot 6487
    6487, 4,
// FRESH_START_AND_RESTART.agc:1397
//# Page 209
// FRESH_START_AND_RESTART.agc:1398
//		ADRES	RENDEZVU	# P72
// slot 6488
    6488, 4,
// FRESH_START_AND_RESTART.agc:1399
//		ADRES	ENTRYUPD	# P62
// slot 6489
    6489, 2,
// FRESH_START_AND_RESTART.agc:1400
//		ADRES	POWERED		# P61
// slot 6490
    6490, 6,
// FRESH_START_AND_RESTART.agc:1401
//		ADRES	COSTALIN
// slot 6491
    6491, 0,
// FRESH_START_AND_RESTART.agc:1402
//		ADRES	COSTALIN
// slot 6492
    6492, 0,
// FRESH_START_AND_RESTART.agc:1403
//		ADRES	COSTALIN	# P52
// slot 6493
    6493, 0,
// FRESH_START_AND_RESTART.agc:1404
//		ADRES	COSTALIN	# P51
// slot 6494
    6494, 0,
// FRESH_START_AND_RESTART.agc:1405
//		ADRES	POWERED		# P47
// slot 6495
    6495, 6,
// FRESH_START_AND_RESTART.agc:1406
//		ADRES	POWERED		# P41
// slot 6496
    6496, 6,
// FRESH_START_AND_RESTART.agc:1407
//		ADRES	POWERED		# P40
// slot 6497
    6497, 6,
// FRESH_START_AND_RESTART.agc:1408
//		ADRES	RENDEZVU	# P39
// slot 6498
    6498, 4,
// FRESH_START_AND_RESTART.agc:1409
//		ADRES	RENDEZVU	# P38
// slot 6499
    6499, 4,
// FRESH_START_AND_RESTART.agc:1410
//		ADRES	RENDEZVU	# P37
// slot 6500
    6500, 4,
// FRESH_START_AND_RESTART.agc:1411
//		ADRES	RENDEZVU	# P35
// slot 6501
    6501, 4,
// FRESH_START_AND_RESTART.agc:1412
//		ADRES	RENDEZVU	# P34
// slot 6502
    6502, 4,
// FRESH_START_AND_RESTART.agc:1413
//		ADRES	RENDEZVU	# P33
// slot 6503
    6503, 4,
// FRESH_START_AND_RESTART.agc:1414
//		ADRES	RENDEZVU	# P32
// slot 6504
    6504, 4,
// FRESH_START_AND_RESTART.agc:1415
//		ADRES	RENDEZVU
// slot 6505
    6505, 4,
// FRESH_START_AND_RESTART.agc:1416
//		ADRES	RENDEZVU	# P30
// slot 6506
    6506, 4,
// FRESH_START_AND_RESTART.agc:1417
//		ADRES	RENDEZVU	# P23
// slot 6507
    6507, 4,
// FRESH_START_AND_RESTART.agc:1418
//		ADRES	P22DNLST	# P22
// slot 6508
    6508, 8,
// FRESH_START_AND_RESTART.agc:1419
//		ADRES	RENDEZVU	# P21
// slot 6509
    6509, 4,
// FRESH_START_AND_RESTART.agc:1420
//		ADRES	RENDEZVU	# P20
// slot 6510
    6510, 4,
// FRESH_START_AND_RESTART.agc:1421
//		ADRES	RENDEZVU	# P17
// slot 6511
    6511, 4,
// FRESH_START_AND_RESTART.agc:1422
//		ADRES	COSTALIN	# P06
// slot 6512
    6512, 0,
// FRESH_START_AND_RESTART.agc:1423
//		ADRES	COSTALIN	# P01
// slot 6513
    6513, 0,
// FRESH_START_AND_RESTART.agc:1424
//DNLADP00	=	ZERO
// FRESH_START_AND_RESTART.agc:1425
//COSTALIN	=	0
// FRESH_START_AND_RESTART.agc:1426
//ENTRYUPD	=	1
// FRESH_START_AND_RESTART.agc:1427
//RENDEZVU	=	2
// FRESH_START_AND_RESTART.agc:1428
//POWERED		=	3
// FRESH_START_AND_RESTART.agc:1429
//
// FRESH_START_AND_RESTART.agc:1430
//P22DNLST	=	4
// FRESH_START_AND_RESTART.agc:1431
//# ORBITAL INTEGRATION CONSTANTS
// FRESH_START_AND_RESTART.agc:1432
//
// FRESH_START_AND_RESTART.agc:1433
//# THESE CONSTANTS ARE USED IN COMPUTING THE SETTING OF MIDFLAG.
// FRESH_START_AND_RESTART.agc:1434
//RMM		2DEC	2538.09 E3 B-27	# 800 KM ABOVE LUNAR SURFACE
// slot 6514 6515
    6514, 618, 6515, 27048,
// FRESH_START_AND_RESTART.agc:1435
//
// FRESH_START_AND_RESTART.agc:1436
//RME		2DEC	7178165 B-29	# 800 KM ABOVE EQ. RADIUS
// slot 6516 6517
    6516, 438, 6517, 1974,
// FRESH_START_AND_RESTART.agc:1437
//
// FRESH_START_AND_RESTART.agc:1438
//		BANK	13
// FRESH_START_AND_RESTART.agc:1439
//		SETLOC	INTINIT
// FRESH_START_AND_RESTART.agc:1440
//		BANK
// FRESH_START_AND_RESTART.agc:1441
//
// FRESH_START_AND_RESTART.agc:1442
//		COUNT*	$$/INTIN
// FRESH_START_AND_RESTART.agc:1443
//
// FRESH_START_AND_RESTART.agc:1444
//		EBANK=	RRECTCSM
// FRESH_START_AND_RESTART.agc:1445
//
// FRESH_START_AND_RESTART.agc:1446
//STATEUP		SET	BOF		# EXTRAPOLATE CM STATE VECTOR
// slot 13312
    13312, 35864,
// FRESH_START_AND_RESTART.agc:1447
//			VINTFLAG
// slot 13313
    13313, 1656,
// FRESH_START_AND_RESTART.agc:1448
//# Page 210
// FRESH_START_AND_RESTART.agc:1449
//			ORBWFLAG	# ALSO 6X6 W-MATRIX IF VALID
// slot 13314
    13314, 2002,
// FRESH_START_AND_RESTART.agc:1450
//			+3		# 	FOR ORBITAL NAVIGATION
// slot 13315
    13315, 22540,
// FRESH_START_AND_RESTART.agc:1451
//		SET
// slot 13316
    13316, 65304,
// FRESH_START_AND_RESTART.agc:1452
//			DIM0FLAG
// slot 13317
    13317, 1660,
// FRESH_START_AND_RESTART.agc:1453
//		CLEAR	CALL
// slot 13318
    13318, 37912,
// FRESH_START_AND_RESTART.agc:1454
//			PRECIFLG
// slot 13319
    13319, 1902,
// FRESH_START_AND_RESTART.agc:1455
//			INTEGRV
// slot 13320
    13320, 23780,
// FRESH_START_AND_RESTART.agc:1456
//		BON	DLOAD
// slot 13321
    13321, 58648,
// FRESH_START_AND_RESTART.agc:1457
//			SURFFLAG
// slot 13322
    13322, 4494,
// FRESH_START_AND_RESTART.agc:1458
//			STATEND
// slot 13323
    13323, 22578,
// FRESH_START_AND_RESTART.agc:1459
//			TETCSM
// slot 13324
    13324, 1778,
// FRESH_START_AND_RESTART.agc:1460
//		STCALL	TDEC1
// slot 13325
    13325, 28738,
// FRESH_START_AND_RESTART.agc:1461
//			INTSTALL
// slot 13326
    13326, 24132,
// FRESH_START_AND_RESTART.agc:1462
//		CLEAR	CALL		# EXTRAPOLATE LM STATE VECTOR
// slot 13327
    13327, 37912,
// FRESH_START_AND_RESTART.agc:1463
//			VINTFLAG
// slot 13328
    13328, 1912,
// FRESH_START_AND_RESTART.agc:1464
//			SETIFLGS	# 	AND 6X6 W-MATRIX IF VALID
// slot 13329
    13329, 23408,
// FRESH_START_AND_RESTART.agc:1465
//		BOF	SET
// slot 13330
    13330, 35864,
// FRESH_START_AND_RESTART.agc:1466
//			RENDWFLG	#	FOR RENDEZVOUS NAVIGATION
// slot 13331
    13331, 3036,
// FRESH_START_AND_RESTART.agc:1467
//			+2
// slot 13332
    13332, 22572,
// FRESH_START_AND_RESTART.agc:1468
//			DIM0FLAG
// slot 13333
    13333, 1660,
// FRESH_START_AND_RESTART.agc:1469
//		SET	CALL
// slot 13334
    13334, 37912,
// FRESH_START_AND_RESTART.agc:1470
//			PRECIFLG
// slot 13335
    13335, 1646,
// FRESH_START_AND_RESTART.agc:1471
//			INTEGRV
// slot 13336
    13336, 23780,
// FRESH_START_AND_RESTART.agc:1472
//STATEND		CLRGO
// slot 13337
    13337, 65304,
// FRESH_START_AND_RESTART.agc:1473
//			NODOFLAG
// slot 13338
    13338, 1340,
// FRESH_START_AND_RESTART.agc:1474
//			ENDINT
// slot 13339
    13339, 23388,
// FRESH_START_AND_RESTART.agc:1475
//
// FRESH_START_AND_RESTART.agc:1476
//
// FRESH_START_AND_RESTART.agc:1477
//# THISVINT IS CALLED BY MIDTOAV1 AND2
// FRESH_START_AND_RESTART.agc:1478
//
// FRESH_START_AND_RESTART.agc:1479
//THISVINT	SET	RVQ
// slot 13340
    13340, 36376,
// FRESH_START_AND_RESTART.agc:1480
//			VINTFLAG
// slot 13341
    13341, 1656
)).

