// PORT: Original source unit FRESH_START_AND_RESTART.agc.
// PORT: Physical bank 05. Shared continuation entries, slots 7394–7398.
function agcAotUnit418 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7395 {
        if slot <= 7394 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:2
//# Filename:	FRESH_START_AND_RESTART.agc
// PORT: SOURCE FRESH_START_AND_RESTART.agc:3
//# Purpose:	Part of the source code for Comanche, build 055. It
// PORT: SOURCE FRESH_START_AND_RESTART.agc:4
//#		is part of the source code for the Command Module's
// PORT: SOURCE FRESH_START_AND_RESTART.agc:5
//#		(CM) Apollo Guidance Computer (AGC), Apollo 11.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE FRESH_START_AND_RESTART.agc:7
//# Reference:	pp. 181-210
// PORT: SOURCE FRESH_START_AND_RESTART.agc:8
//# Contact:	Ron Burkey <info@sandroid.org>,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:9
//#  		Fabrizio Bernardini <fabrizio@spacecraft.it>
// PORT: SOURCE FRESH_START_AND_RESTART.agc:10
//# Website:	http://www.ibiblio.org/apollo.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:11
//# Mod history:	2009-05-16 FB	Transcription Batch 2 Assignment.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:12
//#		2009-05-20 RSB	Removed an extraneous "TC STARTSUB".
// PORT: SOURCE FRESH_START_AND_RESTART.agc:13
//#		2009-05-21 RSB	Changed a "TC BANKCALL" to "TC STOPRATE"
// PORT: SOURCE FRESH_START_AND_RESTART.agc:14
//#				in INITSUB.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:15
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:16
//# The contents of the "Comanche055" files, in general, are transcribed
// PORT: SOURCE FRESH_START_AND_RESTART.agc:17
//# from scanned documents.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:18
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:19
//#	Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE FRESH_START_AND_RESTART.agc:20
//#	2021113-051.  April 1, 1969.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:21
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:22
//#	This AGC program shall also be referred to as Colossus 2A
// PORT: SOURCE FRESH_START_AND_RESTART.agc:23
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:24
//#	Prepared by
// PORT: SOURCE FRESH_START_AND_RESTART.agc:25
//#			Massachusetts Institute of Technology
// PORT: SOURCE FRESH_START_AND_RESTART.agc:26
//#			75 Cambridge Parkway
// PORT: SOURCE FRESH_START_AND_RESTART.agc:27
//#			Cambridge, Massachusetts
// PORT: SOURCE FRESH_START_AND_RESTART.agc:28
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:29
//#	under NASA contract NAS 9-4065.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:30
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:31
//# Refer directly to the online document mentioned above for further
// PORT: SOURCE FRESH_START_AND_RESTART.agc:32
//# information.  Please report any errors to info@sandroid.org.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:33
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:34
//# Page 181
// PORT: SOURCE FRESH_START_AND_RESTART.agc:35
//# PROGRAM DESCRIPTION						8 APRIL, 1967
// PORT: SOURCE FRESH_START_AND_RESTART.agc:36
//#								SUNDISK REV 120
// PORT: SOURCE FRESH_START_AND_RESTART.agc:37
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE FRESH_START_AND_RESTART.agc:38
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:39
//#     SLAP1	MAN INITIATED FRESH START
// PORT: SOURCE FRESH_START_AND_RESTART.agc:40
//#	1. EXECUTE STARTSUB
// PORT: SOURCE FRESH_START_AND_RESTART.agc:41
//#	2. TURN OFF DSKY DISCRETE-LAMPS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:42
//#	3. CLEAR FAIL REGISTERS,SELF-CHECK ERROR COUNTER AND RESTART
// PORT: SOURCE FRESH_START_AND_RESTART.agc:43
//#	   COUNTER
// PORT: SOURCE FRESH_START_AND_RESTART.agc:44
//#	4. EXECUTE DOFSTART
// PORT: SOURCE FRESH_START_AND_RESTART.agc:45
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:46
//#     DOFSTART	MACHINE INITIATED FRESH START
// PORT: SOURCE FRESH_START_AND_RESTART.agc:47
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:48
//#	1. CLEAR SELF-CHECK REGISTERS, MODE REGISTER AND CDUZ REGISTER
// PORT: SOURCE FRESH_START_AND_RESTART.agc:49
//#	2. CLEAR PHASE TABLE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:50
//#	3. INITIALIZE IMU FLAGS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:51
//#	4. INITIALIZE FLAGWORDS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:52
//#	5. TRANSFER CONTROL TO IDLE LOOP IN DUMMYJOB
// PORT: SOURCE FRESH_START_AND_RESTART.agc:53
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:54
//#     GOPROG	HARDWARE RESTART
// PORT: SOURCE FRESH_START_AND_RESTART.agc:55
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:56
//#	0. EXECUTE STARTSUB
// PORT: SOURCE FRESH_START_AND_RESTART.agc:57
//#	1. TRANSFER CONTROL TO DOFSTART IF ANY OF THE FOLLOWING CONDITIONS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:58
//#	   EXIST.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:59
//#	   A. RESTART OCCURED DURING EXECUTION OF ERASCHK
// PORT: SOURCE FRESH_START_AND_RESTART.agc:60
//#	   B. BOTH OSCILLATOR FAIL AND AGC WARNING ARE ON
// PORT: SOURCE FRESH_START_AND_RESTART.agc:61
//#	   C. MARK REJECT AND EITHER NAV OR MAIN DSKY ERROR LIGHT RESET
// PORT: SOURCE FRESH_START_AND_RESTART.agc:62
//#	      ARE ON.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:63
//#	2. SCHEDULE A T5RUPT PROGRAM FOR THE DAP
// PORT: SOURCE FRESH_START_AND_RESTART.agc:64
//#	3. SET FLAGWRD5 BITS FOR INTWAKE ROUTINE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:65
//#	4. EXTINGUISH ALL DSKY LAMPS, EXCEPT FOR PROGRAM ALARM,GIMBAL LOCK AND
// PORT: SOURCE FRESH_START_AND_RESTART.agc:66
//#	   NO ATT
// PORT: SOURCE FRESH_START_AND_RESTART.agc:67
//#	5. INITIALIZE IMU FLAGS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:68
//#	6. IF ENGINE COMMAND IS ON (FLAGWRD5,BIT 7), SET ENGINE ON (CHAN-
// PORT: SOURCE FRESH_START_AND_RESTART.agc:69
//#	   NEL 11, BIT 13)
// PORT: SOURCE FRESH_START_AND_RESTART.agc:70
//#	7. TRANSFER CONTROL TO GOPROG3
// PORT: SOURCE FRESH_START_AND_RESTART.agc:71
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:72
//#     ENEMA	SOFTWARE RESTART	INITIATED BY MAJOR MODE CHANGE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:73
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:74
//#	1. EXECUTE STARTSB2
// PORT: SOURCE FRESH_START_AND_RESTART.agc:75
//#	2. KILL PROGRAMS THAT WERE INTEGRATING OR WAITING FOR INTEGRATION
// PORT: SOURCE FRESH_START_AND_RESTART.agc:76
//#	   ROUTINE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:77
//#	3. TRANSFER CONTROL TO GOPROG3
// PORT: SOURCE FRESH_START_AND_RESTART.agc:78
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:79
//#     GOPROG3	SUBROUTINE COMMON TO GOPROG AND ENEMA
// PORT: SOURCE FRESH_START_AND_RESTART.agc:80
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:81
//#	1. TEST PHASE TABLES - IF INCORRECT, DISPLAY ALARM 1107 AND
// PORT: SOURCE FRESH_START_AND_RESTART.agc:82
//#	   TRANSFER CONTROL TO DOFSTART
// PORT: SOURCE FRESH_START_AND_RESTART.agc:83
//#	2. DISPLAY MAJOR MODE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:84
//#	3. IF ANY GROUPS WERE ACTIVE UPON RESTART,TRANSFER CONTROL TO THE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:85
//# Page 182
// PORT: SOURCE FRESH_START_AND_RESTART.agc:86
//#	   RESTARTS SUBROUTINE TO RESCHEDULE PENDING TASKS, LONGCALLS, AND
// PORT: SOURCE FRESH_START_AND_RESTART.agc:87
//#	   JOBS (P20 IS RESTARTED VIA FINDVAC)
// PORT: SOURCE FRESH_START_AND_RESTART.agc:88
//#	4. IF NO GROUPS WERE ACTIVE UPON RESTART, DISPLAY ALARM CODE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:89
//#	   1110 (RESTART WITH NO ACTIVE GROUPS).
// PORT: SOURCE FRESH_START_AND_RESTART.agc:90
//#	5. TRANSFER CONTROL TO IDLE LOOP IN DUMMYJOB
// PORT: SOURCE FRESH_START_AND_RESTART.agc:91
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:92
//#     STARTSUB	SUBROUTINE COMMON TO SLAP1 AND GOPROG
// PORT: SOURCE FRESH_START_AND_RESTART.agc:93
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:94
//#	1. CLEAR OUTBIT CHANNELS 5 AND 6
// PORT: SOURCE FRESH_START_AND_RESTART.agc:95
//#	2. INITIALIZE TIME5,TIME4,TIME3
// PORT: SOURCE FRESH_START_AND_RESTART.agc:96
//#	3. TRANSFER CONTROL TO STARTSB2
// PORT: SOURCE FRESH_START_AND_RESTART.agc:97
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:98
//#     STARTSB2	SUBROUTINE COMMON TO STARTSUB AND ENEMA
// PORT: SOURCE FRESH_START_AND_RESTART.agc:99
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:100
//#	1. INTIALIZE OUTBIT CHANNELS 11,12,13, AND 14
// PORT: SOURCE FRESH_START_AND_RESTART.agc:101
//#	2. REPLACE ALL TASKS ON WAITLIST WITH ENDTASK
// PORT: SOURCE FRESH_START_AND_RESTART.agc:102
//#	3. MAKE ALL EXECUTIVE REGISTERS AVAILABLE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:103
//#	4. MAKE ALL VAC AREAS AVAILABLE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:104
//#	5. CLEAR DSKY REGISTERS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:105
//#	6. ZERO NUMEROUS SWITCHES
// PORT: SOURCE FRESH_START_AND_RESTART.agc:106
//#	7. INITIALIZE OPTICS FLAGS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:107
//#	8. INITIALIZE PIPA AND TELEMETRY FAIL FLAGS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:108
//#	9. INITIALIZE DOWN TELEMETRY
// PORT: SOURCE FRESH_START_AND_RESTART.agc:109
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:110
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:111
//# INPUT/OUTPUT INITIALIZATION
// PORT: SOURCE FRESH_START_AND_RESTART.agc:112
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:113
//#	A. CALLING SEQUENCE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:114
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:115
//#		SLAP1 -	TC	POSTJUMP	OR	VERB 36,ENTER
// PORT: SOURCE FRESH_START_AND_RESTART.agc:116
//#			CADR 	SLAP1
// PORT: SOURCE FRESH_START_AND_RESTART.agc:117
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:118
//#		ENEMA -	TC 	POSTJUMP	*** DO NOT CALL ENEMA WITHOUT ***
// PORT: SOURCE FRESH_START_AND_RESTART.agc:119
//#			CADR 	ENEMA		*** CONSULTING POOH PEOPLE   ***
// PORT: SOURCE FRESH_START_AND_RESTART.agc:120
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:121
//#	B. OUTPUT
// PORT: SOURCE FRESH_START_AND_RESTART.agc:122
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:123
//#		ERASABLE MEMORY INITIALIZATION
// PORT: SOURCE FRESH_START_AND_RESTART.agc:124
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:125
//# PROGRAM ANALYSIS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:126
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:127
//#	A. SUBROUTINES CALLED
// PORT: SOURCE FRESH_START_AND_RESTART.agc:128
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:129
//#		MR.KLEAN,WAITLIST,DSPMM,ALARM,RESTARTS,FINDVAC
// PORT: SOURCE FRESH_START_AND_RESTART.agc:130
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:131
//#	B. ALARMS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:132
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:133
//#		1107 PHASE TABLE ERROR
// PORT: SOURCE FRESH_START_AND_RESTART.agc:134
//#		1110 RESTART WITH NO ACTIVE GROUPS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:135
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:136
//# Page 183
// PORT: SOURCE FRESH_START_AND_RESTART.agc:137
//		BANK	10
// PORT: SOURCE FRESH_START_AND_RESTART.agc:138
//		SETLOC	FRANDRES
// PORT: SOURCE FRESH_START_AND_RESTART.agc:139
//		BANK
// PORT: SOURCE FRESH_START_AND_RESTART.agc:140
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:141
//		EBANK=	LST1
// PORT: SOURCE FRESH_START_AND_RESTART.agc:142
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:143
//		COUNT	05/START
// PORT: SOURCE FRESH_START_AND_RESTART.agc:144
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:145
//SLAP1		INHINT			# FRESH START.  COMES HERE FROM PINBALL.
// PORT: Fixed ROM slots 7394.
            if slot <> 7394 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:146
//		TC	STARTSUB	# SUBROUTINE DOES MOST OF THE WORK.
// PORT: Fixed ROM slots 7395.
            if slot <> 7395 or instruction <> 1534 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1534, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 7396 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:147
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:148
//STARTSW		TCF	SKIPSIM		# PATCH....TCF STARTSIM...FOR SIMULATION
// PORT: Fixed ROM slots 7396.
            if slot <> 7396 or instruction <> 5353 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5353, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 7397 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:149
//STARTSIM	CAF	BIT14
// PORT: Fixed ROM slots 7397.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:150
//		TC	FINDVAC
// PORT: Fixed ROM slots 7398.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:151
//SIM2CADR	OCT	77777		# PATCH 2CADR (AND EBANK DESIGNATION) OF
// PORT: Fixed ROM slots 7399.
    7399, 65534,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:152
//		OCT	77777		# SIMULATION START ADDRESS.
// PORT: Fixed ROM slots 7400.
    7400, 65534
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7401–7487.
function agcAotUnit419 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7443 {
        if slot <= 7421 {
            if slot <= 7410 {
                if slot <= 7405 {
                    if slot <= 7402 {
                        if slot <= 7401 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:153
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:154
//SKIPSIM		CA	DSPTAB +11D
// PORT: Fixed ROM slots 7401.
                            if slot <> 7401 or instruction <> 12830 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 542).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:155
//		MASK	BITS4&6
// PORT: Fixed ROM slots 7402.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:156
//		AD	BIT15
// PORT: Fixed ROM slots 7403.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:157
//		TS	DSPTAB +11D	# REQUESTED FRESH START.
// PORT: Fixed ROM slots 7404.
                                if slot <> 7404 or instruction <> 23070 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23070, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:158
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:159
//		CA	ZERO		# SAME STORY ON ZEROING FAILREG.
// PORT: Fixed ROM slots 7405.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:160
//		TS	ERCOUNT
// PORT: Fixed ROM slots 7406.
                            if slot <> 7406 or instruction <> 23285 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23285, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:161
//		TS	FAILREG
// PORT: Fixed ROM slots 7407.
                            if slot <> 7407 or instruction <> 22781 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22781, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7408 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:162
//		TS	FAILREG +1
// PORT: Fixed ROM slots 7408.
                            if slot <> 7408 or instruction <> 22782 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22782, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7409 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:163
//		TS	FAILREG +2
// PORT: Fixed ROM slots 7409.
                                if slot <> 7409 or instruction <> 22783 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22783, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:164
//		TS	REDOCTR
// PORT: Fixed ROM slots 7410.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:165
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:166
//		CS	PRIO12
// PORT: Fixed ROM slots 7411.
                            if slot <> 7411 or instruction <> 18888 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2504), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:167
//		TS	DSRUPTSW
// PORT: Fixed ROM slots 7412.
                            if slot <> 7412 or instruction <> 23234 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23234, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7413 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:168
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:169
//DOFSTART	CAF	ZERO		# DO A FRESH START.
// PORT: Fixed ROM slots 7413.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:170
//		TS	ERESTORE	# ***** MUST NOT BE REMOVED FROM DOFSTART
// PORT: Fixed ROM slots 7414.
                                if slot <> 7414 or instruction <> 23280 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23280, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:171
//		TS	SMODE		# ***** MUST NOT BE REMOVED FROM DOFSTART
// PORT: Fixed ROM slots 7415.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:172
//		TS	UPSVFLAG	# UPDATE STATE VECTOR REQUEST FLAGWORD
// PORT: Fixed ROM slots 7416.
                            if slot <> 7416 or instruction <> 23361 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23361, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7417 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:173
//		EXTEND
// PORT: Fixed ROM slots 7417.
                                if slot <> 7417 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:174
//		WRITE	CHAN5		# TURN OFF RCS JETS
// PORT: Fixed ROM slots 7418.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:175
//		EXTEND
// PORT: Fixed ROM slots 7419.
                            if slot <> 7419 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7420 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:176
//		WRITE	CHAN6		# TURN OFF RCS JETS
// PORT: Fixed ROM slots 7420.
                                if slot <> 7420 or instruction <> 518 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 1, 6, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:177
//		EXTEND
// PORT: Fixed ROM slots 7421.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:178
//		WRITE	DSALMOUT	# ZERO CHANNEL 11
// PORT: Fixed ROM slots 7422.
                            if slot <> 7422 or instruction <> 521 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 1, 9, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:179
//		EXTEND
// PORT: Fixed ROM slots 7423.
                            if slot <> 7423 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7424 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:180
//		WRITE	CHAN12		# ZERO CHANNEL 12
// PORT: Fixed ROM slots 7424.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:181
//		EXTEND
// PORT: Fixed ROM slots 7425.
                                if slot <> 7425 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:182
//		WRITE	CHAN13		# ZERO CHANNEL 13
// PORT: Fixed ROM slots 7426.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:183
//		EXTEND
// PORT: Fixed ROM slots 7427.
                            if slot <> 7427 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7428 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:184
//		WRITE	CHAN14		# ZERO CHANNEL 14
// PORT: Fixed ROM slots 7428.
                                if slot <> 7428 or instruction <> 524 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 1, 12, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:185
//		TS	WTOPTION
// PORT: Fixed ROM slots 7429.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:186
//		TS	DNLSTCOD
// PORT: Fixed ROM slots 7430.
                            if slot <> 7430 or instruction <> 22746 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22746, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7431 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:187
//# Page 184
// PORT: SOURCE FRESH_START_AND_RESTART.agc:188
//		TS	NVSAVE
// PORT: Fixed ROM slots 7431.
                                if slot <> 7431 or instruction <> 22777 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22777, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:189
//		TS	EBANKTEM
// PORT: Fixed ROM slots 7432.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:190
//		TS	RATEINDX
// PORT: Fixed ROM slots 7433.
                            if slot <> 7433 or instruction <> 23128 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23128, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:191
//		TS	TRKMKCNT
// PORT: Fixed ROM slots 7434.
                            if slot <> 7434 or instruction <> 23126 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23126, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7435 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:192
//		TS	VHFCNT
// PORT: Fixed ROM slots 7435.
                            if slot <> 7435 or instruction <> 23125 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23125, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7436 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:193
//		TS	EXTVBACT
// PORT: Fixed ROM slots 7436.
                                if slot <> 7436 or instruction <> 23076 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23076, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:194
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:195
//		CS	DSPTAB +11D
// PORT: Fixed ROM slots 7437.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:196
//		MASK	BITS4&6
// PORT: Fixed ROM slots 7438.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:197
//		CCS	A
// PORT: Fixed ROM slots 7439.
                                if slot <> 7439 or instruction <> 4096 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:198
//		TC	+4
// PORT: Fixed ROM slots 7440.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:199
//		CA	BITS4&6
// PORT: Fixed ROM slots 7441.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:200
//		EXTEND			# THE IMU WAS IN COARSE ALIGN IN GIMBAL
// PORT: Fixed ROM slots 7442.
                                if slot <> 7442 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:201
//		WOR	CHAN12		# LOCK, SO PUT IT BACK INTO COARSE ALIGN.
// PORT: Fixed ROM slots 7443.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:202
//		TC	MR.KLEAN
// PORT: Fixed ROM slots 7444.
                            if slot <> 7444 or instruction <> 1345 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1345, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:203
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:204
//		CS	ZERO
// PORT: Fixed ROM slots 7445.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:205
//		TS	MODREG
// PORT: Fixed ROM slots 7446.
                            if slot <> 7446 or instruction <> 23049 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23049, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7447 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:206
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:207
//		CAF	PRIO30
// PORT: Fixed ROM slots 7447.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:208
//		TS	RESTREG
// PORT: Fixed ROM slots 7448.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:209
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:210
//		CAF	IM30INIF	# FRESH START IMU INITIALIZATION.
// PORT: Fixed ROM slots 7449.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:211
//		TS	IMODES30
// PORT: Fixed ROM slots 7450.
                                if slot <> 7450 or instruction <> 23248 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23248, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:212
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:213
//		CAF	NEGONE
// PORT: Fixed ROM slots 7451.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:214
//		TS	OPTIND		# KILL COARSE OPTICS
// PORT: Fixed ROM slots 7452.
                            if slot <> 7452 or instruction <> 23235 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23235, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7453 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:215
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:216
//		CAF	OPTINITF
// PORT: Fixed ROM slots 7453.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:217
//		TS	OPTMODES
// PORT: Fixed ROM slots 7454.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:218
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:219
//		CAF	IM33INIT
// PORT: Fixed ROM slots 7455.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:220
//		TS	IMODES33
// PORT: Fixed ROM slots 7456.
                            if slot <> 7456 or instruction <> 23249 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23249, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7457 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:221
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:222
//		EXTEND			# LET T5 IDLE.
// PORT: Fixed ROM slots 7457.
                            if slot <> 7457 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7458 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:223
//		DCA	T5IDLER
// PORT: Fixed ROM slots 7458.
                                if slot <> 7458 or instruction <> 13934 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 1646, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:224
//		DXCH	T5LOC
// PORT: Fixed ROM slots 7459.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:225
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:226
//		CA	SWINIT
// PORT: Fixed ROM slots 7460.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:227
//		TS	STATE
// PORT: Fixed ROM slots 7461.
                                if slot <> 7461 or instruction <> 22588 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22588, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:228
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:229
//		CA	FLAGWRD1
// PORT: Fixed ROM slots 7462.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:230
//		MASK	NOP01BIT	# LEAVE NODOP01 FLAG UNTOUCHED
// PORT: Fixed ROM slots 7463.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:231
//		AD	SWINIT +1
// PORT: Fixed ROM slots 7464.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:232
//		TS	FLAGWRD1
// PORT: Fixed ROM slots 7465.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:233
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:234
//		CA 	SWINIT +2
// PORT: Fixed ROM slots 7466.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:235
//		TS	STATE +2
// PORT: Fixed ROM slots 7467.
                            if slot <> 7467 or instruction <> 22590 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22590, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7468 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:236
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:237
//		CA	FLAGWRD3
// PORT: Fixed ROM slots 7468.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:238
//# Page 185
// PORT: SOURCE FRESH_START_AND_RESTART.agc:239
//		MASK	BIT13		# REFSMMAT FLAG
// PORT: Fixed ROM slots 7469.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:240
//		AD	SWINIT +3
// PORT: Fixed ROM slots 7470.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:241
//		TS	FLAGWRD3
// PORT: Fixed ROM slots 7471.
                            if slot <> 7471 or instruction <> 22591 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22591, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7472 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:242
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:243
//		EXTEND
// PORT: Fixed ROM slots 7472.
                                if slot <> 7472 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:244
//		DCA	SWINIT +4
// PORT: Fixed ROM slots 7473.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:245
//		DXCH	STATE +4
// PORT: Fixed ROM slots 7474.
                            if slot <> 7474 or instruction <> 21569 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 65, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7475 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:246
//		EXTEND
// PORT: Fixed ROM slots 7475.
                                if slot <> 7475 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:247
//		DCA	SWINIT +6
// PORT: Fixed ROM slots 7476.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:248
//		DXCH	STATE +6
// PORT: Fixed ROM slots 7477.
                            if slot <> 7477 or instruction <> 21571 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 67, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:249
//		CA	FLAGWRD8
// PORT: Fixed ROM slots 7478.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:250
//		MASK	OCT6200		# CMOONFLG, LMOONFLG, AND SUFFLAG
// PORT: Fixed ROM slots 7479.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:251
//		AD	SWINIT	+8D
// PORT: Fixed ROM slots 7480.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:252
//		TS	FLAGWRD8
// PORT: Fixed ROM slots 7481.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:253
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:254
//		CA	SWINIT +9D
// PORT: Fixed ROM slots 7482.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:255
//		TS	STATE +9D
// PORT: Fixed ROM slots 7483.
                                if slot <> 7483 or instruction <> 22597 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22597, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:256
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:257
//		EXTEND
// PORT: Fixed ROM slots 7484.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:258
//		DCA	SWINIT +10D
// PORT: Fixed ROM slots 7485.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:259
//		DXCH	STATE +10D
// PORT: Fixed ROM slots 7486.
                                if slot <> 7486 or instruction <> 21575 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 71, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:260
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:261
//ENDRSTRT	TC	POSTJUMP
// PORT: Fixed ROM slots 7487.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:262
//		CADR	DUMMYJOB +2	# DOES A RELINT.  (IN A SWITCHED BANK.)
// PORT: Fixed ROM slots 7488.
    7488, 3370
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7489–7508.
function agcAotUnit420 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7498 {
        if slot <= 7493 {
            if slot <= 7490 {
                if slot <= 7489 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:263
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:264
//MR.KLEAN	INHINT
// PORT: Fixed ROM slots 7489.
                    if slot <> 7489 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:265
//		EXTEND
// PORT: Fixed ROM slots 7490.
                    if slot <> 7490 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7491 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:266
//		DCA	NEG0
// PORT: Fixed ROM slots 7491.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:267
//		DXCH	-PHASE2
// PORT: Fixed ROM slots 7492.
                        if slot <> 7492 or instruction <> 21997 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 493, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:268
//P00KLEAN	EXTEND
// PORT: Fixed ROM slots 7493.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:269
//		DCA	NEG0
// PORT: Fixed ROM slots 7494.
                    if slot <> 7494 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 2577, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:270
//		DXCH	-PHASE4
// PORT: Fixed ROM slots 7495.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:271
//		EXTEND
// PORT: Fixed ROM slots 7496.
                    if slot <> 7496 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7497 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:272
//		DCA	NEG0
// PORT: Fixed ROM slots 7497.
                        if slot <> 7497 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 2577, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:273
//		DXCH	-PHASE1
// PORT: Fixed ROM slots 7498.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:274
//V37KLEAN	EXTEND
// PORT: Fixed ROM slots 7499.
                    if slot <> 7499 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:275
//		DCA	NEG0
// PORT: Fixed ROM slots 7500.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:276
//		DXCH	-PHASE3
// PORT: Fixed ROM slots 7501.
                    if slot <> 7501 or instruction <> 21999 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 495, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7502 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:277
//		EXTEND
// PORT: Fixed ROM slots 7502.
                        if slot <> 7502 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:278
//		DCA	NEG0
// PORT: Fixed ROM slots 7503.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:279
//		DXCH	-PHASE5
// PORT: Fixed ROM slots 7504.
                    if slot <> 7504 or instruction <> 22003 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 499, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:280
//		EXTEND
// PORT: Fixed ROM slots 7505.
                    if slot <> 7505 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7506 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:281
//		DCA	NEG0
// PORT: Fixed ROM slots 7506.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:282
//		DXCH	-PHASE6
// PORT: Fixed ROM slots 7507.
                        if slot <> 7507 or instruction <> 22005 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 501, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:283
//		TC	Q
// PORT: Fixed ROM slots 7508.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:284
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:285
//OCT6200	OCT	6200
// PORT: Fixed ROM slots 7509.
    7509, 6400
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7510–7515.
function agcAotUnit421 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7512 {
        if slot <= 7510 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:286
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:287
//# Page 186
// PORT: SOURCE FRESH_START_AND_RESTART.agc:288
//# COMES HERE FROM LOCATION 4000, GOJAM, RESTART ANY PROGRAMS WHICH MAY HAVE BEEN RUNNING AT THE TIME.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:289
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:290
//GOPROG		INCR	REDOCTR		# ADVANCE RESTART COUNTER.
// PORT: Fixed ROM slots 7510.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:291
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:292
//		LXCH	Q
// PORT: Fixed ROM slots 7511.
                if slot <> 7511 or instruction <> 9218 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 2, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:293
//		EXTEND
// PORT: Fixed ROM slots 7512.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:294
//		ROR	SUPERBNK
// PORT: Fixed ROM slots 7513.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:295
//		DXCH	RSBBQ
// PORT: Fixed ROM slots 7514.
                if slot <> 7514 or instruction <> 22299 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 795, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:296
//		TC	BANKCALL	# STORE ERASABLES FOR DEBUGGING PURPOSES.
// PORT: Fixed ROM slots 7515.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:297
//		CADR	VAC5STOR
// PORT: Fixed ROM slots 7516.
    7516, 32768
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7517–7526.
function agcAotUnit422 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7521 {
        if slot <= 7518 {
            if slot <= 7517 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:298
//		CA	BIT15		# TEST OSC FAIL BIT TO SEE IF WE HAVE
// PORT: Fixed ROM slots 7517.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:299
//		EXTEND			# HAD A POWER TRANSIENT.  IF SO, ATTEMPT
// PORT: Fixed ROM slots 7518.
                if slot <> 7518 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 7519 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:300
//		WAND	CHAN33		# A RESTART.  IF NOT, CHECK THE PRESENT
// PORT: Fixed ROM slots 7519.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:301
//		EXTEND			# STATE OF AGC WARNING BIT.
// PORT: Fixed ROM slots 7520.
                    if slot <> 7520 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:302
//		BZF	BUTTONS
// PORT: Fixed ROM slots 7521.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:303
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:304
//		CA	BIT14		# IF AGC WARNING ON (BIT = 0), DO A
// PORT: Fixed ROM slots 7522.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:305
//		EXTEND			# FRESH START ON THE ASSUMPTION THAT
// PORT: Fixed ROM slots 7523.
                if slot <> 7523 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 7524 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:306
//		RAND	CHAN33		# WE ARE IN A RESTART LOOP.
// PORT: Fixed ROM slots 7524.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:307
//		EXTEND
// PORT: Fixed ROM slots 7525.
                    if slot <> 7525 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:308
//		BZF	NONAVKEY +1
// PORT: Fixed ROM slots 7526.
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

// PORT: Physical bank 05. Shared continuation entries, slots 7527–7544.
function agcAotUnit423 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7535 {
        if slot <= 7530 {
            if slot <= 7528 {
                if slot <= 7527 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:309
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:310
//BUTTONS		TC	LIGHTSET	# MAKE FRESH START CHECKS BEFORE ERESTORE.
// PORT: Fixed ROM slots 7527.
                    if slot <> 7527 or instruction <> 1515 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1515, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:311
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:312
//# ERASCHK TEMPORARILY STORES THE CONTENTS OF TWO ERASABLE LOCATIONS, X
// PORT: SOURCE FRESH_START_AND_RESTART.agc:313
//# AND X+1 INTO SKEEP5 AND SKEEP6.  IT ALSO STORES X INTO SKEEP7 AND
// PORT: SOURCE FRESH_START_AND_RESTART.agc:314
//# ERESTORE.  IF ERASCHK IS INTERRUPTED BY A RESTART, C(ERESTORE) SHOULD
// PORT: SOURCE FRESH_START_AND_RESTART.agc:315
//# EQUAL C(SKEEP7),AND SHOULD BE A + NUMBER LESS THAN 2000 OCT.  OTHERWISE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:316
//# C(ERESTORE) SHOULD EQUAL +0.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:317
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:318
//		CAF	HI5
// PORT: Fixed ROM slots 7528.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:319
//		MASK	ERESTORE
// PORT: Fixed ROM slots 7529.
                    if slot <> 7529 or instruction <> 29424 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 752).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:320
//		EXTEND
// PORT: Fixed ROM slots 7530.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:321
//		BZF	+2		# IF ERESTORE NOT = +0 OR +N LESS THAN 2K,
// PORT: Fixed ROM slots 7531.
                    if slot <> 7531 or instruction <> 5485 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5485, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:322
//		TCF	NONAVKEY +1	# DOUBT E MEMORY AND DO A FRESH START.
// PORT: Fixed ROM slots 7532.
                    if slot <> 7532 or instruction <> 5628 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5628, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7533 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:323
//		CS	ERESTORE
// PORT: Fixed ROM slots 7533.
                    if slot <> 7533 or instruction <> 17136 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 752).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7534 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:324
//		EXTEND
// PORT: Fixed ROM slots 7534.
                        if slot <> 7534 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:325
//		BZF	ELRSKIP -1
// PORT: Fixed ROM slots 7535.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:326
//		AD	SKEEP7
// PORT: Fixed ROM slots 7536.
                    if slot <> 7536 or instruction <> 25343 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 767).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:327
//		EXTEND
// PORT: Fixed ROM slots 7537.
                    if slot <> 7537 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7538 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:328
//		BZF	+2		# = SKEEP7, RESTORE E MEMORY.
// PORT: Fixed ROM slots 7538.
                    if slot <> 7538 or instruction <> 5492 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5492, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:329
//		TCF	NONAVKEY +1	# NOT=SKEEP7, DOUBT EMEM, DO FRESH START
// PORT: Fixed ROM slots 7539.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:330
//		CA	SKEEP4
// PORT: Fixed ROM slots 7540.
                    if slot <> 7540 or instruction <> 13052 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 764).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:331
//		TS	EBANK		# EBANK OF E MEMORY THAT WAS UNDER TEST.
// PORT: Fixed ROM slots 7541.
                    if slot <> 7541 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7542 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:332
//		EXTEND			# (NOT DXCH SINCE THIS MIGHT HAPPEN AGAIN)
// PORT: Fixed ROM slots 7542.
                    if slot <> 7542 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7543 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:333
//		DCA	SKEEP5
// PORT: Fixed ROM slots 7543.
                        if slot <> 7543 or instruction <> 13054 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 766, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:334
//		INDEX	SKEEP7
// PORT: Fixed ROM slots 7544.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:335
//		DXCH	0000		# E MEMORY RESTORED.
// PORT: Fixed ROM slots 7545.
    7545, 43010
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7546–7554.
function agcAotUnit424 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7549 {
        if slot <= 7547 {
            if slot <= 7546 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:336
//		CA	ZERO
// PORT: Fixed ROM slots 7546.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:337
//		TS	ERESTORE
// PORT: Fixed ROM slots 7547.
                if slot <> 7547 or instruction <> 23280 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23280, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 7548 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:338
//# Page 187
// PORT: SOURCE FRESH_START_AND_RESTART.agc:339
//		TC	STARTSUB	# DO INITIALIZATION AFTER ERASE RESTORE.
// PORT: Fixed ROM slots 7548.
                if slot <> 7548 or instruction <> 1534 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1534, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:340
//ELRSKIP		CA	FLAGWRD6	# RESTART AUTOPILOTS
// PORT: Fixed ROM slots 7549.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:341
//		EXTEND
// PORT: Fixed ROM slots 7550.
                if slot <> 7550 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:342
//		MP	BIT3		# BITS 15,14	00 T5IDLOC
// PORT: Fixed ROM slots 7551.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:343
//		MASK	SIX		#		01 REDORCS
// PORT: Fixed ROM slots 7552.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:344
//		EXTEND			#		10 REDOTVC
// PORT: Fixed ROM slots 7553.
                    if slot <> 7553 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:345
//		INDEX	A		#		11 REDOSAT
// PORT: Fixed ROM slots 7554.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:346
//		DCA	T5IDLER
// PORT: Fixed ROM slots 7555.
    7555, 27868
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7556–7575.
function agcAotUnit425 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7565 {
        if slot <= 7560 {
            if slot <= 7557 {
                if slot <= 7556 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:347
//		DXCH	T5LOC
// PORT: Fixed ROM slots 7556.
                    if slot <> 7556 or instruction <> 22219 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 715, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:348
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:349
//		CS	INTFLBIT
// PORT: Fixed ROM slots 7557.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:350
//		MASK	RASFLAG
// PORT: Fixed ROM slots 7558.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:351
//		TS	RASFLAG
// PORT: Fixed ROM slots 7559.
                        if slot <> 7559 or instruction <> 22598 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22598, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:352
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:353
//		CA	OPTMODES
// PORT: Fixed ROM slots 7560.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:354
//		MASK	OPTINITR
// PORT: Fixed ROM slots 7561.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:355
//		AD	BIT7
// PORT: Fixed ROM slots 7562.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:356
//		TS	OPTMODES
// PORT: Fixed ROM slots 7563.
                    if slot <> 7563 or instruction <> 23257 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23257, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7564 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:357
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:358
//		CAF	BIT6
// PORT: Fixed ROM slots 7564.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:359
//		MASK	IMODES33
// PORT: Fixed ROM slots 7565.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:360
//		AD	IM33INIT
// PORT: Fixed ROM slots 7566.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:361
//		TS	IMODES33
// PORT: Fixed ROM slots 7567.
                    if slot <> 7567 or instruction <> 23249 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23249, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7568 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:362
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:363
//		CA	9,6,4		# LEAVE PROG ALARM,GIMBAL LOCK, NO ATT
// PORT: Fixed ROM slots 7568.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:364
//		MASK	DSPTAB +11D	# LAMPS INTACT ON HARDWARE RESTART
// PORT: Fixed ROM slots 7569.
                        if slot <> 7569 or instruction <> 29214 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 542).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:365
//		AD	BIT15
// PORT: Fixed ROM slots 7570.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:366
//		XCH	DSPTAB +11D
// PORT: Fixed ROM slots 7571.
                    if slot <> 7571 or instruction <> 24094 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 542, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:367
//		MASK	BIT4		# IF NO ATT LAMP WAS ON, LEAVE ISS IN
// PORT: Fixed ROM slots 7572.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:368
//		EXTEND			# COURSE ALIGN
// PORT: Fixed ROM slots 7573.
                    if slot <> 7573 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7574 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:369
//		BZF	NOCOARSE
// PORT: Fixed ROM slots 7574.
                        if slot <> 7574 or instruction <> 5533 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5533, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:370
//		TC	IBNKCALL	# IF NO ATT LAMP ON, RETURN ISS TO
// PORT: Fixed ROM slots 7575.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:371
//		CADR	SETCOARS	#	COARSE ALIGN.
// PORT: Fixed ROM slots 7576.
    7576, 15406
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7577–7578.
function agcAotUnit426 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7577 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:372
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:373
//		CAF	SIX
// PORT: Fixed ROM slots 7577.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:374
//		TC	WAITLIST
// PORT: Fixed ROM slots 7578.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:375
//		EBANK=	CDUIND
// PORT: SOURCE FRESH_START_AND_RESTART.agc:376
//		2CADR	CA+ECE
// PORT: Fixed ROM slots 7579 7580.
    7579, 3110, 7580, 14438
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7581–7604.
function agcAotUnit427 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7592 {
        if slot <= 7586 {
            if slot <= 7583 {
                if slot <= 7581 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:377
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:378
//NOCOARSE	CAF	IFAILINH	# LEAVE FAILURE INHIBITS INTACT ON
// PORT: Fixed ROM slots 7581.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:379
//		MASK	IMODES30	#	HARDWARE RESTART.  RESET ALL
// PORT: Fixed ROM slots 7582.
                        if slot <> 7582 or instruction <> 29392 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 720).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:380
//		AD	IM30INIR	#	FAILURE CODES.
// PORT: Fixed ROM slots 7583.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:381
//		TS	IMODES30
// PORT: Fixed ROM slots 7584.
                    if slot <> 7584 or instruction <> 23248 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23248, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7585 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:382
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:383
//		CS	FLAGWRD5
// PORT: Fixed ROM slots 7585.
                        if slot <> 7585 or instruction <> 16449 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 65).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:384
//		MASK	ENGONBIT
// PORT: Fixed ROM slots 7586.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:385
//		CCS	A
// PORT: Fixed ROM slots 7587.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:386
//		TCF	GOPROG3
// PORT: Fixed ROM slots 7588.
                        if slot <> 7588 or instruction <> 5559 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5559, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:387
//		CAF	BIT13
// PORT: Fixed ROM slots 7589.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:388
//		EXTEND
// PORT: Fixed ROM slots 7590.
                    if slot <> 7590 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7591 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:389
//# Page 188
// PORT: SOURCE FRESH_START_AND_RESTART.agc:390
//		WOR	DSALMOUT	# TURN ENGINE ON
// PORT: Fixed ROM slots 7591.
                        if slot <> 7591 or instruction <> 2569 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 5, 9, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:391
//		TCF	GOPROG3
// PORT: Fixed ROM slots 7592.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:392
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:393
//ENEMA		INHINT
// PORT: Fixed ROM slots 7593.
                    if slot <> 7593 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7594 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:394
//		TC	LIGHTSET	# EXIT TO DOFSTART IF ERROR RESET AND
// PORT: Fixed ROM slots 7594.
                        if slot <> 7594 or instruction <> 1515 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1515, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:395
//		TC	STARTSB2	# MARK REJECT DEPRESSED SIMULTANEOUSLY
// PORT: Fixed ROM slots 7595.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:396
//		CS	INTMASK		# RESET INTEGRATION BITS
// PORT: Fixed ROM slots 7596.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:397
//		MASK	RASFLAG
// PORT: Fixed ROM slots 7597.
                        if slot <> 7597 or instruction <> 28742 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 70).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:398
//		TS	RASFLAG
// PORT: Fixed ROM slots 7598.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:399
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:400
//		CS	FLAGWRD6	# IS TVC ON
// PORT: Fixed ROM slots 7599.
                    if slot <> 7599 or instruction <> 16450 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 66).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7600 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:401
//		MASK	OCT60000
// PORT: Fixed ROM slots 7600.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:402
//		EXTEND
// PORT: Fixed ROM slots 7601.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:403
//		BZMF	GOPROG3		# NO
// PORT: Fixed ROM slots 7602.
                    if slot <> 7602 or instruction <> 26039 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26039, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7603 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:404
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:405
//		CAF	.5SEC		# YES, CALL TVCEXEC TASK WHICH WAS KILLED
// PORT: Fixed ROM slots 7603.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:406
//		TC	WAITLIST	# 	IN STARTSB2.
// PORT: Fixed ROM slots 7604.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:407
//		EBANK=	BZERO
// PORT: SOURCE FRESH_START_AND_RESTART.agc:408
//		2CADR	TVCEXEC
// PORT: Fixed ROM slots 7605 7606.
    7605, 2976, 7606, 28780
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7607–7611.
function agcAotUnit428 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7608 {
        if slot <= 7607 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:409
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:410
//GOPROG3		CAF	NUMGRPS		# VERIFY PHASE TABLE AGREEMENTS
// PORT: Fixed ROM slots 7607.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:411
//PCLOOP		TS	MPAC +5
// PORT: Fixed ROM slots 7608.
            if slot <> 7608 or instruction <> 22641 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22641, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 7609 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:412
//		DOUBLE
// PORT: Fixed ROM slots 7609.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:413
//		EXTEND
// PORT: Fixed ROM slots 7610.
                if slot <> 7610 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:414
//		INDEX	A
// PORT: Fixed ROM slots 7611.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:415
//		DCA	-PHASE1		# COMPLEMENT INTO A, DIRECT INTO L.
// PORT: Fixed ROM slots 7612.
    7612, 25558
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7613–7636.
function agcAotUnit429 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7624 {
        if slot <= 7618 {
            if slot <= 7615 {
                if slot <= 7613 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:416
//		EXTEND
// PORT: Fixed ROM slots 7613.
                    if slot <> 7613 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7614 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:417
//		RXOR	LCHAN		# RESULT MUST BE -0 FOR AGREEMENT.
// PORT: Fixed ROM slots 7614.
                        if slot <> 7614 or instruction <> 3073 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:418
//		CCS	A
// PORT: Fixed ROM slots 7615.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:419
//		TCF	PTBAD		# RESTART FAILURE.
// PORT: Fixed ROM slots 7616.
                    if slot <> 7616 or instruction <> 5606 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5606, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7617 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:420
//		TCF	PTBAD
// PORT: Fixed ROM slots 7617.
                        if slot <> 7617 or instruction <> 5606 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5606, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:421
//		TCF	PTBAD
// PORT: Fixed ROM slots 7618.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:422
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:423
//		CCS	MPAC +5		# PROCESS ALL RESTART GROUPS.
// PORT: Fixed ROM slots 7619.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:424
//		TCF	PCLOOP
// PORT: Fixed ROM slots 7620.
                        if slot <> 7620 or instruction <> 5560 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5560, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:425
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:426
//		TS	MPAC +6		# SET TO +0.
// PORT: Fixed ROM slots 7621.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:427
//		TC	MMDSPLAY	# DISPLAY MAJOR MODE
// PORT: Fixed ROM slots 7622.
                    if slot <> 7622 or instruction <> 2800 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2800, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7623 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:428
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:429
//		INHINT			# RELINT DONE IN MMDSPLAY
// PORT: Fixed ROM slots 7623.
                        if slot <> 7623 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:430
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:431
//		CAE	FLAGWRD6	# IS RCS DAP RUNNING (BITS 15 14 OF
// PORT: Fixed ROM slots 7624.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:432
//		MASK	OCT60000	# FLAGWORD6 = 01)
// PORT: Fixed ROM slots 7625.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:433
//		EXTEND			# YES, DO STOPRATE
// PORT: Fixed ROM slots 7626.
                        if slot <> 7626 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:434
//		BZMF	NXTRST -1	# NO, SKIP TO NXTRST -1
// PORT: Fixed ROM slots 7627.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:435
//		CAF	EBANK6		# STOPRATE IS DONE IN EBANK 6
// PORT: Fixed ROM slots 7628.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:436
//		TS	EBANK
// PORT: Fixed ROM slots 7629.
                        if slot <> 7629 or instruction <> 22531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22531, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:437
//		TC	STOPRATE	# ZERO DELCDUS, WBODYS, AND BIASES THUS
// PORT: Fixed ROM slots 7630.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:438
//					# STOPPING AUTOMATIC MANEUVERING
// PORT: SOURCE FRESH_START_AND_RESTART.agc:439
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:440
//		CAF	EBANK3
// PORT: Fixed ROM slots 7631.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:441
//		TS	EBANK
// PORT: Fixed ROM slots 7632.
                        if slot <> 7632 or instruction <> 22531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22531, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:442
//# Page 189
// PORT: SOURCE FRESH_START_AND_RESTART.agc:443
//		CAF	NUMGRPS		# SEE IF ANY GROUPS RUNNING.
// PORT: Fixed ROM slots 7633.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:444
//NXTRST		TS	MPAC +5
// PORT: Fixed ROM slots 7634.
                    if slot <> 7634 or instruction <> 22641 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22641, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7635 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:445
//		DOUBLE
// PORT: Fixed ROM slots 7635.
                        if slot <> 7635 or instruction <> 24576 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:446
//		INDEX	A
// PORT: Fixed ROM slots 7636.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:447
//		CCS	PHASE1
// PORT: Fixed ROM slots 7637.
    7637, 9174
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7638–7654.
function agcAotUnit430 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7645 {
        if slot <= 7641 {
            if slot <= 7639 {
                if slot <= 7638 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:448
//		TCF	PACTIVE		# PNZ - GROUP ACTIVE.
// PORT: Fixed ROM slots 7638.
                    if slot <> 7638 or instruction <> 5592 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5592, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:449
//		TCF	PINACT		# +0 - GROUP NOT RUNNING.
// PORT: Fixed ROM slots 7639.
                    if slot <> 7639 or instruction <> 5597 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5597, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7640 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:450
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:451
//PACTIVE		TS	MPAC
// PORT: Fixed ROM slots 7640.
                    if slot <> 7640 or instruction <> 22636 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22636, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:452
//		INCR	MPAC		# ABS OF PHASE.
// PORT: Fixed ROM slots 7641.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:453
//		INCR	MPAC +6		# INDICATE GROUP DEMANDS PRESENT.
// PORT: Fixed ROM slots 7642.
                    if slot <> 7642 or instruction <> 10354 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 114).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:454
//		CA	RACTCADR
// PORT: Fixed ROM slots 7643.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:455
//		TC	SWCALL		# MUST RETURN TO SWRETURN.
// PORT: Fixed ROM slots 7644.
                    if slot <> 7644 or instruction <> 2486 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2486, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:456
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:457
//PINACT		CCS	MPAC +5		# PROCESS ALL RESTART GROUPS.
// PORT: Fixed ROM slots 7645.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:458
//		TCF	NXTRST
// PORT: Fixed ROM slots 7646.
                    if slot <> 7646 or instruction <> 5586 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5586, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:459
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:460
//		CCS	MPAC +6		# NO, CHECK PHASE ACTIVITY FLAG
// PORT: Fixed ROM slots 7647.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:461
//		TCF	ENDRSTRT	# PHASE ACTIVE
// PORT: Fixed ROM slots 7648.
                    if slot <> 7648 or instruction <> 5439 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5439, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:462
//		CAF	BIT15		# IS MODE -0
// PORT: Fixed ROM slots 7649.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:463
//		MASK	MODREG
// PORT: Fixed ROM slots 7650.
                    if slot <> 7650 or instruction <> 29193 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 521).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:464
//		EXTEND
// PORT: Fixed ROM slots 7651.
                    if slot <> 7651 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 7652 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:465
//		BZF	GOTOPOOH	# NO
// PORT: Fixed ROM slots 7652.
                    if slot <> 7652 or instruction <> 6214 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6214, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 7653 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:466
//		TCF	ENDRSTRT	# YES
// PORT: Fixed ROM slots 7653.
                        if slot <> 7653 or instruction <> 5439 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5439, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:467
//PTBAD		TC	ALARM		# SET ALARM TO SHOW PHASE TABLE FAILURE.
// PORT: Fixed ROM slots 7654.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:468
//		OCT	1107
// PORT: Fixed ROM slots 7655.
    7655, 1166
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7656–7656.
function agcAotUnit431 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:469
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:470
//		TCF	DOFSTART	# IN R2).
// PORT: Fixed ROM slots 7656.
    if slot <> 7656 or instruction <> 5365 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5365, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[431] to agcAotUnit431@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:471
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:472
//# ******** ****** ******
// PORT: SOURCE FRESH_START_AND_RESTART.agc:473
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:474
//# DO NOT USE GOPROG2 OR ENEMA WITHOUT CONSULTING POOH PEOPLE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:475
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:476
//GOPROG2		EQUALS	ENEMA
// PORT: SOURCE FRESH_START_AND_RESTART.agc:477
//OCT10000	=	BIT13
// PORT: SOURCE FRESH_START_AND_RESTART.agc:478
//OCT30000	=	PRIO30
// PORT: SOURCE FRESH_START_AND_RESTART.agc:479
//OCT7777		OCT	7777
// PORT: Fixed ROM slots 7657.
    7657, 8190,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:480
//RACTCADR	CADR	RESTARTS
// PORT: Fixed ROM slots 7658.
    7658, 3744
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7659–7666.
function agcAotUnit432 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7662 {
        if slot <= 7660 {
            if slot <= 7659 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:481
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:482
//LIGHTSET	CAF	BIT7		# DOFSTART IF MARK REJECT AND EITHER
// PORT: Fixed ROM slots 7659.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:483
//		EXTEND			# ERROR LIGHT RESET BUTTONS ARE DEPRESSED
// PORT: Fixed ROM slots 7660.
                if slot <> 7660 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 7661 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:484
//		RAND	NAVKEYIN
// PORT: Fixed ROM slots 7661.
                if slot <> 7661 or instruction <> 1038 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 2, 14, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:485
//		EXTEND
// PORT: Fixed ROM slots 7662.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:486
//		BZF	NONAVKEY	# NO MARK REJECT
// PORT: Fixed ROM slots 7663.
                if slot <> 7663 or instruction <> 5627 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5627, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:487
//		CAF	OCT37
// PORT: Fixed ROM slots 7664.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:488
//		EXTEND
// PORT: Fixed ROM slots 7665.
                if slot <> 7665 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:489
//		RAND	NAVKEYIN	# NAV DSKY KEYCODES,MARK,MARK REJECT
// PORT: Fixed ROM slots 7666.
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

// PORT: Physical bank 05. Shared continuation entries, slots 7667–7750.
function agcAotUnit433 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7708 {
        if slot <= 7687 {
            if slot <= 7676 {
                if slot <= 7671 {
                    if slot <= 7668 {
                        if slot <= 7667 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:490
//		AD	-ELR
// PORT: Fixed ROM slots 7667.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:491
//		EXTEND
// PORT: Fixed ROM slots 7668.
                            if slot <> 7668 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7669 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:492
//		BZF	NONAVKEY +1
// PORT: Fixed ROM slots 7669.
                            if slot <> 7669 or instruction <> 5628 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5628, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7670 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:493
//		EXTEND
// PORT: Fixed ROM slots 7670.
                                if slot <> 7670 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:494
//# Page 190
// PORT: SOURCE FRESH_START_AND_RESTART.agc:495
//		READ	MNKEYIN		# MAIN DSKY KEYCODES
// PORT: Fixed ROM slots 7671.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:496
//		AD	-ELR
// PORT: Fixed ROM slots 7672.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:497
//		EXTEND
// PORT: Fixed ROM slots 7673.
                            if slot <> 7673 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7674 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:498
//		BZF	+2
// PORT: Fixed ROM slots 7674.
                            if slot <> 7674 or instruction <> 5628 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5628, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7675 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:499
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:500
//NONAVKEY	TC	Q
// PORT: Fixed ROM slots 7675.
                                if slot <> 7675 or instruction <> 2 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:501
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:502
//		TC	STARTSUB
// PORT: Fixed ROM slots 7676.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:503
//		TCF	DOFSTART
// PORT: Fixed ROM slots 7677.
                            if slot <> 7677 or instruction <> 5365 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5365, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:504
//STARTSUB	CAF	LDNPHAS1	# SET POINTER SO NEXT 20MS DOWNRUPT WILL
// PORT: Fixed ROM slots 7678.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:505
//		TS	DNTMGOTO	# CAUSE THE CURRENT DOWNLIST TO BE
// PORT: Fixed ROM slots 7679.
                            if slot <> 7679 or instruction <> 22749 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22749, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7680 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:506
//					# INTERRUPTED AND START SENDING FROM THE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:507
//					# BEGINNING OF THE CURRENT DOWNLIST.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:508
//		CAF	POSMAX
// PORT: Fixed ROM slots 7680.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:509
//		TS	TIME3		# 37777 TO TIME3.
// PORT: Fixed ROM slots 7681.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:510
//		AD	MINUS2
// PORT: Fixed ROM slots 7682.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:511
//		TS	TIME4		# 37775 TO TIME4.
// PORT: Fixed ROM slots 7683.
                                if slot <> 7683 or instruction <> 22551 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22551, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:512
//		AD	NEGONE
// PORT: Fixed ROM slots 7684.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:513
//		TS	TIME5		# 37774 TO TIME5.
// PORT: Fixed ROM slots 7685.
                            if slot <> 7685 or instruction <> 22552 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22552, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7686 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:514
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:515
//STARTSB2	CAF	OCT77603	# TURN OFF UPLINK ACTY, TEMP CAUTION, KR,
// PORT: Fixed ROM slots 7686.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:516
//		EXTEND			# FLASH, OP. ERROR, LEAVE OTHERS UNCHANGED
// PORT: Fixed ROM slots 7687.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:517
//		WAND	DSALMOUT
// PORT: Fixed ROM slots 7688.
                            if slot <> 7688 or instruction <> 1545 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 3, 9, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:518
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:519
//		CAF	OCT74777	# TURN OFF TEST ALARMS, STANDBY ENABLE.
// PORT: Fixed ROM slots 7689.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:520
//		EXTEND
// PORT: Fixed ROM slots 7690.
                            if slot <> 7690 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7691 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:521
//		WAND	CHAN13
// PORT: Fixed ROM slots 7691.
                                if slot <> 7691 or instruction <> 1547 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 3, 11, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:522
//		CS	PRIO25		# CLEAR R21MARK, P21FLAG, AND SKIPVHF BIT.
// PORT: Fixed ROM slots 7692.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:523
//		MASK	FLAGWRD2
// PORT: Fixed ROM slots 7693.
                            if slot <> 7693 or instruction <> 28734 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 62).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:524
//		AD	SKIPVBIT	# NOW SET SKIPVHF FLAG.
// PORT: Fixed ROM slots 7694.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:525
//		TS	FLAGWRD2
// PORT: Fixed ROM slots 7695.
                            if slot <> 7695 or instruction <> 22590 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22590, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7696 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:526
//		EBANK=	LST1
// PORT: SOURCE FRESH_START_AND_RESTART.agc:527
//		CAF	STARTEB
// PORT: Fixed ROM slots 7696.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:528
//		TS	EBANK		# SET FOR E3
// PORT: Fixed ROM slots 7697.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:529
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:530
//		CAF	NEG1/2		# INITIALIZE WAITLIST DELTA-TS.
// PORT: Fixed ROM slots 7698.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:531
//		TS	LST1 +7
// PORT: Fixed ROM slots 7699.
                            if slot <> 7699 or instruction <> 23303 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23303, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7700 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:532
//		TS	LST1 +6
// PORT: Fixed ROM slots 7700.
                            if slot <> 7700 or instruction <> 23302 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23302, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7701 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:533
//		TS	LST1 +5
// PORT: Fixed ROM slots 7701.
                                if slot <> 7701 or instruction <> 23301 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23301, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:534
//		TS	LST1 +4
// PORT: Fixed ROM slots 7702.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:535
//		TS	LST1 +3
// PORT: Fixed ROM slots 7703.
                            if slot <> 7703 or instruction <> 23299 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23299, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7704 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:536
//		TS	LST1 +2
// PORT: Fixed ROM slots 7704.
                                if slot <> 7704 or instruction <> 23298 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23298, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:537
//		TS	LST1 +1
// PORT: Fixed ROM slots 7705.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:538
//		TS	LST1
// PORT: Fixed ROM slots 7706.
                            if slot <> 7706 or instruction <> 23296 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23296, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7707 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:539
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:540
//		CS	ENDTASK
// PORT: Fixed ROM slots 7707.
                                if slot <> 7707 or instruction <> 19140 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2756), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:541
//		TS	LST2
// PORT: Fixed ROM slots 7708.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:542
//		TS	LST2 +2
// PORT: Fixed ROM slots 7709.
                            if slot <> 7709 or instruction <> 23306 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23306, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:543
//		TS	LST2 +4
// PORT: Fixed ROM slots 7710.
                            if slot <> 7710 or instruction <> 23308 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23308, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7711 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:544
//# Page 191
// PORT: SOURCE FRESH_START_AND_RESTART.agc:545
//		TS	LST2 +6
// PORT: Fixed ROM slots 7711.
                            if slot <> 7711 or instruction <> 23310 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23310, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7712 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:546
//		TS	LST2 +8D
// PORT: Fixed ROM slots 7712.
                                if slot <> 7712 or instruction <> 23312 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23312, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:547
//		TS	LST2 +10D
// PORT: Fixed ROM slots 7713.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:548
//		TS	LST2 +12D
// PORT: Fixed ROM slots 7714.
                            if slot <> 7714 or instruction <> 23316 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23316, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:549
//		TS	LST2 +14D
// PORT: Fixed ROM slots 7715.
                            if slot <> 7715 or instruction <> 23318 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23318, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7716 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:550
//		TS	LST2 +16D
// PORT: Fixed ROM slots 7716.
                            if slot <> 7716 or instruction <> 23320 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23320, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7717 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:551
//		CS	ENDTASK +1
// PORT: Fixed ROM slots 7717.
                                if slot <> 7717 or instruction <> 19141 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2757), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:552
//		TS	LST2 +1
// PORT: Fixed ROM slots 7718.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:553
//		TS	LST2 +3
// PORT: Fixed ROM slots 7719.
                            if slot <> 7719 or instruction <> 23307 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23307, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:554
//		TS	LST2 +5
// PORT: Fixed ROM slots 7720.
                            if slot <> 7720 or instruction <> 23309 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23309, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7721 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:555
//		TS	LST2 +7
// PORT: Fixed ROM slots 7721.
                            if slot <> 7721 or instruction <> 23311 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23311, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7722 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:556
//		TS	LST2 +9D
// PORT: Fixed ROM slots 7722.
                                if slot <> 7722 or instruction <> 23313 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23313, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:557
//		TS	LST2 +11D
// PORT: Fixed ROM slots 7723.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:558
//		TS	LST2 +13D
// PORT: Fixed ROM slots 7724.
                            if slot <> 7724 or instruction <> 23317 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23317, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7725 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:559
//		TS	LST2 +15D
// PORT: Fixed ROM slots 7725.
                                if slot <> 7725 or instruction <> 23319 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23319, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:560
//		TS	LST2 +17D
// PORT: Fixed ROM slots 7726.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:561
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:562
//		CS	ZERO		# MAKE ALL EXECUTIVE REGISTER SETS
// PORT: Fixed ROM slots 7727.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:563
//		TS	PRIORITY	# AVAILABLE.
// PORT: Fixed ROM slots 7728.
                                if slot <> 7728 or instruction <> 22647 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22647, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:564
//		TS	PRIORITY +12D
// PORT: Fixed ROM slots 7729.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:565
//		TS	PRIORITY +24D
// PORT: Fixed ROM slots 7730.
                            if slot <> 7730 or instruction <> 22671 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22671, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:566
//		TS	PRIORITY +36D
// PORT: Fixed ROM slots 7731.
                            if slot <> 7731 or instruction <> 22683 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22683, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7732 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:567
//		TS	PRIORITY +48D
// PORT: Fixed ROM slots 7732.
                            if slot <> 7732 or instruction <> 22695 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22695, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7733 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:568
//		TS	PRIORITY +60D
// PORT: Fixed ROM slots 7733.
                                if slot <> 7733 or instruction <> 22707 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22707, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:569
//		TS	PRIORITY +72D
// PORT: Fixed ROM slots 7734.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:570
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:571
//		TS	DSRUPTSW
// PORT: Fixed ROM slots 7735.
                            if slot <> 7735 or instruction <> 23234 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23234, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:572
//		TS	NEWJOB		# SHOWS NO ACTIVE JOBS.
// PORT: Fixed ROM slots 7736.
                            if slot <> 7736 or instruction <> 22583 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22583, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 7737 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:573
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:574
//		CAF	VAC1ADRC	# MAKE ALL VAC AREAS AVAILABLE.
// PORT: Fixed ROM slots 7737.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:575
//		TS	VAC1USE
// PORT: Fixed ROM slots 7738.
                                if slot <> 7738 or instruction <> 22784 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22784, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:576
//		AD	LTHVACA
// PORT: Fixed ROM slots 7739.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:577
//		TS	VAC2USE
// PORT: Fixed ROM slots 7740.
                            if slot <> 7740 or instruction <> 22828 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22828, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:578
//		AD	LTHVACA
// PORT: Fixed ROM slots 7741.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:579
//		TS	VAC3USE
// PORT: Fixed ROM slots 7742.
                            if slot <> 7742 or instruction <> 22872 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22872, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7743 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:580
//		AD	LTHVACA
// PORT: Fixed ROM slots 7743.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:581
//		TS	VAC4USE
// PORT: Fixed ROM slots 7744.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:582
//		AD	LTHVACA
// PORT: Fixed ROM slots 7745.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:583
//		TS	VAC5USE
// PORT: Fixed ROM slots 7746.
                                if slot <> 7746 or instruction <> 22960 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22960, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:584
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:585
//		CAF	TEN		# BLANK DSKY REGISTERS (PROGRAM,VERB,NOUN,
// PORT: Fixed ROM slots 7747.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:586
//					# R1,R2,R3)
// PORT: SOURCE FRESH_START_AND_RESTART.agc:587
//DSPOFF		TS	MPAC
// PORT: Fixed ROM slots 7748.
                            if slot <> 7748 or instruction <> 22636 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22636, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 7749 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:588
//		CS	BIT12
// PORT: Fixed ROM slots 7749.
                                if slot <> 7749 or instruction <> 18948 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2564), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:589
//		INDEX	MPAC
// PORT: Fixed ROM slots 7750.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:590
//		TS	DSPTAB
// PORT: Fixed ROM slots 7751.
    7751, 46118
)).

// PORT: Physical bank 05. Shared continuation entries, slots 7752–7788.
function agcAotUnit434 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 7769 {
        if slot <= 7760 {
            if slot <= 7755 {
                if slot <= 7753 {
                    if slot <= 7752 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:591
//		CCS	MPAC
// PORT: Fixed ROM slots 7752.
                        if slot <> 7752 or instruction <> 4204 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 108).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:592
//		TCF	DSPOFF
// PORT: Fixed ROM slots 7753.
                        if slot <> 7753 or instruction <> 5700 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5700, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7754 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:593
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:594
//		TS	DELAYLOC
// PORT: Fixed ROM slots 7754.
                        if slot <> 7754 or instruction <> 23137 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23137, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:595
//# Page 192
// PORT: SOURCE FRESH_START_AND_RESTART.agc:596
//		TS	DELAYLOC +1
// PORT: Fixed ROM slots 7755.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:597
//		TS	DELAYLOC +2
// PORT: Fixed ROM slots 7756.
                        if slot <> 7756 or instruction <> 23139 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23139, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:598
//		TS	DELAYLOC +3
// PORT: Fixed ROM slots 7757.
                        if slot <> 7757 or instruction <> 23140 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23140, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7758 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:599
//		TS	R1SAVE
// PORT: Fixed ROM slots 7758.
                        if slot <> 7758 or instruction <> 23099 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23099, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7759 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:600
//		TS	INLINK
// PORT: Fixed ROM slots 7759.
                            if slot <> 7759 or instruction <> 22565 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22565, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:601
//		TS	DSPCNT
// PORT: Fixed ROM slots 7760.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:602
//		TS	CADRSTOR
// PORT: Fixed ROM slots 7761.
                        if slot <> 7761 or instruction <> 23074 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23074, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:603
//		TS	REQRET
// PORT: Fixed ROM slots 7762.
                        if slot <> 7762 or instruction <> 23051 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23051, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7763 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:604
//		TS	CLPASS
// PORT: Fixed ROM slots 7763.
                        if slot <> 7763 or instruction <> 23053 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23053, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:605
//		TS	DSPLOCK
// PORT: Fixed ROM slots 7764.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:606
//		TS	MONSAVE		# KILL MONITOR
// PORT: Fixed ROM slots 7765.
                        if slot <> 7765 or instruction <> 23056 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23056, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:607
//		TS	MONSAVE1
// PORT: Fixed ROM slots 7766.
                        if slot <> 7766 or instruction <> 23057 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23057, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7767 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:608
//		TS	VERBREG
// PORT: Fixed ROM slots 7767.
                        if slot <> 7767 or instruction <> 23041 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23041, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7768 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:609
//		TS	NOUNREG
// PORT: Fixed ROM slots 7768.
                            if slot <> 7768 or instruction <> 23042 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23042, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:610
//		TS	DSPLIST
// PORT: Fixed ROM slots 7769.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:611
//		TS	MARKSTAT
// PORT: Fixed ROM slots 7770.
                        if slot <> 7770 or instruction <> 23256 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23256, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:612
//		TS	IMUCADR
// PORT: Fixed ROM slots 7771.
                        if slot <> 7771 or instruction <> 23250 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23250, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7772 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:613
//		TS	OPTCADR
// PORT: Fixed ROM slots 7772.
                        if slot <> 7772 or instruction <> 23251 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23251, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:614
//		TS	RADCADR
// PORT: Fixed ROM slots 7773.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:615
//		TS	ATTCADR
// PORT: Fixed ROM slots 7774.
                        if slot <> 7774 or instruction <> 23253 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23253, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:616
//		TS	LGYRO
// PORT: Fixed ROM slots 7775.
                        if slot <> 7775 or instruction <> 23236 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23236, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7776 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:617
//		TS	FLAGWRD4	# KILL INTERFACE DISPLAYS
// PORT: Fixed ROM slots 7776.
                        if slot <> 7776 or instruction <> 22592 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22592, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7777 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:618
//		CAF	NOUTCON
// PORT: Fixed ROM slots 7777.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:619
//		TS	NOUT
// PORT: Fixed ROM slots 7778.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:620
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:621
//		CAF	BIT14
// PORT: Fixed ROM slots 7779.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:622
//		MASK	EXTVBACT
// PORT: Fixed ROM slots 7780.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:623
//		TS	EXTVBACT
// PORT: Fixed ROM slots 7781.
                        if slot <> 7781 or instruction <> 23076 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23076, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7782 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:624
//		CAF	LESCHK		# SELF CHECK GO-TO REGISTER.
// PORT: Fixed ROM slots 7782.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:625
//		TS	SELFRET
// PORT: Fixed ROM slots 7783.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:626
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:627
//		CS	VD1
// PORT: Fixed ROM slots 7784.
                        if slot <> 7784 or instruction <> 18684 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2300), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:628
//		TS	DSPCOUNT
// PORT: Fixed ROM slots 7785.
                        if slot <> 7785 or instruction <> 23039 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23039, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 7786 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:629
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:630
//		TC	Q
// PORT: Fixed ROM slots 7786.
                        if slot <> 7786 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 7787 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:631
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:632
//T5IDLOC		CA	L		# T5RUPT COMES HERE EVERY 163.84 SECS
// PORT: Fixed ROM slots 7787.
                            if slot <> 7787 or instruction <> 12289 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 1).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:633
//		TCF	NOQRSM	+1	# WHEN NOBODY IS USING IT.
// PORT: Fixed ROM slots 7788.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:634
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:635
//		EBANK=	OGANOW
// PORT: SOURCE FRESH_START_AND_RESTART.agc:636
//T5IDLER		2CADR	T5IDLOC
// PORT: Fixed ROM slots 7789 7790.
    7789, 3286, 7790, 10348,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:637
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:638
//		EBANK=	OGANOW
// PORT: SOURCE FRESH_START_AND_RESTART.agc:639
//		2CADR	REDORCS
// PORT: Fixed ROM slots 7791 7792.
    7791, 2186, 7792, 34924,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:640
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:641
//		EBANK=	OGANOW
// PORT: SOURCE FRESH_START_AND_RESTART.agc:642
//		2CADR	REDOTVC
// PORT: Fixed ROM slots 7793 7794.
    7793, 3264, 7794, 28780,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:643
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:644
//		EBANK=	OGANOW
// PORT: SOURCE FRESH_START_AND_RESTART.agc:645
//		2CADR	REDOSAT
// PORT: Fixed ROM slots 7795 7796.
    7795, 3050, 7796, 39020,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:646
//# Page 193
// PORT: SOURCE FRESH_START_AND_RESTART.agc:647
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:648
//IFAILINH	OCT	435
// PORT: Fixed ROM slots 7797.
    7797, 570,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:649
//LDNPHAS1	GENADR	DNPHASE1
// PORT: Fixed ROM slots 7798.
    7798, 3760,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:650
//LESCHK		GENADR	SELFCHK
// PORT: Fixed ROM slots 7799.
    7799, 3520,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:651
//VAC1ADRC	ADRES	VAC1USE
// PORT: Fixed ROM slots 7800.
    7800, 512,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:652
//LTHVACA		DEC	44
// PORT: Fixed ROM slots 7801.
    7801, 88,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:653
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:654
//INTMASK		OCT	20100
// PORT: Fixed ROM slots 7802.
    7802, 16512,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:655
//OCT77603	OCT	77603
// PORT: Fixed ROM slots 7803.
    7803, 65286,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:656
//OCT74777	OCT	74777
// PORT: Fixed ROM slots 7804.
    7804, 62462,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:657
//STARTEB		ECADR	LST1
// PORT: Fixed ROM slots 7805.
    7805, 1536,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:658
//NUMGRPS		EQUALS	FIVE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:659
//-ELR		OCT	-22		# -ERROR LIGHT RESET KEY CODE.
// PORT: Fixed ROM slots 7806.
    7806, 65498,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:660
//IM30INIF	OCT	37411		# INHIBITS IMU FAIL FOR 5 SEC AND PIP ISSW
// PORT: Fixed ROM slots 7807.
    7807, 32274,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:661
//IM30INIR	OCT	37000
// PORT: Fixed ROM slots 7808.
    7808, 31744,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:662
//IM33INIT	=	PRIO16		# NO PIP OR TM FAIL SIGNALS.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:663
//9,6,4		OCT	450
// PORT: Fixed ROM slots 7809.
    7809, 592,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:664
//OPTINITF	OCT	130
// PORT: Fixed ROM slots 7810.
    7810, 176,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:665
//OPTINITR	OCT	430
// PORT: Fixed ROM slots 7811.
    7811, 560,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:666
//SWINIT		OCT	0
// PORT: Fixed ROM slots 7812.
    7812, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:667
//		OCT	0
// PORT: Fixed ROM slots 7813.
    7813, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:668
//		OCT	0
// PORT: Fixed ROM slots 7814.
    7814, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:669
//		OCT	0
// PORT: Fixed ROM slots 7815.
    7815, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:670
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:671
//		OCT	0
// PORT: Fixed ROM slots 7816.
    7816, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:672
//		OCT	00200
// PORT: Fixed ROM slots 7817.
    7817, 256,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:673
//		OCT	0
// PORT: Fixed ROM slots 7818.
    7818, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:674
//		OCT	0
// PORT: Fixed ROM slots 7819.
    7819, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:675
//		OCT	0
// PORT: Fixed ROM slots 7820.
    7820, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:676
//		OCT	0
// PORT: Fixed ROM slots 7821.
    7821, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:677
//		OCT	0
// PORT: Fixed ROM slots 7822.
    7822, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:678
//		OCT	0
// PORT: Fixed ROM slots 7823.
    7823, 0
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4166–4166.
function agcAotUnit142 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:679
//# Page 194
// PORT: SOURCE FRESH_START_AND_RESTART.agc:680
//# PROGRAM NAME		GOTOPOOH	ASSEMBLY	SUNDISK
// PORT: SOURCE FRESH_START_AND_RESTART.agc:681
//# LOG SECTION		FRESH START AND RESTART
// PORT: SOURCE FRESH_START_AND_RESTART.agc:682
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:683
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE FRESH_START_AND_RESTART.agc:684
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:685
//#	1. DISPLAY MAJOR MODE NUMBER 00 IN DSKY REGISTER R1 AND R3.  FLASH V50 N07 ON DSKY.  (M M CHANGE REQUEST)
// PORT: SOURCE FRESH_START_AND_RESTART.agc:686
//#	2. PERMIT A CURRENT PENDING REQUEST (FLASH ON DSKY) TO BE REPLACED (WITHOUT AN ABORT) BY THE MAJOR MODE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:687
//#	   CHANGE REQUEST.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:688
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:689
//# INPUT/OUTPUT INFORMATION
// PORT: SOURCE FRESH_START_AND_RESTART.agc:690
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:691
//#	A. CALLING SEQUENCE		TC GOTOPOOH
// PORT: SOURCE FRESH_START_AND_RESTART.agc:692
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:693
//#	B. ERASABLE INITIALIZATION		NONE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:694
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:695
//#	C. OUTPUT 		FLASH VERB 50 NOUN 07 ON DSKY
// PORT: SOURCE FRESH_START_AND_RESTART.agc:696
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:697
//#	D. DEBRIS		L
// PORT: SOURCE FRESH_START_AND_RESTART.agc:698
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:699
//# PROGRAM ANALYSIS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:700
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:701
//#	A. SUBROUTINES CALLED		GOPERF3, LINUS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:702
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:703
//#	B. NORMAL EXIT		    TCF ENDOFJOB
// PORT: SOURCE FRESH_START_AND_RESTART.agc:704
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:705
//#	C. ALARM AND ABORT EXITS		NONE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:706
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:707
//		BLOCK	02
// PORT: SOURCE FRESH_START_AND_RESTART.agc:708
//		SETLOC	FFTAG10
// PORT: SOURCE FRESH_START_AND_RESTART.agc:709
//		BANK
// PORT: SOURCE FRESH_START_AND_RESTART.agc:710
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:711
//		COUNT	02/P00
// PORT: SOURCE FRESH_START_AND_RESTART.agc:712
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:713
//GOTOPOOH	TC	PHASCHNG		# RESTART GOTOPOOH
// PORT: Fixed ROM slots 4166.
    if slot <> 4166 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[142] to agcAotUnit142@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:714
//		OCT	14
// PORT: Fixed ROM slots 4167.
    4167, 24
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4168–4168.
function agcAotUnit143 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:715
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:716
//		TC	POSTJUMP
// PORT: Fixed ROM slots 4168.
    if slot <> 4168 or instruction <> 2497 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2497, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[143] to agcAotUnit143@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:717
//		CADR	GOP00FIX
// PORT: Fixed ROM slots 4169.
    4169, 8192
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6144–6147.
function agcAotUnit357 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6145 {
        if slot <= 6144 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:718
//		BANK	10
// PORT: SOURCE FRESH_START_AND_RESTART.agc:719
//		SETLOC	VERB37
// PORT: SOURCE FRESH_START_AND_RESTART.agc:720
//		BANK
// PORT: SOURCE FRESH_START_AND_RESTART.agc:721
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:722
//		COUNT	04/P00
// PORT: SOURCE FRESH_START_AND_RESTART.agc:723
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:724
//GOP00FIX	TC	INITSUB
// PORT: Fixed ROM slots 6144.
            if slot <> 6144 or instruction <> 1240 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1240, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:725
//		TC	CLEARMRK +2
// PORT: Fixed ROM slots 6145.
            if slot <> 6145 or instruction <> 2912 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2912, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6146 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:726
//		CAF	V37N99
// PORT: Fixed ROM slots 6146.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:727
//		TC	BANKCALL
// PORT: Fixed ROM slots 6147.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:728
//		CADR	GOFLASH
// PORT: Fixed ROM slots 6148.
    6148, 17312
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6149–6151.
function agcAotUnit358 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6149 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:729
//		TCF	-3
// PORT: Fixed ROM slots 6149.
        if slot <> 6149 or instruction <> 5122 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5122, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 6150 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:730
//# Page 195
// PORT: SOURCE FRESH_START_AND_RESTART.agc:731
//		TCF	-4
// PORT: Fixed ROM slots 6150.
            if slot <> 6150 or instruction <> 5122 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5122, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:732
//		TCF	-5
// PORT: Fixed ROM slots 6151.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:733
//V37N99		VN	3799
// PORT: Fixed ROM slots 6152.
    6152, 9670,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:734
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:735
//# Page 196
// PORT: SOURCE FRESH_START_AND_RESTART.agc:736
//# PROGRAM NAME	V37			ASSEMBLY	SUNDISK
// PORT: SOURCE FRESH_START_AND_RESTART.agc:737
//# LOG SECTION	FRESH START AND RESTART
// PORT: SOURCE FRESH_START_AND_RESTART.agc:738
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:739
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE FRESH_START_AND_RESTART.agc:740
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:741
//#	1. CHECK IF NEW PROGRAM ALLOWED.  IF BIT 1 OF FLAGWRD2(NODOFLAG) ISSET, AN ALARM 1520 IS CALLED.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:742
//#	2. CHECK FOR VALIDITY OF PROGRAM SELECTED.  IF AN INVALID PROGRAM IS SELECTED, THE OPERATOR ERROR LIGHT IS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:743
//#	   SET AND CURRENT ACTIVITY, IF ANY, CONTINUES.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:744
//#	3. SERVICER IS TERMINATED IF IT HAS BEEN RUNNING.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:745
//#	4. INSTALL IS EXECUTED TO AVOID INTERRUPTING INTEGRATION.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:746
//#	5. THE ENGINE IS TURNED OFF AND THE DAP IS INITIALIZED FOR COAST.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:747
//#	6. TRACK, UPDATE AND TARG1 FLAGS ARE SET TO ZERO.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:748
//#	7. DISPLAY SYSTEM IS RELEASED.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:749
//#	8. THE FOLLOWING ARE PERFORMED FOR EACH OF THE THREE CASES.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:750
//#	   A. PROGRAM SELECTED IS P00.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:751
//#	      1. RENDEZVOUS FLAG IS RESET (KILL P20).
// PORT: SOURCE FRESH_START_AND_RESTART.agc:752
//#	      2. STATINT1	IS SCHEDULED BY SETTING RESTART GROUP 2.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:753
//#	      3. MAJOR MODE 00 IS STORED IN THE MODE REGISTER(MODREG).
// PORT: SOURCE FRESH_START_AND_RESTART.agc:754
//#	      4. SUPERBANK 3 IS SELECTED.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:755
//#	      5. NODOFLAG IS RESET.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:756
//#	      6. ALL RESTART GROUPS EXCEPT GROUP 2 ARE CLEARED.  CONTROL ISTRANSFERRED TO RESTART PROGRAM (GOPROG2)
// PORT: SOURCE FRESH_START_AND_RESTART.agc:757
//#		 WHICH CAUSES ALL CURRENT ACTIVITY TO BE DISCONTINUED AND A 9 MINUTE INTEGRATION CYCLE TO BE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:758
//#		 INITIATED.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:759
//#	   B. PROGRAM SELECTES IS P20.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:760
//#	      1. IF THE CURRENT MAJOR MODE IS THE SAME AS THE SELECTED NEWPROGRAM.  THE PROGRAM IS RE-INITIALIZED
// PORT: SOURCE FRESH_START_AND_RESTART.agc:761
//#		 VIA V37XEQ, ALL RESTART GROUPS, EXCEPT GROUP 4 ARE CLEARED.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:762
//#	      2. IF THE CURRENT MAJOR MODE IS NOT EQUAL TO THE NEW REQUEST, A CHECK IS MADE TO SEE IF THE REQUEST-
// PORT: SOURCE FRESH_START_AND_RESTART.agc:763
//#		 ED MAJOR MODE HAS BEEN RUNNING THE BACKGROUND,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:764
//#		 AND IF IT HAS, NO NEW PROGRAM IS SCHEDULED, THE EXISTING
// PORT: SOURCE FRESH_START_AND_RESTART.agc:765
//#		 P20 IS RESTARTED TO CONTINUE, AND ITS MAJOR MODE IS SET.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:766
//#	      3. CONTROL IS TRANSFERRED TO GOPROG2.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:767
//#	   C. PROGRAM SELECTED IS NEITHER P00 NOR P20
// PORT: SOURCE FRESH_START_AND_RESTART.agc:768
//#	      1. V37XEQ IS SCHEDULED (AS A JOB) BY SETTING RESTART GROUP 4
// PORT: SOURCE FRESH_START_AND_RESTART.agc:769
//#	      2. ALL CURRENT ACTIVITY EXCEPT RENDEZVOUS AND TRACKING IS DISCONTINUED BY CLEARING ALL RESTART
// PORT: SOURCE FRESH_START_AND_RESTART.agc:770
//#		 GROUPS.  GROUP 2 IS CLEARED.  IF THE RENDEZVOUS FLAG IS ON P20 IS RESTARTED IN GOPROG2 VIA REDOP20,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:771
//#		 TO CONTINUE.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:772
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:773
//# INPUT/OUTPUT INFORMATION
// PORT: SOURCE FRESH_START_AND_RESTART.agc:774
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:775
//#	   A. CALLING SEQUENCE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:776
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:777
//#		CONTROL IS DIRECTED TO V37 BY THE VERBFAN ROUTINE.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:778
//#			VERBFAN GOES TO C(VERBTAB+C(VERBREG)).  VERB 37 = MMCHANG.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:779
//#			MMCHANG EXECUTES A	TC POSTJUMP, CADR V37.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:780
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:781
//#	   B. ERASABLE INITIALIZATION		NONE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:782
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:783
//# 	   C. OUTPUT
// PORT: SOURCE FRESH_START_AND_RESTART.agc:784
//#		MAJOR MODE CHANGE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:785
//# Page 197
// PORT: SOURCE FRESH_START_AND_RESTART.agc:786
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:787
//#	   D. DEBRIS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:788
//#		MMNUMBER, MPAC +1, MINDEX, BASETEMP +C(MINDEX), FLAGWRD0, FLAGWRD1, FLAGWRD2, MODREG, GOLOC -1,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:789
//#		GOLOC, GOLOC +1, GOLOC +2, BASETEMP, -PHASE2, PHASE2, -PHASE4
// PORT: SOURCE FRESH_START_AND_RESTART.agc:790
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:791
//# PROGRAM ANALYSIS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:792
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:793
//#	   A. SUBROUTINES CALLED
// PORT: SOURCE FRESH_START_AND_RESTART.agc:794
//#		ALARM, RELDSP, PINBRNCH, INTSTALL, ENGINOF2, ALLCOAST, V37KLEAN, GOPROG2, FALTON, FINDVAC, SUPERSW,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:795
//#		DSPMM
// PORT: SOURCE FRESH_START_AND_RESTART.agc:796
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:797
//#	   B. NORMAL EXIT		TC ENDOFJOB
// PORT: SOURCE FRESH_START_AND_RESTART.agc:798
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:799
//#	   C. ALARMS		1520 (MAJOR MODE CHANGE NOT PERMITTED)
// PORT: SOURCE FRESH_START_AND_RESTART.agc:800
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:801
//		BLOCK	02
// PORT: SOURCE FRESH_START_AND_RESTART.agc:802
//		SETLOC	FFTAG10
// PORT: SOURCE FRESH_START_AND_RESTART.agc:803
//		BANK
// PORT: SOURCE FRESH_START_AND_RESTART.agc:804
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:805
//		COUNT	02/V37
// PORT: SOURCE FRESH_START_AND_RESTART.agc:806
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:807
//OCT24		MM	20
// PORT: Fixed ROM slots 4170.
    4170, 40,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:808
//OCT31		MM	25
// PORT: Fixed ROM slots 4171.
    4171, 50
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6153–6174.
function agcAotUnit359 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6163 {
        if slot <= 6157 {
            if slot <= 6154 {
                if slot <= 6153 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:809
//		BANK	27
// PORT: SOURCE FRESH_START_AND_RESTART.agc:810
//		SETLOC	VERB37
// PORT: SOURCE FRESH_START_AND_RESTART.agc:811
//		BANK
// PORT: SOURCE FRESH_START_AND_RESTART.agc:812
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:813
//		COUNT	04/V37
// PORT: SOURCE FRESH_START_AND_RESTART.agc:814
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:815
//V37		TS	MMNUMBER		# SAVE MAJOR MODE
// PORT: Fixed ROM slots 6153.
                    if slot <> 6153 or instruction <> 23037 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23037, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:816
//		CAF	PRIO30			# RESTART AT PINBALL PRIORITY
// PORT: Fixed ROM slots 6154.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:817
//		TS	RESTREG
// PORT: Fixed ROM slots 6155.
                    if slot <> 6155 or instruction <> 22774 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22774, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6156 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:818
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:819
//		CA	IMODES30		# IS IMU BEING INITIALIZED
// PORT: Fixed ROM slots 6156.
                        if slot <> 6156 or instruction <> 13008 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 720).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:820
//		MASK	BIT6
// PORT: Fixed ROM slots 6157.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:821
//		CCS	A
// PORT: Fixed ROM slots 6158.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:822
//		TCF	CANTR00
// PORT: Fixed ROM slots 6159.
                        if slot <> 6159 or instruction <> 5177 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5177, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:823
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:824
//		CAF	BIT13			# IS ENGINE ON
// PORT: Fixed ROM slots 6160.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:825
//		EXTEND
// PORT: Fixed ROM slots 6161.
                    if slot <> 6161 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6162 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:826
//		RAND	DSALMOUT
// PORT: Fixed ROM slots 6162.
                        if slot <> 6162 or instruction <> 1033 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 2, 9, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:827
//		CCS	A
// PORT: Fixed ROM slots 6163.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:828
//		TCF	R00TOP00		# YES, SET UP FOR P00
// PORT: Fixed ROM slots 6164.
                    if slot <> 6164 or instruction <> 5145 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5145, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:829
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:830
//		CS	FLAGWRD6		# NO, IS TVC DAP ON
// PORT: Fixed ROM slots 6165.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:831
//		MASK	OCT60000
// PORT: Fixed ROM slots 6166.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:832
//		EXTEND
// PORT: Fixed ROM slots 6167.
                        if slot <> 6167 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:833
//		BZMF	ISITP00			# NO, CONTINUE WITH R00
// PORT: Fixed ROM slots 6168.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:834
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:835
//R00TOP00	INHINT
// PORT: Fixed ROM slots 6169.
                    if slot <> 6169 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6170 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:836
//		CAF	EBANK6
// PORT: Fixed ROM slots 6170.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:837
//# Page 198
// PORT: SOURCE FRESH_START_AND_RESTART.agc:838
//		TS	EBANK
// PORT: Fixed ROM slots 6171.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:839
//		EBANK=	DAPDATR1
// PORT: SOURCE FRESH_START_AND_RESTART.agc:840
//		CAE	CSMMASS
// PORT: Fixed ROM slots 6172.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:841
//		TS	MASSTMP
// PORT: Fixed ROM slots 6173.
                        if slot <> 6173 or instruction <> 23466 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23466, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:842
//		TC	IBNKCALL
// PORT: Fixed ROM slots 6174.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:843
//		CADR	SPSOFF
// PORT: Fixed ROM slots 6175.
    6175, 42014
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6176–6176.
function agcAotUnit360 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:844
//		TC	IBNKCALL
// PORT: Fixed ROM slots 6176.
    if slot <> 6176 or instruction <> 2528 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2528, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[360] to agcAotUnit360@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:845
//		CADR	MASSPROP
// PORT: Fixed ROM slots 6177.
    6177, 11756
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6178–6179.
function agcAotUnit361 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6178 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:846
//		CAF	3.1SEC
// PORT: Fixed ROM slots 6178.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:847
//		TC	IBNKCALL
// PORT: Fixed ROM slots 6179.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:848
//		CADR	RCSDAPON +1
// PORT: Fixed ROM slots 6180.
    6180, 34858
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6181–6181.
function agcAotUnit362 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:849
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:850
//		TC	IBNKCALL
// PORT: Fixed ROM slots 6181.
    if slot <> 6181 or instruction <> 2528 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2528, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[362] to agcAotUnit362@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:851
//		CADR	TVCZAP			# DISABLE TVC
// PORT: Fixed ROM slots 6182.
    6182, 42098
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6183–6187.
function agcAotUnit363 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6184 {
        if slot <= 6183 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:852
//		CAF	ZERO
// PORT: Fixed ROM slots 6183.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:853
//		TS	MMNUMBER
// PORT: Fixed ROM slots 6184.
            if slot <> 6184 or instruction <> 23037 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23037, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6185 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:854
//		RELINT
// PORT: Fixed ROM slots 6185.
            if slot <> 6185 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6186 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:855
//		CAF	FIVE
// PORT: Fixed ROM slots 6186.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:856
//		TC	BANKCALL
// PORT: Fixed ROM slots 6187.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:857
//		CADR	DELAYJOB
// PORT: Fixed ROM slots 6188.
    6188, 1972
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6189–6201.
function agcAotUnit364 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6194 {
        if slot <= 6191 {
            if slot <= 6189 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:858
//		CAF	ZERO
// PORT: Fixed ROM slots 6189.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:859
//		EXTEND
// PORT: Fixed ROM slots 6190.
                    if slot <> 6190 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:860
//		WRITE	5
// PORT: Fixed ROM slots 6191.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:861
//		EXTEND
// PORT: Fixed ROM slots 6192.
                if slot <> 6192 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6193 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:862
//		WRITE	6
// PORT: Fixed ROM slots 6193.
                    if slot <> 6193 or instruction <> 518 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 1, 6, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:863
//ISITP00		CA	MMNUMBER
// PORT: Fixed ROM slots 6194.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:864
//		EXTEND
// PORT: Fixed ROM slots 6195.
                if slot <> 6195 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6196 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:865
//		BZF	ISSERVON		# YES, CHECK SERVICER STATUS
// PORT: Fixed ROM slots 6196.
                    if slot <> 6196 or instruction <> 5195 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5195, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:866
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:867
//		CS	FLAGWRD2		# NO, IS NODO V37 FLAG SET
// PORT: Fixed ROM slots 6197.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:868
//		MASK	NODOBIT
// PORT: Fixed ROM slots 6198.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:869
//		CCS	A
// PORT: Fixed ROM slots 6199.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:870
//		TCF	CHECKTAB		# NO
// PORT: Fixed ROM slots 6200.
                    if slot <> 6200 or instruction <> 5182 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5182, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:871
//CANTR00		TC	ALARM
// PORT: Fixed ROM slots 6201.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:872
//		OCT	1520
// PORT: Fixed ROM slots 6202.
    6202, 1696
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6203–6204.
function agcAotUnit365 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6203 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:873
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:874
//V37BAD		TC	RELDSP			# RELEASES DISPLAY FROM ASTRONAUT
// PORT: Fixed ROM slots 6203.
        if slot <> 6203 or instruction <> 2363 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2363, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:875
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:876
//		TC	POSTJUMP		# BRING BACK LAST NORMAL DISPLAY IF THERE
// PORT: Fixed ROM slots 6204.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:877
//		CADR	PINBRNCH		# WAS ONE.  OY
// PORT: Fixed ROM slots 6205.
    6205, 17780
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6206–6208.
function agcAotUnit366 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6206 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:878
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:879
//CHECKTAB	CA	NOV37MM			# THE NO.  OF MM
// PORT: Fixed ROM slots 6206.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:880
//AGAINMM		TS	MPAC +1
// PORT: Fixed ROM slots 6207.
            if slot <> 6207 or instruction <> 22637 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22637, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:881
//		NDX	MPAC +1
// PORT: Fixed ROM slots 6208.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:882
//		CA	PREMM1			# OBTAIN WHICH MM THIS IS FOR
// PORT: Fixed ROM slots 6209.
    6209, 27230
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6210–6230.
function agcAotUnit367 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6219 {
        if slot <= 6214 {
            if slot <= 6211 {
                if slot <= 6210 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:883
//		MASK	LOW7
// PORT: Fixed ROM slots 6210.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:884
//		COM
// PORT: Fixed ROM slots 6211.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:885
//		AD	MMNUMBER
// PORT: Fixed ROM slots 6212.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:886
//		CCS	A
// PORT: Fixed ROM slots 6213.
                        if slot <> 6213 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:887
//		CCS	MPAC +1			# IF GR, SEE IF ANY MORE IN LIST
// PORT: Fixed ROM slots 6214.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:888
//# Page 199
// PORT: SOURCE FRESH_START_AND_RESTART.agc:889
//		TCF	AGAINMM			# YES, GET NEXT ONE
// PORT: Fixed ROM slots 6215.
                    if slot <> 6215 or instruction <> 5183 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5183, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:890
//		TCF	V37NONO			# LAST TIME OR PASSED MM
// PORT: Fixed ROM slots 6216.
                    if slot <> 6216 or instruction <> 5306 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5306, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6217 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:891
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:892
//		CA	MPAC +1
// PORT: Fixed ROM slots 6217.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:893
//		TS	MINDEX			# SAVE INDEX FOR LATER
// PORT: Fixed ROM slots 6218.
                        if slot <> 6218 or instruction <> 23036 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23036, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:894
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:895
//ISSERVON	CS	FLAGWRD7		# V37 FLAG SET - I.E. IS SERVICER GOING
// PORT: Fixed ROM slots 6219.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:896
//		MASK	V37FLBIT
// PORT: Fixed ROM slots 6220.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:897
//		CCS	A
// PORT: Fixed ROM slots 6221.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:898
//		TCF	CANV37			# NO
// PORT: Fixed ROM slots 6222.
                    if slot <> 6222 or instruction <> 5204 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5204, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6223 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:899
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:900
//		INHINT
// PORT: Fixed ROM slots 6223.
                        if slot <> 6223 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:901
//		CS	AVEGBIT			#   YES TURN OFF AVERAGE G FLAG AND WAIT
// PORT: Fixed ROM slots 6224.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:902
//		MASK	FLAGWRD1		# FOR SERVICER TO RETURN TO CANV37
// PORT: Fixed ROM slots 6225.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:903
//		TS	FLAGWRD1
// PORT: Fixed ROM slots 6226.
                        if slot <> 6226 or instruction <> 22589 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22589, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:904
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:905
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 6227.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:906
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:907
//CANV37		CAF	R00AD
// PORT: Fixed ROM slots 6228.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:908
//		TS	TEMPFLSH
// PORT: Fixed ROM slots 6229.
                        if slot <> 6229 or instruction <> 22780 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22780, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:909
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:910
//		TC	PHASCHNG
// PORT: Fixed ROM slots 6230.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:911
//		OCT	14
// PORT: Fixed ROM slots 6231.
    6231, 24
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6232–6232.
function agcAotUnit368 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:912
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:913
//ROC		TC	INTPRET
// PORT: Fixed ROM slots 6232.
    if slot <> 6232 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[368] to agcAotUnit368@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:914
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:915
//		CALL				# WAIT FOR INTEGRATION TO FINISH
// PORT: Fixed ROM slots 6233.
    6233, 65320,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:916
//			INTSTALL
// PORT: Fixed ROM slots 6234.
    6234, 24132,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:917
//DUMMYAD		EXIT
// PORT: Fixed ROM slots 6235.
    6235, 65532
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6236–6247.
function agcAotUnit369 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6241 {
        if slot <= 6238 {
            if slot <= 6236 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:918
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:919
//		CS	OCT1400			# CLEAR CAUTION RESET
// PORT: Fixed ROM slots 6236.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:920
//		EXTEND				#   AND TEST CONNECTOR OUTBIT
// PORT: Fixed ROM slots 6237.
                    if slot <> 6237 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:921
//		WAND	11
// PORT: Fixed ROM slots 6238.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:922
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:923
//		CAF	OCT44571		# CLEAR ENABLE OPTICS ERROR COUNTER, STAR
// PORT: Fixed ROM slots 6239.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:924
//		EXTEND				# TRAKERS ON BIT, TVC ENABLE, ZERO OPTICS,
// PORT: Fixed ROM slots 6240.
                    if slot <> 6240 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:925
//		WAND	12			# DISENGAGE OPTICS DAP, SIVB IN J SEQUENCE
// PORT: Fixed ROM slots 6241.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:926
//						# START, AND SIVB CUTOFF BIT.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:927
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:928
//		CS	OCT600			# CLEAR UNUSED BITS
// PORT: Fixed ROM slots 6242.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:929
//		EXTEND
// PORT: Fixed ROM slots 6243.
                    if slot <> 6243 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:930
//		WAND	13
// PORT: Fixed ROM slots 6244.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:931
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:932
//		TC	INITSUB
// PORT: Fixed ROM slots 6245.
                if slot <> 6245 or instruction <> 1240 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1240, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6246 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:933
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:934
//		TC	CLEARMRK
// PORT: Fixed ROM slots 6246.
                    if slot <> 6246 or instruction <> 2910 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2910, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:935
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:936
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 6247.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:937
//		ADRES	STIKFLAG
// PORT: Fixed ROM slots 6248.
    6248, 32
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6249–6249.
function agcAotUnit370 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:938
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:939
//# Page 200
// PORT: SOURCE FRESH_START_AND_RESTART.agc:940
//		TC	BANKCALL
// PORT: Fixed ROM slots 6249.
    if slot <> 6249 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[370] to agcAotUnit370@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:941
//		CADR	UPACTOFF		# TURN OFF UPLINK ACTIV LIGHT
// PORT: Fixed ROM slots 6250.
    6250, 49118
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6251–6251.
function agcAotUnit371 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:942
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:943
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 6251.
    if slot <> 6251 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[371] to agcAotUnit371@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:944
//		ADRES	VHFRFLAG
// PORT: Fixed ROM slots 6252.
    6252, 282
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6253–6253.
function agcAotUnit372 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:945
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 6253.
    if slot <> 6253 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[372] to agcAotUnit372@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:946
//		ADRES	R21MARK
// PORT: Fixed ROM slots 6254.
    6254, 62
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6255–6277.
function agcAotUnit373 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6265 {
        if slot <= 6259 {
            if slot <= 6256 {
                if slot <= 6255 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:947
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:948
//		CCS	MMNUMBER		# IS THIS A POOH REQUEST
// PORT: Fixed ROM slots 6255.
                    if slot <> 6255 or instruction <> 4605 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 509).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:949
//		TCF	NOUVEAU			# NO, PICK UP NEW PROGRAM
// PORT: Fixed ROM slots 6256.
                    if slot <> 6256 or instruction <> 5296 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5296, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 6257 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:950
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:951
//		COUNT	04/P00
// PORT: SOURCE FRESH_START_AND_RESTART.agc:952
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:953
//POOH		TC	RELDSP			# RELEASE DISPLAY SYSTEM
// PORT: Fixed ROM slots 6257.
                    if slot <> 6257 or instruction <> 2363 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2363, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6258 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:954
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:955
//		CAF	PRIO5			# SET VARIABLE RESTART REGISTER FOR P00.
// PORT: Fixed ROM slots 6258.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:956
//		TS	PHSPRDT2
// PORT: Fixed ROM slots 6259.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:957
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:958
//		INHINT
// PORT: Fixed ROM slots 6260.
                    if slot <> 6260 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6261 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:959
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:960
//		CS	NODOBIT			# TURN OFF NODOFLAG
// PORT: Fixed ROM slots 6261.
                        if slot <> 6261 or instruction <> 18959 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:961
//		MASK	FLAGWRD2
// PORT: Fixed ROM slots 6262.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:962
//		TS	FLAGWRD2
// PORT: Fixed ROM slots 6263.
                    if slot <> 6263 or instruction <> 22590 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22590, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6264 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:963
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:964
//		CA	FIVE			# SET 2.5 RESTART FOR STATEINT1
// PORT: Fixed ROM slots 6264.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:965
//		TS	L
// PORT: Fixed ROM slots 6265.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:966
//		COM
// PORT: Fixed ROM slots 6266.
                    if slot <> 6266 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6267 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:967
//		DXCH	-PHASE2
// PORT: Fixed ROM slots 6267.
                        if slot <> 6267 or instruction <> 21997 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 493, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:968
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:969
//		CS	BIT7-8			# RESET IMUSE + KILL P20 BY TURNING OFF
// PORT: Fixed ROM slots 6268.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:970
//		MASK	FLAGWRD0
// PORT: Fixed ROM slots 6269.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:971
//		TS	FLAGWRD0		#			 RENDFLG
// PORT: Fixed ROM slots 6270.
                        if slot <> 6270 or instruction <> 22588 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22588, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:972
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:973
//		CAF	DNLADP00
// PORT: Fixed ROM slots 6271.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:974
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:975
//		COUNT	04/V37
// PORT: SOURCE FRESH_START_AND_RESTART.agc:976
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:977
//SEUDOP00	TS	DNLSTCOD		# SET UP APPROPRIATE DOWNLIST.
// PORT: Fixed ROM slots 6272.
                    if slot <> 6272 or instruction <> 22746 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22746, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6273 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:978
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:979
//						#   (OLD ONE WILL BE FINISHED FIRST)
// PORT: SOURCE FRESH_START_AND_RESTART.agc:980
//		CS	OCT01120		# TURN OFF TRACK, TARG1, UPDATE FLAGS
// PORT: Fixed ROM slots 6273.
                        if slot <> 6273 or instruction <> 17672 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 1288), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:981
//		TS	EBANKTEM
// PORT: Fixed ROM slots 6274.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:982
//		MASK	FLAGWRD1
// PORT: Fixed ROM slots 6275.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:983
//		TS	FLAGWRD1
// PORT: Fixed ROM slots 6276.
                        if slot <> 6276 or instruction <> 22589 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22589, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:984
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:985
//GROUPKIL	TC	IBNKCALL		# KILL GROUPS 3(5,6
// PORT: Fixed ROM slots 6277.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:986
//		CADR	V37KLEAN
// PORT: Fixed ROM slots 6278.
    6278, 10902
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6279–6281.
function agcAotUnit374 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6279 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:987
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:988
//		CCS	MMNUMBER		# IS IT POOH
// PORT: Fixed ROM slots 6279.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:989
//		TCF	RENDV00			# NO
// PORT: Fixed ROM slots 6280.
            if slot <> 6280 or instruction <> 5263 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5263, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:990
//# Page 201
// PORT: SOURCE FRESH_START_AND_RESTART.agc:991
//		TC	IBNKCALL
// PORT: Fixed ROM slots 6281.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:992
//		CADR	P00KLEAN		# REDUNDANT EXCEPT FOR GROUP 4.
// PORT: Fixed ROM slots 6282.
    6282, 10890
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6283–6285.
function agcAotUnit375 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6283 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:993
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:994
//GOMOD		CA	MMNUMBER
// PORT: Fixed ROM slots 6283.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:995
//		TS	MODREG
// PORT: Fixed ROM slots 6284.
            if slot <> 6284 or instruction <> 23049 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23049, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:996
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:997
//GOGOPROG	TC	POSTJUMP
// PORT: Fixed ROM slots 6285.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:998
//		CADR	GOPROG2
// PORT: Fixed ROM slots 6286.
    6286, 11090
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6287–6292.
function agcAotUnit376 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6289 {
        if slot <= 6287 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:999
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1000
//RENDV00		CS	MMNUMBER		# IS NEW PROG = 20
// PORT: Fixed ROM slots 6287.
            if slot <> 6287 or instruction <> 16893 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 509).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6288 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1001
//		AD	OCT24			# 20
// PORT: Fixed ROM slots 6288.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1002
//		EXTEND
// PORT: Fixed ROM slots 6289.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1003
//		BZF	RENDN00			# YES
// PORT: Fixed ROM slots 6290.
            if slot <> 6290 or instruction <> 5268 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5268, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6291 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1004
//		TCF	P00FIZZ
// PORT: Fixed ROM slots 6291.
                if slot <> 6291 or instruction <> 5276 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5276, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1005
//RENDN00		CS	MMNUMBER
// PORT: Fixed ROM slots 6292.
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

// PORT: Physical bank 04. Shared continuation entries, slots 6293–6324.
function agcAotUnit377 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6308 {
        if slot <= 6300 {
            if slot <= 6296 {
                if slot <= 6294 {
                    if slot <= 6293 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1006
//		AD	MODREG
// PORT: Fixed ROM slots 6293.
                        if slot <> 6293 or instruction <> 25097 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 521).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1007
//		EXTEND
// PORT: Fixed ROM slots 6294.
                        if slot <> 6294 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 6295 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1008
//		BZF	KILL20
// PORT: Fixed ROM slots 6295.
                        if slot <> 6295 or instruction <> 5280 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5280, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1009
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1010
//		CA	FLAGWRD0		# IS RENDEZVOO FLAG SET
// PORT: Fixed ROM slots 6296.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1011
//		MASK	RNDVZBIT
// PORT: Fixed ROM slots 6297.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1012
//		CCS	A
// PORT: Fixed ROM slots 6298.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1013
//		TCF	STATQUO
// PORT: Fixed ROM slots 6299.
                        if slot <> 6299 or instruction <> 5289 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5289, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1014
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1015
//P00FIZZ		CAF	RNDVZBIT
// PORT: Fixed ROM slots 6300.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1016
//		MASK	FLAGWRD0
// PORT: Fixed ROM slots 6301.
                        if slot <> 6301 or instruction <> 28732 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 60).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1017
//		CCS	A
// PORT: Fixed ROM slots 6302.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1018
//		TCF	REV37
// PORT: Fixed ROM slots 6303.
                        if slot <> 6303 or instruction <> 5286 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5286, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1019
//KILL20		EXTEND				# NO, KILL GROUPS 1 + 2
// PORT: Fixed ROM slots 6304.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1020
//		DCA	NEG0
// PORT: Fixed ROM slots 6305.
                        if slot <> 6305 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 2577, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1021
//		DXCH	-PHASE1
// PORT: Fixed ROM slots 6306.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1022
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1023
//		EXTEND
// PORT: Fixed ROM slots 6307.
                        if slot <> 6307 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1024
//		DCA	NEG0
// PORT: Fixed ROM slots 6308.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1025
//		DXCH	-PHASE2
// PORT: Fixed ROM slots 6309.
                        if slot <> 6309 or instruction <> 21997 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 493, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1026
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1027
//REV37		CAF	V37QCAD			# SET RESTART POINT
// PORT: Fixed ROM slots 6310.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1028
//		TS	TEMPFLSH
// PORT: Fixed ROM slots 6311.
                        if slot <> 6311 or instruction <> 22780 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22780, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1029
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1030
//		TCF	GOGOPROG
// PORT: Fixed ROM slots 6312.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1031
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1032
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1033
//STATQUO		CS	FLAGWRD1		# SET TRACKFLAG AND UPDATE FLAG
// PORT: Fixed ROM slots 6313.
                        if slot <> 6313 or instruction <> 16445 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 61).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1034
//		MASK	OCT120
// PORT: Fixed ROM slots 6314.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1035
//		ADS	FLAGWRD1
// PORT: Fixed ROM slots 6315.
                        if slot <> 6315 or instruction <> 11325 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 61).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1036
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1037
//		EXTEND				# KILL GROUP 4
// PORT: Fixed ROM slots 6316.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1038
//		DCA	NEG0
// PORT: Fixed ROM slots 6317.
                        if slot <> 6317 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 2577, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1039
//		DXCH	-PHASE4
// PORT: Fixed ROM slots 6318.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1040
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1041
//# Page 202
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1042
//		TCF	GOMOD
// PORT: Fixed ROM slots 6319.
                        if slot <> 6319 or instruction <> 5259 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5259, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1043
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1044
//NOUVEAU		CAF	RNDVZBIT
// PORT: Fixed ROM slots 6320.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1045
//		MASK	FLAGWRD0
// PORT: Fixed ROM slots 6321.
                        if slot <> 6321 or instruction <> 28732 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 60).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1046
//		CCS	A
// PORT: Fixed ROM slots 6322.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1047
//		TCF	+3
// PORT: Fixed ROM slots 6323.
                        if slot <> 6323 or instruction <> 5302 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5302, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1048
//		TC	DOWNFLAG		# NO, RESET IMUSE FLAG.
// PORT: Fixed ROM slots 6324.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1049
//		ADRES	IMUSE			# BIT 8 FLAG 0
// PORT: Fixed ROM slots 6325.
    6325, 14
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6326–6326.
function agcAotUnit378 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1050
//	+3	INDEX	MINDEX
// PORT: Fixed ROM slots 6326.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1051
//		CAF	DNLADMM1		# OBTAIN NEW DOWNLIST ADDRESS
// PORT: Fixed ROM slots 6327.
    6327, 27298
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6328–6333.
function agcAotUnit379 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6330 {
        if slot <= 6328 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1052
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1053
//		INHINT
// PORT: Fixed ROM slots 6328.
            if slot <> 6328 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6329 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1054
//		TCF	SEUDOP00
// PORT: Fixed ROM slots 6329.
                if slot <> 6329 or instruction <> 5248 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5248, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1055
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1056
//V37NONO		TC	FALTON			# COME HERE IF MM REQUESTED DOESNT EXIST
// PORT: Fixed ROM slots 6330.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1057
//		TCF	V37BAD
// PORT: Fixed ROM slots 6331.
            if slot <> 6331 or instruction <> 5179 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5179, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 6332 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1058
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1059
//OCT00010	EQUALS	BIT4
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1060
//V37XEQ		INHINT
// PORT: Fixed ROM slots 6332.
                if slot <> 6332 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1061
//		INDEX	MINDEX
// PORT: Fixed ROM slots 6333.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1062
//		CAF	PREMM1
// PORT: Fixed ROM slots 6334.
    6334, 27230
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6335–6346.
function agcAotUnit380 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6340 {
        if slot <= 6337 {
            if slot <= 6335 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1063
//		TS	MMTEMP			# OBTAIN PRIORITY BITS 15 - 11
// PORT: Fixed ROM slots 6335.
                if slot <> 6335 or instruction <> 23088 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23088, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 6336 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1064
//		TS	CYR			# SHIFT RIGHT TO BITS 14 - 10
// PORT: Fixed ROM slots 6336.
                    if slot <> 6336 or instruction <> 22544 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22544, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1065
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1066
//		CA	CYR
// PORT: Fixed ROM slots 6337.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1067
//		MASK	PRIO37
// PORT: Fixed ROM slots 6338.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1068
//		TS	PHSPRDT4		# PRESET GROUP4 RESTART PRIORITY
// PORT: Fixed ROM slots 6339.
                    if slot <> 6339 or instruction <> 23090 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23090, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1069
//		TS	NEWPRIO			# STORE PRIO FOR SPVAC
// PORT: Fixed ROM slots 6340.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1070
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1071
//		CA	MMTEMP			# OBTAIN EBANK - BITS 8, 9, 10 OF MMTEMP.
// PORT: Fixed ROM slots 6341.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1072
//		EXTEND
// PORT: Fixed ROM slots 6342.
                    if slot <> 6342 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1073
//		MP	BIT8
// PORT: Fixed ROM slots 6343.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1074
//		MASK	LOW3
// PORT: Fixed ROM slots 6344.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1075
//		TS	L
// PORT: Fixed ROM slots 6345.
                    if slot <> 6345 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1076
//		INDEX	MINDEX
// PORT: Fixed ROM slots 6346.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1077
//		CAF	FCADRMM1
// PORT: Fixed ROM slots 6347.
    6347, 27164
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6348–6370.
function agcAotUnit381 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6358 {
        if slot <= 6352 {
            if slot <= 6349 {
                if slot <= 6348 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1078
//		TS	BASETEMP
// PORT: Fixed ROM slots 6348.
                    if slot <> 6348 or instruction <> 23089 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23089, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1079
//		MASK	HI5
// PORT: Fixed ROM slots 6349.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1080
//		ADS	L
// PORT: Fixed ROM slots 6350.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1081
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1082
//		CA	BASETEMP		# OBTAIN GENADR PORTION OF 2CADR.
// PORT: Fixed ROM slots 6351.
                        if slot <> 6351 or instruction <> 12849 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 561).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1083
//		MASK	LOW10
// PORT: Fixed ROM slots 6352.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1084
//		AD	BIT11
// PORT: Fixed ROM slots 6353.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1085
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1086
//		TC	SPVAC
// PORT: Fixed ROM slots 6354.
                        if slot <> 6354 or instruction <> 2672 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2672, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1087
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1088
//V37XEQC		CA	MMTEMP			# UPON RETURN FROM FINDVAC PLACE THE
// PORT: Fixed ROM slots 6355.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1089
//		MASK	LOW7			# NEW MM IN MODREG (THE LOW 7 BITS OF
// PORT: Fixed ROM slots 6356.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1090
//		TC	NEWMODEA		# PHSBRDT1)
// PORT: Fixed ROM slots 6357.
                        if slot <> 6357 or instruction <> 2799 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2799, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1091
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1092
//# Page 203
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1093
//# FOR SUNDISK ONLY
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1094
//		TC	RELDSP			# RELEASE DISPLAY
// PORT: Fixed ROM slots 6358.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1095
//		TC	ENDOFJOB		# AND EXIT
// PORT: Fixed ROM slots 6359.
                    if slot <> 6359 or instruction <> 2703 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2703, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6360 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1096
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1097
//INITSUB		EXTEND
// PORT: Fixed ROM slots 6360.
                        if slot <> 6360 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1098
//		QXCH	MPAC	+1
// PORT: Fixed ROM slots 6361.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1099
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1100
//		CAF	EBANK6			# SET E6 FOR DEADBAND CODING
// PORT: Fixed ROM slots 6362.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1101
//		TS	EBANK			# WILL BE RESET IN STARTSB2.
// PORT: Fixed ROM slots 6363.
                        if slot <> 6363 or instruction <> 22531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22531, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1102
//		INHINT
// PORT: Fixed ROM slots 6364.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1103
//		TC	STOPRATE
// PORT: Fixed ROM slots 6365.
                    if slot <> 6365 or instruction <> 2390 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2390, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 6366 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1104
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1105
//		CA	FLAGWRD9		# RESTORE DEADBAND
// PORT: Fixed ROM slots 6366.
                        if slot <> 6366 or instruction <> 12357 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 69).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1106
//		MASK	MAXDBBIT
// PORT: Fixed ROM slots 6367.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1107
//		CCS	A
// PORT: Fixed ROM slots 6368.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1108
//		TCF	SETMAXER		# MAX DB SELECTED
// PORT: Fixed ROM slots 6369.
                        if slot <> 6369 or instruction <> 5349 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5349, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1109
//		TC	BANKCALL		# MIN DB SELECTED
// PORT: Fixed ROM slots 6370.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1110
//		CADR	SETMINDB
// PORT: Fixed ROM slots 6371.
    6371, 41352
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6372–6373.
function agcAotUnit382 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6372 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1111
//		TCF	RAKE
// PORT: Fixed ROM slots 6372.
        if slot <> 6372 or instruction <> 5351 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5351, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1112
//SETMAXER	TC	BANKCALL
// PORT: Fixed ROM slots 6373.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1113
//		CADR	SETMAXDB
// PORT: Fixed ROM slots 6374.
    6374, 41376
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6375–6377.
function agcAotUnit383 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6375 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1114
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1115
//RAKE		CAF	ELEVEN			# THIS PART CLEARS FLAGWORD BITS.
// PORT: Fixed ROM slots 6375.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1116
//	+1	TS	MPAC			# LOOP COMES HERE.
// PORT: Fixed ROM slots 6376.
            if slot <> 6376 or instruction <> 22636 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22636, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1117
//		INDEX	MPAC
// PORT: Fixed ROM slots 6377.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1118
//		CS	FLAGTABL
// PORT: Fixed ROM slots 6378.
    6378, 35310
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6379–6379.
function agcAotUnit384 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1119
//		INDEX	MPAC
// PORT: Fixed ROM slots 6379.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1120
//		MASK	FLAGWRD0
// PORT: Fixed ROM slots 6380.
    6380, 57464
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6381–6381.
function agcAotUnit385 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1121
//		INDEX	MPAC			# PUT REVISED FLAGWORD BACK.
// PORT: Fixed ROM slots 6381.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1122
//		TS	FLAGWRD0
// PORT: Fixed ROM slots 6382.
    6382, 45176
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6383–6386.
function agcAotUnit386 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6384 {
        if slot <= 6383 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1123
//		CCS	MPAC
// PORT: Fixed ROM slots 6383.
            if slot <> 6383 or instruction <> 4204 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 108).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1124
//		TCF	RAKE	+1		# GET THE NEXT FLAGWORD.
// PORT: Fixed ROM slots 6384.
            if slot <> 6384 or instruction <> 5352 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5352, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 6385 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1125
//		RELINT
// PORT: Fixed ROM slots 6385.
            if slot <> 6385 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1126
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1127
//		TC	UPFLAG			# NOW SET IMPULSW
// PORT: Fixed ROM slots 6386.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1128
//		ADRES	IMPULSW
// PORT: Fixed ROM slots 6387.
    6387, 72
)).

// PORT: Physical bank 04. Shared continuation entries, slots 6388–6390.
function agcAotUnit387 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 6388 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1129
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1130
//		CA	NEGONE
// PORT: Fixed ROM slots 6388.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1131
//		TS	OPTIND
// PORT: Fixed ROM slots 6389.
            if slot <> 6389 or instruction <> 23235 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23235, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1132
//		TC	MPAC	+1		# RETURN FROM INITSUB
// PORT: Fixed ROM slots 6390.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1133
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1134
//FLAGTABL	OCT	0
// PORT: Fixed ROM slots 6391.
    6391, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1135
//		OCT	00040			# IDLEFAIL
// PORT: Fixed ROM slots 6392.
    6392, 64,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1136
//		OCT	06000			# P21FLAG, STEERSW
// PORT: Fixed ROM slots 6393.
    6393, 6144,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1137
//		OCT	0
// PORT: Fixed ROM slots 6394.
    6394, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1138
//		OCT	0
// PORT: Fixed ROM slots 6395.
    6395, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1139
//		OCT	04140			# V59FLAG, ENGONFLG, 3AXISFLG
// PORT: Fixed ROM slots 6396.
    6396, 4288,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1140
//		OCT	10000			# STRULLSW
// PORT: Fixed ROM slots 6397.
    6397, 8192,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1141
//		OCT	16000
// PORT: Fixed ROM slots 6398.
    6398, 14336,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1142
//		OCT	0
// PORT: Fixed ROM slots 6399.
    6399, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1143
//# Page 204
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1144
//		OCT	42000			# SWTOVER, V94FLAG
// PORT: Fixed ROM slots 6400.
    6400, 34816,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1145
//		OCT	0
// PORT: Fixed ROM slots 6401.
    6401, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1146
//		OCT	0
// PORT: Fixed ROM slots 6402.
    6402, 0
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18432–18436.
function agcAotUnit1073 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18433 {
        if slot <= 18432 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1147
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1148
//		SETLOC	VAC5LOC
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1149
//		BANK
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1150
//VAC5STOR	CA	ZERO			# INITIALIZE INDEX REGISTERS
// PORT: Fixed ROM slots 18432.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1151
//		TS	ITEMP1
// PORT: Fixed ROM slots 18433.
            if slot <> 18433 or instruction <> 22577 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22577, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 18434 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1152
//		TS	ITEMP2
// PORT: Fixed ROM slots 18434.
            if slot <> 18434 or instruction <> 22578 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22578, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18435 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1153
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1154
//V5LOOP1		EXTEND				# LOOP TO STORE LOCS, BANKSETS, AND PRIOS.
// PORT: Fixed ROM slots 18435.
                if slot <> 18435 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1155
//		INDEX	ITEMP1
// PORT: Fixed ROM slots 18436.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1156
//		DCA	LOC
// PORT: Fixed ROM slots 18437.
    18437, 24810
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18438–18438.
function agcAotUnit1074 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1157
//		INDEX	ITEMP2
// PORT: Fixed ROM slots 18438.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1158
//		DXCH	VAC5
// PORT: Fixed ROM slots 18439.
    18439, 43876
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18440–18440.
function agcAotUnit1075 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1159
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1160
//		INDEX	ITEMP1
// PORT: Fixed ROM slots 18440.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1161
//		CA	PRIORITY
// PORT: Fixed ROM slots 18441.
    18441, 24814
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18442–18442.
function agcAotUnit1076 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1162
//		INDEX	ITEMP2
// PORT: Fixed ROM slots 18442.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1163
//		TS	VAC5 +2
// PORT: Fixed ROM slots 18443.
    18443, 45926
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18444–18456.
function agcAotUnit1077 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18449 {
        if slot <= 18446 {
            if slot <= 18444 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1164
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1165
//		CS	ITEMP2			# HAVE WE STORED THEM ALL?
// PORT: Fixed ROM slots 18444.
                if slot <> 18444 or instruction <> 16434 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 50).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18445 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1166
//		AD	EIGHTEEN
// PORT: Fixed ROM slots 18445.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1167
//		EXTEND
// PORT: Fixed ROM slots 18446.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1168
//		BZF	V5OUT1			# YES, GET PHASE INFORMATION.
// PORT: Fixed ROM slots 18447.
                if slot <> 18447 or instruction <> 5141 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5141, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18448 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1169
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1170
//		CA	TWELVE			# NO, INCREMENT INDEXES AND LOOP.
// PORT: Fixed ROM slots 18448.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1171
//		ADS	ITEMP1
// PORT: Fixed ROM slots 18449.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1172
//		CA	THREE
// PORT: Fixed ROM slots 18450.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1173
//		ADS	ITEMP2
// PORT: Fixed ROM slots 18451.
                    if slot <> 18451 or instruction <> 11314 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 50).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1174
//		TCF	V5LOOP1
// PORT: Fixed ROM slots 18452.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1175
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1176
//		EBANK=	PHSNAME1
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1177
//V5OUT1		CA	EBANK3			# PHSNAME REGISTERS ARE IN EBANK3.
// PORT: Fixed ROM slots 18453.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1178
//		TS	EBANK
// PORT: Fixed ROM slots 18454.
                    if slot <> 18454 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18455 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1179
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1180
//		CA	ELEVEN			# GET PHASE 2CADRS.
// PORT: Fixed ROM slots 18455.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1181
//		TC	GENTRAN
// PORT: Fixed ROM slots 18456.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1182
//		ADRES	PHSNAME1
// PORT: Fixed ROM slots 18457.
    18457, 1596,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1183
//		ADRES	VAC5 +21D
// PORT: Fixed ROM slots 18458.
    18458, 908
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18459–18462.
function agcAotUnit1078 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18460 {
        if slot <= 18459 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1184
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1185
//		CA	ZERO			# NOW INITIALIZE INDEXES AGAIN.
// PORT: Fixed ROM slots 18459.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1186
//		TS	ITEMP1
// PORT: Fixed ROM slots 18460.
            if slot <> 18460 or instruction <> 22577 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22577, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 18461 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1187
//		TS	ITEMP2
// PORT: Fixed ROM slots 18461.
            if slot <> 18461 or instruction <> 22578 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22578, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1188
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1189
//V5LOOP2		INDEX	ITEMP1			# LOOP TO GET PHASE TABLES.
// PORT: Fixed ROM slots 18462.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1190
//		CA	PHASE1
// PORT: Fixed ROM slots 18463.
    18463, 25558
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18464–18464.
function agcAotUnit1079 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1191
//		INDEX	ITEMP2
// PORT: Fixed ROM slots 18464.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1192
//		TS	VAC5 +33D
// PORT: Fixed ROM slots 18465.
    18465, 45988
)).

// PORT: Physical bank 20. Shared continuation entries, slots 18466–18483.
function agcAotUnit1080 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18474 {
        if slot <= 18469 {
            if slot <= 18467 {
                if slot <= 18466 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1193
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1194
//# Page 205
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1195
//		CS	ITEMP2			# DO WE HAVE THEM ALL?
// PORT: Fixed ROM slots 18466.
                    if slot <> 18466 or instruction <> 16434 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 50).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1196
//		AD	FIVE
// PORT: Fixed ROM slots 18467.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1197
//		EXTEND
// PORT: Fixed ROM slots 18468.
                    if slot <> 18468 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1198
//		BZF	V5OUT2			# YES, GO FINISH UP.
// PORT: Fixed ROM slots 18469.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1199
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1200
//		CA	TWO			# NO, INCREMENT INDEXES AND LOOP.
// PORT: Fixed ROM slots 18470.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1201
//		ADS	ITEMP1
// PORT: Fixed ROM slots 18471.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1202
//		INCR	ITEMP2
// PORT: Fixed ROM slots 18472.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1203
//		TCF	V5LOOP2
// PORT: Fixed ROM slots 18473.
                        if slot <> 18473 or instruction <> 5150 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5150, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1204
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1205
//V5OUT2		CA	MPAC +3
// PORT: Fixed ROM slots 18474.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1206
//		TS	VAC5 +39D
// PORT: Fixed ROM slots 18475.
                    if slot <> 18475 or instruction <> 23000 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23000, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1207
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1208
//		EXTEND
// PORT: Fixed ROM slots 18476.
                    if slot <> 18476 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18477 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1209
//		DCA	NEWLOC
// PORT: Fixed ROM slots 18477.
                    if slot <> 18477 or instruction <> 12342 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 54, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1210
//		DXCH	VAC5 +40D
// PORT: Fixed ROM slots 18478.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1211
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1212
//		CA	NEWJOB
// PORT: Fixed ROM slots 18479.
                    if slot <> 18479 or instruction <> 12343 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 55).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1213
//		TS	VAC5 +22D
// PORT: Fixed ROM slots 18480.
                    if slot <> 18480 or instruction <> 22983 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22983, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18481 {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1214
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1215
//		CA	NEWPRIO
// PORT: Fixed ROM slots 18481.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1216
//		TS	VAC5 +26D
// PORT: Fixed ROM slots 18482.
                        if slot <> 18482 or instruction <> 22987 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22987, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1217
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1218
//		TC	SWRETURN
// PORT: Fixed ROM slots 18483.
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
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1219
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1220
//EIGHTEEN	OCT	22
// PORT: Fixed ROM slots 18484.
    18484, 36,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1221
//		SETLOC	VERB37
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1222
//		BANK
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1223
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1224
//NEG7		EQUALS	OCT77770
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1225
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1226
//OCT44571	OCT	44571			# CONSTANTS TO CLEAR CHANNEL BITS IN V37
// PORT: Fixed ROM slots 6403.
    6403, 37618,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1227
//OCT600		OCT	600
// PORT: Fixed ROM slots 6404.
    6404, 768,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1228
//		EBANK=	PACTOFF
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1229
//P00DAPAD	2CADR	T5IDLOC
// PORT: Fixed ROM slots 6405 6406.
    6405, 3286, 6406, 10348,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1230
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1231
//MMTEMP		EQUALS	PHSPRDT3
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1232
//BASETEMP	EQUALS	TBASE4
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1233
//BIT7-8		OCT	300
// PORT: Fixed ROM slots 6407.
    6407, 384,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1234
//OCT01120	OCT	01120
// PORT: Fixed ROM slots 6408.
    6408, 1184,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1235
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1236
//V37QCAD		CADR	V37XEQ +3
// PORT: Fixed ROM slots 6409.
    6409, 8574,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1237
//R00AD		CADR	DUMMYAD
// PORT: Fixed ROM slots 6410.
    6410, 8374,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1238
//		EBANK=	DAPDATR1
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1239
//RCSADDR4	2CADR	RCSATT
// PORT: Fixed ROM slots 6411 6412.
    6411, 2212, 6412, 34924,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1240
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1241
//3.1SEC		OCT	37312			# 2.5 + 0.6 SEC
// PORT: Fixed ROM slots 6413.
    6413, 32148,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1242
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1243
//# FOR VERB 37 TWO TABLES ARE MAINTAINED.  EACH TABLE HAS AN ENTRY FOR EACH
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1244
//# MAJOR MODE THAT CAN BE STARTED FROM THE KEYBOARD.  THE ENTRIES ARE PUT
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1245
//# INTO THE TABLE WITH THE ENTRY FOR THE HIGHEST MAJOR MODE COMING FIRST,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1246
//# Page 206
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1247
//# TO THE LOWEST MAJOR MODE WHICH IS THE LAST ENTRY IN EACH TABLE.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1248
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1249
//# 	THE FCADRMM TABLE CONTAINS THE FCADR OF THE STARTING JOB OF
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1250
//# THE MAJOR MODE.  FOR EXAMPLE,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1251
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1252
//#	FCADRMM1	FCADR	P79		# START OF P 79
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1253
//#			FCADR	PROG18		# START OF P 18
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1254
//#			FCADR	P01		# START OF P 01
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1255
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1256
//FCADRMM1	EQUALS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1257
//		FCADR	P79
// PORT: Fixed ROM slots 6414.
    6414, 9460,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1258
//		FCADR	P78
// PORT: Fixed ROM slots 6415.
    6415, 9160,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1259
//		FCADR	P77
// PORT: Fixed ROM slots 6416.
    6416, 60630,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1260
//		FCADR	P76
// PORT: Fixed ROM slots 6417.
    6417, 22642,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1261
//		FCADR	P75
// PORT: Fixed ROM slots 6418.
    6418, 59622,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1262
//		FCADR	P74
// PORT: Fixed ROM slots 6419.
    6419, 59396,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1263
//		FCADR	P73
// PORT: Fixed ROM slots 6420.
    6420, 9794,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1264
//		FCADR	P72
// PORT: Fixed ROM slots 6421.
    6421, 9610,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1265
//		FCADR	P62
// PORT: Fixed ROM slots 6422.
    6422, 45472,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1266
//		FCADR	P61
// PORT: Fixed ROM slots 6423.
    6423, 45342,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1267
//		FCADR	P54
// PORT: Fixed ROM slots 6424.
    6424, 26624,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1268
//		FCADR	P53
// PORT: Fixed ROM slots 6425.
    6425, 25710,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1269
//		FCADR	PROG52
// PORT: Fixed ROM slots 6426.
    6426, 26624,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1270
//		FCADR	P51
// PORT: Fixed ROM slots 6427.
    6427, 25710,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1271
//		FCADR	P47CSM
// PORT: Fixed ROM slots 6428.
    6428, 41574,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1272
//		FCADR	P41CSM
// PORT: Fixed ROM slots 6429.
    6429, 47896,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1273
//		FCADR	P40CSM
// PORT: Fixed ROM slots 6430.
    6430, 41078,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1274
//		FCADR	P39
// PORT: Fixed ROM slots 6431.
    6431, 9452,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1275
//		FCADR	P38
// PORT: Fixed ROM slots 6432.
    6432, 9156,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1276
//		FCADR	P37
// PORT: Fixed ROM slots 6433.
    6433, 62060,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1277
//		FCADR	P35
// PORT: Fixed ROM slots 6434.
    6434, 59614,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1278
//		FCADR	P34
// PORT: Fixed ROM slots 6435.
    6435, 59392,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1279
//		FCADR	P33
// PORT: Fixed ROM slots 6436.
    6436, 9790,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1280
//		FCADR	P32
// PORT: Fixed ROM slots 6437.
    6437, 9606,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1281
//		FCADR	P31
// PORT: Fixed ROM slots 6438.
    6438, 60862,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1282
//		FCADR	P30
// PORT: Fixed ROM slots 6439.
    6439, 60838,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1283
//		FCADR	P23
// PORT: Fixed ROM slots 6440.
    6440, 51718,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1284
//		FCADR	PROG22
// PORT: Fixed ROM slots 6441.
    6441, 49152,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1285
//		FCADR	PROG21
// PORT: Fixed ROM slots 6442.
    6442, 63490,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1286
//		FCADR	PROG20
// PORT: Fixed ROM slots 6443.
    6443, 63842,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1287
//		FCADR	P17
// PORT: Fixed ROM slots 6444.
    6444, 60626,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1288
//		FCADR	P06
// PORT: Fixed ROM slots 6445.
    6445, 46944,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1289
//		FCADR	GTSCPSS1			# GYROCOMPASS STANDARD LEAD IN.
// PORT: Fixed ROM slots 6446.
    6446, 55298,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1290
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1291
//# THE PREMM TABLE CONTAINS THE E-BANK,MAJOR MODE, AND PRIORITY
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1292
//# INFORMATION, IT IS IN THE FOLLOWING FORM,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1293
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1294
//#	PPP PPE EEM MMM MMM
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1295
//#
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1296
//# Page 207
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1297
//#	WHERE THE 7 M BITS CONTAIN THE MAJOR MODE NUMBER
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1298
//#		   3 E BITS CONTAIN THE E-BANK NUMBER
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1299
//#		   5 P BITS CONTAIN THE PRIORITY AT WHICH THE JOB IS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1300
//#			TO BE STARTED
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1301
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1302
//#	FOR EXAMPLE,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1303
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1304
//#		PREMM1		OCT	67213		# PRIORITY	33
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1305
//#							# E-BANK	 5
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1306
//#							# MAJOR MODE	11
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1307
//#				OCT	25437		# PRIORITY	 12
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1308
//#							# E-BANK	 6
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1309
//#							# MAJOR MODE	31
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1310
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1311
//PREMM1		EQUALS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1312
//		OCT	27117		# MM 79		EBANK 4		PRIO 13
// PORT: Fixed ROM slots 6447.
    6447, 23710,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1313
//		OCT	27116		# MM 78		EBANK 4		PR23 13
// PORT: Fixed ROM slots 6448.
    6448, 23708,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1314
//		OCT	27115		# MM 77		EBANK 4		PRIO 13
// PORT: Fixed ROM slots 6449.
    6449, 23706,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1315
//		OCT	27714		# MM 76		EBANK 4		PRIO 13
// PORT: Fixed ROM slots 6450.
    6450, 24472,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1316
//		OCT	27113		# MM 75		EBANK 4		PRIO 13
// PORT: Fixed ROM slots 6451.
    6451, 23702,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1317
//		OCT	27112		# MM 74		EBANK 4		PRIO 13
// PORT: Fixed ROM slots 6452.
    6452, 23700,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1318
//		OCT	27111		# MM 73		EBANK 4		PRIO 13
// PORT: Fixed ROM slots 6453.
    6453, 23698,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1319
//		OCT	27110		# MM 72		EBANK 4		PRIO 13
// PORT: Fixed ROM slots 6454.
    6454, 23696,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1320
//		OCT	27476		# MM 62		EBANK 6		PRIO 13
// PORT: Fixed ROM slots 6455.
    6455, 24188,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1321
//		OCT	27475		# MM 61		EBANK 6		PRIO 13
// PORT: Fixed ROM slots 6456.
    6456, 24186,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1322
//		OCT	27266		# MM 54		EBANK 5		PRIO 13
// PORT: Fixed ROM slots 6457.
    6457, 23916,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1323
//		OCT	27265		# MM 53		EBANK 5		PRIO 13
// PORT: Fixed ROM slots 6458.
    6458, 23914,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1324
//		OCT	27264		# MM 52		EBANK 5		PRIO 13
// PORT: Fixed ROM slots 6459.
    6459, 23912,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1325
//		OCT	27263		# MM 51		EBANK 5		PRIO 13
// PORT: Fixed ROM slots 6460.
    6460, 23910,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1326
//		OCT	27657		# MM 47		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6461.
    6461, 24414,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1327
//		OCT	27451		# MM 41		EBANK 6		PRIO 13
// PORT: Fixed ROM slots 6462.
    6462, 24146,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1328
//		OCT	27450		# MM 40		EBANK 6		PRIO 13
// PORT: Fixed ROM slots 6463.
    6463, 24144,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1329
//		OCT	27047		# MM 39		EBANK 4		PRIO 13
// PORT: Fixed ROM slots 6464.
    6464, 23630,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1330
//		OCT	27046		# MM 38		EBANK 4		PRIO 13
// PORT: Fixed ROM slots 6465.
    6465, 23628,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1331
//		OCT	27645		# MM 37		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6466.
    6466, 24394,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1332
//		OCT	27043		# MM 35		EBANK 4		PRIO 13
// PORT: Fixed ROM slots 6467.
    6467, 23622,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1333
//		OCT	27042		# MM 34		EBANK 4		PRIO 13
// PORT: Fixed ROM slots 6468.
    6468, 23620,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1334
//		OCT	27041		# MM 33		EBANK 4		PRIO 13
// PORT: Fixed ROM slots 6469.
    6469, 23618,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1335
//		OCT	27040		# MM 32		EBANK 4		PRIO 13
// PORT: Fixed ROM slots 6470.
    6470, 23616,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1336
//		OCT	27637		# MM 31		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6471.
    6471, 24382,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1337
//		OCT	27636		# MM 30		EBANK 7		PRIO 13
// PORT: Fixed ROM slots 6472.
    6472, 24380,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1338
//		OCT	27227		# MM 23		EBANK 5		PRIO 13
// PORT: Fixed ROM slots 6473.
    6473, 23854,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1339
//		OCT	27226		# MM 22		EBANK 5		PRIO 13
// PORT: Fixed ROM slots 6474.
    6474, 23852,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1340
//		OCT	27025		# MM 21		EBANK 4		PRIO 13
// PORT: Fixed ROM slots 6475.
    6475, 23594,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1341
//		OCT	27424		# MM 20		EBANK 6		PRIO 13
// PORT: Fixed ROM slots 6476.
    6476, 24104,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1342
//		OCT	27021		# MM 17		EBANK 6		PRIO 13
// PORT: Fixed ROM slots 6477.
    6477, 23586,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1343
//		OCT	27006		# MM 06		EBANK 4		PRIO 13
// PORT: Fixed ROM slots 6478.
    6478, 23564,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1344
//		OCT	41201		# MM 01		EBANK 5		PRIO 20
// PORT: Fixed ROM slots 6479.
    6479, 34050,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1345
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1346
//# Page 208
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1347
//# THE FOLLOWING LIST IS FOR THE PURPOSE OF VERIFYING THAT THE EBA
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1348
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1349
//		EBANK=	TIG		# EBANK SETTING REQUIRED BY MM 76
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1350
//		EBANK=	KT		# EBANK SETTING REQUIRED BY MM 75
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1351
//		EBANK=	SUBEXIT		# EBANK SETTING REQUIRED BY MM 74
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1352
//		EBANK=	SUBEXIT		# EBANK SETTING REQUIRED BY MM 73
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1353
//		EBANK=	SUBEXIT		# EBANK SETTING REQUIRED BY MM 72
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1354
//		EBANK=	AOG		# EBANK SETTING REQUIRED BY MM 62
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1355
//		EBANK=	AOG		# EBANK SETTING REQUIRED BY MM 61
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1356
//		EBANK=	BESTI		# EBANK SETTING REQUIRED BY MM 54
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1357
//		EBANK=	STARIND		# EBANK SETTING REQUIRED BY MM 53
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1358
//		EBANK=	BESTI		# EBANK SETTING REQUIRED BY MM 52
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1359
//		EBANK=	STARIND		# EBANK SETTING REQUIRED BY MM 51
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1360
//		EBANK=	P40TMP		# EBANK SETTING REQUIRED BY MM 47
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1361
//		EBANK=	DAPDATR1	# EBANK SETTING REQUIRED BY MM 41
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1362
//		EBANK=	KMPAC		# EBANK SETTING REQUIRED BY MM 40
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1363
//		EBANK=	KT		# EBANK SETTING REQUIRED BY MM 35
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1364
//		EBANK=	SUBEXIT		# EBANK SETTING REQUIRED BY MM 34
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1365
//		EBANK=	SUBEXIT		# EBANK SETTING REQUIRED BY MM 33
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1366
//		EBANK=	SUBEXIT		# EBANK SETTING REQUIRED BY MM 32
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1367
//		EBANK=	+MGA		# EBANK SETTING REQUIRED BY MM 30
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1368
//		EBANK=	LANDMARK	# EBANK SETTING REQUIRED BY MM 23
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1369
//		EBANK=	MARKINDX	# EBANK SETTING REQUIRED BY MM 22
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1370
//		EBANK=	WHOCARES	# EBANK SETTING REQUIRED BY MM 21
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1371
//		EBANK=	ESTROKER	# EBANK SETTING REQUIRED BY MM 20
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1372
//		EBANK=	TIME2SAV	# EBANK SETTING REQUIRED BY MM 06
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1373
//		EBANK=	QPLACE		# EBANK SETTING REQUIRED BY MM 01
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1374
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1375
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1376
//# NOTE,		THE FOLLOWING CONSTANT IS THE NUMBER OF ENTRIES IN EACH OF
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1377
//# ----		THE ABOVE LISTS-1(IE, THE NUMBER OF MAJOR MODES(EXCEPT P00)
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1378
//#		THAT CAN BE CALLED FROM THE KEYBOARD MINUS ONE)
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1379
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1380
//EPREMM1		EQUALS			# END OF PREMM1 TABLE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1381
//		SETLOC	PREMM1		# THIS CODING WILL AUTOMATICALLY CHANGE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1382
//NO.MMS		=MINUS	EPREMM1		# THE "NOV37MM" CONSTANT AS ENTRIES ARE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1383
//		SETLOC	VERB37		# INSERTED(IN) OR DELETED(FROM) THE
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1384
//		BANK			# "PREMM1" TABLE.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1385
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1386
//NOV37MM		ADRES	NO.MMS	-1	# ITEMS IN "PREMM1"TABLE - 1.  *DON'T MOVE*
// PORT: Fixed ROM slots 6480.
    6480, 64
)).

agcAotInstallSourceRope(list(
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1387
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1388
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1389
//DNLADMM1	EQUALS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1390
//		ADRES	RENDEZVU	# P79
// PORT: Fixed ROM slots 6481.
    6481, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1391
//		ADRES	RENDEZVU	# P78
// PORT: Fixed ROM slots 6482.
    6482, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1392
//		ADRES	RENDEZVU	# P77
// PORT: Fixed ROM slots 6483.
    6483, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1393
//		ADRES	RENDEZVU	# P76
// PORT: Fixed ROM slots 6484.
    6484, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1394
//		ADRES	RENDEZVU	# P75
// PORT: Fixed ROM slots 6485.
    6485, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1395
//		ADRES	RENDEZVU	# P74
// PORT: Fixed ROM slots 6486.
    6486, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1396
//		ADRES	RENDEZVU	# P73
// PORT: Fixed ROM slots 6487.
    6487, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1397
//# Page 209
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1398
//		ADRES	RENDEZVU	# P72
// PORT: Fixed ROM slots 6488.
    6488, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1399
//		ADRES	ENTRYUPD	# P62
// PORT: Fixed ROM slots 6489.
    6489, 2,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1400
//		ADRES	POWERED		# P61
// PORT: Fixed ROM slots 6490.
    6490, 6,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1401
//		ADRES	COSTALIN
// PORT: Fixed ROM slots 6491.
    6491, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1402
//		ADRES	COSTALIN
// PORT: Fixed ROM slots 6492.
    6492, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1403
//		ADRES	COSTALIN	# P52
// PORT: Fixed ROM slots 6493.
    6493, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1404
//		ADRES	COSTALIN	# P51
// PORT: Fixed ROM slots 6494.
    6494, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1405
//		ADRES	POWERED		# P47
// PORT: Fixed ROM slots 6495.
    6495, 6,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1406
//		ADRES	POWERED		# P41
// PORT: Fixed ROM slots 6496.
    6496, 6,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1407
//		ADRES	POWERED		# P40
// PORT: Fixed ROM slots 6497.
    6497, 6,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1408
//		ADRES	RENDEZVU	# P39
// PORT: Fixed ROM slots 6498.
    6498, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1409
//		ADRES	RENDEZVU	# P38
// PORT: Fixed ROM slots 6499.
    6499, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1410
//		ADRES	RENDEZVU	# P37
// PORT: Fixed ROM slots 6500.
    6500, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1411
//		ADRES	RENDEZVU	# P35
// PORT: Fixed ROM slots 6501.
    6501, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1412
//		ADRES	RENDEZVU	# P34
// PORT: Fixed ROM slots 6502.
    6502, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1413
//		ADRES	RENDEZVU	# P33
// PORT: Fixed ROM slots 6503.
    6503, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1414
//		ADRES	RENDEZVU	# P32
// PORT: Fixed ROM slots 6504.
    6504, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1415
//		ADRES	RENDEZVU
// PORT: Fixed ROM slots 6505.
    6505, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1416
//		ADRES	RENDEZVU	# P30
// PORT: Fixed ROM slots 6506.
    6506, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1417
//		ADRES	RENDEZVU	# P23
// PORT: Fixed ROM slots 6507.
    6507, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1418
//		ADRES	P22DNLST	# P22
// PORT: Fixed ROM slots 6508.
    6508, 8,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1419
//		ADRES	RENDEZVU	# P21
// PORT: Fixed ROM slots 6509.
    6509, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1420
//		ADRES	RENDEZVU	# P20
// PORT: Fixed ROM slots 6510.
    6510, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1421
//		ADRES	RENDEZVU	# P17
// PORT: Fixed ROM slots 6511.
    6511, 4,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1422
//		ADRES	COSTALIN	# P06
// PORT: Fixed ROM slots 6512.
    6512, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1423
//		ADRES	COSTALIN	# P01
// PORT: Fixed ROM slots 6513.
    6513, 0,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1424
//DNLADP00	=	ZERO
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1425
//COSTALIN	=	0
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1426
//ENTRYUPD	=	1
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1427
//RENDEZVU	=	2
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1428
//POWERED		=	3
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1429
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1430
//P22DNLST	=	4
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1431
//# ORBITAL INTEGRATION CONSTANTS
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1432
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1433
//# THESE CONSTANTS ARE USED IN COMPUTING THE SETTING OF MIDFLAG.
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1434
//RMM		2DEC	2538.09 E3 B-27	# 800 KM ABOVE LUNAR SURFACE
// PORT: Fixed ROM slots 6514 6515.
    6514, 618, 6515, 27048,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1435
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1436
//RME		2DEC	7178165 B-29	# 800 KM ABOVE EQ. RADIUS
// PORT: Fixed ROM slots 6516 6517.
    6516, 438, 6517, 1974,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1437
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1438
//		BANK	13
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1439
//		SETLOC	INTINIT
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1440
//		BANK
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1441
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1442
//		COUNT*	$$/INTIN
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1443
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1444
//		EBANK=	RRECTCSM
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1445
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1446
//STATEUP		SET	BOF		# EXTRAPOLATE CM STATE VECTOR
// PORT: Fixed ROM slots 13312.
    13312, 35864,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1447
//			VINTFLAG
// PORT: Fixed ROM slots 13313.
    13313, 1656,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1448
//# Page 210
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1449
//			ORBWFLAG	# ALSO 6X6 W-MATRIX IF VALID
// PORT: Fixed ROM slots 13314.
    13314, 2002,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1450
//			+3		# 	FOR ORBITAL NAVIGATION
// PORT: Fixed ROM slots 13315.
    13315, 22540,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1451
//		SET
// PORT: Fixed ROM slots 13316.
    13316, 65304,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1452
//			DIM0FLAG
// PORT: Fixed ROM slots 13317.
    13317, 1660,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1453
//		CLEAR	CALL
// PORT: Fixed ROM slots 13318.
    13318, 37912,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1454
//			PRECIFLG
// PORT: Fixed ROM slots 13319.
    13319, 1902,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1455
//			INTEGRV
// PORT: Fixed ROM slots 13320.
    13320, 23780,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1456
//		BON	DLOAD
// PORT: Fixed ROM slots 13321.
    13321, 58648,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1457
//			SURFFLAG
// PORT: Fixed ROM slots 13322.
    13322, 4494,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1458
//			STATEND
// PORT: Fixed ROM slots 13323.
    13323, 22578,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1459
//			TETCSM
// PORT: Fixed ROM slots 13324.
    13324, 1778,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1460
//		STCALL	TDEC1
// PORT: Fixed ROM slots 13325.
    13325, 28738,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1461
//			INTSTALL
// PORT: Fixed ROM slots 13326.
    13326, 24132,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1462
//		CLEAR	CALL		# EXTRAPOLATE LM STATE VECTOR
// PORT: Fixed ROM slots 13327.
    13327, 37912,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1463
//			VINTFLAG
// PORT: Fixed ROM slots 13328.
    13328, 1912,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1464
//			SETIFLGS	# 	AND 6X6 W-MATRIX IF VALID
// PORT: Fixed ROM slots 13329.
    13329, 23408,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1465
//		BOF	SET
// PORT: Fixed ROM slots 13330.
    13330, 35864,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1466
//			RENDWFLG	#	FOR RENDEZVOUS NAVIGATION
// PORT: Fixed ROM slots 13331.
    13331, 3036,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1467
//			+2
// PORT: Fixed ROM slots 13332.
    13332, 22572,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1468
//			DIM0FLAG
// PORT: Fixed ROM slots 13333.
    13333, 1660,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1469
//		SET	CALL
// PORT: Fixed ROM slots 13334.
    13334, 37912,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1470
//			PRECIFLG
// PORT: Fixed ROM slots 13335.
    13335, 1646,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1471
//			INTEGRV
// PORT: Fixed ROM slots 13336.
    13336, 23780,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1472
//STATEND		CLRGO
// PORT: Fixed ROM slots 13337.
    13337, 65304,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1473
//			NODOFLAG
// PORT: Fixed ROM slots 13338.
    13338, 1340,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1474
//			ENDINT
// PORT: Fixed ROM slots 13339.
    13339, 23388,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1475
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1476
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1477
//# THISVINT IS CALLED BY MIDTOAV1 AND2
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1478
//
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1479
//THISVINT	SET	RVQ
// PORT: Fixed ROM slots 13340.
    13340, 36376,
// PORT: SOURCE FRESH_START_AND_RESTART.agc:1480
//			VINTFLAG
// PORT: Fixed ROM slots 13341.
    13341, 1656
)).

