// PORT: Original source unit P11.agc.
// PORT: Physical bank 34. Shared continuation entries, slots 30722–30752.
function agcAotUnit1742 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30736 {
        if slot <= 30728 {
            if slot <= 30724 {
                if slot <= 30722 {
// PORT: SOURCE P11.agc:1
//# Copyright:    Public domain.
// PORT: SOURCE P11.agc:2
//# Filename:     P11.agc
// PORT: SOURCE P11.agc:3
//# Purpose:      Part of the source code for Colossus 2A, AKA Comanche 055.
// PORT: SOURCE P11.agc:4
//#               It is part of the source code for the Command Module's (CM)
// PORT: SOURCE P11.agc:5
//#               Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE P11.agc:6
//# Assembler:    yaYUL
// PORT: SOURCE P11.agc:7
//# Contact:      Hartmuth Gutsche <hgutsche@xplornet.com>.
// PORT: SOURCE P11.agc:8
//# Website:      www.ibiblio.org/apollo.
// PORT: SOURCE P11.agc:9
//# Pages:	533-550
// PORT: SOURCE P11.agc:10
//# Mod history:  2009-05-13 HG   Started adapting from the Colossus249/ file
// PORT: SOURCE P11.agc:11
//#                		of the same name, using Comanche055 page
// PORT: SOURCE P11.agc:12
//#                		images 0533.jpg - 0550.jpg.
// PORT: SOURCE P11.agc:13
//#		2009-05-20 RSB	Corrections: ERTHALT -> EARTHALT,
// PORT: SOURCE P11.agc:14
//#				STATSW -> SATSW.
// PORT: SOURCE P11.agc:15
//#		2009-05-23 RSB	At end of RESCALES, corrected TC 0 to TC Q.
// PORT: SOURCE P11.agc:16
//#				Added an SBANK= prior to a 2CADR.
// PORT: SOURCE P11.agc:17
//#		2010-08-24 JL	Fixed page numbers. Added missing comment character on p537.
// PORT: SOURCE P11.agc:18
//#
// PORT: SOURCE P11.agc:19
//# This source code has been transcribed or otherwise adapted from digitized
// PORT: SOURCE P11.agc:20
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// PORT: SOURCE P11.agc:21
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// PORT: SOURCE P11.agc:22
//# thanks to both.  The images (with suitable reduction in storage size and
// PORT: SOURCE P11.agc:23
//# consequent reduction in image quality as well) are available online at
// PORT: SOURCE P11.agc:24
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// PORT: SOURCE P11.agc:25
//# illegible, contact me at info@sandroid.org about getting access to the
// PORT: SOURCE P11.agc:26
//# (much) higher-quality images which Paul actually created.
// PORT: SOURCE P11.agc:27
//#
// PORT: SOURCE P11.agc:28
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE P11.agc:29
//#
// PORT: SOURCE P11.agc:30
//#    Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE P11.agc:31
//#    2021113-051.  10:28 APR. 1, 1969
// PORT: SOURCE P11.agc:32
//#
// PORT: SOURCE P11.agc:33
//#    This AGC program shall also be referred to as
// PORT: SOURCE P11.agc:34
//#            Colossus 2A
// PORT: SOURCE P11.agc:35
//# Page 533
// PORT: SOURCE P11.agc:36
//# EARTH ORBIT INSERTION MONITOR PROGRAM
// PORT: SOURCE P11.agc:37
//# *************************************
// PORT: SOURCE P11.agc:38
//
// PORT: SOURCE P11.agc:39
//# PROGRAM DESCRIPTION -P11-
// PORT: SOURCE P11.agc:40
//
// PORT: SOURCE P11.agc:41
//#	MOD NO. 1
// PORT: SOURCE P11.agc:42
//#	MOD BY ELIASSEN
// PORT: SOURCE P11.agc:43
//
// PORT: SOURCE P11.agc:44
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE P11.agc:45
//
// PORT: SOURCE P11.agc:46
//#	P11 IS INITIATED BY
// PORT: SOURCE P11.agc:47
//
// PORT: SOURCE P11.agc:48
//#		A) GYROCOMPASS PRG P02 WHEN LIFTOFF DISCRETE IS RECEIVED OR
// PORT: SOURCE P11.agc:49
//#		B) BACKUP THRU VERB 75 ENTER
// PORT: SOURCE P11.agc:50
//
// PORT: SOURCE P11.agc:51
//#	PROGRAM WILL
// PORT: SOURCE P11.agc:52
//#		1. ZERO CMC CLOCK AT LIFTOFF (OR UPON RECEIPT OF BACKUP)
// PORT: SOURCE P11.agc:53
//#		2. UPDATE TEPHEM TO TIME CMC CLOCK WAS ZEROED
// PORT: SOURCE P11.agc:54
//#		3. INITIATE SERVICER AT PREREAD1
// PORT: SOURCE P11.agc:55
//#		4. CHANGE MAJOR MODE TO 11
// PORT: SOURCE P11.agc:56
//#		5. CLEAR DSKY IN CASE OF V 75
// PORT: SOURCE P11.agc:57
//#		6. STORE LIFTOFF IMU-CDU ANGLES FOR ATT. ERROR DISPLAY
// PORT: SOURCE P11.agc:58
//#		7. TERMINATE GYROCOMPASSING	-  -
// PORT: SOURCE P11.agc:59
//#		8. COMPUTE INITIAL VECTORS	RN, VN            -  -  -
// PORT: SOURCE P11.agc:60
//#		9. COMPUTE REFSMMAT FOR PRELAUNCH ALIGNMENT WHERE U ,U ,U ARE
// PORT: SOURCE P11.agc:61
//#			-         -                                X  Y  Z
// PORT: SOURCE P11.agc:62
//#			U =(UNIT(-R) LOCAL VERTICAL AT TIME OF LIFTOFF
// PORT: SOURCE P11.agc:63
//#			Z
// PORT: SOURCE P11.agc:64
//#			-	-   -
// PORT: SOURCE P11.agc:65
//#			U =UNIT(A), A=HOR VECTOR AT LAUNCH AZIMUTH
// PORT: SOURCE P11.agc:66
//#			X
// PORT: SOURCE P11.agc:67
//#			-  -   -
// PORT: SOURCE P11.agc:68
//#			U =U * U
// PORT: SOURCE P11.agc:69
//#			 U  Z   X
// PORT: SOURCE P11.agc:70
//
// PORT: SOURCE P11.agc:71
//#		10. SET REFSMMAT KNOWN FLAG
// PORT: SOURCE P11.agc:72
//#		11. SET AVGEXIT IN SERVICER TO VHHDOT TO
// PORT: SOURCE P11.agc:73
//#		    COMPUTE AND DISPLAY NOUN 62 EVERY 2 SECONDS
// PORT: SOURCE P11.agc:74
//
// PORT: SOURCE P11.agc:75
//#		    R1	V1  - INERTIAL VELOCITY MAGNITUDE IN FPS
// PORT: SOURCE P11.agc:76
//#		    R2	HDOT - RATE OF CHANGE OF VEHICLE VEL IN FPS
// PORT: SOURCE P11.agc:77
//#		    R3	H    - VEHICLE ALTITUDE ABOVE PAD IN NM
// PORT: SOURCE P11.agc:78
//
// PORT: SOURCE P11.agc:79
//#		12. DISPLAY BODY AXES ATT. ERRORS ON FDAI NEEDLES
// PORT: SOURCE P11.agc:80
//#
// PORT: SOURCE P11.agc:81
//#		    A) FROM L.O. TO RPSTART (APPROX. 0 TO +10SECS AFTER L.O.)
// PORT: SOURCE P11.agc:82
//#		       DESIRED ATTITUDE IS AS STORED AT L.O.
// PORT: SOURCE P11.agc:83
//#		    B) FROM RPSTART TO POLYSTOP(APPROX.+10 TO +133SECS AFTER LO)
// PORT: SOURCE P11.agc:84
//#		       DESIRED ATTITUDE IS SPECIFIED BY CMC PITCH AND ROLL
// PORT: SOURCE P11.agc:85
//#		       POLYNOMIALS DURING SATURN ROLLOUT AND PITCHOVER
// PORT: SOURCE P11.agc:86
//# Page 534
// PORT: SOURCE P11.agc:87
//#			THE DISPLAY IS RUN AS LOW PRIORITY JOB APPROX.
// PORT: SOURCE P11.agc:88
//#			EVERY 1/2 SEC OR LESS AND IS DISABLED UPON OVFLO OF TIME1
// PORT: SOURCE P11.agc:89
//
// PORT: SOURCE P11.agc:90
//# SUBROUTINES CALLED
// PORT: SOURCE P11.agc:91
//
// PORT: SOURCE P11.agc:92
//#		2PHSCHNG	BANKCALL	CALCGRA		CDUTRIG		CLEANDSP	DANZIG
// PORT: SOURCE P11.agc:93
//#		DELAYJOB	EARTHR		ENDOFJOB	FINDVAC		IBNKCALL
// PORT: SOURCE P11.agc:94
//#		INTPRET		LALOTORV	NEEDLER		NEWMODEX	PHASCHNG
// PORT: SOURCE P11.agc:95
//#		POSTJUMP	POWRSERS	PREREAD1	REGODSPR	S11.1
// PORT: SOURCE P11.agc:96
//#		SERVEXIT	TASKOVER	TCDANZIG	V1STO2S		WAITLIST
// PORT: SOURCE P11.agc:97
//
// PORT: SOURCE P11.agc:98
//# ASTRONAUT REQUESTS (IF ALTITUDE ABOVE 300,000 FT)
// PORT: SOURCE P11.agc:99
//#
// PORT: SOURCE P11.agc:100
//#	DSKY -
// PORT: SOURCE P11.agc:101
//#	     MONITOR DISPLAY OF TIME TO PERIGEE R1 HOURS
// PORT: SOURCE P11.agc:102
//#						R2 MINUTES
// PORT: SOURCE P11.agc:103
//
// PORT: SOURCE P11.agc:104
//#	DSKY -
// PORT: SOURCE P11.agc:105
//#	     MONITOR DISPLAY OF R1 APOGEE ALTITUDE IN NAUTICAL MILES
// PORT: SOURCE P11.agc:106
//#				R2 PERIGEE ALTITUDE IN NAUTICAL MILES
// PORT: SOURCE P11.agc:107
//#				R3 TFF IN MINUTES/SECS
// PORT: SOURCE P11.agc:108
//
// PORT: SOURCE P11.agc:109
//#	IF ASTRONAUT HAS REQUESTED ANY OF THESE DISPLAYS HE MUST
// PORT: SOURCE P11.agc:110
//# HIT PROCEED TO RETURN TO NORMAL NOUN 62 DISPLAY.
// PORT: SOURCE P11.agc:111
//# NORMAL EXIT MODE
// PORT: SOURCE P11.agc:112
//
// PORT: SOURCE P11.agc:113
//#	ASTRONAUT	VERB 37 ENTER 00 ENTER
// PORT: SOURCE P11.agc:114
//
// PORT: SOURCE P11.agc:115
//# ALARM MODES - NONE
// PORT: SOURCE P11.agc:116
//
// PORT: SOURCE P11.agc:117
//# ABORT EXIT MODES -
// PORT: SOURCE P11.agc:118
//
// PORT: SOURCE P11.agc:119
//# OUTPUT
// PORT: SOURCE P11.agc:120
//
// PORT: SOURCE P11.agc:121
//#	TLIFTOFF (DP)	TEPHEM (TP)
// PORT: SOURCE P11.agc:122
//#	REFSMMAT
// PORT: SOURCE P11.agc:123
//#	DSKY DISPLAY
// PORT: SOURCE P11.agc:124
//#	FDAI DISPLAY
// PORT: SOURCE P11.agc:125
//
// PORT: SOURCE P11.agc:126
//# ERASABLE INITIALIZATION
// PORT: SOURCE P11.agc:127
//
// PORT: SOURCE P11.agc:128
//#	AZO, AXO, -AYO
// PORT: SOURCE P11.agc:129
//#	LATITUDE
// PORT: SOURCE P11.agc:130
//#	PADLONG
// PORT: SOURCE P11.agc:131
//#	TEPHEM
// PORT: SOURCE P11.agc:132
//#	PGNCSALT
// PORT: SOURCE P11.agc:133
//#	POLYNUM THRU POLYNUM +14D)
// PORT: SOURCE P11.agc:134
//#	RPSTART
// PORT: SOURCE P11.agc:135
//#	POLYSTOP
// PORT: SOURCE P11.agc:136
//# FLAGS SET OR RESET
// PORT: SOURCE P11.agc:137
//# Page 535
// PORT: SOURCE P11.agc:138
//#	SET REFSMFLG
// PORT: SOURCE P11.agc:139
//#	SET DVMON IDLE FLAG
// PORT: SOURCE P11.agc:140
//#	CLEAR ERADFLAG
// PORT: SOURCE P11.agc:141
//
// PORT: SOURCE P11.agc:142
//# DEBRIS
// PORT: SOURCE P11.agc:143
//
// PORT: SOURCE P11.agc:144
//#	LIFTTEMP
// PORT: SOURCE P11.agc:145
//#	POLYNUM THRU POLYNUM +7
// PORT: SOURCE P11.agc:146
//#	SPOLYARG
// PORT: SOURCE P11.agc:147
//#	BODY1, BODY2, BODY3
// PORT: SOURCE P11.agc:148
//#	VMAG2, ALTI, HDOT
// PORT: SOURCE P11.agc:149
//#	CENTRALS, CORE SET AND VAC AREAS
// PORT: SOURCE P11.agc:150
//		COUNT	34/P11
// PORT: SOURCE P11.agc:151
//
// PORT: SOURCE P11.agc:152
//BITS5-6		=	SUPER011
// PORT: SOURCE P11.agc:153
//		BANK	42
// PORT: SOURCE P11.agc:154
//		SETLOC	P11ONE
// PORT: SOURCE P11.agc:155
//		BANK
// PORT: SOURCE P11.agc:156
//
// PORT: SOURCE P11.agc:157
//		EBANK=	TEPHEM
// PORT: SOURCE P11.agc:158
//P11		CA	EBANK3
// PORT: Fixed ROM slots 30722.
                    if slot <> 30722 or instruction <> 14889 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2601), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30723 {
// PORT: SOURCE P11.agc:159
//		TS	EBANK
// PORT: Fixed ROM slots 30723.
                        if slot <> 30723 or instruction <> 22531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22531, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:160
//
// PORT: SOURCE P11.agc:161
//		EXTEND
// PORT: Fixed ROM slots 30724.
                        if slot <> 30724 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 30726 {
                    if slot <= 30725 {
// PORT: SOURCE P11.agc:162
//		DCA	REP11S		# DIRECT RESTARTS TO REP11
// PORT: Fixed ROM slots 30725.
                        if slot <> 30725 or instruction <> 13503 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 1215, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:163
//		DXCH	-PHASE3
// PORT: Fixed ROM slots 30726.
                        if slot <> 30726 or instruction <> 21999 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 495, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30727 {
// PORT: SOURCE P11.agc:164
//		CS	ZERO
// PORT: Fixed ROM slots 30727.
                        if slot <> 30727 or instruction <> 18961 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:165
//		ZL
// PORT: Fixed ROM slots 30728.
                        if slot <> 30728 or instruction <> 9223 { return choose false if checkOnly else -1. }
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
            if slot <= 30732 {
                if slot <= 30730 {
                    if slot <= 30729 {
// PORT: SOURCE P11.agc:166
//		TS	LIFTTEMP
// PORT: Fixed ROM slots 30729.
                        if slot <> 30729 or instruction <> 23221 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23221, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:167
//		DXCH	-PHASE5		# INACTIVE GROUP 5, PRELAUNCH PROTECTION
// PORT: Fixed ROM slots 30730.
                        if slot <> 30730 or instruction <> 22003 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 499, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30731 {
// PORT: SOURCE P11.agc:168
//P11+7		EXTEND
// PORT: Fixed ROM slots 30731.
                        if slot <> 30731 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:169
//		DCA	REP11SA
// PORT: Fixed ROM slots 30732.
                        if slot <> 30732 or instruction <> 13505 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 1217, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 30734 {
                    if slot <= 30733 {
// PORT: SOURCE P11.agc:170
//		DXCH	TLIFTOFF
// PORT: Fixed ROM slots 30733.
                        if slot <> 30733 or instruction <> 22239 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 735, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:171
//
// PORT: SOURCE P11.agc:172
//		EXTEND
// PORT: Fixed ROM slots 30734.
                        if slot <> 30734 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30735 {
// PORT: SOURCE P11.agc:173
//		DCA	TIME2
// PORT: Fixed ROM slots 30735.
                        if slot <> 30735 or instruction <> 12309 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:174
//		DXCH	LIFTTEMP	# FOR RESTARTS
// PORT: Fixed ROM slots 30736.
                        if slot <> 30736 or instruction <> 22198 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 694, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 30744 {
            if slot <= 30740 {
                if slot <= 30738 {
                    if slot <= 30737 {
// PORT: SOURCE P11.agc:175
//
// PORT: SOURCE P11.agc:176
//		CA	ZERO
// PORT: Fixed ROM slots 30737.
                        if slot <> 30737 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:177
//		ZL
// PORT: Fixed ROM slots 30738.
                        if slot <> 30738 or instruction <> 9223 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 7, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30739 {
// PORT: SOURCE P11.agc:178
//		DXCH	TIME2
// PORT: Fixed ROM slots 30739.
                        if slot <> 30739 or instruction <> 21525 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 21, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:179
//REP11A-2	DXCH	TLIFTOFF
// PORT: Fixed ROM slots 30740.
                        if slot <> 30740 or instruction <> 22239 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 735, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 30742 {
                    if slot <= 30741 {
// PORT: SOURCE P11.agc:180
//REP11A-1	DXCH	-PHASE3		# RESET PHASE
// PORT: Fixed ROM slots 30741.
                        if slot <> 30741 or instruction <> 21999 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 495, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:181
//
// PORT: SOURCE P11.agc:182
//
// PORT: SOURCE P11.agc:183
//REP11A		INHINT
// PORT: Fixed ROM slots 30742.
                        if slot <> 30742 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30743 {
// PORT: SOURCE P11.agc:184
//		EXTEND
// PORT: Fixed ROM slots 30743.
                        if slot <> 30743 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:185
//		DCA	TEPHEM	+1
// PORT: Fixed ROM slots 30744.
                        if slot <> 30744 or instruction <> 13256 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 968, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 30748 {
                if slot <= 30746 {
                    if slot <= 30745 {
// PORT: SOURCE P11.agc:186
//		DXCH	TEPHEM1	+1
// PORT: Fixed ROM slots 30745.
                        if slot <> 30745 or instruction <> 22201 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 697, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:187
//		CA	TEPHEM
// PORT: Fixed ROM slots 30746.
                        if slot <> 30746 or instruction <> 13254 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 966).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30747 {
// PORT: SOURCE P11.agc:188
//# Page 536
// PORT: SOURCE P11.agc:189
//		XCH	TEPHEM1
// PORT: Fixed ROM slots 30747.
                        if slot <> 30747 or instruction <> 24247 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 695, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:190
//
// PORT: SOURCE P11.agc:191
//		EXTEND
// PORT: Fixed ROM slots 30748.
                        if slot <> 30748 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 30750 {
                    if slot <= 30749 {
// PORT: SOURCE P11.agc:192
//		DCA	TLIFTOFF
// PORT: Fixed ROM slots 30749.
                        if slot <> 30749 or instruction <> 13023 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 735, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:193
//		DAS	TEPHEM1	+1
// PORT: Fixed ROM slots 30750.
                        if slot <> 30750 or instruction <> 8889 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 697) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30751 {
// PORT: SOURCE P11.agc:194
//		ADS	TEPHEM1		# CORRECTFOR OVERFLOW
// PORT: Fixed ROM slots 30751.
                        if slot <> 30751 or instruction <> 11959 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 695).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:195
//
// PORT: SOURCE P11.agc:196
//		TC	PHASCHNG
// PORT: Fixed ROM slots 30752.
                        if slot <> 30752 or instruction <> 2826 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1742] to agcAotUnit1742@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:197
//		OCT	05023
// PORT: Fixed ROM slots 30753.
    30753, 5158,
// PORT: SOURCE P11.agc:198
//		OCT	22000
// PORT: Fixed ROM slots 30754.
    30754, 18432
)).

// PORT: Physical bank 34. Shared continuation entries, slots 30755–30763.
function agcAotUnit1743 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30758 {
        if slot <= 30756 {
            if slot <= 30755 {
// PORT: SOURCE P11.agc:199
//
// PORT: SOURCE P11.agc:200
//		INHINT
// PORT: Fixed ROM slots 30755.
                if slot <> 30755 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P11.agc:201
//		EXTEND
// PORT: Fixed ROM slots 30756.
                if slot <> 30756 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30757 {
// PORT: SOURCE P11.agc:202
//		DCA	TEPHEM1
// PORT: Fixed ROM slots 30757.
                if slot <> 30757 or instruction <> 12984 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 696, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P11.agc:203
//		DXCH	TEPHEM
// PORT: Fixed ROM slots 30758.
                if slot <> 30758 or instruction <> 22471 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 967, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 30760 {
            if slot <= 30759 {
// PORT: SOURCE P11.agc:204
//		CA	TEPHEM1	+2
// PORT: Fixed ROM slots 30759.
                if slot <> 30759 or instruction <> 12985 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 697).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P11.agc:205
//		XCH	TEPHEM	+2
// PORT: Fixed ROM slots 30760.
                if slot <> 30760 or instruction <> 24520 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 968, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30761 {
// PORT: SOURCE P11.agc:206
//
// PORT: SOURCE P11.agc:207
//		CAF	EBDVCNT
// PORT: Fixed ROM slots 30761.
                if slot <> 30761 or instruction <> 13312 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1024), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30762 {
// PORT: SOURCE P11.agc:208
//		TS	EBANK
// PORT: Fixed ROM slots 30762.
                    if slot <> 30762 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:209
//		EBANK=	DVCNTR
// PORT: SOURCE P11.agc:210
//		TC	IBNKCALL
// PORT: Fixed ROM slots 30763.
                    if slot <> 30763 or instruction <> 2528 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1743] to agcAotUnit1743@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:211
//		CADR	PREREAD1	# ZERO PIPS AND INITIALIZE AVERAGEG
// PORT: Fixed ROM slots 30764.
    30764, 64420
)).

// PORT: Physical bank 34. Shared continuation entries, slots 30765–30765.
function agcAotUnit1744 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P11.agc:212
//
// PORT: SOURCE P11.agc:213
//		TC	PHASCHNG
// PORT: Fixed ROM slots 30765.
    if slot <> 30765 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1744] to agcAotUnit1744@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:214
//		OCT	05023		# CONTINUE HERE ON RESTART
// PORT: Fixed ROM slots 30766.
    30766, 5158,
// PORT: SOURCE P11.agc:215
//		OCT	22000
// PORT: Fixed ROM slots 30767.
    30767, 18432
)).

// PORT: Physical bank 34. Shared continuation entries, slots 30768–30769.
function agcAotUnit1745 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30768 {
// PORT: SOURCE P11.agc:216
//
// PORT: SOURCE P11.agc:217
//		CAF	.5SEC		# START ATT ERROR DISPLAY
// PORT: Fixed ROM slots 30768.
        if slot <> 30768 or instruction <> 14878 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2590), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P11.agc:218
//		TC	WAITLIST	# IN .5 SEC
// PORT: Fixed ROM slots 30769.
        if slot <> 30769 or instruction <> 2725 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2725, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1745] to agcAotUnit1745@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:219
//		EBANK=	BODY3
// PORT: SOURCE P11.agc:220
//		2CADR	ATERTASK
// PORT: Fixed ROM slots 30770 30771.
    30770, 2464, 30771, 57452
)).

// PORT: Physical bank 34. Shared continuation entries, slots 30772–30772.
function agcAotUnit1746 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P11.agc:221
//
// PORT: SOURCE P11.agc:222
//		TC	NEWMODEX	# DISPLAY MM 11
// PORT: Fixed ROM slots 30772.
    if slot <> 30772 or instruction <> 2796 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2796, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1746] to agcAotUnit1746@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:223
//		MM	11
// PORT: Fixed ROM slots 30773.
    30773, 22
)).

// PORT: Physical bank 34. Shared continuation entries, slots 30774–30774.
function agcAotUnit1747 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P11.agc:224
//
// PORT: SOURCE P11.agc:225
//		TC	UPFLAG
// PORT: Fixed ROM slots 30774.
    if slot <> 30774 or instruction <> 2918 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2918, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1747] to agcAotUnit1747@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:226
//		ADRES   NODOP01
// PORT: Fixed ROM slots 30775.
    30775, 36
)).

// PORT: Physical bank 34. Shared continuation entries, slots 30776–30778.
function agcAotUnit1748 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30776 {
// PORT: SOURCE P11.agc:227
//
// PORT: SOURCE P11.agc:228
//		CA      POWDNCOD        # SWITCH TO POWERED FLIGHT DOWNLIST
// PORT: Fixed ROM slots 30776.
        if slot <> 30776 or instruction <> 15500 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 3212), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 30777 {
// PORT: SOURCE P11.agc:229
//		TS      DNLSTCOD
// PORT: Fixed ROM slots 30777.
            if slot <> 30777 or instruction <> 22746 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22746, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P11.agc:230
//
// PORT: SOURCE P11.agc:231
//		TC      BANKCALL
// PORT: Fixed ROM slots 30778.
            if slot <> 30778 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1748] to agcAotUnit1748@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:232
//		CADR	CLEANDSP	# CLEAR DSKY IN CASE OF V75
// PORT: Fixed ROM slots 30779.
    30779, 17286
)).

// PORT: Physical bank 34. Shared continuation entries, slots 30780–30780.
function agcAotUnit1749 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P11.agc:233
//
// PORT: SOURCE P11.agc:234
//		TC	2PHSCHNG
// PORT: Fixed ROM slots 30780.
    if slot <> 30780 or instruction <> 2810 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2810, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1749] to agcAotUnit1749@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:235
//		OCT	40514		# PROTECT ATERTASK
// PORT: Fixed ROM slots 30781.
    30781, 33432,
// PORT: SOURCE P11.agc:236
//		OCT	00073
// PORT: Fixed ROM slots 30782.
    30782, 118
)).

// PORT: Physical bank 34. Shared continuation entries, slots 30783–30787.
function agcAotUnit1750 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30784 {
        if slot <= 30783 {
// PORT: SOURCE P11.agc:237
//		CAF	EBQPLACE
// PORT: Fixed ROM slots 30783.
            if slot <> 30783 or instruction <> 13313 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1025), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P11.agc:238
//# Page 537
// PORT: SOURCE P11.agc:239
//		TS	EBANK
// PORT: Fixed ROM slots 30784.
            if slot <> 30784 or instruction <> 22531 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22531, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30785 {
// PORT: SOURCE P11.agc:240
//
// PORT: SOURCE P11.agc:241
//		EBANK=	QPLACES
// PORT: SOURCE P11.agc:242
//		CA	P11XIT		# SET EXIT FROM PROUT IN EARTHR
// PORT: Fixed ROM slots 30785.
            if slot <> 30785 or instruction <> 13506 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1218), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 30786 {
// PORT: SOURCE P11.agc:243
//		TS	QPLACES
// PORT: Fixed ROM slots 30786.
                if slot <> 30786 or instruction <> 23318 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23318, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P11.agc:244
//		TC      INTPRET
// PORT: Fixed ROM slots 30787.
                if slot <> 30787 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1750] to agcAotUnit1750@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:245
//		VLOAD	MXV
// PORT: Fixed ROM slots 30788.
    30788, 53754,
// PORT: SOURCE P11.agc:246
//			THETAN
// PORT: Fixed ROM slots 30789.
    30789, 2670,
// PORT: SOURCE P11.agc:247
//			XSM
// PORT: Fixed ROM slots 30790.
    30790, 2932,
// PORT: SOURCE P11.agc:248
//		VSL1	VAD
// PORT: Fixed ROM slots 30791.
    30791, 44532,
// PORT: SOURCE P11.agc:249
//			ERCOMP
// PORT: Fixed ROM slots 30792.
    30792, 2896,
// PORT: SOURCE P11.agc:250
//		STODL	ERCOMP
// PORT: Fixed ROM slots 30793.
    30793, 15184,
// PORT: SOURCE P11.agc:251
//			TLIFTOFF
// PORT: Fixed ROM slots 30794.
    30794, 1470,
// PORT: SOURCE P11.agc:252
//		SSP	GOTO
// PORT: Fixed ROM slots 30795.
    30795, 43186,
// PORT: SOURCE P11.agc:253
//			S2
// PORT: Fixed ROM slots 30796.
    30796, 84,
// PORT: SOURCE P11.agc:254
//		CADR	PROUT		# RETURN FROM EARTHR
// PORT: Fixed ROM slots 30797.
    30797, 55848,
// PORT: SOURCE P11.agc:255
//			EARTHR	+3
// PORT: Fixed ROM slots 30798.
    30798, 55798
)).

// PORT: Physical bank 34. Shared continuation entries, slots 30799–30808.
function agcAotUnit1751 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30803 {
        if slot <= 30800 {
            if slot <= 30799 {
// PORT: SOURCE P11.agc:256
//MATRXJOB	ZL	                # STORE DP GIMBAL ANGLES FOR ATTITUDE
// PORT: Fixed ROM slots 30799.
                if slot <> 30799 or instruction <> 9223 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 7, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P11.agc:257
//		CA      CDUX            #       ERROR DISPLAY AFTER LIFTOFF
// PORT: Fixed ROM slots 30800.
                if slot <> 30800 or instruction <> 12314 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 26).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30801 {
// PORT: SOURCE P11.agc:258
//		DXCH    OGC
// PORT: Fixed ROM slots 30801.
                if slot <> 30801 or instruction <> 22512 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 1008, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30802 {
// PORT: SOURCE P11.agc:259
//		ZL
// PORT: Fixed ROM slots 30802.
                    if slot <> 30802 or instruction <> 9223 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 7, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:260
//		CA      CDUY
// PORT: Fixed ROM slots 30803.
                    if slot <> 30803 or instruction <> 12315 { return choose false if checkOnly else -1. }
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
        if slot <= 30805 {
            if slot <= 30804 {
// PORT: SOURCE P11.agc:261
//		DXCH    IGC
// PORT: Fixed ROM slots 30804.
                if slot <> 30804 or instruction <> 22514 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 1010, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P11.agc:262
//		ZL
// PORT: Fixed ROM slots 30805.
                if slot <> 30805 or instruction <> 9223 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 7, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30806 {
// PORT: SOURCE P11.agc:263
//		CA      CDUZ
// PORT: Fixed ROM slots 30806.
                if slot <> 30806 or instruction <> 12316 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 28).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30807 {
// PORT: SOURCE P11.agc:264
//		DXCH    MGC
// PORT: Fixed ROM slots 30807.
                    if slot <> 30807 or instruction <> 22516 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 1012, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:265
//                TC      INTPRET         #       -
// PORT: Fixed ROM slots 30808.
                    if slot <> 30808 or instruction <> 3078 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3078, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1751] to agcAotUnit1751@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:266
//		VLOAD   VSR1            # SCALE OGC B-1
// PORT: Fixed ROM slots 30809.
    30809, 62202,
// PORT: SOURCE P11.agc:267
//			OGC
// PORT: Fixed ROM slots 30810.
    30810, 3040,
// PORT: SOURCE P11.agc:268
//		STORE   OGC
// PORT: Fixed ROM slots 30811.
    30811, 3040,
// PORT: SOURCE P11.agc:269
//		SSP			# ZERO RTX2
// PORT: Fixed ROM slots 30812.
    30812, 65458,
// PORT: SOURCE P11.agc:270
//			RTX2		# FOR
// PORT: Fixed ROM slots 30813.
    30813, 4046,
// PORT: SOURCE P11.agc:271
//			0		# EARTH
// PORT: Fixed ROM slots 30814.
    30814, 0,
// PORT: SOURCE P11.agc:272
//		DLOAD	PDDL
// PORT: Fixed ROM slots 30815.
    30815, 54730,
// PORT: SOURCE P11.agc:273
//			PGNCSALT	# ALTITUDE OF PGNCS
// PORT: Fixed ROM slots 30816.
    30816, 1398,
// PORT: SOURCE P11.agc:274
//			PADLONG		# LONGITUDE
// PORT: Fixed ROM slots 30817.
    30817, 1384,
// PORT: SOURCE P11.agc:275
//		PDDL	VDEF
// PORT: Fixed ROM slots 30818.
    30818, 46762,
// PORT: SOURCE P11.agc:276
//			LATITUDE	# GEODETIC LATITUDE
// PORT: Fixed ROM slots 30819.
    30819, 2566,
// PORT: SOURCE P11.agc:277
//		STODL	LAT		# LAT,LONG,ALT ARE CONSECUTIVE
// PORT: Fixed ROM slots 30820.
    30820, 13448,
// PORT: SOURCE P11.agc:278
//			HI6ZEROS	# TIME = 0
// PORT: Fixed ROM slots 30821.
    30821, 13754,
// PORT: SOURCE P11.agc:279
//		CLEAR	CALL
// PORT: Fixed ROM slots 30822.
    30822, 37912,
// PORT: SOURCE P11.agc:280
//			ERADFLAG
// PORT: Fixed ROM slots 30823.
    30823, 868,
// PORT: SOURCE P11.agc:281
//			LALOTORV	# CONVERT TO POSITION VECTOR IN REF.COORDS
// PORT: Fixed ROM slots 30824.
    30824, 23106,
// PORT: SOURCE P11.agc:282
//
// PORT: SOURCE P11.agc:283
//		STCALL	RN1             #              -
// PORT: Fixed ROM slots 30825.
    30825, 30004,
// PORT: SOURCE P11.agc:284
//			GETDOWN 	# RETURN WITH VECTOR FOR DOWN DIRECTION
// PORT: Fixed ROM slots 30826.
    30826, 57784,
// PORT: SOURCE P11.agc:285
//		VCOMP   UNIT
// PORT: Fixed ROM slots 30827.
    30827, 44668,
// PORT: SOURCE P11.agc:286
//		STOVL	REFSMMAT +12D	# UNITZ = UNIT(GRAV)
// PORT: Fixed ROM slots 30828.
    30828, 22484,
// PORT: SOURCE P11.agc:287
//			RN1
// PORT: Fixed ROM slots 30829.
    30829, 1332,
// PORT: SOURCE P11.agc:288
//		VXV	VXSC
// PORT: Fixed ROM slots 30830.
    30830, 61754,
// PORT: SOURCE P11.agc:289
//# Page 538
// PORT: SOURCE P11.agc:290
//			UNITW		# SCALED AT 1
// PORT: Fixed ROM slots 30831.
    30831, 1944,
// PORT: SOURCE P11.agc:291
//			-ERTHRAT	# V = EARTHRATE X R
// PORT: Fixed ROM slots 30832.
    30832, 24968,
// PORT: SOURCE P11.agc:292
//		VSL4			# SCALE TO 2(7) M/CS
// PORT: Fixed ROM slots 30833.
    30833, 65428,
// PORT: SOURCE P11.agc:293
//		STOVL	VN1
// PORT: Fixed ROM slots 30834.
    30834, 21824,
// PORT: SOURCE P11.agc:294
//			REFSMMAT +12D
// PORT: Fixed ROM slots 30835.
    30835, 2004,
// PORT: SOURCE P11.agc:295
//		VXV	UNIT
// PORT: Fixed ROM slots 30836.
    30836, 44602,
// PORT: SOURCE P11.agc:296
//			UNITW		# (REF3 X UNITW) = EAST
// PORT: Fixed ROM slots 30837.
    30837, 1944,
// PORT: SOURCE P11.agc:297
//		PUSH	VXV
// PORT: Fixed ROM slots 30838.
    30838, 40204,
// PORT: SOURCE P11.agc:298
//			REFSMMAT +12D	# (EAST X REF3) = -SOUTH
// PORT: Fixed ROM slots 30839.
    30839, 2004,
// PORT: SOURCE P11.agc:299
//		UNIT	PDDL
// PORT: Fixed ROM slots 30840.
    30840, 54620,
// PORT: SOURCE P11.agc:300
//			LAUNCHAZ	# COS(AZ)*SOUTH
// PORT: Fixed ROM slots 30841.
    30841, 2872,
// PORT: SOURCE P11.agc:301
//		COS	VXSC
// PORT: Fixed ROM slots 30842.
    30842, 61900,
// PORT: SOURCE P11.agc:302
//		STADR
// PORT: Fixed ROM slots 30843.
    30843, 65324,
// PORT: SOURCE P11.agc:303
//		STODL	REFSMMAT	# TEMPORARY STORAGE
// PORT: Fixed ROM slots 30844.
    30844, 51266,
// PORT: SOURCE P11.agc:304
//			LAUNCHAZ
// PORT: Fixed ROM slots 30845.
    30845, 2872,
// PORT: SOURCE P11.agc:305
//		SIN	VXSC		# SIN(AZ)*EAST
// PORT: Fixed ROM slots 30846.
    30846, 61916,
// PORT: SOURCE P11.agc:306
//		VAD	UNIT		# SIN(AZ)*EAST - COS(AZ)*SOUTH = REF1
// PORT: Fixed ROM slots 30847.
    30847, 44634,
// PORT: SOURCE P11.agc:307
//			REFSMMAT
// PORT: Fixed ROM slots 30848.
    30848, 1980,
// PORT: SOURCE P11.agc:308
//		STORE	REFSMMAT
// PORT: Fixed ROM slots 30849.
    30849, 1980,
// PORT: SOURCE P11.agc:309
//
// PORT: SOURCE P11.agc:310
//		VXV	UNIT		# (REF1 X REF3) = -REF3
// PORT: Fixed ROM slots 30850.
    30850, 44602,
// PORT: SOURCE P11.agc:311
//			REFSMMAT +12D
// PORT: Fixed ROM slots 30851.
    30851, 2004,
// PORT: SOURCE P11.agc:312
//		VCOMP
// PORT: Fixed ROM slots 30852.
    30852, 65404,
// PORT: SOURCE P11.agc:313
//		STORE	REFSMMAT +6
// PORT: Fixed ROM slots 30853.
    30853, 1992,
// PORT: SOURCE P11.agc:314
//		DLOAD	DSU
// PORT: Fixed ROM slots 30854.
    30854, 38346,
// PORT: SOURCE P11.agc:315
//			DPHALF		# 1/2 REV
// PORT: Fixed ROM slots 30855.
    30855, 13750,
// PORT: SOURCE P11.agc:316
//			LAUNCHAZ
// PORT: Fixed ROM slots 30856.
    30856, 2872,
// PORT: SOURCE P11.agc:317
//		DAD	PDDL
// PORT: Fixed ROM slots 30857.
    30857, 54554,
// PORT: SOURCE P11.agc:318
//			AZIMUTH
// PORT: Fixed ROM slots 30858.
    30858, 2562,
// PORT: SOURCE P11.agc:319
//			SATRLRT		# SET	SATRLRT = -SATRLRT IF
// PORT: Fixed ROM slots 30859.
    30859, 3458,
// PORT: SOURCE P11.agc:320
//		SIGN	STADR		# (1/2REV -LAVNCHAZ +AZIMUTH) IS NEGATIVE
// PORT: Fixed ROM slots 30860.
    30860, 38634,
// PORT: SOURCE P11.agc:321
//		STORE	SATRLRT		# FOR ROLL CALC IN FDAI ATT. ERROR DISPLAY
// PORT: Fixed ROM slots 30861.
    30861, 62076,
// PORT: SOURCE P11.agc:322
//		SET	EXIT
// PORT: Fixed ROM slots 30862.
    30862, 65048,
// PORT: SOURCE P11.agc:323
//			REFSMFLG	# SET REFSMMAT KNOWN FLAG
// PORT: Fixed ROM slots 30863.
    30863, 1636
)).

// PORT: Physical bank 34. Shared continuation entries, slots 30864–30864.
function agcAotUnit1752 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P11.agc:324
//
// PORT: SOURCE P11.agc:325
//		TC	PHASCHNG
// PORT: Fixed ROM slots 30864.
    if slot <> 30864 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1752] to agcAotUnit1752@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:326
//		OCT	04023
// PORT: Fixed ROM slots 30865.
    30865, 4134
)).

// PORT: Physical bank 34. Shared continuation entries, slots 30866–30883.
function agcAotUnit1753 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30874 {
        if slot <= 30869 {
            if slot <= 30867 {
                if slot <= 30866 {
// PORT: SOURCE P11.agc:327
//
// PORT: SOURCE P11.agc:328
//		EXTEND
// PORT: Fixed ROM slots 30866.
                    if slot <> 30866 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:329
//		DCA	P11SCADR
// PORT: Fixed ROM slots 30867.
                    if slot <> 30867 or instruction <> 13510 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 1222, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30868 {
// PORT: SOURCE P11.agc:330
//		DXCH	AVGEXIT		# SET AVGEXIT
// PORT: Fixed ROM slots 30868.
                    if slot <> 30868 or instruction <> 22163 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 659, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:331
//
// PORT: SOURCE P11.agc:332
//		CA	PRIO31		# 2 SECONDS AT 2(+8)
// PORT: Fixed ROM slots 30869.
                    if slot <> 30869 or instruction <> 16309 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 4021), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 30871 {
                if slot <= 30870 {
// PORT: SOURCE P11.agc:333
//		TS	1/PIPADT
// PORT: Fixed ROM slots 30870.
                    if slot <> 30870 or instruction <> 23100 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23100, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:334
//
// PORT: SOURCE P11.agc:335
//		EBANK=	RCSFLAGS
// PORT: SOURCE P11.agc:336
//		CA	EBANK6
// PORT: Fixed ROM slots 30871.
                    if slot <> 30871 or instruction <> 14895 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2607), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30872 {
// PORT: SOURCE P11.agc:337
//		TS	EBANK
// PORT: Fixed ROM slots 30872.
                    if slot <> 30872 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30873 {
// PORT: SOURCE P11.agc:338
//
// PORT: SOURCE P11.agc:339
//		INHINT
// PORT: Fixed ROM slots 30873.
                        if slot <> 30873 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:340
//# Page 539
// PORT: SOURCE P11.agc:341
//		CS	ZERO
// PORT: Fixed ROM slots 30874.
                        if slot <> 30874 or instruction <> 18961 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 30878 {
            if slot <= 30876 {
                if slot <= 30875 {
// PORT: SOURCE P11.agc:342
//		TS	TBASE5		# RESTART READACCS 2 SECONDS AFTER LIFTOFF
// PORT: Fixed ROM slots 30875.
                    if slot <> 30875 or instruction <> 23091 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23091, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:343
//
// PORT: SOURCE P11.agc:344
//		CS	TIME1
// PORT: Fixed ROM slots 30876.
                    if slot <> 30876 or instruction <> 16405 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 21).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30877 {
// PORT: SOURCE P11.agc:345
//		AD	2SECS		# DO READACCS 2 SECONDS AFTER LIFTOFF
// PORT: Fixed ROM slots 30877.
                    if slot <> 30877 or instruction <> 27170 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2594), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:346
//
// PORT: SOURCE P11.agc:347
//		CCS	A		# CHECK TO INSURE DT IS POSITIVE
// PORT: Fixed ROM slots 30878.
                    if slot <> 30878 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
            if slot <= 30880 {
                if slot <= 30879 {
// PORT: SOURCE P11.agc:348
//		TCF	+3		# TIME POSITIVE
// PORT: Fixed ROM slots 30879.
                    if slot <> 30879 or instruction <> 5282 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5282, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:349
//		TCF	+2		# CANNOT GET HERE
// PORT: Fixed ROM slots 30880.
                    if slot <> 30880 or instruction <> 5282 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5282, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30881 {
// PORT: SOURCE P11.agc:350
//		CA	ZERO		# TIME NEGATIVE - SET TO 1
// PORT: Fixed ROM slots 30881.
                    if slot <> 30881 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30882 {
// PORT: SOURCE P11.agc:351
//		AD	ONE		# RESTORE TIME  -  OR MAKE POSITIVE
// PORT: Fixed ROM slots 30882.
                        if slot <> 30882 or instruction <> 27151 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:352
//
// PORT: SOURCE P11.agc:353
//		TC	WAITLIST
// PORT: Fixed ROM slots 30883.
                        if slot <> 30883 or instruction <> 2725 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1753] to agcAotUnit1753@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:354
//		EBANK=	AOG
// PORT: SOURCE P11.agc:355
//		2CADR	READACCS
// PORT: Fixed ROM slots 30884 30885.
    30884, 3016, 30885, 63596
)).

// PORT: Physical bank 34. Shared continuation entries, slots 30886–30886.
function agcAotUnit1754 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P11.agc:356
//
// PORT: SOURCE P11.agc:357
//		TC	2PHSCHNG
// PORT: Fixed ROM slots 30886.
    if slot <> 30886 or instruction <> 2810 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2810, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1754] to agcAotUnit1754@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:358
//		OCT	00003		# TURN OFF GROUP 3
// PORT: Fixed ROM slots 30887.
    30887, 6,
// PORT: SOURCE P11.agc:359
//		OCT	00025		# PROTECT NORMLIZE AND READACCS
// PORT: Fixed ROM slots 30888.
    30888, 42
)).

// PORT: Physical bank 34. Shared continuation entries, slots 30889–30889.
function agcAotUnit1755 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P11.agc:360
//
// PORT: SOURCE P11.agc:361
//		TC	POSTJUMP
// PORT: Fixed ROM slots 30889.
    if slot <> 30889 or instruction <> 2497 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2497, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1755] to agcAotUnit1755@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:362
//		CADR	NORMLIZE	# DO NORMLIZE AND ENDOFJOB
// PORT: Fixed ROM slots 30890.
    30890, 64828
)).

// PORT: Physical bank 34. Shared continuation entries, slots 30891–30909.
function agcAotUnit1756 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30899 {
        if slot <= 30894 {
            if slot <= 30892 {
                if slot <= 30891 {
// PORT: SOURCE P11.agc:363
//
// PORT: SOURCE P11.agc:364
//
// PORT: SOURCE P11.agc:365
//		EBANK=	TEPHEM
// PORT: SOURCE P11.agc:366
//REP11		INHINT
// PORT: Fixed ROM slots 30891.
                    if slot <> 30891 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:367
//		CCS	PHASE5
// PORT: Fixed ROM slots 30892.
                    if slot <> 30892 or instruction <> 4595 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 499).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30893 {
// PORT: SOURCE P11.agc:368
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 30893.
                    if slot <> 30893 or instruction <> 2703 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2703, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:369
//
// PORT: SOURCE P11.agc:370
//		CCS	LIFTTEMP
// PORT: Fixed ROM slots 30894.
                    if slot <> 30894 or instruction <> 4789 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 693).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 30896 {
                if slot <= 30895 {
// PORT: SOURCE P11.agc:371
//		TCF	+4
// PORT: Fixed ROM slots 30895.
                    if slot <> 30895 or instruction <> 5299 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5299, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:372
//		TCF	+3
// PORT: Fixed ROM slots 30896.
                    if slot <> 30896 or instruction <> 5299 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5299, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30897 {
// PORT: SOURCE P11.agc:373
//		TCF	+2
// PORT: Fixed ROM slots 30897.
                    if slot <> 30897 or instruction <> 5299 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5299, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30898 {
// PORT: SOURCE P11.agc:374
//		TCF	P11+7
// PORT: Fixed ROM slots 30898.
                        if slot <> 30898 or instruction <> 5131 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5131, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:375
//
// PORT: SOURCE P11.agc:376
//		CS	TLIFTOFF
// PORT: Fixed ROM slots 30899.
                        if slot <> 30899 or instruction <> 17118 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 734).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 30904 {
            if slot <= 30901 {
                if slot <= 30900 {
// PORT: SOURCE P11.agc:377
//		EXTEND
// PORT: Fixed ROM slots 30900.
                    if slot <> 30900 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:378
//		BZMF	ENDREP11
// PORT: Fixed ROM slots 30901.
                    if slot <> 30901 or instruction <> 25787 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25787, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30902 {
// PORT: SOURCE P11.agc:379
//
// PORT: SOURCE P11.agc:380
//		CCS	TIME2		# **TIME2 MUST BE NON-ZERO AT LIFTOFF**
// PORT: Fixed ROM slots 30902.
                    if slot <> 30902 or instruction <> 4116 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 20).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30903 {
// PORT: SOURCE P11.agc:381
//		TCF	REP11A	-5	# T2,T1 NOT YET ZEROED, GO AND DO IT
// PORT: Fixed ROM slots 30903.
                        if slot <> 30903 or instruction <> 5137 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5137, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:382
//
// PORT: SOURCE P11.agc:383
//		EXTEND			# T2,T1 ZEROED, SET TLIFTOFF
// PORT: Fixed ROM slots 30904.
                        if slot <> 30904 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 30906 {
                if slot <= 30905 {
// PORT: SOURCE P11.agc:384
//		DCA	LIFTTEMP
// PORT: Fixed ROM slots 30905.
                    if slot <> 30905 or instruction <> 12982 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 694, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:385
//		TCF	REP11A-2
// PORT: Fixed ROM slots 30906.
                    if slot <> 30906 or instruction <> 5140 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5140, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30907 {
// PORT: SOURCE P11.agc:386
//
// PORT: SOURCE P11.agc:387
//ENDREP11	EXTEND
// PORT: Fixed ROM slots 30907.
                    if slot <> 30907 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30908 {
// PORT: SOURCE P11.agc:388
//		DCA	REP11SA
// PORT: Fixed ROM slots 30908.
                        if slot <> 30908 or instruction <> 13505 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 1217, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:389
//		TCF	REP11A-1
// PORT: Fixed ROM slots 30909.
                        if slot <> 30909 or instruction <> 5141 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5141, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1756] to agcAotUnit1756@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:390
//# Page 540
// PORT: SOURCE P11.agc:391
//REP11S		2OCT	7776600011
// PORT: Fixed ROM slots 30910 30911.
    30910, 65516, 30911, 18,
// PORT: SOURCE P11.agc:392
//
// PORT: SOURCE P11.agc:393
//REP11SA		2OCT	7776400013
// PORT: Fixed ROM slots 30912 30913.
    30912, 65512, 30913, 22,
// PORT: SOURCE P11.agc:394
//
// PORT: SOURCE P11.agc:395
//P11XIT		GENADR	P11OUT
// PORT: Fixed ROM slots 30914.
    30914, 2642,
// PORT: SOURCE P11.agc:396
//-ERTHRAT	2DEC*	-7.292115138 E-7 B18*	# - EARTH RATE AT 2(18)
// PORT: Fixed ROM slots 30915 30916.
    30915, 59272, 30916, 34746,
// PORT: SOURCE P11.agc:397
//
// PORT: SOURCE P11.agc:398
//		EBANK=	BODY3
// PORT: SOURCE P11.agc:399
//P11SCADR	2CADR	VHHDOT
// PORT: Fixed ROM slots 30917 30918.
    30917, 2446, 30918, 57452
)).

// PORT: Physical bank 34. Shared continuation entries, slots 30919–30919.
function agcAotUnit1757 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P11.agc:400
//
// PORT: SOURCE P11.agc:401
//POWDNCOD        EQUALS  THREE
// PORT: SOURCE P11.agc:402
//
// PORT: SOURCE P11.agc:403
//		EBANK=	BODY3
// PORT: SOURCE P11.agc:404
//# VHHDOT IS EXECUTED EVERY 2 SECONDS TO DISPLAY ON DSKY
// PORT: SOURCE P11.agc:405
//#			VI INERTIAL VELOCITY MAGNITUDE
// PORT: SOURCE P11.agc:406
//#			HDOT  RATE OF CHANGE OF ALT ABOVE L PAD RADIUS
// PORT: SOURCE P11.agc:407
//#			H  ALTITUDE ABOVE L PAD RADIUS
// PORT: SOURCE P11.agc:408
//
// PORT: SOURCE P11.agc:409
//VHHDOT		TC	INTPRET
// PORT: Fixed ROM slots 30919.
    if slot <> 30919 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1757] to agcAotUnit1757@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:410
//		CALL			# LOAD VMAGI, ALTI,
// PORT: Fixed ROM slots 30920.
    30920, 65320,
// PORT: SOURCE P11.agc:411
//			S11.1		# HDOT FOR DISPLAY
// PORT: Fixed ROM slots 30921.
    30921, 58052,
// PORT: SOURCE P11.agc:412
//		EXIT
// PORT: Fixed ROM slots 30922.
    30922, 65532
)).

// PORT: Physical bank 34. Shared continuation entries, slots 30923–30923.
function agcAotUnit1758 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P11.agc:413
//		TC      PHASCHNG
// PORT: Fixed ROM slots 30923.
    if slot <> 30923 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1758] to agcAotUnit1758@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:414
//		OCT     00035
// PORT: Fixed ROM slots 30924.
    30924, 58
)).

// PORT: Physical bank 34. Shared continuation entries, slots 30925–30926.
function agcAotUnit1759 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30925 {
// PORT: SOURCE P11.agc:415
//
// PORT: SOURCE P11.agc:416
//		CAF	V06N62		# DISPLAY IN R1	R2	R3
// PORT: Fixed ROM slots 30925.
        if slot <> 30925 or instruction <> 13714 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1426), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P11.agc:417
//		TC	BANKCALL	#            VI	HDOT	H
// PORT: Fixed ROM slots 30926.
        if slot <> 30926 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1759] to agcAotUnit1759@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:418
//		CADR	REGODSP
// PORT: Fixed ROM slots 30927.
    30927, 17294
)).

// PORT: Physical bank 34. Shared continuation entries, slots 30928–30929.
function agcAotUnit1760 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30928 {
// PORT: SOURCE P11.agc:419
//
// PORT: SOURCE P11.agc:420
//ATERTASK	CAF	PRIO1		# ESTABLISH JOB TO DISPLAY ATT ERRORS
// PORT: Fixed ROM slots 30928.
        if slot <> 30928 or instruction <> 14854 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2566), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P11.agc:421
//		TC	FINDVAC		# COMES HERE AT L.O. + .33 SEC
// PORT: Fixed ROM slots 30929.
        if slot <> 30929 or instruction <> 2663 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2663, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1760] to agcAotUnit1760@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:422
//		EBANK=	BODY3
// PORT: SOURCE P11.agc:423
//		2CADR	ATERJOB
// PORT: Fixed ROM slots 30930 30931.
    30930, 2506, 30931, 57452
)).

// PORT: Physical bank 34. Shared continuation entries, slots 30932–30935.
function agcAotUnit1761 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30933 {
        if slot <= 30932 {
// PORT: SOURCE P11.agc:424
//
// PORT: SOURCE P11.agc:425
//		CS	RCSFLAGS	# SET BIT3 FOR
// PORT: Fixed ROM slots 30932.
            if slot <> 30932 or instruction <> 17217 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 833).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P11.agc:426
//		MASK	BIT3		# NEEDLER
// PORT: Fixed ROM slots 30933.
            if slot <> 30933 or instruction <> 31245 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                set words[0] to agcOverflowCorrected(words[0]).
                local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                if fixedOperand = 4 {
                    set words[0] to agcSignExtend(mod(floor(words[0] / 4), 2) * 4).
                } else {
                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30934 {
// PORT: SOURCE P11.agc:427
//		ADS	RCSFLAGS	# INITIALIZATION PASS
// PORT: Fixed ROM slots 30934.
            if slot <> 30934 or instruction <> 12097 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreADS(words, 833).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P11.agc:428
//		TC	IBNKCALL	# AND GO
// PORT: Fixed ROM slots 30935.
            if slot <> 30935 or instruction <> 2528 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2528, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1761] to agcAotUnit1761@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:429
//		CADR	NEEDLER		# DO IT
// PORT: Fixed ROM slots 30936.
    30936, 35360
)).

// PORT: Physical bank 34. Shared continuation entries, slots 30937–30939.
function agcAotUnit1762 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30937 {
// PORT: SOURCE P11.agc:430
//		CA      BIT1            # SET SW
// PORT: Fixed ROM slots 30937.
        if slot <> 30937 or instruction <> 14863 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 30938 {
// PORT: SOURCE P11.agc:431
//		TS      SATSW           # FOR DISPLAY
// PORT: Fixed ROM slots 30938.
            if slot <> 30938 or instruction <> 23509 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23509, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P11.agc:432
//		TC	TASKOVER
// PORT: Fixed ROM slots 30939.
            if slot <> 30939 or instruction <> 2772 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2772, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1762] to agcAotUnit1762@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:433
//GETDOWN         STQ     SETPD
// PORT: Fixed ROM slots 30940.
    30940, 33056,
// PORT: SOURCE P11.agc:434
//			INCORPEX
// PORT: Fixed ROM slots 30941.
    30941, 2372,
// PORT: SOURCE P11.agc:435
//			0D
// PORT: Fixed ROM slots 30942.
    30942, 2,
// PORT: SOURCE P11.agc:436
//		DLOAD
// PORT: Fixed ROM slots 30943.
    30943, 65482,
// PORT: SOURCE P11.agc:437
//			HI6ZEROS
// PORT: Fixed ROM slots 30944.
    30944, 13754,
// PORT: SOURCE P11.agc:438
//# Page 541
// PORT: SOURCE P11.agc:439
//		STODL   6D
// PORT: Fixed ROM slots 30945.
    30945, 12302,
// PORT: SOURCE P11.agc:440
//		        DPHALF
// PORT: Fixed ROM slots 30946.
    30946, 13750,
// PORT: SOURCE P11.agc:441
//		STCALL  8D
// PORT: Fixed ROM slots 30947.
    30947, 28690,
// PORT: SOURCE P11.agc:442
//		        LALOTORV +5
// PORT: Fixed ROM slots 30948.
    30948, 23116
)).

// PORT: Physical bank 34. Shared continuation entries, slots 30949–30959.
function agcAotUnit1763 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30953 {
        if slot <= 30950 {
            if slot <= 30949 {
// PORT: SOURCE P11.agc:443
//# THIS SECTION PROVIDES ATTITUDE ERROR DISPLAYS TO THE FDAI DURING SONE BOOST
// PORT: SOURCE P11.agc:444
//
// PORT: SOURCE P11.agc:445
//#					COMPUTE DESIRED PITCH W.R.T. PAD LOCAL VERTICAL AT LIFTOFF
// PORT: SOURCE P11.agc:446
//#							2    3    4    5    6
// PORT: SOURCE P11.agc:447
//#					PITCH = A0+A1T+A2T +A3T +A4T +A5T +A6T
// PORT: SOURCE P11.agc:448
//#						SCALED TO 32 REVS.                                   -14
// PORT: SOURCE P11.agc:449
//#					IF TL = TIME IN SECS FROM L.O., THEN	T = 100(TL-RPSTART)2
// PORT: SOURCE P11.agc:450
//#					WHERE	TL GE RPSTART
// PORT: SOURCE P11.agc:451
//#						TL LE (-POLYSTOP + RPSTART)
// PORT: SOURCE P11.agc:452
//#					COMPUTE DESIRED ROLL WHERE ROLL EQUALS ANGLE FROM
// PORT: SOURCE P11.agc:453
//#					LAUNCHAZ TO -Z(S/C) AS SEEN FROM X(S/C).
// PORT: SOURCE P11.agc:454
//#					ROLL = LAUNCHAZ-AZIMUTH-.5 +SATRLRT*T	IN REV
// PORT: SOURCE P11.agc:455
//#					SATRLRT = RATE OF ROLL IN REV/CENTI-SEC
// PORT: SOURCE P11.agc:456
//#					T,IN CENTI-SEC,IS DEFINED AS ABOVE,INCLUSIVE OF TIME RESTRICTIONS
// PORT: SOURCE P11.agc:457
//
// PORT: SOURCE P11.agc:458
//#					FOR SIMPLICITY, LET	P = 2*PI*PITCH
// PORT: SOURCE P11.agc:459
//#								R = 2*PI*ROLL
// PORT: SOURCE P11.agc:460
//
// PORT: SOURCE P11.agc:461
//#					CONSTRUCT THE TRANSFORMATION MATRIX, TSMV, GIVING DESIRED S/C AXES IN
// PORT: SOURCE P11.agc:462
//#					TERMS OF SM COORDINATES.  LET THE RESULTING ROWS EQUAL THE VECTORS XDC,
// PORT: SOURCE P11.agc:463
//#					YDC,AND ZDC.
// PORT: SOURCE P11.agc:464
//
// PORT: SOURCE P11.agc:465
//#					 *     (    SIN(P)                 0               -COS(P)    )   (XDC)
// PORT: SOURCE P11.agc:466
//#					TSMV = (-SIN(R)*COS(P)		-COS(R)		-SIN(R)*SIN(P)) = (YDC)
// PORT: SOURCE P11.agc:467
//#					       (-COS(R)*COS(P)           SIN(R)         -COS(R)*SIN(P))   (ZDC)
// PORT: SOURCE P11.agc:468
//
// PORT: SOURCE P11.agc:469
//#					XDC,YDC,ZDC ARE USED AS INPUT TO CALCGTA FOR THE EXTRACTION OF THE
// PORT: SOURCE P11.agc:470
//#					EULER SET OF ANGLES WHICH WILL BRING THE SM INTO THE DESIRED
// PORT: SOURCE P11.agc:471
//#					ORIENTATION.  THIS EULER SET, OGC, IGC, AND MGC, MAY BE IDENTIFIED
// PORT: SOURCE P11.agc:472
//#					AS THE DESIRED CDU ANGLES.
// PORT: SOURCE P11.agc:473
//
// PORT: SOURCE P11.agc:474
//#					(XDC)			(OGC)
// PORT: SOURCE P11.agc:475
//#					(YDC) ---) CALCGTA ---) (IGC)
// PORT: SOURCE P11.agc:476
//#					(ZDC)			(MGC)
// PORT: SOURCE P11.agc:477
//
// PORT: SOURCE P11.agc:478
//#							   -
// PORT: SOURCE P11.agc:479
//#					DEFINE THE VECTOR DELTACDU.
// PORT: SOURCE P11.agc:480
//
// PORT: SOURCE P11.agc:481
//#					 -         (OGC)   (CDUX)
// PORT: SOURCE P11.agc:482
//#					DELTACDU = (IGC) - (CDUY)
// PORT: SOURCE P11.agc:483
//#					           (MGC)   (CDUZ)
// PORT: SOURCE P11.agc:484
//
// PORT: SOURCE P11.agc:485
//#								 -		-    *    -
// PORT: SOURCE P11.agc:486
//#					COMPUTE ATTITUDE ERRORS, A, WHERE	A = TGSC*DELTACDU
// PORT: SOURCE P11.agc:487
//#
// PORT: SOURCE P11.agc:488
//#					 *     (1	      SIN(CDUZ)             0    )   THE GIMBAL ANGLES
// PORT: SOURCE P11.agc:489
//# Page 542
// PORT: SOURCE P11.agc:490
//#	TGSC = (0	COS(CDUX)*COS(CDUZ)	SIN(CDUX)) = TO SPACECRAFT AXES
// PORT: SOURCE P11.agc:491
//#	       (0      -SIN(CDUX)*COS(CDUZ)	COS(CDUX))   CONVERSION MATRIX
// PORT: SOURCE P11.agc:492
//
// PORT: SOURCE P11.agc:493
//#			     -
// PORT: SOURCE P11.agc:494
//#	THE ATTITUDE ERRORS, A, ARE STORED ONE HALF SINGLE PRECISION IN
// PORT: SOURCE P11.agc:495
//#	THE REGISTERS AK, AK1, AK2 AS INPUT TO NEEDLER, THE FDAI ATTITUDE
// PORT: SOURCE P11.agc:496
//#	ERROR DISPLAY ROUTINE.
// PORT: SOURCE P11.agc:497
//
// PORT: SOURCE P11.agc:498
//ATERJOB		CAE	FLAGWRD6	# CHECK FLAGWRD6
// PORT: Fixed ROM slots 30949.
                if slot <> 30949 or instruction <> 12354 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 66).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P11.agc:499
//		MASK    OCT60000        # BITS 14, 15
// PORT: Fixed ROM slots 30950.
                if slot <> 30950 or instruction <> 30789 { return choose false if checkOnly else -1. }
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
            }
        } else {
            if slot <= 30951 {
// PORT: SOURCE P11.agc:500
//		EXTEND
// PORT: Fixed ROM slots 30951.
                if slot <> 30951 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30952 {
// PORT: SOURCE P11.agc:501
//		BZF     +2              # OK - CONTINUE
// PORT: Fixed ROM slots 30952.
                    if slot <> 30952 or instruction <> 5354 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5354, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:502
//		TC      ENDOFJOB	# SATURN STICK ON - KILL JOB
// PORT: Fixed ROM slots 30953.
                    if slot <> 30953 or instruction <> 2703 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2703, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 30956 {
            if slot <= 30954 {
// PORT: SOURCE P11.agc:503
//		CAF     BIT10           # CHECK IF S/C CONTROL
// PORT: Fixed ROM slots 30954.
                if slot <> 30954 or instruction <> 14854 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2566), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30955 {
// PORT: SOURCE P11.agc:504
//		EXTEND                  # OF SATURN PANEL
// PORT: Fixed ROM slots 30955.
                    if slot <> 30955 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:505
//		RAND    CHAN30          # SWITCH IS ON
// PORT: Fixed ROM slots 30956.
                    if slot <> 30956 or instruction <> 1048 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 24, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 30957 {
// PORT: SOURCE P11.agc:506
//		EXTEND
// PORT: Fixed ROM slots 30957.
                if slot <> 30957 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30958 {
// PORT: SOURCE P11.agc:507
//		BZF     STRSAT          # IT IS - GO STEER
// PORT: Fixed ROM slots 30958.
                    if slot <> 30958 or instruction <> 5448 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5448, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:508
//		CCS     SATSW           # IT IS NOT - WAS IT ON LAST CYCLE
// PORT: Fixed ROM slots 30959.
                    if slot <> 30959 or instruction <> 5077 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 981).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1763] to agcAotUnit1763@.

// PORT: Physical bank 34. Shared continuation entries, slots 30960–30983.
function agcAotUnit1764 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30971 {
        if slot <= 30965 {
            if slot <= 30962 {
                if slot <= 30960 {
// PORT: SOURCE P11.agc:509
//		TC      ATTDISP         # NO - CONTINUE
// PORT: Fixed ROM slots 30960.
                    if slot <> 30960 or instruction <> 1267 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1267, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30961 {
// PORT: SOURCE P11.agc:510
//		TC      ATRESET         # YES - REINITIALIZE NEEDLER
// PORT: Fixed ROM slots 30961.
                        if slot <> 30961 or instruction <> 1355 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1355, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:511
//		TC      ATRESET         # YES - REINITIALIZE NEEDLER
// PORT: Fixed ROM slots 30962.
                        if slot <> 30962 or instruction <> 1355 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1355, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 30963 {
// PORT: SOURCE P11.agc:512
//ATTDISP		CS	RPSTART		# PITCH/ROLL START TIME
// PORT: Fixed ROM slots 30963.
                    if slot <> 30963 or instruction <> 17346 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 962).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30964 {
// PORT: SOURCE P11.agc:513
//		AD	TIME1
// PORT: Fixed ROM slots 30964.
                        if slot <> 30964 or instruction <> 24597 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 21).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:514
//		EXTEND
// PORT: Fixed ROM slots 30965.
                        if slot <> 30965 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 30968 {
                if slot <= 30966 {
// PORT: SOURCE P11.agc:515
//		BZMF	NOPOLY		# IF MINUS THEN ATTITUDE HOLD
// PORT: Fixed ROM slots 30966.
                    if slot <> 30966 or instruction <> 25997 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25997, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30967 {
// PORT: SOURCE P11.agc:516
//		TS	MPAC		# MPAC=TIME1-RPSTART
// PORT: Fixed ROM slots 30967.
                        if slot <> 30967 or instruction <> 22636 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22636, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:517
//		TS	SPOLYARG	# SAVE FOR USE IN ROLL CALCULATION
// PORT: Fixed ROM slots 30968.
                        if slot <> 30968 or instruction <> 23495 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23495, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 30969 {
// PORT: SOURCE P11.agc:518
//		AD	POLYSTOP	# NEG PITCHOVER TIME IN CSECS
// PORT: Fixed ROM slots 30969.
                    if slot <> 30969 or instruction <> 25539 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 963).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30970 {
// PORT: SOURCE P11.agc:519
//		EXTEND
// PORT: Fixed ROM slots 30970.
                        if slot <> 30970 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:520
//		BZMF	+2
// PORT: Fixed ROM slots 30971.
                        if slot <> 30971 or instruction <> 25853 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 25853, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 30977 {
            if slot <= 30974 {
                if slot <= 30972 {
// PORT: SOURCE P11.agc:521
//		TC      NOPOLY          # GO TO ATTITUDE HOLD
// PORT: Fixed ROM slots 30972.
                    if slot <> 30972 or instruction <> 1421 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1421, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30973 {
// PORT: SOURCE P11.agc:522
//		CA      TIME2
// PORT: Fixed ROM slots 30973.
                        if slot <> 30973 or instruction <> 12308 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 20).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:523
//		EXTEND
// PORT: Fixed ROM slots 30974.
                        if slot <> 30974 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 30975 {
// PORT: SOURCE P11.agc:524
//		BZMF    +2
// PORT: Fixed ROM slots 30975.
                    if slot <> 30975 or instruction <> 25857 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25857, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30976 {
// PORT: SOURCE P11.agc:525
//		TC      NOPOLY          # GO TO ATTITUDE HOLD
// PORT: Fixed ROM slots 30976.
                        if slot <> 30976 or instruction <> 1421 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1421, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:526
//		CAE	POLYNUM
// PORT: Fixed ROM slots 30977.
                        if slot <> 30977 or instruction <> 13233 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 945).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 30980 {
                if slot <= 30978 {
// PORT: SOURCE P11.agc:527
//		TS	L
// PORT: Fixed ROM slots 30978.
                    if slot <> 30978 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30979 {
// PORT: SOURCE P11.agc:528
//		CAF	COEFPOLY	# EVALUATE PITCH POLYNOMIAL
// PORT: Fixed ROM slots 30979.
                        if slot <> 30979 or instruction <> 13713 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1425), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:529
//		TC	POWRSERS	# SCALED TO 32 REVOLUTIONS
// PORT: Fixed ROM slots 30980.
                        if slot <> 30980 or instruction <> 3700 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3700, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 30981 {
// PORT: SOURCE P11.agc:530
//
// PORT: SOURCE P11.agc:531
//		CA      ZERO            # RETURN WITH PITCH(32REV)
// PORT: Fixed ROM slots 30981.
                    if slot <> 30981 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30982 {
// PORT: SOURCE P11.agc:532
//		TS	MODE		# STORED MPAC, MPAC +1
// PORT: Fixed ROM slots 30982.
                        if slot <> 30982 or instruction <> 22643 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22643, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:533
//		TC	INTPRET
// PORT: Fixed ROM slots 30983.
                        if slot <> 30983 or instruction <> 3078 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3078, words[0], readEffective).
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
// PORT: SOURCE P11.agc:534
//		SETPD	SL		# 32(PITCH(32REV))=PITCH(REV)
// PORT: Fixed ROM slots 30984.
    30984, 45314,
// PORT: SOURCE P11.agc:535
//			0
// PORT: Fixed ROM slots 30985.
    30985, 2,
// PORT: SOURCE P11.agc:536
//			5
// PORT: Fixed ROM slots 30986.
    30986, 16652,
// PORT: SOURCE P11.agc:537
//		PUSH			# LET P(RAD)=2*PI*PITCH(REV)
// PORT: Fixed ROM slots 30987.
    30987, 65292,
// PORT: SOURCE P11.agc:538
//		GOTO
// PORT: Fixed ROM slots 30988.
    30988, 65360,
// PORT: SOURCE P11.agc:539
//			ATTDISP1	# AROUND SETLOC
// PORT: Fixed ROM slots 30989.
    30989, 63706,
// PORT: SOURCE P11.agc:540
//# Page 543
// PORT: SOURCE P11.agc:541
//#				     *
// PORT: SOURCE P11.agc:542
//#	CONSTRUCT SM TO S/C MATRIX, TSMV
// PORT: SOURCE P11.agc:543
//
// PORT: SOURCE P11.agc:544
//		SETLOC	P11TWO
// PORT: SOURCE P11.agc:545
//		BANK			# 36 IN COL., 34 IN DISK
// PORT: SOURCE P11.agc:546
//
// PORT: SOURCE P11.agc:547
//		COUNT	36/P11
// PORT: SOURCE P11.agc:548
//
// PORT: SOURCE P11.agc:549
//ATTDISP1	COS	DCOMP
// PORT: Fixed ROM slots 33901.
    33901, 48844,
// PORT: SOURCE P11.agc:550
//		STODL	14D		# -.5*COS(P)
// PORT: Fixed ROM slots 33902.
    33902, 12318,
// PORT: SOURCE P11.agc:551
//		SIN
// PORT: Fixed ROM slots 33903.
    33903, 65500,
// PORT: SOURCE P11.agc:552
//		STODL	10D		# .5*SIN(P)
// PORT: Fixed ROM slots 33904.
    33904, 12310,
// PORT: SOURCE P11.agc:553
//			ZEROVECS
// PORT: Fixed ROM slots 33905.
    33905, 13754,
// PORT: SOURCE P11.agc:554
//		STORE	12D		# 0
// PORT: Fixed ROM slots 33906.
    33906, 26,
// PORT: SOURCE P11.agc:555
//
// PORT: SOURCE P11.agc:556
//#	EVALUATE ROLL = LAUNCHAZ-AZIMUTH-.5+SATRLRT*T
// PORT: SOURCE P11.agc:557
//		SLOAD	DMP
// PORT: Fixed ROM slots 33907.
    33907, 34234,
// PORT: SOURCE P11.agc:558
//			SPOLYARG	# TIME1 - RSPSTART ,CSECS B-14.
// PORT: Fixed ROM slots 33908.
    33908, 3472,
// PORT: SOURCE P11.agc:559
//			SATRLRT
// PORT: Fixed ROM slots 33909.
    33909, 3458,
// PORT: SOURCE P11.agc:560
//		SL	DSU
// PORT: Fixed ROM slots 33910.
    33910, 38242,
// PORT: SOURCE P11.agc:561
//			14D
// PORT: Fixed ROM slots 33911.
    33911, 16670,
// PORT: SOURCE P11.agc:562
//			DPHALF
// PORT: Fixed ROM slots 33912.
    33912, 13750,
// PORT: SOURCE P11.agc:563
//		DAD	DSU		# ASSUMING X(SM) ALONG LAUNCH AZIMUTH,
// PORT: Fixed ROM slots 33913.
    33913, 38170,
// PORT: SOURCE P11.agc:564
//			LAUNCHAZ	# LAUNCHAZ = ANGLE FROM NORTH TO X(SM).
// PORT: Fixed ROM slots 33914.
    33914, 2872,
// PORT: SOURCE P11.agc:565
//			AZIMUTH		# AZIMUTH = -ANGLE FROM NORTH TO Z(S/C)
// PORT: Fixed ROM slots 33915.
    33915, 2562,
// PORT: SOURCE P11.agc:566
//		RTB			# DETERMINE IF ROLLOUT
// PORT: Fixed ROM slots 33916.
    33916, 65336,
// PORT: SOURCE P11.agc:567
//			RLTST		# IS COMPLETED
// PORT: Fixed ROM slots 33917.
    33917, 58120,
// PORT: SOURCE P11.agc:568
//ATTDISPR	PUSH	COS		# CONTINUE COMPUTING TSMV
// PORT: Fixed ROM slots 33918.
    33918, 58892,
// PORT: SOURCE P11.agc:569
//		PUSH			# LET	R(RAD) = 2*PI*ROLL(REV)
// PORT: Fixed ROM slots 33919.
    33919, 65292,
// PORT: SOURCE P11.agc:570
//		DMP	SL1
// PORT: Fixed ROM slots 33920.
    33920, 59914,
// PORT: SOURCE P11.agc:571
//			14D
// PORT: Fixed ROM slots 33921.
    33921, 30,
// PORT: SOURCE P11.agc:572
//		STODL	22D		# -.5*COS(R)*COS(P)
// PORT: Fixed ROM slots 33922.
    33922, 12334,
// PORT: SOURCE P11.agc:573
//		DCOMP
// PORT: Fixed ROM slots 33923.
    33923, 65404,
// PORT: SOURCE P11.agc:574
//		STORE	18D		# -.5*COS(R)
// PORT: Fixed ROM slots 33924.
    33924, 38,
// PORT: SOURCE P11.agc:575
//		DMP	SL1
// PORT: Fixed ROM slots 33925.
    33925, 59914,
// PORT: SOURCE P11.agc:576
//			10D
// PORT: Fixed ROM slots 33926.
    33926, 22,
// PORT: SOURCE P11.agc:577
//		STODL	26D		# -.5*COS(R)*SIN(P)
// PORT: Fixed ROM slots 33927.
    33927, 12342,
// PORT: SOURCE P11.agc:578
//		SIN	PUSH
// PORT: Fixed ROM slots 33928.
    33928, 34524,
// PORT: SOURCE P11.agc:579
//		STORE	24D		# .5*SIN(R)
// PORT: Fixed ROM slots 33929.
    33929, 50,
// PORT: SOURCE P11.agc:580
//		DMP	SL1
// PORT: Fixed ROM slots 33930.
    33930, 59914,
// PORT: SOURCE P11.agc:581
//			14D
// PORT: Fixed ROM slots 33931.
    33931, 30,
// PORT: SOURCE P11.agc:582
//		STODL	16D		# -.5*SIN(R)*COS(P)
// PORT: Fixed ROM slots 33932.
    33932, 12322,
// PORT: SOURCE P11.agc:583
//		DCOMP
// PORT: Fixed ROM slots 33933.
    33933, 65404,
// PORT: SOURCE P11.agc:584
//		DMP	SL1
// PORT: Fixed ROM slots 33934.
    33934, 59914,
// PORT: SOURCE P11.agc:585
//			10D
// PORT: Fixed ROM slots 33935.
    33935, 22,
// PORT: SOURCE P11.agc:586
//		STOVL	20D		# -.5*SIN(R)*SIN(P)
// PORT: Fixed ROM slots 33936.
    33936, 20522,
// PORT: SOURCE P11.agc:587
//			10D
// PORT: Fixed ROM slots 33937.
    33937, 22,
// PORT: SOURCE P11.agc:588
//
// PORT: SOURCE P11.agc:589
//#	FROM TSMV FIND THE HALF UNIT VECTORS XDC,YDC,ZDC = INPUT TO CALCGTA
// PORT: SOURCE P11.agc:590
//# Page 544
// PORT: SOURCE P11.agc:591
//		UNIT
// PORT: Fixed ROM slots 33938.
    33938, 65372,
// PORT: SOURCE P11.agc:592
//		STOVL	XDC		# XDC = .5*UNIT(SIN(P),0,-COS(P))
// PORT: Fixed ROM slots 33939.
    33939, 23448,
// PORT: SOURCE P11.agc:593
//			16D
// PORT: Fixed ROM slots 33940.
    33940, 34,
// PORT: SOURCE P11.agc:594
//		UNIT
// PORT: Fixed ROM slots 33941.
    33941, 65372,
// PORT: SOURCE P11.agc:595
//		STOVL	YDC		# YDC = .5*UNIT(-SIN(R)*COS(P),-COS(R),
// PORT: Fixed ROM slots 33942.
    33942, 23460,
// PORT: SOURCE P11.agc:596
//			22D		#			-SIN(R)*SIN(P))
// PORT: Fixed ROM slots 33943.
    33943, 46,
// PORT: SOURCE P11.agc:597
//		UNIT
// PORT: Fixed ROM slots 33944.
    33944, 65372,
// PORT: SOURCE P11.agc:598
//		STCALL	ZDC		# ZDC = .5*UNIT(-COS(R)*COS(P),SIN(R),
// PORT: Fixed ROM slots 33945.
    33945, 31664,
// PORT: SOURCE P11.agc:599
//			CALCGTA		#			-COS(R)*SIN(P))
// PORT: Fixed ROM slots 33946.
    33946, 40202,
// PORT: SOURCE P11.agc:600
//
// PORT: SOURCE P11.agc:601
//#	CALL CALCGTA TO COMPUTE DESIRED SM ORIENTATION	OGC,IGC,AND MGC
// PORT: SOURCE P11.agc:602
//#				 -          -   -
// PORT: SOURCE P11.agc:603
//#	FIND DIFFERENCE VECTOR	DELTACDU = OGC-CDUX
// PORT: SOURCE P11.agc:604
//
// PORT: SOURCE P11.agc:605
//#	ENTER HERE IF ATTITUDE HOLD
// PORT: SOURCE P11.agc:606
//
// PORT: SOURCE P11.agc:607
//NOPOLYM		VLOAD	PUSH		#        OGC      IGC
// PORT: Fixed ROM slots 33947.
    33947, 34554,
// PORT: SOURCE P11.agc:608
//			OGC		# CHANGE IGC  TO  MGC FOR COMPATIBILITY
// PORT: Fixed ROM slots 33948.
    33948, 3040,
// PORT: SOURCE P11.agc:609
//		PUSH	CALL		#        MGC      OGC
// PORT: Fixed ROM slots 33949.
    33949, 37900,
// PORT: SOURCE P11.agc:610
//			CDUTRIG		# WITH Y,Z,X ORDER OF CDUSPOT
// PORT: Fixed ROM slots 33950.
    33950, 40574,
// PORT: SOURCE P11.agc:611
//		VLOAD	RTB		#  -         DPHI     OGC-CDUX ,PD4
// PORT: Fixed ROM slots 33951.
    33951, 40186,
// PORT: SOURCE P11.agc:612
//			2		# DELTACDU = DTHETA = IGC-CDUY ,   0
// PORT: Fixed ROM slots 33952.
    33952, 6,
// PORT: SOURCE P11.agc:613
//			V1STO2S		#            DPSI     MGC-CDUZ ,   2
// PORT: Fixed ROM slots 33953.
    33953, 38612,
// PORT: SOURCE P11.agc:614
//		STOVL	BOOSTEMP
// PORT: Fixed ROM slots 33954.
    33954, 23966,
// PORT: SOURCE P11.agc:615
//			ZEROVECS
// PORT: Fixed ROM slots 33955.
    33955, 13754,
// PORT: SOURCE P11.agc:616
//		STOVL	0
// PORT: Fixed ROM slots 33956.
    33956, 20482,
// PORT: SOURCE P11.agc:617
//			CDUSPOT
// PORT: Fixed ROM slots 33957.
    33957, 1006,
// PORT: SOURCE P11.agc:618
//		RTB	RTB
// PORT: Fixed ROM slots 33958.
    33958, 39992,
// PORT: SOURCE P11.agc:619
//			V1STO2S
// PORT: Fixed ROM slots 33959.
    33959, 38612,
// PORT: SOURCE P11.agc:620
//			DELSTOR
// PORT: Fixed ROM slots 33960.
    33960, 58088,
// PORT: SOURCE P11.agc:621
//		STODL	10D
// PORT: Fixed ROM slots 33961.
    33961, 12310,
// PORT: SOURCE P11.agc:622
//			SINCDUZ
// PORT: Fixed ROM slots 33962.
    33962, 962,
// PORT: SOURCE P11.agc:623
//		DMP	SL1
// PORT: Fixed ROM slots 33963.
    33963, 59914,
// PORT: SOURCE P11.agc:624
//			0
// PORT: Fixed ROM slots 33964.
    33964, 2,
// PORT: SOURCE P11.agc:625
//		DAD	SR2		# CHANGE SCALE OF AK TO 2REVS
// PORT: Fixed ROM slots 33965.
    33965, 49690,
// PORT: SOURCE P11.agc:626
//			4
// PORT: Fixed ROM slots 33966.
    33966, 10,
// PORT: SOURCE P11.agc:627
//		GOTO
// PORT: Fixed ROM slots 33967.
    33967, 65360,
// PORT: SOURCE P11.agc:628
//			ATTDISP2
// PORT: Fixed ROM slots 33968.
    33968, 57884,
// PORT: SOURCE P11.agc:629
//
// PORT: SOURCE P11.agc:630
//		SETLOC	P11ONE
// PORT: SOURCE P11.agc:631
//		BANK
// PORT: SOURCE P11.agc:632
//		COUNT	34/P11
// PORT: SOURCE P11.agc:633
//
// PORT: SOURCE P11.agc:634
//ATTDISP2	STODL	16D		# 16D, .5(DPHI + DTHETA*SIN(CDUZ))
// PORT: Fixed ROM slots 30990.
    30990, 12322,
// PORT: SOURCE P11.agc:635
//			COSCDUZ
// PORT: Fixed ROM slots 30991.
    30991, 974,
// PORT: SOURCE P11.agc:636
//		DMP	PUSH
// PORT: Fixed ROM slots 30992.
    30992, 34314,
// PORT: SOURCE P11.agc:637
//			0
// PORT: Fixed ROM slots 30993.
    30993, 2,
// PORT: SOURCE P11.agc:638
//		DMP	SL1
// PORT: Fixed ROM slots 30994.
    30994, 59914,
// PORT: SOURCE P11.agc:639
//			COSCDUX
// PORT: Fixed ROM slots 30995.
    30995, 978,
// PORT: SOURCE P11.agc:640
//		PDDL	DMP
// PORT: Fixed ROM slots 30996.
    30996, 34218,
// PORT: SOURCE P11.agc:641
//# Page 545
// PORT: SOURCE P11.agc:642
//			SINCDUX
// PORT: Fixed ROM slots 30997.
    30997, 966,
// PORT: SOURCE P11.agc:643
//			2
// PORT: Fixed ROM slots 30998.
    30998, 6,
// PORT: SOURCE P11.agc:644
//		DAD	SL1
// PORT: Fixed ROM slots 30999.
    30999, 59930,
// PORT: SOURCE P11.agc:645
//		STADR
// PORT: Fixed ROM slots 31000.
    31000, 65324,
// PORT: SOURCE P11.agc:646
//		STODL	17D		# 17D,	.5(DTHETA*COS(CDUX)*COS(CDUZ)
// PORT: Fixed ROM slots 31001.
    31001, 53210,
// PORT: SOURCE P11.agc:647
//		DMP	SL1		#			+DPSI*SIN(CDUX))
// PORT: Fixed ROM slots 31002.
    31002, 59914,
// PORT: SOURCE P11.agc:648
//			SINCDUX
// PORT: Fixed ROM slots 31003.
    31003, 966,
// PORT: SOURCE P11.agc:649
//		PDDL	DMP
// PORT: Fixed ROM slots 31004.
    31004, 34218,
// PORT: SOURCE P11.agc:650
//			COSCDUX
// PORT: Fixed ROM slots 31005.
    31005, 978,
// PORT: SOURCE P11.agc:651
//			2
// PORT: Fixed ROM slots 31006.
    31006, 6,
// PORT: SOURCE P11.agc:652
//		DSU	SL1
// PORT: Fixed ROM slots 31007.
    31007, 59946,
// PORT: SOURCE P11.agc:653
//		STADR
// PORT: Fixed ROM slots 31008.
    31008, 65324,
// PORT: SOURCE P11.agc:654
//		STORE	18D		# 18D,	.5(-DTHETA*SIN(CDUX)*COS(CDUZ)
// PORT: Fixed ROM slots 31009.
    31009, 65496,
// PORT: SOURCE P11.agc:655
//		TLOAD			#			+DPSI*COS(CDUX))
// PORT: Fixed ROM slots 31010.
    31010, 65490,
// PORT: SOURCE P11.agc:656
//			16D
// PORT: Fixed ROM slots 31011.
    31011, 34,
// PORT: SOURCE P11.agc:657
//		STORE	AK		# STORE ATTITUDE ERRORS IN AK,AK1,AK2
// PORT: Fixed ROM slots 31012.
    31012, 3198,
// PORT: SOURCE P11.agc:658
//		EXIT
// PORT: Fixed ROM slots 31013.
    31013, 65532
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31014–31018.
function agcAotUnit1765 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31015 {
        if slot <= 31014 {
// PORT: SOURCE P11.agc:659
//
// PORT: SOURCE P11.agc:660
//		CA      SATSW
// PORT: Fixed ROM slots 31014.
            if slot <> 31014 or instruction <> 13269 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 981).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P11.agc:661
//		CCS     A               # CHK TAKEOVER STATUS
// PORT: Fixed ROM slots 31015.
            if slot <> 31015 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 31016 {
// PORT: SOURCE P11.agc:662
//		TC      SATOUT          # POS - DISPLAY ONLY
// PORT: Fixed ROM slots 31016.
            if slot <> 31016 or instruction <> 1337 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1337, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31017 {
// PORT: SOURCE P11.agc:663
//		TC      AKLOAD          # 0     STORE BIAS
// PORT: Fixed ROM slots 31017.
                if slot <> 31017 or instruction <> 1343 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1343, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P11.agc:664
//STEERSAT        TC      INTPRET         # NEG   STEER L/V
// PORT: Fixed ROM slots 31018.
                if slot <> 31018 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1765] to agcAotUnit1765@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:665
//		TLOAD   TAD
// PORT: Fixed ROM slots 31019.
    31019, 63954,
// PORT: SOURCE P11.agc:666
//			BIASAK
// PORT: Fixed ROM slots 31020.
    31020, 3502,
// PORT: SOURCE P11.agc:667
//			AK
// PORT: Fixed ROM slots 31021.
    31021, 3198,
// PORT: SOURCE P11.agc:668
//		STORE   AK              # AKS = AKS - STORED BIAS
// PORT: Fixed ROM slots 31022.
    31022, 3198,
// PORT: SOURCE P11.agc:669
//		EXIT
// PORT: Fixed ROM slots 31023.
    31023, 65532
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31024–31033.
function agcAotUnit1766 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31028 {
        if slot <= 31025 {
            if slot <= 31024 {
// PORT: SOURCE P11.agc:670
//		CA      AK
// PORT: Fixed ROM slots 31024.
                if slot <> 31024 or instruction <> 13118 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 830).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P11.agc:671
//		TC      RESCALES
// PORT: Fixed ROM slots 31025.
                if slot <> 31025 or instruction <> 1427 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1427, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 31026 {
// PORT: SOURCE P11.agc:672
//		TS      AK
// PORT: Fixed ROM slots 31026.
                if slot <> 31026 or instruction <> 23358 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23358, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31027 {
// PORT: SOURCE P11.agc:673
//		CA      AK1
// PORT: Fixed ROM slots 31027.
                    if slot <> 31027 or instruction <> 13119 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 831).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:674
//		TC      RESCALES
// PORT: Fixed ROM slots 31028.
                    if slot <> 31028 or instruction <> 1427 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1427, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 31030 {
            if slot <= 31029 {
// PORT: SOURCE P11.agc:675
//		TS      AK1
// PORT: Fixed ROM slots 31029.
                if slot <> 31029 or instruction <> 23359 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23359, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P11.agc:676
//		CA      AK2
// PORT: Fixed ROM slots 31030.
                if slot <> 31030 or instruction <> 13120 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 832).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 31031 {
// PORT: SOURCE P11.agc:677
//		TC      RESCALES
// PORT: Fixed ROM slots 31031.
                if slot <> 31031 or instruction <> 1427 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1427, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31032 {
// PORT: SOURCE P11.agc:678
//		TS      AK2
// PORT: Fixed ROM slots 31032.
                    if slot <> 31032 or instruction <> 23360 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23360, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:679
//# DISPLAY ATTITUDE ERRORS ON FDAI VIA NEEDLER
// PORT: SOURCE P11.agc:680
//
// PORT: SOURCE P11.agc:681
//SATOUT		TC	BANKCALL
// PORT: Fixed ROM slots 31033.
                    if slot <> 31033 or instruction <> 2482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1766] to agcAotUnit1766@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:682
//		CADR	NEEDLER
// PORT: Fixed ROM slots 31034.
    31034, 35360
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31035–31036.
function agcAotUnit1767 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31035 {
// PORT: SOURCE P11.agc:683
//ATERSET		CAF	OCT31		# DELAY .25 SEC
// PORT: Fixed ROM slots 31035.
        if slot <> 31035 or instruction <> 14411 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2123), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P11.agc:684
//		TC	BANKCALL	# EXECUTION + DELAY =.56SEC APPROX
// PORT: Fixed ROM slots 31036.
        if slot <> 31036 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1767] to agcAotUnit1767@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:685
//		CADR	DELAYJOB
// PORT: Fixed ROM slots 31037.
    31037, 1972
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31038–31054.
function agcAotUnit1768 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31045 {
        if slot <= 31041 {
            if slot <= 31039 {
                if slot <= 31038 {
// PORT: SOURCE P11.agc:686
//		TC	ATERJOB		# END OF ATT ERROR DISPLAY CYCLE
// PORT: Fixed ROM slots 31038.
                    if slot <> 31038 or instruction <> 1253 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1253, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:687
//
// PORT: SOURCE P11.agc:688
//AKLOAD          CS      AK              # STORE AKS
// PORT: Fixed ROM slots 31039.
                    if slot <> 31039 or instruction <> 17214 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 830).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 31040 {
// PORT: SOURCE P11.agc:689
//		TS      BIASAK          # INTO BIAS
// PORT: Fixed ROM slots 31040.
                    if slot <> 31040 or instruction <> 23510 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23510, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:690
//		CS      AK1             # COMPLEMENTED
// PORT: Fixed ROM slots 31041.
                    if slot <> 31041 or instruction <> 17215 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 831).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 31043 {
                if slot <= 31042 {
// PORT: SOURCE P11.agc:691
//		TS      BIASAK +1
// PORT: Fixed ROM slots 31042.
                    if slot <> 31042 or instruction <> 23511 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23511, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:692
//# Page 546
// PORT: SOURCE P11.agc:693
//		CS      AK2
// PORT: Fixed ROM slots 31043.
                    if slot <> 31043 or instruction <> 17216 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 832).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 31044 {
// PORT: SOURCE P11.agc:694
//		TS      BIASAK +2
// PORT: Fixed ROM slots 31044.
                    if slot <> 31044 or instruction <> 23512 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23512, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:695
//		CS      BIT1            # SET SW
// PORT: Fixed ROM slots 31045.
                    if slot <> 31045 or instruction <> 18959 { return choose false if checkOnly else -1. }
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
        if slot <= 31049 {
            if slot <= 31047 {
                if slot <= 31046 {
// PORT: SOURCE P11.agc:696
//		TS      SATSW           # TO STEER
// PORT: Fixed ROM slots 31046.
                    if slot <> 31046 or instruction <> 23509 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23509, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:697
//		TC      STEERSAT        # GO STEER
// PORT: Fixed ROM slots 31047.
                    if slot <> 31047 or instruction <> 1322 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1322, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 31048 {
// PORT: SOURCE P11.agc:698
//STRSAT		CA      SATSW           # CHECK IF NEEDLER
// PORT: Fixed ROM slots 31048.
                    if slot <> 31048 or instruction <> 13269 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 981).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:699
//		EXTEND                  # HAS BEEN INITIALIZED
// PORT: Fixed ROM slots 31049.
                    if slot <> 31049 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 31051 {
                if slot <= 31050 {
// PORT: SOURCE P11.agc:700
//		BZMF    ATTDISP         # YES - CONTINUE
// PORT: Fixed ROM slots 31050.
                    if slot <> 31050 or instruction <> 25843 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25843, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:701
//ATRESET		CS      RCSFLAGS        # NO - SET
// PORT: Fixed ROM slots 31051.
                    if slot <> 31051 or instruction <> 17217 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 833).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 31052 {
// PORT: SOURCE P11.agc:702
//		MASK    BIT3            # INITIALIZATION SW
// PORT: Fixed ROM slots 31052.
                    if slot <> 31052 or instruction <> 31245 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                        if fixedOperand = 4 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 4), 2) * 4).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 31053 {
// PORT: SOURCE P11.agc:703
//		ADS     RCSFLAGS        # FOR NEEDLER
// PORT: Fixed ROM slots 31053.
                        if slot <> 31053 or instruction <> 12097 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 833).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:704
//		TC      BANKCALL        # AND GO
// PORT: Fixed ROM slots 31054.
                        if slot <> 31054 or instruction <> 2482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1768] to agcAotUnit1768@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:705
//		CADR    NEEDLER         # DO IT
// PORT: Fixed ROM slots 31055.
    31055, 35360
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31056–31057.
function agcAotUnit1769 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31056 {
// PORT: SOURCE P11.agc:706
//		CAF     REVCNT          # OCT 6
// PORT: Fixed ROM slots 31056.
        if slot <> 31056 or instruction <> 15497 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 3209), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P11.agc:707
//		TC      BANKCALL        # DELAY JOB
// PORT: Fixed ROM slots 31057.
        if slot <> 31057 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1769] to agcAotUnit1769@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:708
//		CADR    DELAYJOB        # 60 MS -WAIT TILL IMUERRCNTR ZEROED
// PORT: Fixed ROM slots 31058.
    31058, 1972
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31059–31073.
function agcAotUnit1770 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31065 {
        if slot <= 31061 {
            if slot <= 31059 {
// PORT: SOURCE P11.agc:709
//		CCS     SATSW          	# CHECK SW STATUS
// PORT: Fixed ROM slots 31059.
                if slot <> 31059 or instruction <> 5077 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 981).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31060 {
// PORT: SOURCE P11.agc:710
//		TC      TAKEON          # POS   STEER INIT.
// PORT: Fixed ROM slots 31060.
                    if slot <> 31060 or instruction <> 1372 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1372, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:711
//		TC      +1              # 0     RETURN TO DISPLAY
// PORT: Fixed ROM slots 31061.
                    if slot <> 31061 or instruction <> 1366 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1366, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 31063 {
                if slot <= 31062 {
// PORT: SOURCE P11.agc:712
//		CA      BIT1            # NEG   RETURN TO DISPLAY
// PORT: Fixed ROM slots 31062.
                    if slot <> 31062 or instruction <> 14863 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:713
//		TS      SATSW           # SW = DISPLAY ON
// PORT: Fixed ROM slots 31063.
                    if slot <> 31063 or instruction <> 23509 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23509, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 31064 {
// PORT: SOURCE P11.agc:714
//		CS      BIT9            # DISABLE
// PORT: Fixed ROM slots 31064.
                    if slot <> 31064 or instruction <> 18951 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:715
//		EXTEND                  # SIVB
// PORT: Fixed ROM slots 31065.
                    if slot <> 31065 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 31069 {
            if slot <= 31067 {
                if slot <= 31066 {
// PORT: SOURCE P11.agc:716
//		WAND    CHAN12          # TAKEOVER
// PORT: Fixed ROM slots 31066.
                    if slot <> 31066 or instruction <> 1546 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:717
//		TC      SATOUT          # DISPLAY
// PORT: Fixed ROM slots 31067.
                    if slot <> 31067 or instruction <> 1337 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1337, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 31068 {
// PORT: SOURCE P11.agc:718
//TAKEON          CAF     BIT9            # ENABLE
// PORT: Fixed ROM slots 31068.
                    if slot <> 31068 or instruction <> 14855 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:719
//		EXTEND                  # SIVB
// PORT: Fixed ROM slots 31069.
                    if slot <> 31069 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 31071 {
                if slot <= 31070 {
// PORT: SOURCE P11.agc:720
//		WOR     CHAN12          # TAKEOVER
// PORT: Fixed ROM slots 31070.
                    if slot <> 31070 or instruction <> 2570 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:721
//		CA      ZERO            # INDICATE NEEDLER
// PORT: Fixed ROM slots 31071.
                    if slot <> 31071 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
                if slot <= 31072 {
// PORT: SOURCE P11.agc:722
//		TS      SATSW           # WAS INITIALIZED
// PORT: Fixed ROM slots 31072.
                    if slot <> 31072 or instruction <> 23509 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23509, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:723
//		TC      SATOUT
// PORT: Fixed ROM slots 31073.
                    if slot <> 31073 or instruction <> 1337 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1337, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1770] to agcAotUnit1770@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:724
//S11.1		VLOAD	ABVAL
// PORT: Fixed ROM slots 31074.
    31074, 42746,
// PORT: SOURCE P11.agc:725
//			VN
// PORT: Fixed ROM slots 31075.
    31075, 1278,
// PORT: SOURCE P11.agc:726
//		STOVL	VMAGI		# VI	SCALED 2(7) IN METERS/CSEC
// PORT: Fixed ROM slots 31076.
    31076, 24486,
// PORT: SOURCE P11.agc:727
//			RN
// PORT: Fixed ROM slots 31077.
    31077, 1266,
// PORT: SOURCE P11.agc:728
//		UNIT    DOT
// PORT: Fixed ROM slots 31078.
    31078, 41308,
// PORT: SOURCE P11.agc:729
//		        VN
// PORT: Fixed ROM slots 31079.
    31079, 1278,
// PORT: SOURCE P11.agc:730
//		SL1
// PORT: Fixed ROM slots 31080.
    31080, 65492,
// PORT: SOURCE P11.agc:731
//		STODL   HDOT
// PORT: Fixed ROM slots 31081.
    31081, 16318,
// PORT: SOURCE P11.agc:732
//		        RPAD
// PORT: Fixed ROM slots 31082.
    31082, 5332,
// PORT: SOURCE P11.agc:733
//		BOF     VLOAD
// PORT: Fixed ROM slots 31083.
    31083, 64792,
// PORT: SOURCE P11.agc:734
//		        AMOONFLG
// PORT: Fixed ROM slots 31084.
    31084, 474,
// PORT: SOURCE P11.agc:735
//		        EARTHALT
// PORT: Fixed ROM slots 31085.
    31085, 58080,
// PORT: SOURCE P11.agc:736
//		        RLS
// PORT: Fixed ROM slots 31086.
    31086, 2092,
// PORT: SOURCE P11.agc:737
//		ABVAL	SR2
// PORT: Fixed ROM slots 31087.
    31087, 49740,
// PORT: SOURCE P11.agc:738
//EARTHALT         BDSU
// PORT: Fixed ROM slots 31088.
    31088, 65314,
// PORT: SOURCE P11.agc:739
//		        36D
// PORT: Fixed ROM slots 31089.
    31089, 74,
// PORT: SOURCE P11.agc:740
//		STORE   ALTI
// PORT: Fixed ROM slots 31090.
    31090, 4026,
// PORT: SOURCE P11.agc:741
//		RVQ
// PORT: Fixed ROM slots 31091.
    31091, 65308
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31092–31095.
function agcAotUnit1771 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31093 {
        if slot <= 31092 {
// PORT: SOURCE P11.agc:742
//DELSTOR		CA	BOOSTEMP
// PORT: Fixed ROM slots 31092.
            if slot <> 31092 or instruction <> 13262 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 974).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P11.agc:743
//# Page 547
// PORT: SOURCE P11.agc:744
//		EXTEND			# STORE DELTACDU INTO PDL 0,2,4
// PORT: Fixed ROM slots 31093.
            if slot <> 31093 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 31094 {
// PORT: SOURCE P11.agc:745
//		MSU	MPAC
// PORT: Fixed ROM slots 31094.
            if slot <> 31094 or instruction <> 8300 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMSU(words, 108).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P11.agc:746
//		INDEX	FIXLOC
// PORT: Fixed ROM slots 31095.
            if slot <> 31095 or instruction <> 20560 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1771] to agcAotUnit1771@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:747
//		TS	0
// PORT: Fixed ROM slots 31096.
    31096, 45056
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31097–31100.
function agcAotUnit1772 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31098 {
        if slot <= 31097 {
// PORT: SOURCE P11.agc:748
//		CA	BOOSTEMP +1
// PORT: Fixed ROM slots 31097.
            if slot <> 31097 or instruction <> 13263 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 975).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P11.agc:749
//		EXTEND
// PORT: Fixed ROM slots 31098.
            if slot <> 31098 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 31099 {
// PORT: SOURCE P11.agc:750
//		MSU	MPAC +1
// PORT: Fixed ROM slots 31099.
            if slot <> 31099 or instruction <> 8301 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMSU(words, 109).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P11.agc:751
//		INDEX	FIXLOC
// PORT: Fixed ROM slots 31100.
            if slot <> 31100 or instruction <> 20560 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1772] to agcAotUnit1772@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:752
//		TS	2
// PORT: Fixed ROM slots 31101.
    31101, 45060
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31102–31105.
function agcAotUnit1773 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31103 {
        if slot <= 31102 {
// PORT: SOURCE P11.agc:753
//		CA	BOOSTEMP +2
// PORT: Fixed ROM slots 31102.
            if slot <> 31102 or instruction <> 13264 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 976).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P11.agc:754
//		EXTEND
// PORT: Fixed ROM slots 31103.
            if slot <> 31103 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 31104 {
// PORT: SOURCE P11.agc:755
//		MSU	MPAC +2
// PORT: Fixed ROM slots 31104.
            if slot <> 31104 or instruction <> 8302 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMSU(words, 110).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P11.agc:756
//		INDEX	FIXLOC
// PORT: Fixed ROM slots 31105.
            if slot <> 31105 or instruction <> 20560 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1773] to agcAotUnit1773@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:757
//		TS	4
// PORT: Fixed ROM slots 31106.
    31106, 45064
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31107–31117.
function agcAotUnit1774 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31111 {
        if slot <= 31108 {
            if slot <= 31107 {
// PORT: SOURCE P11.agc:758
//		TCF	DANZIG
// PORT: Fixed ROM slots 31107.
                if slot <> 31107 or instruction <> 7192 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7192, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P11.agc:759
//RLTST		CA	MPAC		# DETERMINE IF ROLLOUT
// PORT: Fixed ROM slots 31108.
                if slot <> 31108 or instruction <> 12396 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 108).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 31109 {
// PORT: SOURCE P11.agc:760
//		EXTEND			# IS COMPLETED
// PORT: Fixed ROM slots 31109.
                if slot <> 31109 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31110 {
// PORT: SOURCE P11.agc:761
//		MP	SATRLRT +1
// PORT: Fixed ROM slots 31110.
                    if slot <> 31110 or instruction <> 29633 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 961, readEffective:call(words, 961)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:762
//		EXTEND
// PORT: Fixed ROM slots 31111.
                    if slot <> 31111 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 31114 {
            if slot <= 31112 {
// PORT: SOURCE P11.agc:763
//		BZMF	DANZIG		# UNLIKE SIGNS STILL ROLLING
// PORT: Fixed ROM slots 31112.
                if slot <> 31112 or instruction <> 27672 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 27672, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31113 {
// PORT: SOURCE P11.agc:764
//		EXTEND			# ROLLOUT COMPLETED
// PORT: Fixed ROM slots 31113.
                    if slot <> 31113 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:765
//		DCA	MBDYTCTL +2	# ZERO OUT ROLL CONTRIBUTION
// PORT: Fixed ROM slots 31114.
                    if slot <> 31114 or instruction <> 14266 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 1978, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 31115 {
// PORT: SOURCE P11.agc:766
//		DXCH	MPAC
// PORT: Fixed ROM slots 31115.
                if slot <> 31115 or instruction <> 21613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31116 {
// PORT: SOURCE P11.agc:767
//		TC	DANZIG
// PORT: Fixed ROM slots 31116.
                    if slot <> 31116 or instruction <> 3096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3096, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:768
//NOPOLY		TC	INTPRET		# COMES HERE IF
// PORT: Fixed ROM slots 31117.
                    if slot <> 31117 or instruction <> 3078 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3078, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1774] to agcAotUnit1774@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:769
//		SETPD	GOTO		# ATTITUDE HOLD
// PORT: Fixed ROM slots 31118.
    31118, 43010,
// PORT: SOURCE P11.agc:770
//			0
// PORT: Fixed ROM slots 31119.
    31119, 2,
// PORT: SOURCE P11.agc:771
//			NOPOLYM
// PORT: Fixed ROM slots 31120.
    31120, 63798,
// PORT: SOURCE P11.agc:772
//COEFPOLY	ADRES	POLYLOC
// PORT: Fixed ROM slots 31121.
    31121, 1910,
// PORT: SOURCE P11.agc:773
//V06N62		VN	0662
// PORT: Fixed ROM slots 31122.
    31122, 1660
)).

// PORT: Physical bank 34. Shared continuation entries, slots 31123–31127.
function agcAotUnit1775 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31124 {
        if slot <= 31123 {
// PORT: SOURCE P11.agc:774
//RESCALES        EXTEND                  # RESCALE AK S FOR
// PORT: Fixed ROM slots 31123.
            if slot <> 31123 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P11.agc:775
//		MP      SATSCALE        # NEW HARDWARE
// PORT: Fixed ROM slots 31124.
            if slot <> 31124 or instruction <> 29657 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 985, readEffective:call(words, 985)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 31125 {
// PORT: SOURCE P11.agc:776
//		DDOUBL                  # SCALING FOR
// PORT: Fixed ROM slots 31125.
            if slot <> 31125 or instruction <> 8193 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDas(words, 1) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31126 {
// PORT: SOURCE P11.agc:777
//		DDOUBL                  # STEERING
// PORT: Fixed ROM slots 31126.
                if slot <> 31126 or instruction <> 8193 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 1) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P11.agc:778
//		TC      Q               # SATURN
// PORT: Fixed ROM slots 31127.
                if slot <> 31127 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1775] to agcAotUnit1775@.

// PORT: Physical bank 43. Shared continuation entries, slots 38541–38550.
function agcAotUnit2310 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38545 {
        if slot <= 38542 {
            if slot <= 38541 {
// PORT: SOURCE P11.agc:779
//# SATURN TAKEOVER FUNCTION
// PORT: SOURCE P11.agc:780
//# ************************
// PORT: SOURCE P11.agc:781
//
// PORT: SOURCE P11.agc:782
//# PROGRAM DESCRIPTION
// PORT: SOURCE P11.agc:783
//
// PORT: SOURCE P11.agc:784
//#	MOD NUMBER 1
// PORT: SOURCE P11.agc:785
//#	MOD BY ELIASSEN
// PORT: SOURCE P11.agc:786
//
// PORT: SOURCE P11.agc:787
//# FUNCTIONAL DESCRIPTION
// PORT: SOURCE P11.agc:788
//
// PORT: SOURCE P11.agc:789
//#	DURING THE COASTING PHASE OF SIVB ATTACHED, THE
// PORT: SOURCE P11.agc:790
//#	ASTRONAUT MAY REQUEST SATURN TAKEOVER THROUGH
// PORT: SOURCE P11.agc:791
//#	EXTENDED VERB 46 (BITS 13,14 OF DAPDATR1 SET ).
// PORT: SOURCE P11.agc:792
//#	THE CMC REGARDS RHC COMMANDS AS BODY-AXES RATE
// PORT: SOURCE P11.agc:793
//#	COMMANDS AND IT TRANSMITS THESE TO SATURN AS DC
// PORT: SOURCE P11.agc:794
//# Page 548
// PORT: SOURCE P11.agc:795
//#	VOLTAGES.  THE VALUE OF THE CONSTANT RATE COMMAND
// PORT: SOURCE P11.agc:796
//#	IS 0.5 DEG/SEC.  AN ABSENCE OF RHC ACTIVITY RE-
// PORT: SOURCE P11.agc:797
//#	SULTS IN A ZERO RATE COMMAND.
// PORT: SOURCE P11.agc:798
//
// PORT: SOURCE P11.agc:799
//#	THE FDAI ERROR NEEDLES WILL INDICATE THE VALUE
// PORT: SOURCE P11.agc:800
//#	OF THE RATE COMMAND.
// PORT: SOURCE P11.agc:801
//
// PORT: SOURCE P11.agc:802
//# CALLING SEQUENCE
// PORT: SOURCE P11.agc:803
//#
// PORT: SOURCE P11.agc:804
//#	DAPFIG +9D	TC	POSTJUMP
// PORT: SOURCE P11.agc:805
//#			CADR	SATSTKON
// PORT: SOURCE P11.agc:806
//
// PORT: SOURCE P11.agc:807
//# SUBROUTINES CALLED
// PORT: SOURCE P11.agc:808
//
// PORT: SOURCE P11.agc:809
//#	ENDEXT
// PORT: SOURCE P11.agc:810
//#	IBNKCALL
// PORT: SOURCE P11.agc:811
//#	STICKCHK
// PORT: SOURCE P11.agc:812
//#	NEEDLER
// PORT: SOURCE P11.agc:813
//#	T5RUPT
// PORT: SOURCE P11.agc:814
//#	RESUME
// PORT: SOURCE P11.agc:815
//
// PORT: SOURCE P11.agc:816
//# ASTRONAUT REQUESTS
// PORT: SOURCE P11.agc:817
//
// PORT: SOURCE P11.agc:818
//#	ENTRY	- VERB 46 ENTER
// PORT: SOURCE P11.agc:819
//#		  (CONDITION - BITS 13, 14 OF DAPDATR1 SET)
// PORT: SOURCE P11.agc:820
//#
// PORT: SOURCE P11.agc:821
//#	EXIT	- VERB 48 ENTER	(FLASH V06N46)
// PORT: SOURCE P11.agc:822
//#		  VERB 21 ENTER	AXXXX ENTER WHERE A=0 OR 1
// PORT: SOURCE P11.agc:823
//#		  VERB 34 ENTER
// PORT: SOURCE P11.agc:824
//#		  VERB 46 ENTER
// PORT: SOURCE P11.agc:825
//
// PORT: SOURCE P11.agc:826
//# NORMAL EXIT MODE
// PORT: SOURCE P11.agc:827
//
// PORT: SOURCE P11.agc:828
//#		VERB 46 ENTER	(SEE ASTRONAUT ABOVE)
// PORT: SOURCE P11.agc:829
//
// PORT: SOURCE P11.agc:830
//# ALARM OR ABORT EXIT MODES
// PORT: SOURCE P11.agc:831
//
// PORT: SOURCE P11.agc:832
//#	NONE
// PORT: SOURCE P11.agc:833
//
// PORT: SOURCE P11.agc:834
//# OUTPUT
// PORT: SOURCE P11.agc:835
//
// PORT: SOURCE P11.agc:836
//#	SATURN RATES IN CDUXCMD, CDUYCMD, CDUZCMD
// PORT: SOURCE P11.agc:837
//
// PORT: SOURCE P11.agc:838
//# ERASABLE INITIALIZATION
// PORT: SOURCE P11.agc:839
//
// PORT: SOURCE P11.agc:840
//#	DAPDATR1	(BITS 13,14 MUST BE SET)
// PORT: SOURCE P11.agc:841
//
// PORT: SOURCE P11.agc:842
//# DEBRIS
// PORT: SOURCE P11.agc:843
//
// PORT: SOURCE P11.agc:844
//#	CENTRALS
// PORT: SOURCE P11.agc:845
//# Page 549
// PORT: SOURCE P11.agc:846
//#	CDUXCMD, CDUYCMD, CDUZCMD
// PORT: SOURCE P11.agc:847
//
// PORT: SOURCE P11.agc:848
//		BANK	43
// PORT: SOURCE P11.agc:849
//		SETLOC	EXTVERBS
// PORT: SOURCE P11.agc:850
//		BANK
// PORT: SOURCE P11.agc:851
//
// PORT: SOURCE P11.agc:852
//		COUNT	23/STTKE
// PORT: SOURCE P11.agc:853
//SATSTKON	EXTEND
// PORT: Fixed ROM slots 38541.
                if slot <> 38541 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P11.agc:854
//		DCA	2REDOSAT
// PORT: Fixed ROM slots 38542.
                if slot <> 38542 or instruction <> 13979 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 1691, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38543 {
// PORT: SOURCE P11.agc:855
//		INHINT
// PORT: Fixed ROM slots 38543.
                if slot <> 38543 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38544 {
// PORT: SOURCE P11.agc:856
//		DXCH	T5LOC
// PORT: Fixed ROM slots 38544.
                    if slot <> 38544 or instruction <> 22219 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 715, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:857
//		CAF	POSMAX
// PORT: Fixed ROM slots 38545.
                    if slot <> 38545 or instruction <> 14847 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 38547 {
            if slot <= 38546 {
// PORT: SOURCE P11.agc:858
//		TS	TIME5
// PORT: Fixed ROM slots 38546.
                if slot <> 38546 or instruction <> 22552 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22552, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P11.agc:859
//		CS	FLAGWRD6	# TURN ON BITS 15,14 OF
// PORT: Fixed ROM slots 38547.
                if slot <> 38547 or instruction <> 16450 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 66).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38548 {
// PORT: SOURCE P11.agc:860
//		MASK	RELTAB11	# FLAGWRD6
// PORT: Fixed ROM slots 38548.
                if slot <> 38548 or instruction <> 30789 { return choose false if checkOnly else -1. }
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
                if slot <= 38549 {
// PORT: SOURCE P11.agc:861
//		ADS	FLAGWRD6	#	SATSTICK CONTROL OF T5
// PORT: Fixed ROM slots 38549.
                    if slot <> 38549 or instruction <> 11330 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 66).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:862
//		TC	IBNKCALL	# ZERO JET CHANNELS IN 14 MS AND THEN
// PORT: Fixed ROM slots 38550.
                    if slot <> 38550 or instruction <> 2528 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2310] to agcAotUnit2310@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:863
//		CADR	ZEROJET		# LEAVE THE T6 CLOCK DISABLED
// PORT: Fixed ROM slots 38551.
    38551, 35636
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38552–38553.
function agcAotUnit2311 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38552 {
// PORT: SOURCE P11.agc:864
//		RELINT
// PORT: Fixed ROM slots 38552.
        if slot <> 38552 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P11.agc:865
//		TC	GOPIN		# EXIT THUS BECAUSE WE CAME VIA V46
// PORT: Fixed ROM slots 38553.
        if slot <> 38553 or instruction <> 1105 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1105, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2311] to agcAotUnit2311@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:866
//
// PORT: SOURCE P11.agc:867
//		EBANK=	BODY3
// PORT: SOURCE P11.agc:868
//2REDOSAT	2CADR	REDOSAT
// PORT: Fixed ROM slots 38554 38555.
    38554, 3050, 38555, 39052
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22005–22011.
function agcAotUnit1249 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22007 {
        if slot <= 22005 {
// PORT: SOURCE P11.agc:869
//
// PORT: SOURCE P11.agc:870
//
// PORT: SOURCE P11.agc:871
//		SBANK=  LOWSUPER
// PORT: SOURCE P11.agc:872
//		BANK	32
// PORT: SOURCE P11.agc:873
//		SETLOC	P11FOUR
// PORT: SOURCE P11.agc:874
//		BANK
// PORT: SOURCE P11.agc:875
//
// PORT: SOURCE P11.agc:876
//REDOSAT		LXCH	BANKRUPT	# ALSO COMES HERE FOR RESTARTS
// PORT: Fixed ROM slots 22005.
            if slot <> 22005 or instruction <> 9230 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 14, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 22006 {
// PORT: SOURCE P11.agc:877
//		EXTEND
// PORT: Fixed ROM slots 22006.
                if slot <> 22006 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P11.agc:878
//		QXCH	QRUPT
// PORT: Fixed ROM slots 22007.
                if slot <> 22007 or instruction <> 9226 { return choose false if checkOnly else -1. }
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
        if slot <= 22009 {
            if slot <= 22008 {
// PORT: SOURCE P11.agc:879
//		CS	RCSFLAGS	# TURN ON BIT3 OF RCSFLAGX
// PORT: Fixed ROM slots 22008.
                if slot <> 22008 or instruction <> 17217 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 833).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P11.agc:880
//		MASK	BIT3		# FOR
// PORT: Fixed ROM slots 22009.
                if slot <> 22009 or instruction <> 31245 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                    if fixedOperand = 4 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 4), 2) * 4).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 22010 {
// PORT: SOURCE P11.agc:881
//		ADS	RCSFLAGS	# NEEDLER INITIALIZATION
// PORT: Fixed ROM slots 22010.
                if slot <> 22010 or instruction <> 12097 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 833).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P11.agc:882
//		TC	IBNKCALL
// PORT: Fixed ROM slots 22011.
                if slot <> 22011 or instruction <> 2528 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2528, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1249] to agcAotUnit1249@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:883
//		CADR	NEEDLER		# DISABLE IMU ERR COUNTERS ETC.
// PORT: Fixed ROM slots 22012.
    22012, 35360
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22013–22033.
function agcAotUnit1250 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22022 {
        if slot <= 22017 {
            if slot <= 22014 {
                if slot <= 22013 {
// PORT: SOURCE P11.agc:884
//		CAF	BIT9		# SIVB
// PORT: Fixed ROM slots 22013.
                    if slot <> 22013 or instruction <> 14855 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:885
//		EXTEND			# TAKEOVER
// PORT: Fixed ROM slots 22014.
                    if slot <> 22014 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 22015 {
// PORT: SOURCE P11.agc:886
//		WOR	CHAN12		# ENABLE
// PORT: Fixed ROM slots 22015.
                    if slot <> 22015 or instruction <> 2570 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22016 {
// PORT: SOURCE P11.agc:887
//		EXTEND			# SET UP T5 CYCLE
// PORT: Fixed ROM slots 22016.
                        if slot <> 22016 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:888
//		DCA	2SATSTCK
// PORT: Fixed ROM slots 22017.
                        if slot <> 22017 or instruction <> 13858 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 1570, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 22019 {
                if slot <= 22018 {
// PORT: SOURCE P11.agc:889
//		DXCH	T5LOC
// PORT: Fixed ROM slots 22018.
                    if slot <> 22018 or instruction <> 22219 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 715, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:890
//		CAF	100MST5		# IN 100 MSECS
// PORT: Fixed ROM slots 22019.
                    if slot <> 22019 or instruction <> 13856 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1568), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 22020 {
// PORT: SOURCE P11.agc:891
//		TS	TIME5
// PORT: Fixed ROM slots 22020.
                    if slot <> 22020 or instruction <> 22552 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22552, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22021 {
// PORT: SOURCE P11.agc:892
//		TCF	RESUME		# END OF SATURN STICK INITIALIZATION
// PORT: Fixed ROM slots 22021.
                        if slot <> 22021 or instruction <> 6875 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6875, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:893
//
// PORT: SOURCE P11.agc:894
//#	THIS SECTION IS EXECUTED EVERY 100 MSECS
// PORT: SOURCE P11.agc:895
//# Page 550
// PORT: SOURCE P11.agc:896
//SATSTICK	LXCH	BANKRUPT
// PORT: Fixed ROM slots 22022.
                        if slot <> 22022 or instruction <> 9230 { return choose false if checkOnly else -1. }
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
        if slot <= 22027 {
            if slot <= 22024 {
                if slot <= 22023 {
// PORT: SOURCE P11.agc:897
//		EXTEND
// PORT: Fixed ROM slots 22023.
                    if slot <> 22023 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE P11.agc:898
//		QXCH	QRUPT
// PORT: Fixed ROM slots 22024.
                    if slot <> 22024 or instruction <> 9226 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 2, 10, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 22025 {
// PORT: SOURCE P11.agc:899
//
// PORT: SOURCE P11.agc:900
//		CAF	2SATSTCK	# SET UP RUPT
// PORT: Fixed ROM slots 22025.
                    if slot <> 22025 or instruction <> 13857 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1569), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22026 {
// PORT: SOURCE P11.agc:901
//		TS	T5LOC		# LO ORDER LOC SET
// PORT: Fixed ROM slots 22026.
                        if slot <> 22026 or instruction <> 23242 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23242, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:902
//		CAF	100MST5		# 100 MSECS
// PORT: Fixed ROM slots 22027.
                        if slot <> 22027 or instruction <> 13856 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1568), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 22030 {
                if slot <= 22028 {
// PORT: SOURCE P11.agc:903
//		TS	TIME5
// PORT: Fixed ROM slots 22028.
                    if slot <> 22028 or instruction <> 22552 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22552, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22029 {
// PORT: SOURCE P11.agc:904
//		CAF	STIKBITS
// PORT: Fixed ROM slots 22029.
                        if slot <> 22029 or instruction <> 13855 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1567), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:905
//		EXTEND
// PORT: Fixed ROM slots 22030.
                        if slot <> 22030 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 22031 {
// PORT: SOURCE P11.agc:906
//		RXOR	CHAN31		# CHECK IF MAN ROT BITS SAME
// PORT: Fixed ROM slots 22031.
                    if slot <> 22031 or instruction <> 3097 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 6, 25, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22032 {
// PORT: SOURCE P11.agc:907
//		MASK	STIKBITS
// PORT: Fixed ROM slots 22032.
                        if slot <> 22032 or instruction <> 30239 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 1567), 32768).
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE P11.agc:908
//		TC	IBNKCALL	# SET RATE INDICES
// PORT: Fixed ROM slots 22033.
                        if slot <> 22033 or instruction <> 2528 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1250] to agcAotUnit1250@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:909
//		CADR	STICKCHK	# FOR PITCH YAW AND ROLL
// PORT: Fixed ROM slots 22034.
    22034, 36016
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22035–22035.
function agcAotUnit1251 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P11.agc:910
//
// PORT: SOURCE P11.agc:911
//		INDEX	RMANNDX		# SET SATURN RATES
// PORT: Fixed ROM slots 22035.
    if slot <> 22035 or instruction <> 21422 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21422, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21422, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1251] to agcAotUnit1251@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:912
//		CA	SATRATE
// PORT: Fixed ROM slots 22036.
    22036, 26530
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22037–22038.
function agcAotUnit1252 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22037 {
// PORT: SOURCE P11.agc:913
//		TS	AK		#		ROLL
// PORT: Fixed ROM slots 22037.
        if slot <> 22037 or instruction <> 23358 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23358, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P11.agc:914
//		INDEX	PMANNDX
// PORT: Fixed ROM slots 22038.
        if slot <> 22038 or instruction <> 21423 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21423, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21423, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1252] to agcAotUnit1252@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:915
//		CA	SATRATE
// PORT: Fixed ROM slots 22039.
    22039, 26530
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22040–22041.
function agcAotUnit1253 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22040 {
// PORT: SOURCE P11.agc:916
//		TS	AK1		#		PITCH
// PORT: Fixed ROM slots 22040.
        if slot <> 22040 or instruction <> 23359 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23359, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P11.agc:917
//		INDEX	YMANNDX
// PORT: Fixed ROM slots 22041.
        if slot <> 22041 or instruction <> 21424 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21424, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21424, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1253] to agcAotUnit1253@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:918
//		CA	SATRATE
// PORT: Fixed ROM slots 22042.
    22042, 26530
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22043–22044.
function agcAotUnit1254 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22043 {
// PORT: SOURCE P11.agc:919
//		TS	AK2		#		YAW
// PORT: Fixed ROM slots 22043.
        if slot <> 22043 or instruction <> 23360 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23360, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P11.agc:920
//
// PORT: SOURCE P11.agc:921
//		TC	IBNKCALL	# FOR SATURN INTERFACE AND FDAI DISPLAY
// PORT: Fixed ROM slots 22044.
        if slot <> 22044 or instruction <> 2528 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2528, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1254] to agcAotUnit1254@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:922
//		CADR	NEEDLER
// PORT: Fixed ROM slots 22045.
    22045, 35360
)).

// PORT: Physical bank 23. Shared continuation entries, slots 22046–22046.
function agcAotUnit1255 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P11.agc:923
//		TCF	RESUME		# END OF SATURN STICK CONTROL
// PORT: Fixed ROM slots 22046.
    if slot <> 22046 or instruction <> 6875 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6875, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1255] to agcAotUnit1255@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P11.agc:924
//
// PORT: SOURCE P11.agc:925
//STIKBITS	OCT	00077
// PORT: Fixed ROM slots 22047.
    22047, 126,
// PORT: SOURCE P11.agc:926
//100MST5		DEC	16374
// PORT: Fixed ROM slots 22048.
    22048, 32748,
// PORT: SOURCE P11.agc:927
//		EBANK=	BODY3
// PORT: SOURCE P11.agc:928
//2SATSTCK	2CADR	SATSTICK
// PORT: Fixed ROM slots 22049 22050.
    22049, 3084, 22050, 39020
)).

