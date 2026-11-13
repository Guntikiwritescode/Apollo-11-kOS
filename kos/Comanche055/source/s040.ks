// P11.agc
// bank 34, slots 30722-30752
function agcAotUnit1742 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30736 {
        if slot <= 30728 {
            if slot <= 30724 {
                if slot <= 30722 {
// P11.agc:1
//# Copyright:    Public domain.
// P11.agc:2
//# Filename:     P11.agc
// P11.agc:3
//# Purpose:      Part of the source code for Colossus 2A, AKA Comanche 055.
// P11.agc:4
//#               It is part of the source code for the Command Module's (CM)
// P11.agc:5
//#               Apollo Guidance Computer (AGC), for Apollo 11.
// P11.agc:6
//# Assembler:    yaYUL
// P11.agc:7
//# Contact:      Gutsche Kerman <hgutsche@xplornet.com>.
// P11.agc:8
//# Website:      www.ibiblio.org/apollo.
// P11.agc:9
//# Pages:	533-550
// P11.agc:10
//# Mod history:  2009-05-13 HG   Started adapting from the Colossus249/ file
// P11.agc:11
//#                		of the same name, using Comanche055 page
// P11.agc:12
//#                		images 0533.jpg - 0550.jpg.
// P11.agc:13
//#		2009-05-20 RSB	Corrections: ERTHALT -> EARTHALT,
// P11.agc:14
//#				STATSW -> SATSW.
// P11.agc:15
//#		2009-05-23 RSB	At end of RESCALES, corrected TC 0 to TC Q.
// P11.agc:16
//#				Added an SBANK= prior to a 2CADR.
// P11.agc:17
//#		2010-08-24 JL	Fixed page numbers. Added missing comment character on p537.
// P11.agc:18
//#
// P11.agc:19
//# This source code has been transcribed or otherwise adapted from digitized
// P11.agc:20
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// P11.agc:21
//# by Fjeld Kerman, and arranged for by Douglas Kerman of the Museum.  Many
// P11.agc:22
//# thanks to both.  The images (with suitable reduction in storage size and
// P11.agc:23
//# consequent reduction in image quality as well) are available online at
// P11.agc:24
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// P11.agc:25
//# illegible, contact me at info@sandroid.org about getting access to the
// P11.agc:26
//# (much) higher-quality images which Fjeld Kerman actually created.
// P11.agc:27
//#
// P11.agc:28
//# Notations on the hardcopy document read, in part:
// P11.agc:29
//#
// P11.agc:30
//#    Assemble revision 055 of AGC program Comanche by NASA
// P11.agc:31
//#    2021113-051.  10:28 APR. 1, 1969
// P11.agc:32
//#
// P11.agc:33
//#    This AGC program shall also be referred to as
// P11.agc:34
//#            Colossus 2A
// P11.agc:35
//# Page 533
// P11.agc:36
//# KERBIN ORBIT INSERTION MONITOR PROGRAM
// P11.agc:37
//# *************************************
// P11.agc:38
//
// P11.agc:39
//# PROGRAM DESCRIPTION -P11-
// P11.agc:40
//
// P11.agc:41
//#	MOD NO. 1
// P11.agc:42
//#	MOD BY ELIASSEN KERMAN
// P11.agc:43
//
// P11.agc:44
//# FUNCTIONAL DESCRIPTION
// P11.agc:45
//
// P11.agc:46
//#	P11 IS INITIATED BY
// P11.agc:47
//
// P11.agc:48
//#		A) GYROCOMPASS PRG P02 WHEN LIFTOFF DISCRETE IS RECEIVED OR
// P11.agc:49
//#		B) BACKUP THRU VERB 75 ENTER
// P11.agc:50
//
// P11.agc:51
//#	PROGRAM WILL
// P11.agc:52
//#		1. ZERO CMC CLOCK AT LIFTOFF (OR UPON RECEIPT OF BACKUP)
// P11.agc:53
//#		2. UPDATE TEPHEM TO TIME CMC CLOCK WAS ZEROED
// P11.agc:54
//#		3. INITIATE SERVICER AT PREREAD1
// P11.agc:55
//#		4. CHANGE MAJOR MODE TO 11
// P11.agc:56
//#		5. CLEAR DSKY IN CASE OF V 75
// P11.agc:57
//#		6. STORE LIFTOFF IMU-CDU ANGLES FOR ATT. ERROR DISPLAY
// P11.agc:58
//#		7. TERMINATE GYROCOMPASSING	-  -
// P11.agc:59
//#		8. COMPUTE INITIAL VECTORS	RN, VN            -  -  -
// P11.agc:60
//#		9. COMPUTE REFSMMAT FOR PRELAUNCH ALIGNMENT WHERE U ,U ,U ARE
// P11.agc:61
//#			-         -                                X  Y  Z
// P11.agc:62
//#			U =(UNIT(-R) LOCAL VERTICAL AT TIME OF LIFTOFF
// P11.agc:63
//#			Z
// P11.agc:64
//#			-	-   -
// P11.agc:65
//#			U =UNIT(A), A=HOR VECTOR AT LAUNCH AZIMUTH
// P11.agc:66
//#			X
// P11.agc:67
//#			-  -   -
// P11.agc:68
//#			U =U * U
// P11.agc:69
//#			 U  Z   X
// P11.agc:70
//
// P11.agc:71
//#		10. SET REFSMMAT KNOWN FLAG
// P11.agc:72
//#		11. SET AVGEXIT IN SERVICER TO VHHDOT TO
// P11.agc:73
//#		    COMPUTE AND DISPLAY NOUN 62 EVERY 2 SECONDS
// P11.agc:74
//
// P11.agc:75
//#		    R1	V1  - INERTIAL VELOCITY MAGNITUDE IN FPS
// P11.agc:76
//#		    R2	HDOT - RATE OF CHANGE OF VEHICLE VEL IN FPS
// P11.agc:77
//#		    R3	H    - VEHICLE ALTITUDE ABOVE PAD IN NM
// P11.agc:78
//
// P11.agc:79
//#		12. DISPLAY BODY AXES ATT. ERRORS ON FDAI NEEDLES
// P11.agc:80
//#
// P11.agc:81
//#		    A) FROM L.O. TO RPSTART (APPROX. 0 TO +10SECS AFTER L.O.)
// P11.agc:82
//#		       DESIRED ATTITUDE IS AS STORED AT L.O.
// P11.agc:83
//#		    B) FROM RPSTART TO POLYSTOP(APPROX.+10 TO +133SECS AFTER LO)
// P11.agc:84
//#		       DESIRED ATTITUDE IS SPECIFIED BY CMC PITCH AND ROLL
// P11.agc:85
//#		       POLYNOMIALS DURING ACAPELLO ROLLOUT AND PITCHOVER
// P11.agc:86
//# Page 534
// P11.agc:87
//#			THE DISPLAY IS RUN AS LOW PRIORITY JOB APPROX.
// P11.agc:88
//#			EVERY 1/2 SEC OR LESS AND IS DISABLED UPON OVFLO OF TIME1
// P11.agc:89
//
// P11.agc:90
//# SUBROUTINES CALLED
// P11.agc:91
//
// P11.agc:92
//#		2PHSCHNG	BANKCALL	CALCGRA		CDUTRIG		CLEANDSP	DANZIG
// P11.agc:93
//#		DELAYJOB	EARTHR		ENDOFJOB	FINDVAC		IBNKCALL
// P11.agc:94
//#		INTPRET		LALOTORV	NEEDLER		NEWMODEX	PHASCHNG
// P11.agc:95
//#		POSTJUMP	POWRSERS	PREREAD1	REGODSPR	S11.1
// P11.agc:96
//#		SERVEXIT	TASKOVER	TCDANZIG	V1STO2S		WAITLIST
// P11.agc:97
//
// P11.agc:98
//# VAL REQUESTS (IF ALTITUDE ABOVE 300,000 FT)
// P11.agc:99
//#
// P11.agc:100
//#	DSKY -
// P11.agc:101
//#	     MONITOR DISPLAY OF TIME TO PERIGEE R1 HOURS
// P11.agc:102
//#						R2 MINUTES
// P11.agc:103
//
// P11.agc:104
//#	DSKY -
// P11.agc:105
//#	     MONITOR DISPLAY OF R1 APOGEE ALTITUDE IN NAUTICAL MILES
// P11.agc:106
//#				R2 PERIGEE ALTITUDE IN NAUTICAL MILES
// P11.agc:107
//#				R3 TFF IN MINUTES/SECS
// P11.agc:108
//
// P11.agc:109
//#	IF VAL HAS REQUESTED ANY OF THESE DISPLAYS SHE MUST
// P11.agc:110
//# HIT PROCEED TO RETURN TO NORMAL NOUN 62 DISPLAY.
// P11.agc:111
//# NORMAL EXIT MODE
// P11.agc:112
//
// P11.agc:113
//#	VAL	VERB 37 ENTER 00 ENTER
// P11.agc:114
//
// P11.agc:115
//# ALARM MODES - NONE
// P11.agc:116
//
// P11.agc:117
//# ABORT EXIT MODES -
// P11.agc:118
//
// P11.agc:119
//# OUTPUT
// P11.agc:120
//
// P11.agc:121
//#	TLIFTOFF (DP)	TEPHEM (TP)
// P11.agc:122
//#	REFSMMAT
// P11.agc:123
//#	DSKY DISPLAY
// P11.agc:124
//#	FDAI DISPLAY
// P11.agc:125
//
// P11.agc:126
//# ERASABLE INITIALIZATION
// P11.agc:127
//
// P11.agc:128
//#	AZO, AXO, -AYO
// P11.agc:129
//#	LATITUDE
// P11.agc:130
//#	PADLONG
// P11.agc:131
//#	TEPHEM
// P11.agc:132
//#	PGNCSALT
// P11.agc:133
//#	POLYNUM THRU POLYNUM +14D)
// P11.agc:134
//#	RPSTART
// P11.agc:135
//#	POLYSTOP
// P11.agc:136
//# FLAGS SET OR RESET
// P11.agc:137
//# Page 535
// P11.agc:138
//#	SET REFSMFLG
// P11.agc:139
//#	SET DVMON IDLE FLAG
// P11.agc:140
//#	CLEAR ERADFLAG
// P11.agc:141
//
// P11.agc:142
//# DEBRIS
// P11.agc:143
//
// P11.agc:144
//#	LIFTTEMP
// P11.agc:145
//#	POLYNUM THRU POLYNUM +7
// P11.agc:146
//#	SPOLYARG
// P11.agc:147
//#	BODY1, BODY2, BODY3
// P11.agc:148
//#	VMAG2, ALTI, HDOT
// P11.agc:149
//#	CENTRALS, CORE SET AND VAC AREAS
// P11.agc:150
//		COUNT	34/P11
// P11.agc:151
//
// P11.agc:152
//BITS5-6		=	SUPER011
// P11.agc:153
//		BANK	42
// P11.agc:154
//		SETLOC	P11ONE
// P11.agc:155
//		BANK
// P11.agc:156
//
// P11.agc:157
//		EBANK=	TEPHEM
// P11.agc:158
//P11		CA	EBANK3
// slot 30722
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
// P11.agc:159
//		TS	EBANK
// slot 30723
                        if slot <> 30723 or instruction <> 22531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22531, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:160
//
// P11.agc:161
//		EXTEND
// slot 30724
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
// P11.agc:162
//		DCA	REP11S		# DIRECT RESTARTS TO REP11
// slot 30725
                        if slot <> 30725 or instruction <> 13503 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 1215, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:163
//		DXCH	-PHASE3
// slot 30726
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
// P11.agc:164
//		CS	ZERO
// slot 30727
                        if slot <> 30727 or instruction <> 18961 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:165
//		ZL
// slot 30728
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
// P11.agc:166
//		TS	LIFTTEMP
// slot 30729
                        if slot <> 30729 or instruction <> 23221 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23221, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:167
//		DXCH	-PHASE5		# INACTIVE GROUP 5, PRELAUNCH PROTECTION
// slot 30730
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
// P11.agc:168
//P11+7		EXTEND
// slot 30731
                        if slot <> 30731 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:169
//		DCA	REP11SA
// slot 30732
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
// P11.agc:170
//		DXCH	TLIFTOFF
// slot 30733
                        if slot <> 30733 or instruction <> 22239 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 735, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:171
//
// P11.agc:172
//		EXTEND
// slot 30734
                        if slot <> 30734 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30735 {
// P11.agc:173
//		DCA	TIME2
// slot 30735
                        if slot <> 30735 or instruction <> 12309 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:174
//		DXCH	LIFTTEMP	# FOR RESTARTS
// slot 30736
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
// P11.agc:175
//
// P11.agc:176
//		CA	ZERO
// slot 30737
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
// P11.agc:177
//		ZL
// slot 30738
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
// P11.agc:178
//		DXCH	TIME2
// slot 30739
                        if slot <> 30739 or instruction <> 21525 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 21, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:179
//REP11A-2	DXCH	TLIFTOFF
// slot 30740
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
// P11.agc:180
//REP11A-1	DXCH	-PHASE3		# RESET PHASE
// slot 30741
                        if slot <> 30741 or instruction <> 21999 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 495, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:181
//
// P11.agc:182
//
// P11.agc:183
//REP11A		INHINT
// slot 30742
                        if slot <> 30742 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 30743 {
// P11.agc:184
//		EXTEND
// slot 30743
                        if slot <> 30743 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:185
//		DCA	TEPHEM	+1
// slot 30744
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
// P11.agc:186
//		DXCH	TEPHEM1	+1
// slot 30745
                        if slot <> 30745 or instruction <> 22201 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 697, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:187
//		CA	TEPHEM
// slot 30746
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
// P11.agc:188
//# Page 536
// P11.agc:189
//		XCH	TEPHEM1
// slot 30747
                        if slot <> 30747 or instruction <> 24247 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 695, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:190
//
// P11.agc:191
//		EXTEND
// slot 30748
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
// P11.agc:192
//		DCA	TLIFTOFF
// slot 30749
                        if slot <> 30749 or instruction <> 13023 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 735, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:193
//		DAS	TEPHEM1	+1
// slot 30750
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
// P11.agc:194
//		ADS	TEPHEM1		# CORRECTFOR OVERFLOW
// slot 30751
                        if slot <> 30751 or instruction <> 11959 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 695).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:195
//
// P11.agc:196
//		TC	PHASCHNG
// slot 30752
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
// P11.agc:197
//		OCT	05023
// slot 30753
    30753, 5158,
// P11.agc:198
//		OCT	22000
// slot 30754
    30754, 18432
)).

// bank 34, slots 30755-30763
function agcAotUnit1743 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30758 {
        if slot <= 30756 {
            if slot <= 30755 {
// P11.agc:199
//
// P11.agc:200
//		INHINT
// slot 30755
                if slot <> 30755 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P11.agc:201
//		EXTEND
// slot 30756
                if slot <> 30756 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 30757 {
// P11.agc:202
//		DCA	TEPHEM1
// slot 30757
                if slot <> 30757 or instruction <> 12984 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 696, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P11.agc:203
//		DXCH	TEPHEM
// slot 30758
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
// P11.agc:204
//		CA	TEPHEM1	+2
// slot 30759
                if slot <> 30759 or instruction <> 12985 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 697).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P11.agc:205
//		XCH	TEPHEM	+2
// slot 30760
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
// P11.agc:206
//
// P11.agc:207
//		CAF	EBDVCNT
// slot 30761
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
// P11.agc:208
//		TS	EBANK
// slot 30762
                    if slot <> 30762 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:209
//		EBANK=	DVCNTR
// P11.agc:210
//		TC	IBNKCALL
// slot 30763
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
// P11.agc:211
//		CADR	PREREAD1	# ZERO PIPS AND INITIALIZE AVERAGEG
// slot 30764
    30764, 64420
)).

// bank 34, slots 30765-30765
function agcAotUnit1744 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P11.agc:212
//
// P11.agc:213
//		TC	PHASCHNG
// slot 30765
    if slot <> 30765 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1744] to agcAotUnit1744@.

agcAotInstallSourceRope(list(
// P11.agc:214
//		OCT	05023		# CONTINUE HERE ON RESTART
// slot 30766
    30766, 5158,
// P11.agc:215
//		OCT	22000
// slot 30767
    30767, 18432
)).

// bank 34, slots 30768-30769
function agcAotUnit1745 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30768 {
// P11.agc:216
//
// P11.agc:217
//		CAF	.5SEC		# START ATT ERROR DISPLAY
// slot 30768
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
// P11.agc:218
//		TC	WAITLIST	# IN .5 SEC
// slot 30769
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
// P11.agc:219
//		EBANK=	BODY3
// P11.agc:220
//		2CADR	ATERTASK
// slot 30770 30771
    30770, 2464, 30771, 57452
)).

// bank 34, slots 30772-30772
function agcAotUnit1746 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P11.agc:221
//
// P11.agc:222
//		TC	NEWMODEX	# DISPLAY MM 11
// slot 30772
    if slot <> 30772 or instruction <> 2796 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2796, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1746] to agcAotUnit1746@.

agcAotInstallSourceRope(list(
// P11.agc:223
//		MM	11
// slot 30773
    30773, 22
)).

// bank 34, slots 30774-30774
function agcAotUnit1747 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P11.agc:224
//
// P11.agc:225
//		TC	UPFLAG
// slot 30774
    if slot <> 30774 or instruction <> 2918 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2918, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1747] to agcAotUnit1747@.

agcAotInstallSourceRope(list(
// P11.agc:226
//		ADRES   NODOP01
// slot 30775
    30775, 36
)).

// bank 34, slots 30776-30778
function agcAotUnit1748 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30776 {
// P11.agc:227
//
// P11.agc:228
//		CA      POWDNCOD        # SWITCH TO POWERED FLIGHT DOWNLIST
// slot 30776
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
// P11.agc:229
//		TS      DNLSTCOD
// slot 30777
            if slot <> 30777 or instruction <> 22746 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22746, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P11.agc:230
//
// P11.agc:231
//		TC      BANKCALL
// slot 30778
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
// P11.agc:232
//		CADR	CLEANDSP	# CLEAR DSKY IN CASE OF V75
// slot 30779
    30779, 17286
)).

// bank 34, slots 30780-30780
function agcAotUnit1749 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P11.agc:233
//
// P11.agc:234
//		TC	2PHSCHNG
// slot 30780
    if slot <> 30780 or instruction <> 2810 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2810, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1749] to agcAotUnit1749@.

agcAotInstallSourceRope(list(
// P11.agc:235
//		OCT	40514		# PROTECT ATERTASK
// slot 30781
    30781, 33432,
// P11.agc:236
//		OCT	00073
// slot 30782
    30782, 118
)).

// bank 34, slots 30783-30787
function agcAotUnit1750 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30784 {
        if slot <= 30783 {
// P11.agc:237
//		CAF	EBQPLACE
// slot 30783
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
// P11.agc:238
//# Page 537
// P11.agc:239
//		TS	EBANK
// slot 30784
            if slot <> 30784 or instruction <> 22531 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22531, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 30785 {
// P11.agc:240
//
// P11.agc:241
//		EBANK=	QPLACES
// P11.agc:242
//		CA	P11XIT		# SET EXIT FROM PROUT IN EARTHR
// slot 30785
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
// P11.agc:243
//		TS	QPLACES
// slot 30786
                if slot <> 30786 or instruction <> 23318 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23318, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P11.agc:244
//		TC      INTPRET
// slot 30787
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
// P11.agc:245
//		VLOAD	MXV
// slot 30788
    30788, 53754,
// P11.agc:246
//			THETAN
// slot 30789
    30789, 2670,
// P11.agc:247
//			XSM
// slot 30790
    30790, 2932,
// P11.agc:248
//		VSL1	VAD
// slot 30791
    30791, 44532,
// P11.agc:249
//			ERCOMP
// slot 30792
    30792, 2896,
// P11.agc:250
//		STODL	ERCOMP
// slot 30793
    30793, 15184,
// P11.agc:251
//			TLIFTOFF
// slot 30794
    30794, 1470,
// P11.agc:252
//		SSP	GOTO
// slot 30795
    30795, 43186,
// P11.agc:253
//			S2
// slot 30796
    30796, 84,
// P11.agc:254
//		CADR	PROUT		# RETURN FROM EARTHR
// slot 30797
    30797, 55848,
// P11.agc:255
//			EARTHR	+3
// slot 30798
    30798, 55798
)).

// bank 34, slots 30799-30808
function agcAotUnit1751 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30803 {
        if slot <= 30800 {
            if slot <= 30799 {
// P11.agc:256
//MATRXJOB	ZL	                # STORE DP GIMBAL ANGLES FOR ATTITUDE
// slot 30799
                if slot <> 30799 or instruction <> 9223 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 7, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P11.agc:257
//		CA      CDUX            #       ERROR DISPLAY AFTER LIFTOFF
// slot 30800
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
// P11.agc:258
//		DXCH    OGC
// slot 30801
                if slot <> 30801 or instruction <> 22512 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 1008, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30802 {
// P11.agc:259
//		ZL
// slot 30802
                    if slot <> 30802 or instruction <> 9223 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 7, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:260
//		CA      CDUY
// slot 30803
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
// P11.agc:261
//		DXCH    IGC
// slot 30804
                if slot <> 30804 or instruction <> 22514 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 1010, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P11.agc:262
//		ZL
// slot 30805
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
// P11.agc:263
//		CA      CDUZ
// slot 30806
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
// P11.agc:264
//		DXCH    MGC
// slot 30807
                    if slot <> 30807 or instruction <> 22516 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 1012, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:265
//                TC      INTPRET         #       -
// slot 30808
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
// P11.agc:266
//		VLOAD   VSR1            # SCALE OGC B-1
// slot 30809
    30809, 62202,
// P11.agc:267
//			OGC
// slot 30810
    30810, 3040,
// P11.agc:268
//		STORE   OGC
// slot 30811
    30811, 3040,
// P11.agc:269
//		SSP			# ZERO RTX2
// slot 30812
    30812, 65458,
// P11.agc:270
//			RTX2		# FOR
// slot 30813
    30813, 4046,
// P11.agc:271
//			0		# KERBIN
// slot 30814
    30814, 0,
// P11.agc:272
//		DLOAD	PDDL
// slot 30815
    30815, 54730,
// P11.agc:273
//			PGNCSALT	# ALTITUDE OF PGNCS
// slot 30816
    30816, 1398,
// P11.agc:274
//			PADLONG		# LONGITUDE
// slot 30817
    30817, 1384,
// P11.agc:275
//		PDDL	VDEF
// slot 30818
    30818, 46762,
// P11.agc:276
//			LATITUDE	# GEODETIC LATITUDE
// slot 30819
    30819, 2566,
// P11.agc:277
//		STODL	LAT		# LAT,LONG,ALT ARE CONSECUTIVE
// slot 30820
    30820, 13448,
// P11.agc:278
//			HI6ZEROS	# TIME = 0
// slot 30821
    30821, 13754,
// P11.agc:279
//		CLEAR	CALL
// slot 30822
    30822, 37912,
// P11.agc:280
//			ERADFLAG
// slot 30823
    30823, 868,
// P11.agc:281
//			LALOTORV	# CONVERT TO POSITION VECTOR IN REF.COORDS
// slot 30824
    30824, 23106,
// P11.agc:282
//
// P11.agc:283
//		STCALL	RN1             #              -
// slot 30825
    30825, 30004,
// P11.agc:284
//			GETDOWN 	# RETURN WITH VECTOR FOR DOWN DIRECTION
// slot 30826
    30826, 57784,
// P11.agc:285
//		VCOMP   UNIT
// slot 30827
    30827, 44668,
// P11.agc:286
//		STOVL	REFSMMAT +12D	# UNITZ = UNIT(GRAV)
// slot 30828
    30828, 22484,
// P11.agc:287
//			RN1
// slot 30829
    30829, 1332,
// P11.agc:288
//		VXV	VXSC
// slot 30830
    30830, 61754,
// P11.agc:289
//# Page 538
// P11.agc:290
//			UNITW		# SCALED AT 1
// slot 30831
    30831, 1944,
// P11.agc:291
//			-ERTHRAT	# V = EARTHRATE X R
// slot 30832
    30832, 24968,
// P11.agc:292
//		VSL4			# SCALE TO 2(7) M/CS
// slot 30833
    30833, 65428,
// P11.agc:293
//		STOVL	VN1
// slot 30834
    30834, 21824,
// P11.agc:294
//			REFSMMAT +12D
// slot 30835
    30835, 2004,
// P11.agc:295
//		VXV	UNIT
// slot 30836
    30836, 44602,
// P11.agc:296
//			UNITW		# (REF3 X UNITW) = EAST
// slot 30837
    30837, 1944,
// P11.agc:297
//		PUSH	VXV
// slot 30838
    30838, 40204,
// P11.agc:298
//			REFSMMAT +12D	# (EAST X REF3) = -SOUTH
// slot 30839
    30839, 2004,
// P11.agc:299
//		UNIT	PDDL
// slot 30840
    30840, 54620,
// P11.agc:300
//			LAUNCHAZ	# COS(AZ)*SOUTH
// slot 30841
    30841, 2872,
// P11.agc:301
//		COS	VXSC
// slot 30842
    30842, 61900,
// P11.agc:302
//		STADR
// slot 30843
    30843, 65324,
// P11.agc:303
//		STODL	REFSMMAT	# TEMPORARY STORAGE
// slot 30844
    30844, 51266,
// P11.agc:304
//			LAUNCHAZ
// slot 30845
    30845, 2872,
// P11.agc:305
//		SIN	VXSC		# SIN(AZ)*EAST
// slot 30846
    30846, 61916,
// P11.agc:306
//		VAD	UNIT		# SIN(AZ)*EAST - COS(AZ)*SOUTH = REF1
// slot 30847
    30847, 44634,
// P11.agc:307
//			REFSMMAT
// slot 30848
    30848, 1980,
// P11.agc:308
//		STORE	REFSMMAT
// slot 30849
    30849, 1980,
// P11.agc:309
//
// P11.agc:310
//		VXV	UNIT		# (REF1 X REF3) = -REF3
// slot 30850
    30850, 44602,
// P11.agc:311
//			REFSMMAT +12D
// slot 30851
    30851, 2004,
// P11.agc:312
//		VCOMP
// slot 30852
    30852, 65404,
// P11.agc:313
//		STORE	REFSMMAT +6
// slot 30853
    30853, 1992,
// P11.agc:314
//		DLOAD	DSU
// slot 30854
    30854, 38346,
// P11.agc:315
//			DPHALF		# 1/2 REV
// slot 30855
    30855, 13750,
// P11.agc:316
//			LAUNCHAZ
// slot 30856
    30856, 2872,
// P11.agc:317
//		DAD	PDDL
// slot 30857
    30857, 54554,
// P11.agc:318
//			AZIMUTH
// slot 30858
    30858, 2562,
// P11.agc:319
//			SATRLRT		# SET	SATRLRT = -SATRLRT IF
// slot 30859
    30859, 3458,
// P11.agc:320
//		SIGN	STADR		# (1/2REV -LAVNCHAZ +AZIMUTH) IS NEGATIVE
// slot 30860
    30860, 38634,
// P11.agc:321
//		STORE	SATRLRT		# FOR ROLL CALC IN FDAI ATT. ERROR DISPLAY
// slot 30861
    30861, 62076,
// P11.agc:322
//		SET	EXIT
// slot 30862
    30862, 65048,
// P11.agc:323
//			REFSMFLG	# SET REFSMMAT KNOWN FLAG
// slot 30863
    30863, 1636
)).

// bank 34, slots 30864-30864
function agcAotUnit1752 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P11.agc:324
//
// P11.agc:325
//		TC	PHASCHNG
// slot 30864
    if slot <> 30864 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1752] to agcAotUnit1752@.

agcAotInstallSourceRope(list(
// P11.agc:326
//		OCT	04023
// slot 30865
    30865, 4134
)).

// bank 34, slots 30866-30883
function agcAotUnit1753 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30874 {
        if slot <= 30869 {
            if slot <= 30867 {
                if slot <= 30866 {
// P11.agc:327
//
// P11.agc:328
//		EXTEND
// slot 30866
                    if slot <> 30866 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:329
//		DCA	P11SCADR
// slot 30867
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
// P11.agc:330
//		DXCH	AVGEXIT		# SET AVGEXIT
// slot 30868
                    if slot <> 30868 or instruction <> 22163 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 659, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:331
//
// P11.agc:332
//		CA	PRIO31		# 2 SECONDS AT 2(+8)
// slot 30869
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
// P11.agc:333
//		TS	1/PIPADT
// slot 30870
                    if slot <> 30870 or instruction <> 23100 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23100, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:334
//
// P11.agc:335
//		EBANK=	RCSFLAGS
// P11.agc:336
//		CA	EBANK6
// slot 30871
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
// P11.agc:337
//		TS	EBANK
// slot 30872
                    if slot <> 30872 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30873 {
// P11.agc:338
//
// P11.agc:339
//		INHINT
// slot 30873
                        if slot <> 30873 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:340
//# Page 539
// P11.agc:341
//		CS	ZERO
// slot 30874
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
// P11.agc:342
//		TS	TBASE5		# RESTART READACCS 2 SECONDS AFTER LIFTOFF
// slot 30875
                    if slot <> 30875 or instruction <> 23091 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23091, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:343
//
// P11.agc:344
//		CS	TIME1
// slot 30876
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
// P11.agc:345
//		AD	2SECS		# DO READACCS 2 SECONDS AFTER LIFTOFF
// slot 30877
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
// P11.agc:346
//
// P11.agc:347
//		CCS	A		# CHECK TO INSURE DT IS POSITIVE
// slot 30878
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
// P11.agc:348
//		TCF	+3		# TIME POSITIVE
// slot 30879
                    if slot <> 30879 or instruction <> 5282 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5282, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:349
//		TCF	+2		# CANNOT GET HERE
// slot 30880
                    if slot <> 30880 or instruction <> 5282 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5282, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30881 {
// P11.agc:350
//		CA	ZERO		# TIME NEGATIVE - SET TO 1
// slot 30881
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
// P11.agc:351
//		AD	ONE		# RESTORE TIME  -  OR MAKE POSITIVE
// slot 30882
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
// P11.agc:352
//
// P11.agc:353
//		TC	WAITLIST
// slot 30883
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
// P11.agc:354
//		EBANK=	AOG
// P11.agc:355
//		2CADR	READACCS
// slot 30884 30885
    30884, 3016, 30885, 63596
)).

// bank 34, slots 30886-30886
function agcAotUnit1754 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P11.agc:356
//
// P11.agc:357
//		TC	2PHSCHNG
// slot 30886
    if slot <> 30886 or instruction <> 2810 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2810, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1754] to agcAotUnit1754@.

agcAotInstallSourceRope(list(
// P11.agc:358
//		OCT	00003		# TURN OFF GROUP 3
// slot 30887
    30887, 6,
// P11.agc:359
//		OCT	00025		# PROTECT NORMLIZE AND READACCS
// slot 30888
    30888, 42
)).

// bank 34, slots 30889-30889
function agcAotUnit1755 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P11.agc:360
//
// P11.agc:361
//		TC	POSTJUMP
// slot 30889
    if slot <> 30889 or instruction <> 2497 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2497, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1755] to agcAotUnit1755@.

agcAotInstallSourceRope(list(
// P11.agc:362
//		CADR	NORMLIZE	# DO NORMLIZE AND ENDOFJOB
// slot 30890
    30890, 64828
)).

// bank 34, slots 30891-30909
function agcAotUnit1756 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30899 {
        if slot <= 30894 {
            if slot <= 30892 {
                if slot <= 30891 {
// P11.agc:363
//
// P11.agc:364
//
// P11.agc:365
//		EBANK=	TEPHEM
// P11.agc:366
//REP11		INHINT
// slot 30891
                    if slot <> 30891 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:367
//		CCS	PHASE5
// slot 30892
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
// P11.agc:368
//		TC	ENDOFJOB
// slot 30893
                    if slot <> 30893 or instruction <> 2703 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2703, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:369
//
// P11.agc:370
//		CCS	LIFTTEMP
// slot 30894
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
// P11.agc:371
//		TCF	+4
// slot 30895
                    if slot <> 30895 or instruction <> 5299 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5299, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:372
//		TCF	+3
// slot 30896
                    if slot <> 30896 or instruction <> 5299 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5299, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30897 {
// P11.agc:373
//		TCF	+2
// slot 30897
                    if slot <> 30897 or instruction <> 5299 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5299, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30898 {
// P11.agc:374
//		TCF	P11+7
// slot 30898
                        if slot <> 30898 or instruction <> 5131 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5131, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:375
//
// P11.agc:376
//		CS	TLIFTOFF
// slot 30899
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
// P11.agc:377
//		EXTEND
// slot 30900
                    if slot <> 30900 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:378
//		BZMF	ENDREP11
// slot 30901
                    if slot <> 30901 or instruction <> 25787 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25787, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30902 {
// P11.agc:379
//
// P11.agc:380
//		CCS	TIME2		# **TIME2 MUST BE NON-ZERO AT LIFTOFF**
// slot 30902
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
// P11.agc:381
//		TCF	REP11A	-5	# T2,T1 NOT YET ZEROED, GO AND DO IT
// slot 30903
                        if slot <> 30903 or instruction <> 5137 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5137, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:382
//
// P11.agc:383
//		EXTEND			# T2,T1 ZEROED, SET TLIFTOFF
// slot 30904
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
// P11.agc:384
//		DCA	LIFTTEMP
// slot 30905
                    if slot <> 30905 or instruction <> 12982 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 694, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:385
//		TCF	REP11A-2
// slot 30906
                    if slot <> 30906 or instruction <> 5140 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5140, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 30907 {
// P11.agc:386
//
// P11.agc:387
//ENDREP11	EXTEND
// slot 30907
                    if slot <> 30907 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30908 {
// P11.agc:388
//		DCA	REP11SA
// slot 30908
                        if slot <> 30908 or instruction <> 13505 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 1217, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:389
//		TCF	REP11A-1
// slot 30909
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
// P11.agc:390
//# Page 540
// P11.agc:391
//REP11S		2OCT	7776600011
// slot 30910 30911
    30910, 65516, 30911, 18,
// P11.agc:392
//
// P11.agc:393
//REP11SA		2OCT	7776400013
// slot 30912 30913
    30912, 65512, 30913, 22,
// P11.agc:394
//
// P11.agc:395
//P11XIT		GENADR	P11OUT
// slot 30914
    30914, 2642,
// P11.agc:396
//-ERTHRAT	2DEC*	-7.292115138 E-7 B18*	# - KERBIN RATE AT 2(18)
// slot 30915 30916
    30915, 59272, 30916, 34746,
// P11.agc:397
//
// P11.agc:398
//		EBANK=	BODY3
// P11.agc:399
//P11SCADR	2CADR	VHHDOT
// slot 30917 30918
    30917, 2446, 30918, 57452
)).

// bank 34, slots 30919-30919
function agcAotUnit1757 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P11.agc:400
//
// P11.agc:401
//POWDNCOD        EQUALS  THREE
// P11.agc:402
//
// P11.agc:403
//		EBANK=	BODY3
// P11.agc:404
//# VHHDOT IS EXECUTED EVERY 2 SECONDS TO DISPLAY ON DSKY
// P11.agc:405
//#			VI INERTIAL VELOCITY MAGNITUDE
// P11.agc:406
//#			HDOT  RATE OF CHANGE OF ALT ABOVE L PAD RADIUS
// P11.agc:407
//#			H  ALTITUDE ABOVE L PAD RADIUS
// P11.agc:408
//
// P11.agc:409
//VHHDOT		TC	INTPRET
// slot 30919
    if slot <> 30919 or instruction <> 3078 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3078, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1757] to agcAotUnit1757@.

agcAotInstallSourceRope(list(
// P11.agc:410
//		CALL			# LOAD VMAGI, ALTI,
// slot 30920
    30920, 65320,
// P11.agc:411
//			S11.1		# HDOT FOR DISPLAY
// slot 30921
    30921, 58052,
// P11.agc:412
//		EXIT
// slot 30922
    30922, 65532
)).

// bank 34, slots 30923-30923
function agcAotUnit1758 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P11.agc:413
//		TC      PHASCHNG
// slot 30923
    if slot <> 30923 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1758] to agcAotUnit1758@.

agcAotInstallSourceRope(list(
// P11.agc:414
//		OCT     00035
// slot 30924
    30924, 58
)).

// bank 34, slots 30925-30926
function agcAotUnit1759 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30925 {
// P11.agc:415
//
// P11.agc:416
//		CAF	V06N62		# DISPLAY IN R1	R2	R3
// slot 30925
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
// P11.agc:417
//		TC	BANKCALL	#            VI	HDOT	H
// slot 30926
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
// P11.agc:418
//		CADR	REGODSP
// slot 30927
    30927, 17294
)).

// bank 34, slots 30928-30929
function agcAotUnit1760 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30928 {
// P11.agc:419
//
// P11.agc:420
//ATERTASK	CAF	PRIO1		# ESTABLISH JOB TO DISPLAY ATT ERRORS
// slot 30928
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
// P11.agc:421
//		TC	FINDVAC		# COMES HERE AT L.O. + .33 SEC
// slot 30929
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
// P11.agc:422
//		EBANK=	BODY3
// P11.agc:423
//		2CADR	ATERJOB
// slot 30930 30931
    30930, 2506, 30931, 57452
)).

// bank 34, slots 30932-30935
function agcAotUnit1761 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30933 {
        if slot <= 30932 {
// P11.agc:424
//
// P11.agc:425
//		CS	RCSFLAGS	# SET BIT3 FOR
// slot 30932
            if slot <> 30932 or instruction <> 17217 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 833).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P11.agc:426
//		MASK	BIT3		# NEEDLER
// slot 30933
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
// P11.agc:427
//		ADS	RCSFLAGS	# INITIALIZATION PASS
// slot 30934
            if slot <> 30934 or instruction <> 12097 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreADS(words, 833).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P11.agc:428
//		TC	IBNKCALL	# AND GO
// slot 30935
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
// P11.agc:429
//		CADR	NEEDLER		# DO IT
// slot 30936
    30936, 35360
)).

// bank 34, slots 30937-30939
function agcAotUnit1762 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30937 {
// P11.agc:430
//		CA      BIT1            # SET SW
// slot 30937
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
// P11.agc:431
//		TS      SATSW           # FOR DISPLAY
// slot 30938
            if slot <> 30938 or instruction <> 23509 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23509, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P11.agc:432
//		TC	TASKOVER
// slot 30939
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
// P11.agc:433
//GETDOWN         STQ     SETPD
// slot 30940
    30940, 33056,
// P11.agc:434
//			INCORPEX
// slot 30941
    30941, 2372,
// P11.agc:435
//			0D
// slot 30942
    30942, 2,
// P11.agc:436
//		DLOAD
// slot 30943
    30943, 65482,
// P11.agc:437
//			HI6ZEROS
// slot 30944
    30944, 13754,
// P11.agc:438
//# Page 541
// P11.agc:439
//		STODL   6D
// slot 30945
    30945, 12302,
// P11.agc:440
//		        DPHALF
// slot 30946
    30946, 13750,
// P11.agc:441
//		STCALL  8D
// slot 30947
    30947, 28690,
// P11.agc:442
//		        LALOTORV +5
// slot 30948
    30948, 23116
)).

// bank 34, slots 30949-30959
function agcAotUnit1763 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30953 {
        if slot <= 30950 {
            if slot <= 30949 {
// P11.agc:443
//# THIS SECTION PROVIDES ATTITUDE ERROR DISPLAYS TO THE FDAI DURING SONE BOOST
// P11.agc:444
//
// P11.agc:445
//#					COMPUTE DESIRED PITCH W.R.T. PAD LOCAL VERTICAL AT LIFTOFF
// P11.agc:446
//#							2    3    4    5    6
// P11.agc:447
//#					PITCH = A0+A1T+A2T +A3T +A4T +A5T +A6T
// P11.agc:448
//#						SCALED TO 32 REVS.                                   -14
// P11.agc:449
//#					IF TL = TIME IN SECS FROM L.O., THEN	T = 100(TL-RPSTART)2
// P11.agc:450
//#					WHERE	TL GE RPSTART
// P11.agc:451
//#						TL LE (-POLYSTOP + RPSTART)
// P11.agc:452
//#					COMPUTE DESIRED ROLL WHERE ROLL EQUALS ANGLE FROM
// P11.agc:453
//#					LAUNCHAZ TO -Z(S/C) AS SEEN FROM X(S/C).
// P11.agc:454
//#					ROLL = LAUNCHAZ-AZIMUTH-.5 +SATRLRT*T	IN REV
// P11.agc:455
//#					SATRLRT = RATE OF ROLL IN REV/CENTI-SEC
// P11.agc:456
//#					T,IN CENTI-SEC,IS DEFINED AS ABOVE,INCLUSIVE OF TIME RESTRICTIONS
// P11.agc:457
//
// P11.agc:458
//#					FOR SIMPLICITY, LET	P = 2*PI*PITCH
// P11.agc:459
//#								R = 2*PI*ROLL
// P11.agc:460
//
// P11.agc:461
//#					CONSTRUCT THE TRANSFORMATION MATRIX, TSMV, GIVING DESIRED S/C AXES IN
// P11.agc:462
//#					TERMS OF SM COORDINATES.  LET THE RESULTING ROWS EQUAL THE VECTORS XDC,
// P11.agc:463
//#					YDC,AND ZDC.
// P11.agc:464
//
// P11.agc:465
//#					 *     (    SIN(P)                 0               -COS(P)    )   (XDC)
// P11.agc:466
//#					TSMV = (-SIN(R)*COS(P)		-COS(R)		-SIN(R)*SIN(P)) = (YDC)
// P11.agc:467
//#					       (-COS(R)*COS(P)           SIN(R)         -COS(R)*SIN(P))   (ZDC)
// P11.agc:468
//
// P11.agc:469
//#					XDC,YDC,ZDC ARE USED AS INPUT TO CALCGTA FOR THE EXTRACTION OF THE
// P11.agc:470
//#					EULER SET OF ANGLES WHICH WILL BRING THE SM INTO THE DESIRED
// P11.agc:471
//#					ORIENTATION.  THIS EULER SET, OGC, IGC, AND MGC, MAY BE IDENTIFIED
// P11.agc:472
//#					AS THE DESIRED CDU ANGLES.
// P11.agc:473
//
// P11.agc:474
//#					(XDC)			(OGC)
// P11.agc:475
//#					(YDC) ---) CALCGTA ---) (IGC)
// P11.agc:476
//#					(ZDC)			(MGC)
// P11.agc:477
//
// P11.agc:478
//#							   -
// P11.agc:479
//#					DEFINE THE VECTOR DELTACDU.
// P11.agc:480
//
// P11.agc:481
//#					 -         (OGC)   (CDUX)
// P11.agc:482
//#					DELTACDU = (IGC) - (CDUY)
// P11.agc:483
//#					           (MGC)   (CDUZ)
// P11.agc:484
//
// P11.agc:485
//#								 -		-    *    -
// P11.agc:486
//#					COMPUTE ATTITUDE ERRORS, A, WHERE	A = TGSC*DELTACDU
// P11.agc:487
//#
// P11.agc:488
//#					 *     (1	      SIN(CDUZ)             0    )   THE GIMBAL ANGLES
// P11.agc:489
//# Page 542
// P11.agc:490
//#	TGSC = (0	COS(CDUX)*COS(CDUZ)	SIN(CDUX)) = TO SPACECRAFT AXES
// P11.agc:491
//#	       (0      -SIN(CDUX)*COS(CDUZ)	COS(CDUX))   CONVERSION MATRIX
// P11.agc:492
//
// P11.agc:493
//#			     -
// P11.agc:494
//#	THE ATTITUDE ERRORS, A, ARE STORED ONE HALF SINGLE PRECISION IN
// P11.agc:495
//#	THE REGISTERS AK, AK1, AK2 AS INPUT TO NEEDLER, THE FDAI ATTITUDE
// P11.agc:496
//#	ERROR DISPLAY ROUTINE.
// P11.agc:497
//
// P11.agc:498
//ATERJOB		CAE	FLAGWRD6	# CHECK FLAGWRD6
// slot 30949
                if slot <> 30949 or instruction <> 12354 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 66).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P11.agc:499
//		MASK    OCT60000        # BITS 14, 15
// slot 30950
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
// P11.agc:500
//		EXTEND
// slot 30951
                if slot <> 30951 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30952 {
// P11.agc:501
//		BZF     +2              # OK - CONTINUE
// slot 30952
                    if slot <> 30952 or instruction <> 5354 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5354, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:502
//		TC      ENDOFJOB	# ACAPELLO STICK ON - KILL JOB
// slot 30953
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
// P11.agc:503
//		CAF     BIT10           # CHECK IF S/C CONTROL
// slot 30954
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
// P11.agc:504
//		EXTEND                  # OF ACAPELLO PANEL
// slot 30955
                    if slot <> 30955 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:505
//		RAND    CHAN30          # SWITCH IS ON
// slot 30956
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
// P11.agc:506
//		EXTEND
// slot 30957
                if slot <> 30957 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 30958 {
// P11.agc:507
//		BZF     STRSAT          # IT IS - GO STEER
// slot 30958
                    if slot <> 30958 or instruction <> 5448 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5448, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:508
//		CCS     SATSW           # IT IS NOT - WAS IT ON LAST CYCLE
// slot 30959
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

// bank 34, slots 30960-30983
function agcAotUnit1764 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 30971 {
        if slot <= 30965 {
            if slot <= 30962 {
                if slot <= 30960 {
// P11.agc:509
//		TC      ATTDISP         # NO - CONTINUE
// slot 30960
                    if slot <> 30960 or instruction <> 1267 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1267, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30961 {
// P11.agc:510
//		TC      ATRESET         # YES - REINITIALIZE NEEDLER
// slot 30961
                        if slot <> 30961 or instruction <> 1355 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1355, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:511
//		TC      ATRESET         # YES - REINITIALIZE NEEDLER
// slot 30962
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
// P11.agc:512
//ATTDISP		CS	RPSTART		# PITCH/ROLL START TIME
// slot 30963
                    if slot <> 30963 or instruction <> 17346 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 962).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30964 {
// P11.agc:513
//		AD	TIME1
// slot 30964
                        if slot <> 30964 or instruction <> 24597 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 21).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:514
//		EXTEND
// slot 30965
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
// P11.agc:515
//		BZMF	NOPOLY		# IF MINUS THEN ATTITUDE HOLD
// slot 30966
                    if slot <> 30966 or instruction <> 25997 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25997, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30967 {
// P11.agc:516
//		TS	MPAC		# MPAC=TIME1-RPSTART
// slot 30967
                        if slot <> 30967 or instruction <> 22636 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22636, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:517
//		TS	SPOLYARG	# SAVE FOR USE IN ROLL CALCULATION
// slot 30968
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
// P11.agc:518
//		AD	POLYSTOP	# NEG PITCHOVER TIME IN CSECS
// slot 30969
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
// P11.agc:519
//		EXTEND
// slot 30970
                        if slot <> 30970 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:520
//		BZMF	+2
// slot 30971
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
// P11.agc:521
//		TC      NOPOLY          # GO TO ATTITUDE HOLD
// slot 30972
                    if slot <> 30972 or instruction <> 1421 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1421, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30973 {
// P11.agc:522
//		CA      TIME2
// slot 30973
                        if slot <> 30973 or instruction <> 12308 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 20).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:523
//		EXTEND
// slot 30974
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
// P11.agc:524
//		BZMF    +2
// slot 30975
                    if slot <> 30975 or instruction <> 25857 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25857, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30976 {
// P11.agc:525
//		TC      NOPOLY          # GO TO ATTITUDE HOLD
// slot 30976
                        if slot <> 30976 or instruction <> 1421 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1421, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:526
//		CAE	POLYNUM
// slot 30977
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
// P11.agc:527
//		TS	L
// slot 30978
                    if slot <> 30978 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 30979 {
// P11.agc:528
//		CAF	COEFPOLY	# EVALUATE PITCH POLYNOMIAL
// slot 30979
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
// P11.agc:529
//		TC	POWRSERS	# SCALED TO 32 REVOLUTIONS
// slot 30980
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
// P11.agc:530
//
// P11.agc:531
//		CA      ZERO            # RETURN WITH PITCH(32REV)
// slot 30981
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
// P11.agc:532
//		TS	MODE		# STORED MPAC, MPAC +1
// slot 30982
                        if slot <> 30982 or instruction <> 22643 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22643, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:533
//		TC	INTPRET
// slot 30983
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
// P11.agc:534
//		SETPD	SL		# 32(PITCH(32REV))=PITCH(REV)
// slot 30984
    30984, 45314,
// P11.agc:535
//			0
// slot 30985
    30985, 2,
// P11.agc:536
//			5
// slot 30986
    30986, 16652,
// P11.agc:537
//		PUSH			# LET P(RAD)=2*PI*PITCH(REV)
// slot 30987
    30987, 65292,
// P11.agc:538
//		GOTO
// slot 30988
    30988, 65360,
// P11.agc:539
//			ATTDISP1	# AROUND SETLOC
// slot 30989
    30989, 63706,
// P11.agc:540
//# Page 543
// P11.agc:541
//#				     *
// P11.agc:542
//#	CONSTRUCT SM TO S/C MATRIX, TSMV
// P11.agc:543
//
// P11.agc:544
//		SETLOC	P11TWO
// P11.agc:545
//		BANK			# 36 IN COL., 34 IN DISK
// P11.agc:546
//
// P11.agc:547
//		COUNT	36/P11
// P11.agc:548
//
// P11.agc:549
//ATTDISP1	COS	DCOMP
// slot 33901
    33901, 48844,
// P11.agc:550
//		STODL	14D		# -.5*COS(P)
// slot 33902
    33902, 12318,
// P11.agc:551
//		SIN
// slot 33903
    33903, 65500,
// P11.agc:552
//		STODL	10D		# .5*SIN(P)
// slot 33904
    33904, 12310,
// P11.agc:553
//			ZEROVECS
// slot 33905
    33905, 13754,
// P11.agc:554
//		STORE	12D		# 0
// slot 33906
    33906, 26,
// P11.agc:555
//
// P11.agc:556
//#	EVALUATE ROLL = LAUNCHAZ-AZIMUTH-.5+SATRLRT*T
// P11.agc:557
//		SLOAD	DMP
// slot 33907
    33907, 34234,
// P11.agc:558
//			SPOLYARG	# TIME1 - RSPSTART ,CSECS B-14.
// slot 33908
    33908, 3472,
// P11.agc:559
//			SATRLRT
// slot 33909
    33909, 3458,
// P11.agc:560
//		SL	DSU
// slot 33910
    33910, 38242,
// P11.agc:561
//			14D
// slot 33911
    33911, 16670,
// P11.agc:562
//			DPHALF
// slot 33912
    33912, 13750,
// P11.agc:563
//		DAD	DSU		# ASSUMING X(SM) ALONG LAUNCH AZIMUTH,
// slot 33913
    33913, 38170,
// P11.agc:564
//			LAUNCHAZ	# LAUNCHAZ = ANGLE FROM NORTH TO X(SM).
// slot 33914
    33914, 2872,
// P11.agc:565
//			AZIMUTH		# AZIMUTH = -ANGLE FROM NORTH TO Z(S/C)
// slot 33915
    33915, 2562,
// P11.agc:566
//		RTB			# DETERMINE IF ROLLOUT
// slot 33916
    33916, 65336,
// P11.agc:567
//			RLTST		# IS COMPLETED
// slot 33917
    33917, 58120,
// P11.agc:568
//ATTDISPR	PUSH	COS		# CONTINUE COMPUTING TSMV
// slot 33918
    33918, 58892,
// P11.agc:569
//		PUSH			# LET	R(RAD) = 2*PI*ROLL(REV)
// slot 33919
    33919, 65292,
// P11.agc:570
//		DMP	SL1
// slot 33920
    33920, 59914,
// P11.agc:571
//			14D
// slot 33921
    33921, 30,
// P11.agc:572
//		STODL	22D		# -.5*COS(R)*COS(P)
// slot 33922
    33922, 12334,
// P11.agc:573
//		DCOMP
// slot 33923
    33923, 65404,
// P11.agc:574
//		STORE	18D		# -.5*COS(R)
// slot 33924
    33924, 38,
// P11.agc:575
//		DMP	SL1
// slot 33925
    33925, 59914,
// P11.agc:576
//			10D
// slot 33926
    33926, 22,
// P11.agc:577
//		STODL	26D		# -.5*COS(R)*SIN(P)
// slot 33927
    33927, 12342,
// P11.agc:578
//		SIN	PUSH
// slot 33928
    33928, 34524,
// P11.agc:579
//		STORE	24D		# .5*SIN(R)
// slot 33929
    33929, 50,
// P11.agc:580
//		DMP	SL1
// slot 33930
    33930, 59914,
// P11.agc:581
//			14D
// slot 33931
    33931, 30,
// P11.agc:582
//		STODL	16D		# -.5*SIN(R)*COS(P)
// slot 33932
    33932, 12322,
// P11.agc:583
//		DCOMP
// slot 33933
    33933, 65404,
// P11.agc:584
//		DMP	SL1
// slot 33934
    33934, 59914,
// P11.agc:585
//			10D
// slot 33935
    33935, 22,
// P11.agc:586
//		STOVL	20D		# -.5*SIN(R)*SIN(P)
// slot 33936
    33936, 20522,
// P11.agc:587
//			10D
// slot 33937
    33937, 22,
// P11.agc:588
//
// P11.agc:589
//#	FROM TSMV FIND THE HALF UNIT VECTORS XDC,YDC,ZDC = INPUT TO CALCGTA
// P11.agc:590
//# Page 544
// P11.agc:591
//		UNIT
// slot 33938
    33938, 65372,
// P11.agc:592
//		STOVL	XDC		# XDC = .5*UNIT(SIN(P),0,-COS(P))
// slot 33939
    33939, 23448,
// P11.agc:593
//			16D
// slot 33940
    33940, 34,
// P11.agc:594
//		UNIT
// slot 33941
    33941, 65372,
// P11.agc:595
//		STOVL	YDC		# YDC = .5*UNIT(-SIN(R)*COS(P),-COS(R),
// slot 33942
    33942, 23460,
// P11.agc:596
//			22D		#			-SIN(R)*SIN(P))
// slot 33943
    33943, 46,
// P11.agc:597
//		UNIT
// slot 33944
    33944, 65372,
// P11.agc:598
//		STCALL	ZDC		# ZDC = .5*UNIT(-COS(R)*COS(P),SIN(R),
// slot 33945
    33945, 31664,
// P11.agc:599
//			CALCGTA		#			-COS(R)*SIN(P))
// slot 33946
    33946, 40202,
// P11.agc:600
//
// P11.agc:601
//#	CALL CALCGTA TO COMPUTE DESIRED SM ORIENTATION	OGC,IGC,AND MGC
// P11.agc:602
//#				 -          -   -
// P11.agc:603
//#	FIND DIFFERENCE VECTOR	DELTACDU = OGC-CDUX
// P11.agc:604
//
// P11.agc:605
//#	ENTER HERE IF ATTITUDE HOLD
// P11.agc:606
//
// P11.agc:607
//NOPOLYM		VLOAD	PUSH		#        OGC      IGC
// slot 33947
    33947, 34554,
// P11.agc:608
//			OGC		# CHANGE IGC  TO  MGC FOR COMPATIBILITY
// slot 33948
    33948, 3040,
// P11.agc:609
//		PUSH	CALL		#        MGC      OGC
// slot 33949
    33949, 37900,
// P11.agc:610
//			CDUTRIG		# WITH Y,Z,X ORDER OF CDUSPOT
// slot 33950
    33950, 40574,
// P11.agc:611
//		VLOAD	RTB		#  -         DPHI     OGC-CDUX ,PD4
// slot 33951
    33951, 40186,
// P11.agc:612
//			2		# DELTACDU = DTHETA = IGC-CDUY ,   0
// slot 33952
    33952, 6,
// P11.agc:613
//			V1STO2S		#            DPSI     MGC-CDUZ ,   2
// slot 33953
    33953, 38612,
// P11.agc:614
//		STOVL	BOOSTEMP
// slot 33954
    33954, 23966,
// P11.agc:615
//			ZEROVECS
// slot 33955
    33955, 13754,
// P11.agc:616
//		STOVL	0
// slot 33956
    33956, 20482,
// P11.agc:617
//			CDUSPOT
// slot 33957
    33957, 1006,
// P11.agc:618
//		RTB	RTB
// slot 33958
    33958, 39992,
// P11.agc:619
//			V1STO2S
// slot 33959
    33959, 38612,
// P11.agc:620
//			DELSTOR
// slot 33960
    33960, 58088,
// P11.agc:621
//		STODL	10D
// slot 33961
    33961, 12310,
// P11.agc:622
//			SINCDUZ
// slot 33962
    33962, 962,
// P11.agc:623
//		DMP	SL1
// slot 33963
    33963, 59914,
// P11.agc:624
//			0
// slot 33964
    33964, 2,
// P11.agc:625
//		DAD	SR2		# CHANGE SCALE OF AK TO 2REVS
// slot 33965
    33965, 49690,
// P11.agc:626
//			4
// slot 33966
    33966, 10,
// P11.agc:627
//		GOTO
// slot 33967
    33967, 65360,
// P11.agc:628
//			ATTDISP2
// slot 33968
    33968, 57884,
// P11.agc:629
//
// P11.agc:630
//		SETLOC	P11ONE
// P11.agc:631
//		BANK
// P11.agc:632
//		COUNT	34/P11
// P11.agc:633
//
// P11.agc:634
//ATTDISP2	STODL	16D		# 16D, .5(DPHI + DTHETA*SIN(CDUZ))
// slot 30990
    30990, 12322,
// P11.agc:635
//			COSCDUZ
// slot 30991
    30991, 974,
// P11.agc:636
//		DMP	PUSH
// slot 30992
    30992, 34314,
// P11.agc:637
//			0
// slot 30993
    30993, 2,
// P11.agc:638
//		DMP	SL1
// slot 30994
    30994, 59914,
// P11.agc:639
//			COSCDUX
// slot 30995
    30995, 978,
// P11.agc:640
//		PDDL	DMP
// slot 30996
    30996, 34218,
// P11.agc:641
//# Page 545
// P11.agc:642
//			SINCDUX
// slot 30997
    30997, 966,
// P11.agc:643
//			2
// slot 30998
    30998, 6,
// P11.agc:644
//		DAD	SL1
// slot 30999
    30999, 59930,
// P11.agc:645
//		STADR
// slot 31000
    31000, 65324,
// P11.agc:646
//		STODL	17D		# 17D,	.5(DTHETA*COS(CDUX)*COS(CDUZ)
// slot 31001
    31001, 53210,
// P11.agc:647
//		DMP	SL1		#			+DPSI*SIN(CDUX))
// slot 31002
    31002, 59914,
// P11.agc:648
//			SINCDUX
// slot 31003
    31003, 966,
// P11.agc:649
//		PDDL	DMP
// slot 31004
    31004, 34218,
// P11.agc:650
//			COSCDUX
// slot 31005
    31005, 978,
// P11.agc:651
//			2
// slot 31006
    31006, 6,
// P11.agc:652
//		DSU	SL1
// slot 31007
    31007, 59946,
// P11.agc:653
//		STADR
// slot 31008
    31008, 65324,
// P11.agc:654
//		STORE	18D		# 18D,	.5(-DTHETA*SIN(CDUX)*COS(CDUZ)
// slot 31009
    31009, 65496,
// P11.agc:655
//		TLOAD			#			+DPSI*COS(CDUX))
// slot 31010
    31010, 65490,
// P11.agc:656
//			16D
// slot 31011
    31011, 34,
// P11.agc:657
//		STORE	AK		# STORE ATTITUDE ERRORS IN AK,AK1,AK2
// slot 31012
    31012, 3198,
// P11.agc:658
//		EXIT
// slot 31013
    31013, 65532
)).

// bank 34, slots 31014-31018
function agcAotUnit1765 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31015 {
        if slot <= 31014 {
// P11.agc:659
//
// P11.agc:660
//		CA      SATSW
// slot 31014
            if slot <> 31014 or instruction <> 13269 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 981).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P11.agc:661
//		CCS     A               # CHK TAKEOVER STATUS
// slot 31015
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
// P11.agc:662
//		TC      SATOUT          # POS - DISPLAY ONLY
// slot 31016
            if slot <> 31016 or instruction <> 1337 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1337, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 31017 {
// P11.agc:663
//		TC      AKLOAD          # 0     STORE BIAS
// slot 31017
                if slot <> 31017 or instruction <> 1343 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1343, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P11.agc:664
//STEERSAT        TC      INTPRET         # NEG   STEER L/V
// slot 31018
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
// P11.agc:665
//		TLOAD   TAD
// slot 31019
    31019, 63954,
// P11.agc:666
//			BIASAK
// slot 31020
    31020, 3502,
// P11.agc:667
//			AK
// slot 31021
    31021, 3198,
// P11.agc:668
//		STORE   AK              # AKS = AKS - STORED BIAS
// slot 31022
    31022, 3198,
// P11.agc:669
//		EXIT
// slot 31023
    31023, 65532
)).

// bank 34, slots 31024-31033
function agcAotUnit1766 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31028 {
        if slot <= 31025 {
            if slot <= 31024 {
// P11.agc:670
//		CA      AK
// slot 31024
                if slot <> 31024 or instruction <> 13118 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 830).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P11.agc:671
//		TC      RESCALES
// slot 31025
                if slot <> 31025 or instruction <> 1427 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1427, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 31026 {
// P11.agc:672
//		TS      AK
// slot 31026
                if slot <> 31026 or instruction <> 23358 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23358, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31027 {
// P11.agc:673
//		CA      AK1
// slot 31027
                    if slot <> 31027 or instruction <> 13119 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 831).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:674
//		TC      RESCALES
// slot 31028
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
// P11.agc:675
//		TS      AK1
// slot 31029
                if slot <> 31029 or instruction <> 23359 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23359, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P11.agc:676
//		CA      AK2
// slot 31030
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
// P11.agc:677
//		TC      RESCALES
// slot 31031
                if slot <> 31031 or instruction <> 1427 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1427, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31032 {
// P11.agc:678
//		TS      AK2
// slot 31032
                    if slot <> 31032 or instruction <> 23360 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23360, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:679
//# DISPLAY ATTITUDE ERRORS ON FDAI VIA NEEDLER
// P11.agc:680
//
// P11.agc:681
//SATOUT		TC	BANKCALL
// slot 31033
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
// P11.agc:682
//		CADR	NEEDLER
// slot 31034
    31034, 35360
)).

// bank 34, slots 31035-31036
function agcAotUnit1767 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31035 {
// P11.agc:683
//ATERSET		CAF	OCT31		# DELAY .25 SEC
// slot 31035
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
// P11.agc:684
//		TC	BANKCALL	# EXECUTION + DELAY =.56SEC APPROX
// slot 31036
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
// P11.agc:685
//		CADR	DELAYJOB
// slot 31037
    31037, 1972
)).

// bank 34, slots 31038-31054
function agcAotUnit1768 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31045 {
        if slot <= 31041 {
            if slot <= 31039 {
                if slot <= 31038 {
// P11.agc:686
//		TC	ATERJOB		# END OF ATT ERROR DISPLAY CYCLE
// slot 31038
                    if slot <> 31038 or instruction <> 1253 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1253, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:687
//
// P11.agc:688
//AKLOAD          CS      AK              # STORE AKS
// slot 31039
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
// P11.agc:689
//		TS      BIASAK          # INTO BIAS
// slot 31040
                    if slot <> 31040 or instruction <> 23510 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23510, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:690
//		CS      AK1             # COMPLEMENTED
// slot 31041
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
// P11.agc:691
//		TS      BIASAK +1
// slot 31042
                    if slot <> 31042 or instruction <> 23511 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23511, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:692
//# Page 546
// P11.agc:693
//		CS      AK2
// slot 31043
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
// P11.agc:694
//		TS      BIASAK +2
// slot 31044
                    if slot <> 31044 or instruction <> 23512 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23512, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:695
//		CS      BIT1            # SET SW
// slot 31045
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
// P11.agc:696
//		TS      SATSW           # TO STEER
// slot 31046
                    if slot <> 31046 or instruction <> 23509 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23509, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:697
//		TC      STEERSAT        # GO STEER
// slot 31047
                    if slot <> 31047 or instruction <> 1322 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1322, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 31048 {
// P11.agc:698
//STRSAT		CA      SATSW           # CHECK IF NEEDLER
// slot 31048
                    if slot <> 31048 or instruction <> 13269 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 981).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:699
//		EXTEND                  # HAS BEEN INITIALIZED
// slot 31049
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
// P11.agc:700
//		BZMF    ATTDISP         # YES - CONTINUE
// slot 31050
                    if slot <> 31050 or instruction <> 25843 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25843, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:701
//ATRESET		CS      RCSFLAGS        # NO - SET
// slot 31051
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
// P11.agc:702
//		MASK    BIT3            # INITIALIZATION SW
// slot 31052
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
// P11.agc:703
//		ADS     RCSFLAGS        # FOR NEEDLER
// slot 31053
                        if slot <> 31053 or instruction <> 12097 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 833).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:704
//		TC      BANKCALL        # AND GO
// slot 31054
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
// P11.agc:705
//		CADR    NEEDLER         # DO IT
// slot 31055
    31055, 35360
)).

// bank 34, slots 31056-31057
function agcAotUnit1769 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31056 {
// P11.agc:706
//		CAF     REVCNT          # OCT 6
// slot 31056
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
// P11.agc:707
//		TC      BANKCALL        # DELAY JOB
// slot 31057
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
// P11.agc:708
//		CADR    DELAYJOB        # 60 MS -WAIT TILL IMUERRCNTR ZEROED
// slot 31058
    31058, 1972
)).

// bank 34, slots 31059-31073
function agcAotUnit1770 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31065 {
        if slot <= 31061 {
            if slot <= 31059 {
// P11.agc:709
//		CCS     SATSW          	# CHECK SW STATUS
// slot 31059
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
// P11.agc:710
//		TC      TAKEON          # POS   STEER INIT.
// slot 31060
                    if slot <> 31060 or instruction <> 1372 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1372, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:711
//		TC      +1              # 0     RETURN TO DISPLAY
// slot 31061
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
// P11.agc:712
//		CA      BIT1            # NEG   RETURN TO DISPLAY
// slot 31062
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
// P11.agc:713
//		TS      SATSW           # SW = DISPLAY ON
// slot 31063
                    if slot <> 31063 or instruction <> 23509 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23509, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 31064 {
// P11.agc:714
//		CS      BIT9            # DISABLE
// slot 31064
                    if slot <> 31064 or instruction <> 18951 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2567), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:715
//		EXTEND                  # SIVB
// slot 31065
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
// P11.agc:716
//		WAND    CHAN12          # TAKEOVER
// slot 31066
                    if slot <> 31066 or instruction <> 1546 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:717
//		TC      SATOUT          # DISPLAY
// slot 31067
                    if slot <> 31067 or instruction <> 1337 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1337, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 31068 {
// P11.agc:718
//TAKEON          CAF     BIT9            # ENABLE
// slot 31068
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
// P11.agc:719
//		EXTEND                  # SIVB
// slot 31069
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
// P11.agc:720
//		WOR     CHAN12          # TAKEOVER
// slot 31070
                    if slot <> 31070 or instruction <> 2570 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:721
//		CA      ZERO            # INDICATE NEEDLER
// slot 31071
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
// P11.agc:722
//		TS      SATSW           # WAS INITIALIZED
// slot 31072
                    if slot <> 31072 or instruction <> 23509 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23509, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:723
//		TC      SATOUT
// slot 31073
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
// P11.agc:724
//S11.1		VLOAD	ABVAL
// slot 31074
    31074, 42746,
// P11.agc:725
//			VN
// slot 31075
    31075, 1278,
// P11.agc:726
//		STOVL	VMAGI		# VI	SCALED 2(7) IN METERS/CSEC
// slot 31076
    31076, 24486,
// P11.agc:727
//			RN
// slot 31077
    31077, 1266,
// P11.agc:728
//		UNIT    DOT
// slot 31078
    31078, 41308,
// P11.agc:729
//		        VN
// slot 31079
    31079, 1278,
// P11.agc:730
//		SL1
// slot 31080
    31080, 65492,
// P11.agc:731
//		STODL   HDOT
// slot 31081
    31081, 16318,
// P11.agc:732
//		        RPAD
// slot 31082
    31082, 5332,
// P11.agc:733
//		BOF     VLOAD
// slot 31083
    31083, 64792,
// P11.agc:734
//		        AMOONFLG
// slot 31084
    31084, 474,
// P11.agc:735
//		        EARTHALT
// slot 31085
    31085, 58080,
// P11.agc:736
//		        RLS
// slot 31086
    31086, 2092,
// P11.agc:737
//		ABVAL	SR2
// slot 31087
    31087, 49740,
// P11.agc:738
//EARTHALT         BDSU
// slot 31088
    31088, 65314,
// P11.agc:739
//		        36D
// slot 31089
    31089, 74,
// P11.agc:740
//		STORE   ALTI
// slot 31090
    31090, 4026,
// P11.agc:741
//		RVQ
// slot 31091
    31091, 65308
)).

// bank 34, slots 31092-31095
function agcAotUnit1771 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31093 {
        if slot <= 31092 {
// P11.agc:742
//DELSTOR		CA	BOOSTEMP
// slot 31092
            if slot <> 31092 or instruction <> 13262 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 974).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P11.agc:743
//# Page 547
// P11.agc:744
//		EXTEND			# STORE DELTACDU INTO PDL 0,2,4
// slot 31093
            if slot <> 31093 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 31094 {
// P11.agc:745
//		MSU	MPAC
// slot 31094
            if slot <> 31094 or instruction <> 8300 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMSU(words, 108).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P11.agc:746
//		INDEX	FIXLOC
// slot 31095
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
// P11.agc:747
//		TS	0
// slot 31096
    31096, 45056
)).

// bank 34, slots 31097-31100
function agcAotUnit1772 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31098 {
        if slot <= 31097 {
// P11.agc:748
//		CA	BOOSTEMP +1
// slot 31097
            if slot <> 31097 or instruction <> 13263 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 975).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P11.agc:749
//		EXTEND
// slot 31098
            if slot <> 31098 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 31099 {
// P11.agc:750
//		MSU	MPAC +1
// slot 31099
            if slot <> 31099 or instruction <> 8301 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMSU(words, 109).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P11.agc:751
//		INDEX	FIXLOC
// slot 31100
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
// P11.agc:752
//		TS	2
// slot 31101
    31101, 45060
)).

// bank 34, slots 31102-31105
function agcAotUnit1773 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31103 {
        if slot <= 31102 {
// P11.agc:753
//		CA	BOOSTEMP +2
// slot 31102
            if slot <> 31102 or instruction <> 13264 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 976).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P11.agc:754
//		EXTEND
// slot 31103
            if slot <> 31103 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 31104 {
// P11.agc:755
//		MSU	MPAC +2
// slot 31104
            if slot <> 31104 or instruction <> 8302 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMSU(words, 110).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// P11.agc:756
//		INDEX	FIXLOC
// slot 31105
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
// P11.agc:757
//		TS	4
// slot 31106
    31106, 45064
)).

// bank 34, slots 31107-31117
function agcAotUnit1774 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31111 {
        if slot <= 31108 {
            if slot <= 31107 {
// P11.agc:758
//		TCF	DANZIG
// slot 31107
                if slot <> 31107 or instruction <> 7192 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7192, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P11.agc:759
//RLTST		CA	MPAC		# DETERMINE IF ROLLOUT
// slot 31108
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
// P11.agc:760
//		EXTEND			# IS COMPLETED
// slot 31109
                if slot <> 31109 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31110 {
// P11.agc:761
//		MP	SATRLRT +1
// slot 31110
                    if slot <> 31110 or instruction <> 29633 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 961, readEffective:call(words, 961)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:762
//		EXTEND
// slot 31111
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
// P11.agc:763
//		BZMF	DANZIG		# UNLIKE SIGNS STILL ROLLING
// slot 31112
                if slot <> 31112 or instruction <> 27672 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 27672, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31113 {
// P11.agc:764
//		EXTEND			# ROLLOUT COMPLETED
// slot 31113
                    if slot <> 31113 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:765
//		DCA	MBDYTCTL +2	# ZERO OUT ROLL CONTRIBUTION
// slot 31114
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
// P11.agc:766
//		DXCH	MPAC
// slot 31115
                if slot <> 31115 or instruction <> 21613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 31116 {
// P11.agc:767
//		TC	DANZIG
// slot 31116
                    if slot <> 31116 or instruction <> 3096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3096, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:768
//NOPOLY		TC	INTPRET		# COMES HERE IF
// slot 31117
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
// P11.agc:769
//		SETPD	GOTO		# ATTITUDE HOLD
// slot 31118
    31118, 43010,
// P11.agc:770
//			0
// slot 31119
    31119, 2,
// P11.agc:771
//			NOPOLYM
// slot 31120
    31120, 63798,
// P11.agc:772
//COEFPOLY	ADRES	POLYLOC
// slot 31121
    31121, 1910,
// P11.agc:773
//V06N62		VN	0662
// slot 31122
    31122, 1660
)).

// bank 34, slots 31123-31127
function agcAotUnit1775 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 31124 {
        if slot <= 31123 {
// P11.agc:774
//RESCALES        EXTEND                  # RESCALE AK S FOR
// slot 31123
            if slot <> 31123 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P11.agc:775
//		MP      SATSCALE        # NEW HARDWARE
// slot 31124
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
// P11.agc:776
//		DDOUBL                  # SCALING FOR
// slot 31125
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
// P11.agc:777
//		DDOUBL                  # STEERING
// slot 31126
                if slot <> 31126 or instruction <> 8193 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 1) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P11.agc:778
//		TC      Q               # ACAPELLO
// slot 31127
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

// bank 43, slots 38541-38550
function agcAotUnit2310 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38545 {
        if slot <= 38542 {
            if slot <= 38541 {
// P11.agc:779
//# ACAPELLO TAKEOVER FUNCTION
// P11.agc:780
//# ************************
// P11.agc:781
//
// P11.agc:782
//# PROGRAM DESCRIPTION
// P11.agc:783
//
// P11.agc:784
//#	MOD NUMBER 1
// P11.agc:785
//#	MOD BY ELIASSEN KERMAN
// P11.agc:786
//
// P11.agc:787
//# FUNCTIONAL DESCRIPTION
// P11.agc:788
//
// P11.agc:789
//#	DURING THE COASTING PHASE OF SIVB ATTACHED, THE
// P11.agc:790
//#	VAL MAY REQUEST ACAPELLO TAKEOVER THROUGH
// P11.agc:791
//#	EXTENDED VERB 46 (BITS 13,14 OF DAPDATR1 SET ).
// P11.agc:792
//#	THE CMC REGARDS RHC COMMANDS AS BODY-AXES RATE
// P11.agc:793
//#	COMMANDS AND IT TRANSMITS THESE TO ACAPELLO AS DC
// P11.agc:794
//# Page 548
// P11.agc:795
//#	VOLTAGES.  THE VALUE OF THE CONSTANT RATE COMMAND
// P11.agc:796
//#	IS 0.5 DEG/SEC.  AN ABSENCE OF RHC ACTIVITY RE-
// P11.agc:797
//#	SULTS IN A ZERO RATE COMMAND.
// P11.agc:798
//
// P11.agc:799
//#	THE FDAI ERROR NEEDLES WILL INDICATE THE VALUE
// P11.agc:800
//#	OF THE RATE COMMAND.
// P11.agc:801
//
// P11.agc:802
//# CALLING SEQUENCE
// P11.agc:803
//#
// P11.agc:804
//#	DAPFIG +9D	TC	POSTJUMP
// P11.agc:805
//#			CADR	SATSTKON
// P11.agc:806
//
// P11.agc:807
//# SUBROUTINES CALLED
// P11.agc:808
//
// P11.agc:809
//#	ENDEXT
// P11.agc:810
//#	IBNKCALL
// P11.agc:811
//#	STICKCHK
// P11.agc:812
//#	NEEDLER
// P11.agc:813
//#	T5RUPT
// P11.agc:814
//#	RESUME
// P11.agc:815
//
// P11.agc:816
//# VAL REQUESTS
// P11.agc:817
//
// P11.agc:818
//#	ENTRY	- VERB 46 ENTER
// P11.agc:819
//#		  (CONDITION - BITS 13, 14 OF DAPDATR1 SET)
// P11.agc:820
//#
// P11.agc:821
//#	EXIT	- VERB 48 ENTER	(FLASH V06N46)
// P11.agc:822
//#		  VERB 21 ENTER	AXXXX ENTER WHERE A=0 OR 1
// P11.agc:823
//#		  VERB 34 ENTER
// P11.agc:824
//#		  VERB 46 ENTER
// P11.agc:825
//
// P11.agc:826
//# NORMAL EXIT MODE
// P11.agc:827
//
// P11.agc:828
//#		VERB 46 ENTER	(SEE VAL ABOVE)
// P11.agc:829
//
// P11.agc:830
//# ALARM OR ABORT EXIT MODES
// P11.agc:831
//
// P11.agc:832
//#	NONE
// P11.agc:833
//
// P11.agc:834
//# OUTPUT
// P11.agc:835
//
// P11.agc:836
//#	ACAPELLO RATES IN CDUXCMD, CDUYCMD, CDUZCMD
// P11.agc:837
//
// P11.agc:838
//# ERASABLE INITIALIZATION
// P11.agc:839
//
// P11.agc:840
//#	DAPDATR1	(BITS 13,14 MUST BE SET)
// P11.agc:841
//
// P11.agc:842
//# DEBRIS
// P11.agc:843
//
// P11.agc:844
//#	CENTRALS
// P11.agc:845
//# Page 549
// P11.agc:846
//#	CDUXCMD, CDUYCMD, CDUZCMD
// P11.agc:847
//
// P11.agc:848
//		BANK	43
// P11.agc:849
//		SETLOC	EXTVERBS
// P11.agc:850
//		BANK
// P11.agc:851
//
// P11.agc:852
//		COUNT	23/STTKE
// P11.agc:853
//SATSTKON	EXTEND
// slot 38541
                if slot <> 38541 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P11.agc:854
//		DCA	2REDOSAT
// slot 38542
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
// P11.agc:855
//		INHINT
// slot 38543
                if slot <> 38543 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38544 {
// P11.agc:856
//		DXCH	T5LOC
// slot 38544
                    if slot <> 38544 or instruction <> 22219 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 715, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:857
//		CAF	POSMAX
// slot 38545
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
// P11.agc:858
//		TS	TIME5
// slot 38546
                if slot <> 38546 or instruction <> 22552 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22552, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P11.agc:859
//		CS	FLAGWRD6	# TURN ON BITS 15,14 OF
// slot 38547
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
// P11.agc:860
//		MASK	RELTAB11	# FLAGWRD6
// slot 38548
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
// P11.agc:861
//		ADS	FLAGWRD6	#	SATSTICK CONTROL OF T5
// slot 38549
                    if slot <> 38549 or instruction <> 11330 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 66).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:862
//		TC	IBNKCALL	# ZERO JET CHANNELS IN 14 MS AND THEN
// slot 38550
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
// P11.agc:863
//		CADR	ZEROJET		# LEAVE THE T6 CLOCK DISABLED
// slot 38551
    38551, 35636
)).

// bank 43, slots 38552-38553
function agcAotUnit2311 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38552 {
// P11.agc:864
//		RELINT
// slot 38552
        if slot <> 38552 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P11.agc:865
//		TC	GOPIN		# EXIT THUS BECAUSE WE CAME VIA V46
// slot 38553
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
// P11.agc:866
//
// P11.agc:867
//		EBANK=	BODY3
// P11.agc:868
//2REDOSAT	2CADR	REDOSAT
// slot 38554 38555
    38554, 3050, 38555, 39052
)).

// bank 23, slots 22005-22011
function agcAotUnit1249 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22007 {
        if slot <= 22005 {
// P11.agc:869
//
// P11.agc:870
//
// P11.agc:871
//		SBANK=  LOWSUPER
// P11.agc:872
//		BANK	32
// P11.agc:873
//		SETLOC	P11FOUR
// P11.agc:874
//		BANK
// P11.agc:875
//
// P11.agc:876
//REDOSAT		LXCH	BANKRUPT	# ALSO COMES HERE FOR RESTARTS
// slot 22005
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
// P11.agc:877
//		EXTEND
// slot 22006
                if slot <> 22006 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P11.agc:878
//		QXCH	QRUPT
// slot 22007
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
// P11.agc:879
//		CS	RCSFLAGS	# TURN ON BIT3 OF RCSFLAGX
// slot 22008
                if slot <> 22008 or instruction <> 17217 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 833).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P11.agc:880
//		MASK	BIT3		# FOR
// slot 22009
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
// P11.agc:881
//		ADS	RCSFLAGS	# NEEDLER INITIALIZATION
// slot 22010
                if slot <> 22010 or instruction <> 12097 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 833).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P11.agc:882
//		TC	IBNKCALL
// slot 22011
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
// P11.agc:883
//		CADR	NEEDLER		# DISABLE IMU ERR COUNTERS ETC.
// slot 22012
    22012, 35360
)).

// bank 23, slots 22013-22033
function agcAotUnit1250 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22022 {
        if slot <= 22017 {
            if slot <= 22014 {
                if slot <= 22013 {
// P11.agc:884
//		CAF	BIT9		# SIVB
// slot 22013
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
// P11.agc:885
//		EXTEND			# TAKEOVER
// slot 22014
                    if slot <> 22014 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 22015 {
// P11.agc:886
//		WOR	CHAN12		# ENABLE
// slot 22015
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
// P11.agc:887
//		EXTEND			# SET UP T5 CYCLE
// slot 22016
                        if slot <> 22016 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:888
//		DCA	2SATSTCK
// slot 22017
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
// P11.agc:889
//		DXCH	T5LOC
// slot 22018
                    if slot <> 22018 or instruction <> 22219 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 715, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:890
//		CAF	100MST5		# IN 100 MSECS
// slot 22019
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
// P11.agc:891
//		TS	TIME5
// slot 22020
                    if slot <> 22020 or instruction <> 22552 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22552, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22021 {
// P11.agc:892
//		TCF	RESUME		# END OF ACAPELLO STICK INITIALIZATION
// slot 22021
                        if slot <> 22021 or instruction <> 6875 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6875, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:893
//
// P11.agc:894
//#	THIS SECTION IS EXECUTED EVERY 100 MSECS
// P11.agc:895
//# Page 550
// P11.agc:896
//SATSTICK	LXCH	BANKRUPT
// slot 22022
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
// P11.agc:897
//		EXTEND
// slot 22023
                    if slot <> 22023 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// P11.agc:898
//		QXCH	QRUPT
// slot 22024
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
// P11.agc:899
//
// P11.agc:900
//		CAF	2SATSTCK	# SET UP RUPT
// slot 22025
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
// P11.agc:901
//		TS	T5LOC		# LO ORDER LOC SET
// slot 22026
                        if slot <> 22026 or instruction <> 23242 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23242, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// P11.agc:902
//		CAF	100MST5		# 100 MSECS
// slot 22027
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
// P11.agc:903
//		TS	TIME5
// slot 22028
                    if slot <> 22028 or instruction <> 22552 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22552, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 22029 {
// P11.agc:904
//		CAF	STIKBITS
// slot 22029
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
// P11.agc:905
//		EXTEND
// slot 22030
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
// P11.agc:906
//		RXOR	CHAN31		# CHECK IF MAN ROT BITS SAME
// slot 22031
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
// P11.agc:907
//		MASK	STIKBITS
// slot 22032
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
// P11.agc:908
//		TC	IBNKCALL	# SET RATE INDICES
// slot 22033
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
// P11.agc:909
//		CADR	STICKCHK	# FOR PITCH YAW AND ROLL
// slot 22034
    22034, 36016
)).

// bank 23, slots 22035-22035
function agcAotUnit1251 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P11.agc:910
//
// P11.agc:911
//		INDEX	RMANNDX		# SET ACAPELLO RATES
// slot 22035
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
// P11.agc:912
//		CA	SATRATE
// slot 22036
    22036, 26530
)).

// bank 23, slots 22037-22038
function agcAotUnit1252 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22037 {
// P11.agc:913
//		TS	AK		#		ROLL
// slot 22037
        if slot <> 22037 or instruction <> 23358 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23358, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P11.agc:914
//		INDEX	PMANNDX
// slot 22038
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
// P11.agc:915
//		CA	SATRATE
// slot 22039
    22039, 26530
)).

// bank 23, slots 22040-22041
function agcAotUnit1253 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22040 {
// P11.agc:916
//		TS	AK1		#		PITCH
// slot 22040
        if slot <> 22040 or instruction <> 23359 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23359, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P11.agc:917
//		INDEX	YMANNDX
// slot 22041
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
// P11.agc:918
//		CA	SATRATE
// slot 22042
    22042, 26530
)).

// bank 23, slots 22043-22044
function agcAotUnit1254 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 22043 {
// P11.agc:919
//		TS	AK2		#		YAW
// slot 22043
        if slot <> 22043 or instruction <> 23360 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23360, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P11.agc:920
//
// P11.agc:921
//		TC	IBNKCALL	# FOR ACAPELLO INTERFACE AND FDAI DISPLAY
// slot 22044
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
// P11.agc:922
//		CADR	NEEDLER
// slot 22045
    22045, 35360
)).

// bank 23, slots 22046-22046
function agcAotUnit1255 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P11.agc:923
//		TCF	RESUME		# END OF ACAPELLO STICK CONTROL
// slot 22046
    if slot <> 22046 or instruction <> 6875 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6875, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1255] to agcAotUnit1255@.

agcAotInstallSourceRope(list(
// P11.agc:924
//
// P11.agc:925
//STIKBITS	OCT	00077
// slot 22047
    22047, 126,
// P11.agc:926
//100MST5		DEC	16374
// slot 22048
    22048, 32748,
// P11.agc:927
//		EBANK=	BODY3
// P11.agc:928
//2SATSTCK	2CADR	SATSTICK
// slot 22049 22050
    22049, 3084, 22050, 39020
)).

