// TVCROLLDAP.agc
// bank 16, slots 17082-17124
function agcAotUnit978 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17102 {
        if slot <= 17091 {
            if slot <= 17086 {
                if slot <= 17083 {
                    if slot <= 17082 {
// TVCROLLDAP.agc:1
//# Copyright:	Public domain.
// TVCROLLDAP.agc:2
//# Filename:	TVCROLLDAP.agc
// TVCROLLDAP.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// TVCROLLDAP.agc:4
//#		It is part of the source code for the Command Module's (CM)
// TVCROLLDAP.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// TVCROLLDAP.agc:6
//# Assembler:	yaYUL
// TVCROLLDAP.agc:7
//# Contact:	Burkey Kerman <info@sandroid.org>.
// TVCROLLDAP.agc:8
//# Website:	www.ibiblio.org/apollo.
// TVCROLLDAP.agc:9
//# Pages:	984-998
// TVCROLLDAP.agc:10
//# Mod history:	2009-05-13 RSB	Adapted from the Colossus249/ file of the
// TVCROLLDAP.agc:11
//#				same name, using Comanche055 page images.
// TVCROLLDAP.agc:12
//#
// TVCROLLDAP.agc:13
//# This source code has been transcribed or otherwise adapted from digitized
// TVCROLLDAP.agc:14
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// TVCROLLDAP.agc:15
//# by Fjeld Kerman, and arranged for by Douglas Kerman of the Museum.  Many
// TVCROLLDAP.agc:16
//# thanks to both.  The images (with suitable reduction in storage size and
// TVCROLLDAP.agc:17
//# consequent reduction in image quality as well) are available online at
// TVCROLLDAP.agc:18
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// TVCROLLDAP.agc:19
//# illegible, contact me at info@sandroid.org about getting access to the
// TVCROLLDAP.agc:20
//# (much) higher-quality images which Fjeld Kerman actually created.
// TVCROLLDAP.agc:21
//#
// TVCROLLDAP.agc:22
//# Notations on the hardcopy document read, in part:
// TVCROLLDAP.agc:23
//#
// TVCROLLDAP.agc:24
//#	Assemble revision 055 of AGC program Comanche by NASA
// TVCROLLDAP.agc:25
//#	2021113-051.  10:28 APR. 1, 1969
// TVCROLLDAP.agc:26
//#
// TVCROLLDAP.agc:27
//#	This AGC program shall also be referred to as
// TVCROLLDAP.agc:28
//#			Colossus 2A
// TVCROLLDAP.agc:29
//
// TVCROLLDAP.agc:30
//# Page 984
// TVCROLLDAP.agc:31
//# PROGRAM NAME...TVC ROLL AUTOPILOT
// TVCROLLDAP.agc:32
//# LOG SECTION...TVCROLLDAP			SUBROUTINE...DAPCSM
// TVCROLLDAP.agc:33
//# MOD BY SCHLUNDT KERMAN				21 OCTOBER 1968
// TVCROLLDAP.agc:34
//
// TVCROLLDAP.agc:35
//
// TVCROLLDAP.agc:36
//# FUNCTIONAL DESCRIPTION....
// TVCROLLDAP.agc:37
//
// TVCROLLDAP.agc:38
//#      *AN ADAPTATION OF THE LEM P-AXIS CONTROLLER
// TVCROLLDAP.agc:39
//#      *MAINTAIN OGA WITHIN 5 DEG DEADBND OF OGAD, WHERE OGAD = OGA AS SEEN
// TVCROLLDAP.agc:40
//#	BY IGNITION (P40)
// TVCROLLDAP.agc:41
//#      *MAINTAIN OGA RATE LESS THAN 0.1 DEG/SEC LIMIT CYCLE RATE
// TVCROLLDAP.agc:42
//#      *SWITCHING LOGIC IN PHASE PLANE.... SEE GSOP CHAPTER 3
// TVCROLLDAP.agc:43
//#      *USES T6 CLOCK TO TIME JET FIRINGS
// TVCROLLDAP.agc:44
//#      *MAXIMUM JET FIRING TIME = 2.56 SECONDS, LIMITED TO 2.5 IF GREATER
// TVCROLLDAP.agc:45
//#      *MINIMUM JET FIRING TIME = 15 MS
// TVCROLLDAP.agc:46
//#      *JET PAIRS FIRE ALTERNATELY
// TVCROLLDAP.agc:47
//#      *AT LEAST 1/2 SECOND DELAY BEFORE A NEW JET PAIR IS FIRED
// TVCROLLDAP.agc:48
//#      *JET FIRINGS MAY NOT BE EXTENDED, ONLY SHORTENED, WHEN RE-EVALUATION
// TVCROLLDAP.agc:49
//#	OF A JET FIRING TIME IS MADE ON A LATER PASS
// TVCROLLDAP.agc:50
//
// TVCROLLDAP.agc:51
//# CALLING SEQUENCE....
// TVCROLLDAP.agc:52
//
// TVCROLLDAP.agc:53
//#      *ROLLDAP CALL VIA WAITLIST, IN PARTICULAR BY TVCEXEC (EVERY 1/2 SEC)
// TVCROLLDAP.agc:54
//#	WITH A 3CS DELAY TO ALLOW FREE TIME FOR OTHER RUPTS (DWNRPT, ETC.)
// TVCROLLDAP.agc:55
//
// TVCROLLDAP.agc:56
//# NORMAL EXIT MODES.... ENDOFJOB
// TVCROLLDAP.agc:57
//
// TVCROLLDAP.agc:58
//# ALARM OR ABORT EXIT MODES.... NONE
// TVCROLLDAP.agc:59
//
// TVCROLLDAP.agc:60
//# SUBROUTINES CALLED.....NONE
// TVCROLLDAP.agc:61
//
// TVCROLLDAP.agc:62
//# OTHER INTERFACES....
// TVCROLLDAP.agc:63
//
// TVCROLLDAP.agc:64
//#      *TVCEXEC SETS UP ROLLDAP TASK EVERY 1/2 SECOND AND UPDATES 1/CONACC
// TVCROLLDAP.agc:65
//#	EVERY 10 SECONDS (VIA MASSPROP AND S40.15)
// TVCROLLDAP.agc:66
//#      *RESTARTS SUSPEND ROLL DAP COMPUTATIONS UNTIL THE NEXT 1/2 SEC
// TVCROLLDAP.agc:67
//#	SAMPLE PERIOD.  (THE PART OF TVCEXECUTIVE THAT CALLS ROLL DAP IS
// TVCROLLDAP.agc:68
//#	NOT RESTARTED.)  THE OGAD FROM IGNITION IS MAINTAINED.
// TVCROLLDAP.agc:69
//
// TVCROLLDAP.agc:70
//# ERASABLE INITIALIZATION REQUIRED....
// TVCROLLDAP.agc:71
//
// TVCROLLDAP.agc:72
//#      *1/CONACC (S40.15)
// TVCROLLDAP.agc:73
//#      *OGAD (CDUX AT IGNITION)
// TVCROLLDAP.agc:74
//#      *OGANOW (CDUX AT TVCINIT4 AND TVCEXECUTIVE)
// TVCROLLDAP.agc:75
//#      *OGAPAST (OGANOW AT TVCEXECUTIVE)
// TVCROLLDAP.agc:76
//#      *ROLLFIRE = TEMREG = ROLLWORD = 0 (MRCLEAN LOOP IN TVCDAPON)
// TVCROLLDAP.agc:77
//#
// TVCROLLDAP.agc:78
//# OUTPUT....
// TVCROLLDAP.agc:79
//
// TVCROLLDAP.agc:80
//#      *ROLL JET PAIR FIRINGS
// TVCROLLDAP.agc:81
//
// TVCROLLDAP.agc:82
//# Page 985
// TVCROLLDAP.agc:83
//# DEBRIS.... MISCELLANEOUS, SHAREABLE WITH RCS/ENTRY, IN EBANK6 ONLY
// TVCROLLDAP.agc:84
//
// TVCROLLDAP.agc:85
//# Page 986
// TVCROLLDAP.agc:86
//# SOME NOTES ON THE ROLL AUTOPILOT, AND IN PARTICULAR, ON ITS SWITCHING
// TVCROLLDAP.agc:87
//# LOGIC.  SEE SECTION THREE OF THE GSOP (SUNDISK/COLOSSUS) FOR DETAILS.
// TVCROLLDAP.agc:88
//
// TVCROLLDAP.agc:89
//# SWITCHING LOGIC IN THE PHASE PLANE....
// TVCROLLDAP.agc:90
//
// TVCROLLDAP.agc:91
//#                              OGARATE
// TVCROLLDAP.agc:92
//#                                 *
// TVCROLLDAP.agc:93
//#                                 *
// TVCROLLDAP.agc:94
//#  * * * * * * * * * * *          *
// TVCROLLDAP.agc:95
//#                                 *     (REGION 1, SEE TEXT BELOW)
// TVCROLLDAP.agc:96
//#                            *    *
// TVCROLLDAP.agc:97
//#                                 *
// TVCROLLDAP.agc:98
//# * * * * * * *     (COAST)       *     ...PARABOLA (SWITCHING = CONTROL)
// TVCROLLDAP.agc:99
//#               *                 *    .
// TVCROLLDAP.agc:100
//#                 *               *   *
// TVCROLLDAP.agc:101
//#                   *             *                (FIRE NEG ROLL JETS)
// TVCROLLDAP.agc:102
//#                     *           *      *
// TVCROLLDAP.agc:103
//#     (-DB,+LMCRATE)....*         *
// TVCROLLDAP.agc:104
//#                       *         *        *
// TVCROLLDAP.agc:105
//#                       *         *			         OGAERROR
// TVCROLLDAP.agc:106
//# ************************************************************************
// TVCROLLDAP.agc:107
//#                                 *         *                (-AK, OGAERR)
// TVCROLLDAP.agc:108
//#                        *        *         *      (REGION 6-PRIME)
// TVCROLLDAP.agc:109
//#                                 *         *      (SEE TEXT BELOW)
// TVCROLLDAP.agc:110
//#                          *      *           *
// TVCROLLDAP.agc:111
//#                                 *             *     ...STRAIGHT LINE
// TVCROLLDAP.agc:112
//#    (FIRE POS ROLL JETS)     *   *               *  .
// TVCROLLDAP.agc:113
//#                                 *   (COAST)       *
// TVCROLLDAP.agc:114
//#                                 *                   * * * * * * * * * *
// TVCROLLDAP.agc:115
//#                                 *                         -MINLIM
// TVCROLLDAP.agc:116
//#                                 *    *
// TVCROLLDAP.agc:117
//#                                 *
// TVCROLLDAP.agc:118
//#                                 *          * * * * * * * * * * * * * * *
// TVCROLLDAP.agc:119
//#                                 *                        -MAXLIM
// TVCROLLDAP.agc:120
//#                                 *
// TVCROLLDAP.agc:121
//#                                 *
// TVCROLLDAP.agc:122
//
// TVCROLLDAP.agc:123
//# SWITCHING PARABOLAS ARE CONTROL PARABOLAS, THUS REQUIRING KNOWLEDGE OF
// TVCROLLDAP.agc:124
//#	CONTROL ACCELERATION CONACC, OR ITS RECIPROCAL, 1/CONACC, THE TVC
// TVCROLLDAP.agc:125
//#	ROLL DAP GAIN (SEE TVCEXECUTIVE VARIABLE GAIN PACKAGE).  JET
// TVCROLLDAP.agc:126
//#	FIRING TIME IS SIMPLY THAT REQUIRED TO ACHIEVE THE DESIRED OGARATE,
// TVCROLLDAP.agc:127
//#	SUBJECT TO THE LIMITATIONS DISCUSSED UNDER FUNCTIONAL DESCRIPTION,
// TVCROLLDAP.agc:128
//#	ABOVE.
// TVCROLLDAP.agc:129
//
// TVCROLLDAP.agc:130
//# THE THREE CONTROL REGIONS (+, -, AND ZERO TORQUE) ARE COMPRIZED OF
// TVCROLLDAP.agc:131
//#	TWELVE SUBSET REGIONS ( 1...6, AND THE CORRESPONDING 1-PRIME...
// TVCROLLDAP.agc:132
//#	6-PRIME ) SEE SECTION 3 OF THE GSOP (SUNDISK OR COLOSSUS)
// TVCROLLDAP.agc:133
//# Page 987
// TVCROLLDAP.agc:134
//#
// TVCROLLDAP.agc:135
//# GIVEN THE OPERATING POINT NOT IN THE COAST REGION, THE DESIRED OGARATE
// TVCROLLDAP.agc:136
//#	IS AT THE POINT OF PENETRATION OF THE COAST REGION BY THE CONTROL
// TVCROLLDAP.agc:137
//#	PARABOLA WHICH PASSES THROUGH THE OPERATING POINT.  FOR REGION 3
// TVCROLLDAP.agc:138
//#	DESIRED OGARATE IS SIMPLY +-MAXLIM.  FOR REGIONS 1 OR 6 THE SOLUTION
// TVCROLLDAP.agc:139
//#	TO A QUADRATIC IS REQUIRED (THE PENETRATION IS ALONG THE STRAIGHT
// TVCROLLDAP.agc:140
//#	LINE OR MINLIM BOUNDRY SWITCH LINES).  AN APPROXIMATION IS MADE
// TVCROLLDAP.agc:141
//#	INSTEAD.  TAKE AN OPERATING POINT IN REGION 6' .  PASS A TANGENT TO
// TVCROLLDAP.agc:142
//#	THE CONTROL PARABOLA THROUGH THE OPERATING POINT, AND FIND ITS
// TVCROLLDAP.agc:143
//#	INTERSECTION WITH THE STRAIGHT LINE SECTION OF THE SWITCH CURVE...
// TVCROLLDAP.agc:144
//#	THE INTERSECTION DEFINES THE DESIRED OGARATE.  IF THE OPERATING POINT IS
// TVCROLLDAP.agc:145
//#	CLOSE TO THE SWITCH LINE, THE APPROXIMATION IS QUITE GOOD (INDEED
// TVCROLLDAP.agc:146
//#	THE APPROXIMATE AND QUADRATIC SOLUTIONS CONVERGE IN THE LIMIT AS
// TVCROLLDAP.agc:147
//#	THE SWITCH LINE IS APPROACHED).  IF THE OPERATING POINT IS NOT CLOSE
// TVCROLLDAP.agc:148
//#	TO THE SWITCH LINE, THE APPROXIMATE SOLUTION GIVES VALID TREND
// TVCROLLDAP.agc:149
//#	INFORMATION (DIRECTION OF DESIRED OGARATE) AT LEAST.  THE
// TVCROLLDAP.agc:150
//#	RE-EVALUATION OF DESIRED OGARATE IN SUBSEQUENT ROLL DAP PASSES (1/2
// TVCROLLDAP.agc:151
//#	SECOND INTERVALS) WILL BENEFIT FROM THE CONVERGENT NATURE OF THE
// TVCROLLDAP.agc:152
//#	APPROXIMATION.
// TVCROLLDAP.agc:153
//
// TVCROLLDAP.agc:154
//# FOR LARGE OGAERROR THE TANGENT INTERSECTS +-MINLIM SWITCH BOUNDARY BEFORE
// TVCROLLDAP.agc:155
//#	INTERSECTING THE STRAIGHT LINE SWITCH.  HOWEVER THE MINLIM IS
// TVCROLLDAP.agc:156
//#	IGNORED IN COMPUTING THE FIRING TIME, SO THAT THE EXTENSION (INTO
// TVCROLLDAP.agc:157
//#	THE COAST REGION) OF THE STRAIGHT LINE SWITCH IS WHAT IS FIRED TO.
// TVCROLLDAP.agc:158
//#	IF THE ROLL DAP FINDS ITSELF IN THE COAST REGION BEFORE REACHING
// TVCROLLDAP.agc:159
//#	THE DESIRED INTERSECTION (IE. IN THE REGION BETWEEN THE MINLIM
// TVCROLLDAP.agc:160
//#	AND THE STRAIGHT LINE SWITCH) IT WILL EXHIBIT NORMAL COAST-REGION
// TVCROLLDAP.agc:161
//#	BEHAVIOR AND TURN OFF THE JETS.  THE PURPOSE OF THIS FIRING POLICY
// TVCROLLDAP.agc:162
//#	IS TO MAINTAIN STATIC ROLL STABILITY IN THE EVENT OF A JET
// TVCROLLDAP.agc:163
//#	FAILED-ON.
// TVCROLLDAP.agc:164
//
// TVCROLLDAP.agc:165
//# WHEN THE OPERATING POINT IS IN REGION 1 THE SAME APPROXIMATION IS
// TVCROLLDAP.agc:166
//#	MADE, BUT AT AN ARTIFICIALLY-CREATED OR DUMMY OPERATING POINT,
// TVCROLLDAP.agc:167
//#	DEFINED BY.. OGAERROR = INTERSECTION OF CONTROL PARABOLA AND
// TVCROLLDAP.agc:168
//#	OGAERROR AXIS, OGARATE = +-LMCRATE WHERE SIGN IS OPPOSITE THAT OF
// TVCROLLDAP.agc:169
//#	REAL OPERATING POINT RATE.  WHEN THE OPERATING POINT HAS PASSED
// TVCROLLDAP.agc:170
//#	FROM REGION 1 TO REGION 6', THE DUMMY POINT IS NO LONGER REQUIRED,
// TVCROLLDAP.agc:171
//#	AND THE SOLUTION REVERTS TO THAT OF A REGULAR REGION 6' POINT.
// TVCROLLDAP.agc:172
//
// TVCROLLDAP.agc:173
//
// TVCROLLDAP.agc:174
//# EQUATION FOR SWITCHING PARABOLA (SEE FIGURE ABOVE)....
// TVCROLLDAP.agc:175
//#				  2
// TVCROLLDAP.agc:176
//#	SOGAERROR = (DB - (SOGARATE) (1/CONACC)/2) SGN(SOGARATE)
// TVCROLLDAP.agc:177
//
// TVCROLLDAP.agc:178
//
// TVCROLLDAP.agc:179
//# EQUATION FOR SWITCHING STRAIGHT LINE SEGMENT....
// TVCROLLDAP.agc:180
//
// TVCROLLDAP.agc:181
//#	SOGARATE = -(-SLOPE)(SOGAERROR) - SGN(SOGARATE) INTERCEP
// TVCROLLDAP.agc:182
//
// TVCROLLDAP.agc:183
//#		WHERE  INTERCEP = DB(-SLOPE) - LMCRATE
// TVCROLLDAP.agc:184
//# Page 988
// TVCROLLDAP.agc:185
//#
// TVCROLLDAP.agc:186
//# EQUATION FOR INTERSECTION, CONTROL PARABOLA AND STRAIGHT SWITCH LINE....
// TVCROLLDAP.agc:187
//
// TVCROLLDAP.agc:188
//#	DOGADOT = NUM/DEN, WHERE
// TVCROLLDAP.agc:189
//#				   2
// TVCROLLDAP.agc:190
//#	    NUM = (-SLOPE)(OGARATE) (1/CONACC)
// TVCROLLDAP.agc:191
//#		    +SGN(DELOGA)(-SLOPE)(OGAERROR - SGN(DELOGA)(DB))
// TVCROLLDAP.agc:192
//#		    +LMCRATE
// TVCROLLDAP.agc:193
//
// TVCROLLDAP.agc:194
//#	    DEN = (-SLOPE)(LMCRATE)(1/CONACC) - SGN(DELOGA)
// TVCROLLDAP.agc:195
//
// TVCROLLDAP.agc:196
//#					      2
// TVCROLLDAP.agc:197
//#	    DELOGA = OGAERROR - (DB - (OGADOT) (1/CONACC)/2) SGN(OGARATE)
// TVCROLLDAP.agc:198
//
// TVCROLLDAP.agc:199
//
// TVCROLLDAP.agc:200
//# FOR REGIONS 6 AND 6-PRIME USE ACTUAL OPERATING POINT (OGA, OGARATE)
// TVCROLLDAP.agc:201
//#	FOR OGAERROR AND OGARATE IN THE INTERSECTION EQUATIONS ABOVE.
// TVCROLLDAP.agc:202
//#	FOR REGIONS 1 AND 1-PRIME USE DUMMY OPERATING POINT FOR OGAERROR
// TVCROLLDAP.agc:203
//#	AND OGARATE, WHERE THE DUMMY POINT IS GIVEN BY....
// TVCROLLDAP.agc:204
//#	OGAERROR= DELOGA + DB SGN(OGARATE)
// TVCROLLDAP.agc:205
//#	OGARATE= -LMCRATE SGN(OGARATE)
// TVCROLLDAP.agc:206
//#
// TVCROLLDAP.agc:207
//# NOTE, OGAERROR = OGA - OGAD USES DUMMY REGISTER OGA IN ROLL DAP CODING
// TVCROLLDAP.agc:208
//#	ALSO, AT POINT WHERE DOGARATE IS COMPUTED, REGISTER DELOGA IS USED
// TVCROLLDAP.agc:209
//#	AS A DUMMY REGISTER FOR THE OGAERROR IN THE NUM EQUATION ABOVE
// TVCROLLDAP.agc:210
//# Page 989
// TVCROLLDAP.agc:211
//
// TVCROLLDAP.agc:212
//# ROLLDAP CODING....
// TVCROLLDAP.agc:213
//
// TVCROLLDAP.agc:214
//		SETLOC	DAPROLL
// TVCROLLDAP.agc:215
//		BANK
// TVCROLLDAP.agc:216
//		EBANK=	OGANOW
// TVCROLLDAP.agc:217
//		COUNT*	$$/ROLL
// TVCROLLDAP.agc:218
//ROLLDAP		CAE	OGANOW		# OGA RATE ESTIMATOR...SIMPLE FIRST-ORDER
// slot 17082
                        if slot <> 17082 or instruction <> 13234 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 946).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCROLLDAP.agc:219
//		EXTEND			#	DIFFERENCE (SAMPLE TIME = 1/2 SEC)
// slot 17083
                        if slot <> 17083 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17084 {
// TVCROLLDAP.agc:220
//		MSU	OGAPAST
// slot 17084
                        if slot <> 17084 or instruction <> 9139 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMSU(words, 947).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17085 {
// TVCROLLDAP.agc:221
//		EXTEND
// slot 17085
                            if slot <> 17085 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TVCROLLDAP.agc:222
//		MP	BIT5
// slot 17086
                            if slot <> 17086 or instruction <> 31243 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2571, readEffective:call(words, 2571)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 17088 {
                    if slot <= 17087 {
// TVCROLLDAP.agc:223
//		LXCH	A
// slot 17087
                        if slot <> 17087 or instruction <> 9216 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 0, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCROLLDAP.agc:224
//		TS	OGARATE		# SC.AT B-4 REV/SEC
// slot 17088
                        if slot <> 17088 or instruction <> 23387 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23387, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17089 {
// TVCROLLDAP.agc:225
//
// TVCROLLDAP.agc:226
//# COMPUTATIONS WHICH FOLLOW USE OGA FOR OGAERR (SAME REGISTER)
// TVCROLLDAP.agc:227
//# EXAMINE DURATION OF LAST JET FIRING IF JETS ARE NOW ON.
// TVCROLLDAP.agc:228
//
// TVCROLLDAP.agc:229
//DURATION	CA	ROLLFIRE	# SAME SGN AS PRESENT TORQ,MAGN=POSMAX
// slot 17089
                        if slot <> 17089 or instruction <> 13177 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 889).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17090 {
// TVCROLLDAP.agc:230
//		EXTEND
// slot 17090
                            if slot <> 17090 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TVCROLLDAP.agc:231
//		BZF	+2		# ROLL JETS ARE NOW OFF.
// slot 17091
                            if slot <> 17091 or instruction <> 5829 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5829, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 17096 {
                if slot <= 17093 {
                    if slot <= 17092 {
// TVCROLLDAP.agc:232
//		TCF	ROLLOGIC	# ENTER LOGIC,JETS NOW ON.
// slot 17092
                        if slot <> 17092 or instruction <> 5835 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5835, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCROLLDAP.agc:233
//
// TVCROLLDAP.agc:234
//		CAE	TEMREG		# EXAMINE LAST FIRING INTERVAL
// slot 17093
                        if slot <> 17093 or instruction <> 13179 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 891).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17094 {
// TVCROLLDAP.agc:235
//		EXTEND			# IF POSITIVE, DONT FIRE
// slot 17094
                        if slot <> 17094 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17095 {
// TVCROLLDAP.agc:236
//		BZF	ROLLOGIC	# ENTER LOGIC, JETS NOW OFF.
// slot 17095
                            if slot <> 17095 or instruction <> 5835 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5835, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TVCROLLDAP.agc:237
//
// TVCROLLDAP.agc:238
//		CAF	ZERO		# JETS HAVE NOT BEEN OFF FOR 1/2 SEC. WAIT
// slot 17096
                            if slot <> 17096 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
                if slot <= 17099 {
                    if slot <= 17097 {
// TVCROLLDAP.agc:239
//		TS	TEMREG		# RESET TEMREG
// slot 17097
                        if slot <> 17097 or instruction <> 23419 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23419, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17098 {
// TVCROLLDAP.agc:240
//WAIT1/2		TCF	TASKOVER	# EXIT ROLL DAP
// slot 17098
                            if slot <> 17098 or instruction <> 6868 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6868, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TVCROLLDAP.agc:241
//
// TVCROLLDAP.agc:242
//# COMPUTE DB-(1/2 CONACC) (OGARATE)SQ  (1/2 IN THE SCALING)
// TVCROLLDAP.agc:243
//
// TVCROLLDAP.agc:244
//ROLLOGIC	CS	OGARATE		# SCALED AT 2(-4) REV/SEC
// slot 17099
                            if slot <> 17099 or instruction <> 17243 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 859).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17100 {
// TVCROLLDAP.agc:245
//		EXTEND
// slot 17100
                        if slot <> 17100 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17101 {
// TVCROLLDAP.agc:246
//		MP	1/CONACC	# SCALED AT 2(+9) SEC SQ /REV
// slot 17101
                            if slot <> 17101 or instruction <> 29600 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 928, readEffective:call(words, 928)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TVCROLLDAP.agc:247
//		EXTEND
// slot 17102
                            if slot <> 17102 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 17113 {
            if slot <= 17107 {
                if slot <= 17104 {
                    if slot <= 17103 {
// TVCROLLDAP.agc:248
//		MP	OGARATE
// slot 17103
                        if slot <> 17103 or instruction <> 29531 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 859, readEffective:call(words, 859)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCROLLDAP.agc:249
//		AD	DB		# SCALED AT 2(+0) REV
// slot 17104
                        if slot <> 17104 or instruction <> 26566 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1990), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17105 {
// TVCROLLDAP.agc:250
//		TS	TEMREG		# QUANTITY SCALED AT 2(+0) REV.
// slot 17105
                        if slot <> 17105 or instruction <> 23419 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23419, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17106 {
// TVCROLLDAP.agc:251
//
// TVCROLLDAP.agc:252
//# GET SIGN OF OGARATE
// TVCROLLDAP.agc:253
//
// TVCROLLDAP.agc:254
//		CA	OGARATE
// slot 17106
                            if slot <> 17106 or instruction <> 13147 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 859).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TVCROLLDAP.agc:255
//		EXTEND
// slot 17107
                            if slot <> 17107 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 17110 {
                    if slot <= 17108 {
// TVCROLLDAP.agc:256
//		BZMF	+3		# LET SGN(0) BE NEGATIVE
// slot 17108
                        if slot <> 17108 or instruction <> 26327 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26327, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17109 {
// TVCROLLDAP.agc:257
//		CA	BIT1
// slot 17109
                            if slot <> 17109 or instruction <> 14863 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TVCROLLDAP.agc:258
//		TCF	+2
// slot 17110
                            if slot <> 17110 or instruction <> 5848 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5848, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17111 {
// TVCROLLDAP.agc:259
//		CS	BIT1
// slot 17111
                        if slot <> 17111 or instruction <> 18959 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17112 {
// TVCROLLDAP.agc:260
//		TS	SGNRT		# + OR -  2(-14)
// slot 17112
                            if slot <> 17112 or instruction <> 23478 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23478, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TVCROLLDAP.agc:261
//
// TVCROLLDAP.agc:262
//# Page 990
// TVCROLLDAP.agc:263
//# CALCULATE DISTANCE FROM SWITCH PARABOLA (DELOGA)
// TVCROLLDAP.agc:264
//
// TVCROLLDAP.agc:265
//		EXTEND
// slot 17113
                            if slot <> 17113 or instruction <> 6 { return choose false if checkOnly else -1. }
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
            if slot <= 17118 {
                if slot <= 17115 {
                    if slot <= 17114 {
// TVCROLLDAP.agc:266
//		MP	TEMREG		# SGN(OGARATE) TEMREG NOW IN L
// slot 17114
                        if slot <> 17114 or instruction <> 29563 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 891, readEffective:call(words, 891)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCROLLDAP.agc:267
//		CS	L
// slot 17115
                        if slot <> 17115 or instruction <> 16385 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 1).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17116 {
// TVCROLLDAP.agc:268
//		AD	OGA		# SCALED AT 2(+0) REV
// slot 17116
                        if slot <> 17116 or instruction <> 25524 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 948).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17117 {
// TVCROLLDAP.agc:269
//DELOGAC		TS	DELOGA		# SC.AT B+0 REV, PLUS TO RIGHT OF C-PARAB
// slot 17117
                            if slot <> 17117 or instruction <> 23479 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23479, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TVCROLLDAP.agc:270
//
// TVCROLLDAP.agc:271
//# EXAMINE SGN(DELOGA) AND CREATE CA OR CS INSTR. DEPENDING UPON SIGN.
// TVCROLLDAP.agc:272
//
// TVCROLLDAP.agc:273
//		EXTEND
// slot 17118
                            if slot <> 17118 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 17121 {
                    if slot <= 17119 {
// TVCROLLDAP.agc:274
//		BZMF	+3
// slot 17119
                        if slot <> 17119 or instruction <> 26338 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26338, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17120 {
// TVCROLLDAP.agc:275
//		CAF	PRIO30		# =CA (30000)
// slot 17120
                            if slot <> 17120 or instruction <> 14585 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2297), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TVCROLLDAP.agc:276
//		TCF	+2
// slot 17121
                            if slot <> 17121 or instruction <> 5859 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5859, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 17122 {
// TVCROLLDAP.agc:277
//		CAF	BIT15		# =CS (40000)
// slot 17122
                        if slot <> 17122 or instruction <> 14849 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17123 {
// TVCROLLDAP.agc:278
//		TS	I
// slot 17123
                            if slot <> 17123 or instruction <> 23480 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23480, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TVCROLLDAP.agc:279
//
// TVCROLLDAP.agc:280
//		INDEX	I		# TSET ON I SGN(OGARATE)
// slot 17124
                            if slot <> 17124 or instruction <> 21432 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 21432, words[0], readEffective).
                            }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 21432, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[978] to agcAotUnit978@.

agcAotInstallSourceRope(list(
// TVCROLLDAP.agc:281
//		0	SGNRT		# CA OR CS
// slot 17125
    17125, 1900
)).

// bank 16, slots 17126-17129
function agcAotUnit979 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17127 {
        if slot <= 17126 {
// TVCROLLDAP.agc:282
//		COM
// slot 17126
            if slot <> 17126 or instruction <> 16384 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 0).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// TVCROLLDAP.agc:283
//		EXTEND
// slot 17127
            if slot <> 17127 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17128 {
// TVCROLLDAP.agc:284
//REG1TST		BZMF	ROLLON		# IF REGION 1 (DELOGA OGARATE SAME SIGN)
// slot 17128
            if slot <> 17128 or instruction <> 26385 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26385, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// TVCROLLDAP.agc:285
//
// TVCROLLDAP.agc:286
//# NO JET FIRE YET.  TEST FOR MAX OGARATE
// TVCROLLDAP.agc:287
//
// TVCROLLDAP.agc:288
//		INDEX	I
// slot 17129
            if slot <> 17129 or instruction <> 21432 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21432, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21432, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[979] to agcAotUnit979@.

agcAotInstallSourceRope(list(
// TVCROLLDAP.agc:289
//		0	OGARATE		# CA OR CS...BOTH MUST BE NEG. HERE
// slot 17130
    17130, 1718
)).

// bank 16, slots 17131-17146
function agcAotUnit980 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17138 {
        if slot <= 17134 {
            if slot <= 17132 {
                if slot <= 17131 {
// TVCROLLDAP.agc:290
//		TS	IOGARATE	# I.E. I OGARATE
// slot 17131
                    if slot <> 17131 or instruction <> 23481 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23481, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCROLLDAP.agc:291
//		AD	MAXLIM		# SCALED AT 2(-4) REV/SEC
// slot 17132
                    if slot <> 17132 or instruction <> 26572 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 1996), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17133 {
// TVCROLLDAP.agc:292
//		EXTEND
// slot 17133
                    if slot <> 17133 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCROLLDAP.agc:293
//REG3TST		BZMF	RATELIM		# IF REGION 3 (RATES TOO HIGH, FIRE JETS)
// slot 17134
                    if slot <> 17134 or instruction <> 26432 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26432, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17136 {
                if slot <= 17135 {
// TVCROLLDAP.agc:294
//
// TVCROLLDAP.agc:295
//# COMPUTATION OF I((-SLOPE)OGA + OGARATE) - INTERCEPT..NOTE THAT STR. LINE
// TVCROLLDAP.agc:296
//# SWITCH SLOPE IS (SLOPE) DEG/SEC/DEG, A NEG QUANTITY
// TVCROLLDAP.agc:297
//
// TVCROLLDAP.agc:298
//		CA	OGARATE
// slot 17135
                    if slot <> 17135 or instruction <> 13147 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 859).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCROLLDAP.agc:299
//		EXTEND
// slot 17136
                    if slot <> 17136 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17137 {
// TVCROLLDAP.agc:300
//		MP	BIT14
// slot 17137
                    if slot <> 17137 or instruction <> 31234 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 2562, readEffective:call(words, 2562)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCROLLDAP.agc:301
//		TS	TEMREG
// slot 17138
                    if slot <> 17138 or instruction <> 23419 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23419, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 17142 {
            if slot <= 17140 {
                if slot <= 17139 {
// TVCROLLDAP.agc:302
//		CA	OGA
// slot 17139
                    if slot <> 17139 or instruction <> 13236 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 948).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCROLLDAP.agc:303
//		EXTEND
// slot 17140
                    if slot <> 17140 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17141 {
// TVCROLLDAP.agc:304
//		MP	-SLOPE
// slot 17141
                    if slot <> 17141 or instruction <> 30663 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 1991, readEffective:call(words, 1991)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCROLLDAP.agc:305
//		DDOUBL
// slot 17142
                    if slot <> 17142 or instruction <> 8193 { return choose false if checkOnly else -1. }
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
            if slot <= 17144 {
                if slot <= 17143 {
// TVCROLLDAP.agc:306
//		DDOUBL
// slot 17143
                    if slot <> 17143 or instruction <> 8193 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 1) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCROLLDAP.agc:307
//		DDOUBL			# (OGA ERROR MUST BE LESS THAN +-225 DEG)
// slot 17144
                    if slot <> 17144 or instruction <> 8193 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 1) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17145 {
// TVCROLLDAP.agc:308
//		AD	TEMREG
// slot 17145
                    if slot <> 17145 or instruction <> 25467 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 891).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCROLLDAP.agc:309
//
// TVCROLLDAP.agc:310
//		INDEX	I
// slot 17146
                    if slot <> 17146 or instruction <> 21432 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21432, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21432, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[980] to agcAotUnit980@.

agcAotInstallSourceRope(list(
// TVCROLLDAP.agc:311
//		0	A		# I((-SLOPE)OGA+OGARATE) AT 2(-3)REV/SEC
// slot 17147
    17147, 0
)).

// bank 16, slots 17148-17157
function agcAotUnit981 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17152 {
        if slot <= 17149 {
            if slot <= 17148 {
// TVCROLLDAP.agc:312
//		COM
// slot 17148
                if slot <> 17148 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCROLLDAP.agc:313
//# Page 991
// TVCROLLDAP.agc:314
//		AD	INTERCEP	# SCALED AT 2(-3) REV.
// slot 17149
                if slot <> 17149 or instruction <> 26569 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 1993), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17150 {
// TVCROLLDAP.agc:315
//		COM
// slot 17150
                if slot <> 17150 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17151 {
// TVCROLLDAP.agc:316
//		EXTEND
// slot 17151
                    if slot <> 17151 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCROLLDAP.agc:317
//REG2TST		BZMF	NOROLL		# IP REGION 2 (COAST SIDE OF STRT LINE)
// slot 17152
                    if slot <> 17152 or instruction <> 26505 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26505, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 17154 {
            if slot <= 17153 {
// TVCROLLDAP.agc:318
//
// TVCROLLDAP.agc:319
//# CHECK TO SEE IF OGARATE IS ABOVE MINLIM BOUNDARY
// TVCROLLDAP.agc:320
//
// TVCROLLDAP.agc:321
//		CA	IOGARATE	# ALWAYS NEGATIVE
// slot 17153
                if slot <> 17153 or instruction <> 13241 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 953).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCROLLDAP.agc:322
//		AD	MINLIM		# SCALED AT 2(-4) REV/SEC
// slot 17154
                if slot <> 17154 or instruction <> 26570 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 1994), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17155 {
// TVCROLLDAP.agc:323
//		EXTEND
// slot 17155
                if slot <> 17155 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17156 {
// TVCROLLDAP.agc:324
//REG4TST		BZMF	NOROLL		# IF REGION 4 (COAST SIDE OF MINLIM)
// slot 17156
                    if slot <> 17156 or instruction <> 26505 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26505, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCROLLDAP.agc:325
//
// TVCROLLDAP.agc:326
//# ALL AREAS CHECKED EXCEPT LAST AREA...NO FIRE IN THIS SMALL SEGMENT
// TVCROLLDAP.agc:327
//
// TVCROLLDAP.agc:328
//		INDEX	I
// slot 17157
                    if slot <> 17157 or instruction <> 21432 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21432, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21432, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[981] to agcAotUnit981@.

agcAotInstallSourceRope(list(
// TVCROLLDAP.agc:329
//		0	OGA
// slot 17158
    17158, 1896
)).

// bank 16, slots 17159-17169
function agcAotUnit982 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17163 {
        if slot <= 17160 {
            if slot <= 17159 {
// TVCROLLDAP.agc:330
//		COM
// slot 17159
                if slot <> 17159 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCROLLDAP.agc:331
//		AD	DB
// slot 17160
                if slot <> 17160 or instruction <> 26566 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 1990), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17161 {
// TVCROLLDAP.agc:332
//		COM
// slot 17161
                if slot <> 17161 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17162 {
// TVCROLLDAP.agc:333
//		EXTEND
// slot 17162
                    if slot <> 17162 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCROLLDAP.agc:334
//REG5TST		BZMF	NOROLL		# IF REGION 5 (COAST SIDE OF DB)
// slot 17163
                    if slot <> 17163 or instruction <> 26505 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26505, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 17166 {
            if slot <= 17164 {
// TVCROLLDAP.agc:335
//
// TVCROLLDAP.agc:336
//# JETS MUST FIRE NOW.OGARATE IS NEG.(OR VICE VERSA).USE DIRECT STR. LINE.
// TVCROLLDAP.agc:337
//# DELOGA AND DELOGART ARE USED AS DUMMY VARIABLES IN THE SOLUTION OF A
// TVCROLLDAP.agc:338
//# STRAIGHT LINE APPROXIMATION TO A QUADRATIC SOLUTION OF THE INTERSECTION
// TVCROLLDAP.agc:339
//# OF THE CONTROL PARABOLA AND THE STRAIGHT-LINE SWITCH LINE.  THE STRAIGHT
// TVCROLLDAP.agc:340
//# LINE IS THE TANGENT TO THE CONTROL PARABOLA AT THE OPERATING POINT.  (FOR
// TVCROLLDAP.agc:341
//# OPERATING POINTS IN REGIONS 6 AND 6')
// TVCROLLDAP.agc:342
//
// TVCROLLDAP.agc:343
//REGION6		CAE	OGA		# USE ACTUAL OPERATING POINT FOR TANGENT
// slot 17164
                if slot <> 17164 or instruction <> 13236 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 948).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17165 {
// TVCROLLDAP.agc:344
//		TS	DELOGA		# ACTUAL STATE
// slot 17165
                    if slot <> 17165 or instruction <> 23479 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23479, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCROLLDAP.agc:345
//		CA	OGARATE
// slot 17166
                    if slot <> 17166 or instruction <> 13147 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 859).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17167 {
// TVCROLLDAP.agc:346
//		TS	DELOGART	# ACTUAL STATE,I.E. DEL OGARATE
// slot 17167
                if slot <> 17167 or instruction <> 23477 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23477, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17168 {
// TVCROLLDAP.agc:347
//		TCF	ONROLL
// slot 17168
                    if slot <> 17168 or instruction <> 5912 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5912, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCROLLDAP.agc:348
//
// TVCROLLDAP.agc:349
//# JETS ALSO FIRE FROM HERE EXCEPT OGARATE IS POS (VICE VERSA),USE INDIRECT
// TVCROLLDAP.agc:350
//# STRAIGHT LINE ESTABLISHED BY TANGENT TO A CONTROL PARABOLA AT    ((DELOGA
// TVCROLLDAP.agc:351
//# + DB SGN(DELOGA) ), -LMCRATE SGN(DELOGA) )	(THIS IS THE DUMMY
// TVCROLLDAP.agc:352
//# OPERATING POINT FOR OPERATING POINTS IN REGIONS 1 AND 1' )
// TVCROLLDAP.agc:353
//
// TVCROLLDAP.agc:354
//ROLLON		INDEX	I
// slot 17169
                    if slot <> 17169 or instruction <> 21432 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21432, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21432, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[982] to agcAotUnit982@.

agcAotInstallSourceRope(list(
// TVCROLLDAP.agc:355
//		0	DB
// slot 17170
    17170, 3980
)).

// bank 16, slots 17171-17173
function agcAotUnit983 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17171 {
// TVCROLLDAP.agc:356
//		ADS	DELOGA		# DELOGA WAS DIST. FROM SWITCH PARABOLA
// slot 17171
        if slot <> 17171 or instruction <> 12215 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreADS(words, 951).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 17172 {
// TVCROLLDAP.agc:357
//
// TVCROLLDAP.agc:358
//		CS	LMCRATE		# LIMIT CYCLE RATE AT 2(-4) REV/SEC
// slot 17172
            if slot <> 17172 or instruction <> 18376 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 1992), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// TVCROLLDAP.agc:359
//		INDEX	I
// slot 17173
            if slot <> 17173 or instruction <> 21432 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21432, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21432, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[983] to agcAotUnit983@.

agcAotInstallSourceRope(list(
// TVCROLLDAP.agc:360
//		0	A
// slot 17174
    17174, 0
)).

// bank 16, slots 17175-17186
function agcAotUnit984 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17180 {
        if slot <= 17177 {
            if slot <= 17175 {
// TVCROLLDAP.agc:361
//		TS	DELOGART	# EVALUATE STATE FOR INDIRECT LINE.
// slot 17175
                if slot <> 17175 or instruction <> 23477 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23477, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17176 {
// TVCROLLDAP.agc:362
//
// TVCROLLDAP.agc:363
//# Page 992
// TVCROLLDAP.agc:364
//# SOLVE STRAIGHT LINES SIMULTANEOUSLY TO OBTAIN DESIRED OGARATE.
// TVCROLLDAP.agc:365
//
// TVCROLLDAP.agc:366
//ONROLL		EXTEND			# DELOGART IN ACC. ON ARRIVAL
// slot 17176
                    if slot <> 17176 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCROLLDAP.agc:367
//		MP	1/CONACC
// slot 17177
                    if slot <> 17177 or instruction <> 29600 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 928, readEffective:call(words, 928)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17178 {
// TVCROLLDAP.agc:368
//		DOUBLE
// slot 17178
                if slot <> 17178 or instruction <> 24576 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17179 {
// TVCROLLDAP.agc:369
//		EXTEND
// slot 17179
                    if slot <> 17179 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCROLLDAP.agc:370
//		MP	-SLOPE
// slot 17180
                    if slot <> 17180 or instruction <> 30663 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 1991, readEffective:call(words, 1991)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 17183 {
            if slot <= 17181 {
// TVCROLLDAP.agc:371
//		TS	TEMREG		# 2(-SLOPE)RATE /CONACC
// slot 17181
                if slot <> 17181 or instruction <> 23419 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23419, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17182 {
// TVCROLLDAP.agc:372
//		EXTEND
// slot 17182
                    if slot <> 17182 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCROLLDAP.agc:373
//		MP	DELOGART
// slot 17183
                    if slot <> 17183 or instruction <> 29621 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 949, readEffective:call(words, 949)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 17184 {
// TVCROLLDAP.agc:374
//		TS	DELOGART	# 2(-SLOPE)(RATESQ)/CONACC
// slot 17184
                if slot <> 17184 or instruction <> 23477 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23477, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17185 {
// TVCROLLDAP.agc:375
//		CS	BIT11
// slot 17185
                    if slot <> 17185 or instruction <> 18949 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2565), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCROLLDAP.agc:376
//		INDEX	I
// slot 17186
                    if slot <> 17186 or instruction <> 21432 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21432, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21432, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[984] to agcAotUnit984@.

agcAotInstallSourceRope(list(
// TVCROLLDAP.agc:377
//		0	A
// slot 17187
    17187, 0
)).

// bank 16, slots 17188-17189
function agcAotUnit985 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17188 {
// TVCROLLDAP.agc:378
//RATEDEN		ADS	TEMREG		# DENOMINATOR COMPLETED
// slot 17188
        if slot <> 17188 or instruction <> 12155 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreADS(words, 891).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// TVCROLLDAP.agc:379
//
// TVCROLLDAP.agc:380
//		INDEX	I
// slot 17189
        if slot <> 17189 or instruction <> 21432 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21432, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21432, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[985] to agcAotUnit985@.

agcAotInstallSourceRope(list(
// TVCROLLDAP.agc:381
//		0	DELOGA
// slot 17190
    17190, 1902
)).

// bank 16, slots 17191-17217
function agcAotUnit986 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17203 {
        if slot <= 17196 {
            if slot <= 17193 {
                if slot <= 17191 {
// TVCROLLDAP.agc:382
//		COM
// slot 17191
                    if slot <> 17191 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17192 {
// TVCROLLDAP.agc:383
//		AD	DB
// slot 17192
                        if slot <> 17192 or instruction <> 26566 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1990), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCROLLDAP.agc:384
//		COM
// slot 17193
                        if slot <> 17193 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17194 {
// TVCROLLDAP.agc:385
//		EXTEND
// slot 17194
                    if slot <> 17194 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17195 {
// TVCROLLDAP.agc:386
//		MP	-SLOPE
// slot 17195
                        if slot <> 17195 or instruction <> 30663 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 1991, readEffective:call(words, 1991)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCROLLDAP.agc:387
//		ADS	DELOGART
// slot 17196
                        if slot <> 17196 or instruction <> 12213 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 949).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 17199 {
                if slot <= 17197 {
// TVCROLLDAP.agc:388
//		CA	LMCRATE
// slot 17197
                    if slot <> 17197 or instruction <> 14280 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1992), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17198 {
// TVCROLLDAP.agc:389
//		EXTEND
// slot 17198
                        if slot <> 17198 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCROLLDAP.agc:390
//		MP	BIT11
// slot 17199
                        if slot <> 17199 or instruction <> 31237 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2565, readEffective:call(words, 2565)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17201 {
                    if slot <= 17200 {
// TVCROLLDAP.agc:391
//RATENUM		AD	DELOGART	# NUMERATOR COMPLETED
// slot 17200
                        if slot <> 17200 or instruction <> 25525 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 949).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCROLLDAP.agc:392
//
// TVCROLLDAP.agc:393
//		XCH	L		# PLACE NUMERATOR IN L FOR OVERFL. CHECK
// slot 17201
                        if slot <> 17201 or instruction <> 23553 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 1, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17202 {
// TVCROLLDAP.agc:394
//		CA	ZERO
// slot 17202
                        if slot <> 17202 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCROLLDAP.agc:395
//		EXTEND
// slot 17203
                        if slot <> 17203 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 17210 {
            if slot <= 17206 {
                if slot <= 17204 {
// TVCROLLDAP.agc:396
//		DV	TEMREG		# OVERFLOW, IF ANYTHING, NOW APPEARS IN A
// slot 17204
                    if slot <> 17204 or instruction <> 4987 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreDv(words, 891, readEffective:call(words, 891)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17205 {
// TVCROLLDAP.agc:397
//		EXTEND
// slot 17205
                        if slot <> 17205 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCROLLDAP.agc:398
//		BZF	DVOK		# NO OVERFLOW....(0,L)/TEMREG = 0,L
// slot 17206
                        if slot <> 17206 or instruction <> 5948 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5948, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17208 {
                    if slot <= 17207 {
// TVCROLLDAP.agc:399
//
// TVCROLLDAP.agc:400
//MINLIMAP	CCS	A
// slot 17207
                        if slot <> 17207 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCROLLDAP.agc:401
//		CAF	POSMAX		# 	POSITIVE OVERFLOW
// slot 17208
                        if slot <> 17208 or instruction <> 14847 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17209 {
// TVCROLLDAP.agc:402
//		TCF	ROLLSET
// slot 17209
                        if slot <> 17209 or instruction <> 5955 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5955, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCROLLDAP.agc:403
//		CS	POSMAX		#	NEGATIVE OVERFLOW
// slot 17210
                        if slot <> 17210 or instruction <> 18943 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 17213 {
                if slot <= 17211 {
// TVCROLLDAP.agc:404
//		TCF	ROLLSET
// slot 17211
                    if slot <> 17211 or instruction <> 5955 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5955, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17212 {
// TVCROLLDAP.agc:405
//
// TVCROLLDAP.agc:406
//DVOK		LXCH	A		# PUT NUMERATOR BACK INTO A, 0 INTO L
// slot 17212
                        if slot <> 17212 or instruction <> 9216 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 0, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCROLLDAP.agc:407
//		EXTEND
// slot 17213
                        if slot <> 17213 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 17215 {
                    if slot <= 17214 {
// TVCROLLDAP.agc:408
//		DV	TEMREG		# RESULT OF DIVISION IS DESIRED OGARATE
// slot 17214
                        if slot <> 17214 or instruction <> 4987 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreDv(words, 891, readEffective:call(words, 891)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCROLLDAP.agc:409
//		TCF	ROLLSET		#	( SCALED AT B-4 REV/SEC )
// slot 17215
                        if slot <> 17215 or instruction <> 5955 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5955, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17216 {
// TVCROLLDAP.agc:410
//
// TVCROLLDAP.agc:411
//RATELIM		CS	MAXLIM
// slot 17216
                        if slot <> 17216 or instruction <> 18380 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 1996), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TVCROLLDAP.agc:412
//		INDEX	I
// slot 17217
                        if slot <> 17217 or instruction <> 21432 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21432, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21432, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[986] to agcAotUnit986@.

agcAotInstallSourceRope(list(
// TVCROLLDAP.agc:413
//# Page 993
// TVCROLLDAP.agc:414
//		0	A		# IF I = CA, DESIRED RATE IS	-MAXLIM
// slot 17218
    17218, 0
)).

// bank 16, slots 17219-17224
function agcAotUnit987 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17221 {
        if slot <= 17219 {
// TVCROLLDAP.agc:415
//
// TVCROLLDAP.agc:416
//# COMPUTE JET FIRE TIME, BASED ON DESIRED RATE MINUS PRESENT RATE
// TVCROLLDAP.agc:417
//
// TVCROLLDAP.agc:418
//ROLLSET		TS	TEMREG		# STORE DESIRED OGARATE (SCALED B-4)
// slot 17219
            if slot <> 17219 or instruction <> 23419 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23419, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 17220 {
// TVCROLLDAP.agc:419
//		EXTEND
// slot 17220
                if slot <> 17220 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCROLLDAP.agc:420
//		SU	OGARATE		# RATE DIFF. SCALED AT 2(-4) REV/SEC
// slot 17221
                if slot <> 17221 or instruction <> 25435 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreSU(words, 859).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 17222 {
// TVCROLLDAP.agc:421
//		TS	TEMREG		#	OVERFLOW PROTECT
// slot 17222
            if slot <> 17222 or instruction <> 23419 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23419, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 17223 {
// TVCROLLDAP.agc:422
//		TCF	+3		#	    "       "
// slot 17223
                if slot <> 17223 or instruction <> 5962 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5962, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCROLLDAP.agc:423
//		INDEX	A		#           "       "
// slot 17224
                if slot <> 17224 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[987] to agcAotUnit987@.

agcAotInstallSourceRope(list(
// TVCROLLDAP.agc:424
//		CS	LIMITS		#	    "       "
// slot 17225
    17225, 37888
)).

// bank 16, slots 17226-17234
function agcAotUnit988 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17229 {
        if slot <= 17227 {
            if slot <= 17226 {
// TVCROLLDAP.agc:425
//		EXTEND
// slot 17226
                if slot <> 17226 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCROLLDAP.agc:426
//		MP	T6SCALE		# T6SCALE = 8/10.24
// slot 17227
                if slot <> 17227 or instruction <> 32693 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 4021, readEffective:call(words, 4021)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17228 {
// TVCROLLDAP.agc:427
//		EXTEND
// slot 17228
                if slot <> 17228 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCROLLDAP.agc:428
//		MP	1/CONACC	# SCALED AT B+9 SECSQ/REV (MAX < .60)
// slot 17229
                if slot <> 17229 or instruction <> 29600 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 928, readEffective:call(words, 928)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 17231 {
            if slot <= 17230 {
// TVCROLLDAP.agc:429
//		DDOUBL
// slot 17230
                if slot <> 17230 or instruction <> 8193 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 1) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// TVCROLLDAP.agc:430
//		DDOUBL
// slot 17231
                if slot <> 17231 or instruction <> 8193 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 1) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17232 {
// TVCROLLDAP.agc:431
//		TS	TEMREG		#	OVERFLOW PROTECT
// slot 17232
                if slot <> 17232 or instruction <> 23419 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23419, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17233 {
// TVCROLLDAP.agc:432
//		TCF	+3		#	    "	    "
// slot 17233
                    if slot <> 17233 or instruction <> 5972 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5972, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TVCROLLDAP.agc:433
//		INDEX	A		#   	    "	    "
// slot 17234
                    if slot <> 17234 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[988] to agcAotUnit988@.

agcAotInstallSourceRope(list(
// TVCROLLDAP.agc:434
//		CS	LIMITS		# 	    " 	    "
// slot 17235
    17235, 37888
)).

// bank 16, slots 17236-17347
function agcAotUnit989 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17291 {
        if slot <= 17263 {
            if slot <= 17249 {
                if slot <= 17242 {
                    if slot <= 17238 {
                        if slot <= 17236 {
// TVCROLLDAP.agc:435
//		TS	TEMREG		# JET FIRE TIME AT 625 MICROSEC/BIT
// slot 17236
                            if slot <> 17236 or instruction <> 23419 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23419, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17237 {
// TVCROLLDAP.agc:436
//		EXTEND			# POS MEANS POSITIVE ROLL TORQUE.
// slot 17237
                                if slot <> 17237 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:437
//		BZF	NOROLL
// slot 17238
                                if slot <> 17238 or instruction <> 6025 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6025, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17240 {
                            if slot <= 17239 {
// TVCROLLDAP.agc:438
//
// TVCROLLDAP.agc:439
//# JET FIRE TIME IS NZ, TEST FOR JETS NOW ON.
// TVCROLLDAP.agc:440
//
// TVCROLLDAP.agc:441
//		CAE	TEMREG		# DESIRED CHANGE IN OGARATE
// slot 17239
                                if slot <> 17239 or instruction <> 13179 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 891).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:442
//		EXTEND
// slot 17240
                                if slot <> 17240 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17241 {
// TVCROLLDAP.agc:443
//		MP	ROLLFIRE	# (SGN OF TORQUE..ZERO IF JETS NOW OFF)
// slot 17241
                                if slot <> 17241 or instruction <> 29561 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 889, readEffective:call(words, 889)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:444
//		CCS	A
// slot 17242
                                if slot <> 17242 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                    if slot <= 17245 {
                        if slot <= 17243 {
// TVCROLLDAP.agc:445
//		TCF	MOREROLL	# CONTINUE FIRING WITH PRESENT POLARITY
// slot 17243
                            if slot <> 17243 or instruction <> 5983 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5983, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17244 {
// TVCROLLDAP.agc:446
//		TCF	NEWROLL		# START NEW FIRING NOW, PLUS
// slot 17244
                                if slot <> 17244 or instruction <> 5986 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5986, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:447
//		TCF	NOROLL		# TERMINATE OLD FIRING, NEW SIGN REQUESTED
// slot 17245
                                if slot <> 17245 or instruction <> 6025 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6025, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17247 {
                            if slot <= 17246 {
// TVCROLLDAP.agc:448
//		TCF	NEWROLL		# START NEW FIRING NOW, MINUS
// slot 17246
                                if slot <> 17246 or instruction <> 5986 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5986, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:449
//
// TVCROLLDAP.agc:450
//# CONTINUE PRESENT FIRING
// TVCROLLDAP.agc:451
//
// TVCROLLDAP.agc:452
//MOREROLL	CAF	ZERO
// slot 17247
                                if slot <> 17247 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
                            if slot <= 17248 {
// TVCROLLDAP.agc:453
//		TS	I		# USE TEMP. AS MOREROLL SWITCH
// slot 17248
                                if slot <> 17248 or instruction <> 23480 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23480, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:454
//		TCF	MAXTFIRE
// slot 17249
                                if slot <> 17249 or instruction <> 5995 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5995, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 17256 {
                    if slot <= 17252 {
                        if slot <= 17250 {
// TVCROLLDAP.agc:455
//
// TVCROLLDAP.agc:456
//# START NEW FIRING BUT CHECK IF GREATER THAN MIN FIRE TIME.
// TVCROLLDAP.agc:457
//
// TVCROLLDAP.agc:458
//NEWROLL		CCS	TEMREG		# CALL THIS T6FIRE
// slot 17250
                            if slot <> 17250 or instruction <> 4987 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 891).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17251 {
// TVCROLLDAP.agc:459
//		AD	ONE
// slot 17251
                                if slot <> 17251 or instruction <> 27151 { return choose false if checkOnly else -1. }
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
// TVCROLLDAP.agc:460
//		TCF	+2
// slot 17252
                                if slot <> 17252 or instruction <> 5990 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5990, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17254 {
                            if slot <= 17253 {
// TVCROLLDAP.agc:461
//		AD	ONE
// slot 17253
                                if slot <> 17253 or instruction <> 27151 { return choose false if checkOnly else -1. }
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
// TVCROLLDAP.agc:462
//		COM			# -MAG(T6FIRE)
// slot 17254
                                if slot <> 17254 or instruction <> 16384 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 0).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17255 {
// TVCROLLDAP.agc:463
//		AD	TMINFIRE	# TMINFIRE-MAG(T6FIRE)
// slot 17255
                                if slot <> 17255 or instruction <> 26573 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 1997), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:464
//# Page 994
// TVCROLLDAP.agc:465
//		COM
// slot 17256
                                if slot <> 17256 or instruction <> 16384 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 0).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 17259 {
                        if slot <= 17257 {
// TVCROLLDAP.agc:466
//		EXTEND
// slot 17257
                            if slot <> 17257 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17258 {
// TVCROLLDAP.agc:467
//MINTST		BZMF	NOROLL		# IF NOT GREATER THAN TMINFIRE (NEW FIRE)
// slot 17258
                                if slot <> 17258 or instruction <> 26505 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 26505, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:468
//
// TVCROLLDAP.agc:469
//# PROCEED WITH NEW FIRING BUT NOT LONGER THAN TMAXFIRE.
// TVCROLLDAP.agc:470
//
// TVCROLLDAP.agc:471
//MAXTFIRE	CA	TEMREG
// slot 17259
                                if slot <> 17259 or instruction <> 13179 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 891).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17261 {
                            if slot <= 17260 {
// TVCROLLDAP.agc:472
//		EXTEND
// slot 17260
                                if slot <> 17260 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:473
//		MP	1/TMXFIR	# I.E. 1/TMAXFIRE
// slot 17261
                                if slot <> 17261 or instruction <> 31245 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 2573, readEffective:call(words, 2573)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17262 {
// TVCROLLDAP.agc:474
//		EXTEND
// slot 17262
                                if slot <> 17262 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:475
//MAXTST		BZF	NOMXFIRE	# IF LESS THAN TMAXFIRE
// slot 17263
                                if slot <> 17263 or instruction <> 6005 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6005, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 17277 {
                if slot <= 17270 {
                    if slot <= 17266 {
                        if slot <= 17264 {
// TVCROLLDAP.agc:476
//
// TVCROLLDAP.agc:477
//		CCS	A
// slot 17264
                            if slot <> 17264 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17265 {
// TVCROLLDAP.agc:478
//		CAF	TMAXFIRE	# USE MAXIMUM
// slot 17265
                                if slot <> 17265 or instruction <> 14286 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1998), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:479
//		TCF	+2
// slot 17266
                                if slot <> 17266 or instruction <> 6004 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6004, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17268 {
                            if slot <= 17267 {
// TVCROLLDAP.agc:480
//		CS	TMAXFIRE	# USE MAXIMUM
// slot 17267
                                if slot <> 17267 or instruction <> 18382 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 1998), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:481
//		TS	TEMREG
// slot 17268
                                if slot <> 17268 or instruction <> 23419 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23419, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17269 {
// TVCROLLDAP.agc:482
//
// TVCROLLDAP.agc:483
//# SET UP SIGN OF REQUIRED TORQUE.
// TVCROLLDAP.agc:484
//
// TVCROLLDAP.agc:485
//NOMXFIRE	CCS	TEMREG		# FOR TORQUE SIGN
// slot 17269
                                if slot <> 17269 or instruction <> 4987 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 891).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:486
//		CA	POSMAX		# POSITIVE TORQUE REQUIRED
// slot 17270
                                if slot <> 17270 or instruction <> 14847 { return choose false if checkOnly else -1. }
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
                    if slot <= 17273 {
                        if slot <= 17271 {
// TVCROLLDAP.agc:487
//		TCF	+2
// slot 17271
                            if slot <> 17271 or instruction <> 6009 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6009, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17272 {
// TVCROLLDAP.agc:488
//		CA	NEGMAX		# NEGATIVE TORQUE REQUIRED
// slot 17272
                                if slot <> 17272 or instruction <> 14849 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:489
//		TS	ROLLFIRE	# SET ROLLFIRE FOR + OR - TORQUE
// slot 17273
                                if slot <> 17273 or instruction <> 23417 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23417, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17275 {
                            if slot <= 17274 {
// TVCROLLDAP.agc:490
//
// TVCROLLDAP.agc:491
//		COM			# COMPLEMENT... POS. FOR NEG. TORQUE
// slot 17274
                                if slot <> 17274 or instruction <> 16384 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 0).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:492
//		EXTEND
// slot 17275
                                if slot <> 17275 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17276 {
// TVCROLLDAP.agc:493
//		BZMF	+3		# POSITIVE TORQUE REQUIRED
// slot 17276
                                if slot <> 17276 or instruction <> 26495 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 26495, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:494
//		CS	TEMREG
// slot 17277
                                if slot <> 17277 or instruction <> 17275 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 891).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 17284 {
                    if slot <= 17280 {
                        if slot <= 17278 {
// TVCROLLDAP.agc:495
//		TS	TEMREG
// slot 17278
                            if slot <> 17278 or instruction <> 23419 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23419, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17279 {
// TVCROLLDAP.agc:496
//
// TVCROLLDAP.agc:497
//FIRELOOK	CA	I		# IS IT MOREROLL
// slot 17279
                                if slot <> 17279 or instruction <> 13240 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 952).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:498
//		EXTEND
// slot 17280
                                if slot <> 17280 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17282 {
                            if slot <= 17281 {
// TVCROLLDAP.agc:499
//		BZF	FIREPLUG	# YES
// slot 17281
                                if slot <> 17281 or instruction <> 6019 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6019, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:500
//		TCF	JETROLL		# MAG(T6FIRE) NOW IN TEMREG
// slot 17282
                                if slot <> 17282 or instruction <> 6028 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6028, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17283 {
// TVCROLLDAP.agc:501
//
// TVCROLLDAP.agc:502
//FIREPLUG	CAE	TIME6		# CHECK FOR EXTENDED FIRING
// slot 17283
                                if slot <> 17283 or instruction <> 12313 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 25).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:503
//		EXTEND
// slot 17284
                                if slot <> 17284 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 17287 {
                        if slot <= 17285 {
// TVCROLLDAP.agc:504
//		SU	TEMREG
// slot 17285
                            if slot <> 17285 or instruction <> 25467 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreSU(words, 891).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17286 {
// TVCROLLDAP.agc:505
//		EXTEND
// slot 17286
                                if slot <> 17286 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:506
//EXTENTST	BZMF	TASKOVER	# IF EXTENSION WANTED, DONT, EXIT ROLL DAP
// slot 17287
                                if slot <> 17287 or instruction <> 27348 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 27348, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17289 {
                            if slot <= 17288 {
// TVCROLLDAP.agc:507
//		TCF	JETROLL
// slot 17288
                                if slot <> 17288 or instruction <> 6028 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6028, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:508
//
// TVCROLLDAP.agc:509
//NOROLL		CS	ZERO		# COAST....(NEG ZERO FOR TIME6)
// slot 17289
                                if slot <> 17289 or instruction <> 18961 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17290 {
// TVCROLLDAP.agc:510
//		TS	ROLLFIRE	# NOTE, JETS CAN FIRE NEXT PASS
// slot 17290
                                if slot <> 17290 or instruction <> 23417 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23417, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:511
//		TS	TEMREG
// slot 17291
                                if slot <> 17291 or instruction <> 23419 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23419, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 17319 {
            if slot <= 17305 {
                if slot <= 17298 {
                    if slot <= 17294 {
                        if slot <= 17292 {
// TVCROLLDAP.agc:512
//
// TVCROLLDAP.agc:513
//JETROLL		EXTEND
// slot 17292
                            if slot <> 17292 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17293 {
// TVCROLLDAP.agc:514
//		DCA	NOROL1T6
// slot 17293
                                if slot <> 17293 or instruction <> 14277 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 1989, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:515
//# Page 995
// TVCROLLDAP.agc:516
//		DXCH	T6LOC
// slot 17294
                                if slot <> 17294 or instruction <> 22217 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 713, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17296 {
                            if slot <= 17295 {
// TVCROLLDAP.agc:517
//		CA	TEMREG		# ENTER JET FIRING TIME
// slot 17295
                                if slot <> 17295 or instruction <> 13179 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 891).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:518
//		TS	TIME6
// slot 17296
                                if slot <> 17296 or instruction <> 22553 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22553, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17297 {
// TVCROLLDAP.agc:519
//
// TVCROLLDAP.agc:520
//		CA	I		# I=0 IF MOREROLL,KEEP SAME JETS ON
// slot 17297
                                if slot <> 17297 or instruction <> 13240 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 952).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:521
//		EXTEND
// slot 17298
                                if slot <> 17298 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 17301 {
                        if slot <= 17299 {
// TVCROLLDAP.agc:522
//SAMEJETS	BZF	TASKOVER	# IF JETS ON KEEP SAME JETS.  EXIT ROLL DAP
// slot 17299
                            if slot <> 17299 or instruction <> 6868 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6868, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17300 {
// TVCROLLDAP.agc:523
//
// TVCROLLDAP.agc:524
//		CCS	ROLLFIRE
// slot 17300
                                if slot <> 17300 or instruction <> 4985 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 889).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:525
//		TCF	+TORQUE
// slot 17301
                                if slot <> 17301 or instruction <> 6041 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6041, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17303 {
                            if slot <= 17302 {
// TVCROLLDAP.agc:526
//		TCF	T6ENABL
// slot 17302
                                if slot <> 17302 or instruction <> 6074 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6074, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:527
//		TCF	-TORQUE
// slot 17303
                                if slot <> 17303 or instruction <> 6058 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6058, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17304 {
// TVCROLLDAP.agc:528
//		TCF	T6ENABL
// slot 17304
                                if slot <> 17304 or instruction <> 6074 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6074, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:529
//
// TVCROLLDAP.agc:530
//# PROCEED WITH + TORQUE
// TVCROLLDAP.agc:531
//
// TVCROLLDAP.agc:532
//+TORQUE		CA	ROLLWORD	# WHAT WAS THE LAST +TORQUE COMBINATION
// slot 17305
                                if slot <> 17305 or instruction <> 13178 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 890).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 17312 {
                    if slot <= 17308 {
                        if slot <= 17306 {
// TVCROLLDAP.agc:533
//		MASK	BIT1		# WAS IT NO.9-11
// slot 17306
                            if slot <> 17306 or instruction <> 31247 { return choose false if checkOnly else -1. }
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
                            if slot <= 17307 {
// TVCROLLDAP.agc:534
//		EXTEND
// slot 17307
                                if slot <> 17307 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:535
//		BZF	NO.9-11		# NOT 9-11, SO USE IT THIS TIME
// slot 17308
                                if slot <> 17308 or instruction <> 6052 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6052, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17310 {
                            if slot <= 17309 {
// TVCROLLDAP.agc:536
//
// TVCROLLDAP.agc:537
//NO.13-15	CS	BIT1
// slot 17309
                                if slot <> 17309 or instruction <> 18959 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:538
//		MASK	ROLLWORD
// slot 17310
                                if slot <> 17310 or instruction <> 29562 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMASK(words, 890).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17311 {
// TVCROLLDAP.agc:539
//		TS	ROLLWORD	# CHANGE BIT 1 TO ZERO
// slot 17311
                                if slot <> 17311 or instruction <> 23418 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23418, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:540
//		CAF	+ROLL2
// slot 17312
                                if slot <> 17312 or instruction <> 14879 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2591), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 17315 {
                        if slot <= 17313 {
// TVCROLLDAP.agc:541
//		EXTEND
// slot 17313
                            if slot <> 17313 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17314 {
// TVCROLLDAP.agc:542
//		WRITE	CHAN6
// slot 17314
                                if slot <> 17314 or instruction <> 518 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 1, 6, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:543
//		TCF	T6ENABL
// slot 17315
                                if slot <> 17315 or instruction <> 6074 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6074, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17317 {
                            if slot <= 17316 {
// TVCROLLDAP.agc:544
//
// TVCROLLDAP.agc:545
//NO.9-11		CAF	BIT1		# 1ST + JETS TO FIRE (MRCLEAN OS ROLLWORD)
// slot 17316
                                if slot <> 17316 or instruction <> 14863 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:546
//		ADS	ROLLWORD	# CHANGE BIT 1 TO ONE
// slot 17317
                                if slot <> 17317 or instruction <> 12154 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 890).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17318 {
// TVCROLLDAP.agc:547
//		CAF	+ROLL1
// slot 17318
                                if slot <> 17318 or instruction <> 14866 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2578), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:548
//		EXTEND
// slot 17319
                                if slot <> 17319 or instruction <> 6 { return choose false if checkOnly else -1. }
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
            if slot <= 17333 {
                if slot <= 17326 {
                    if slot <= 17322 {
                        if slot <= 17320 {
// TVCROLLDAP.agc:549
//		WRITE	CHAN6
// slot 17320
                            if slot <> 17320 or instruction <> 518 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 1, 6, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17321 {
// TVCROLLDAP.agc:550
//		TCF	T6ENABL
// slot 17321
                                if slot <> 17321 or instruction <> 6074 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6074, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:551
//
// TVCROLLDAP.agc:552
//-TORQUE		CA	ROLLWORD	# WHAT WAS LAST -TORQUE COMBINATION
// slot 17322
                                if slot <> 17322 or instruction <> 13178 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 890).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17324 {
                            if slot <= 17323 {
// TVCROLLDAP.agc:553
//		MASK	BIT2		# WAS IT NO.12-10
// slot 17323
                                if slot <> 17323 or instruction <> 31246 { return choose false if checkOnly else -1. }
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
// TVCROLLDAP.agc:554
//		EXTEND
// slot 17324
                                if slot <> 17324 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17325 {
// TVCROLLDAP.agc:555
//		BZF	NO.12-10	# NOT 12-10, SO USE IT THIS TIME
// slot 17325
                                if slot <> 17325 or instruction <> 6069 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6069, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:556
//
// TVCROLLDAP.agc:557
//NO.16-14	CS	BIT2
// slot 17326
                                if slot <> 17326 or instruction <> 18958 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 17329 {
                        if slot <= 17327 {
// TVCROLLDAP.agc:558
//		MASK	ROLLWORD
// slot 17327
                            if slot <> 17327 or instruction <> 29562 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 890).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17328 {
// TVCROLLDAP.agc:559
//		TS	ROLLWORD	# CHANGE BIT 2 TO ZERO
// slot 17328
                                if slot <> 17328 or instruction <> 23418 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23418, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:560
//		CAF	-ROLL2
// slot 17329
                                if slot <> 17329 or instruction <> 14287 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1999), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17331 {
                            if slot <= 17330 {
// TVCROLLDAP.agc:561
//		EXTEND
// slot 17330
                                if slot <> 17330 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:562
//		WRITE	CHAN6
// slot 17331
                                if slot <> 17331 or instruction <> 518 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 1, 6, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17332 {
// TVCROLLDAP.agc:563
//		TCF	T6ENABL
// slot 17332
                                if slot <> 17332 or instruction <> 6074 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6074, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:564
//
// TVCROLLDAP.agc:565
//NO.12-10	CAF	BIT2		# 1ST -JETS TO FIRE (MRCLEAN OS ROLLWORD)
// slot 17333
                                if slot <> 17333 or instruction <> 14862 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 17340 {
                    if slot <= 17336 {
                        if slot <= 17334 {
// TVCROLLDAP.agc:566
//# Page 996
// TVCROLLDAP.agc:567
//		ADS	ROLLWORD	# CHANGE BIT 2 TO ONE
// slot 17334
                            if slot <> 17334 or instruction <> 12154 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 890).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17335 {
// TVCROLLDAP.agc:568
//		CAF	-ROLL1
// slot 17335
                                if slot <> 17335 or instruction <> 14591 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2303), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:569
//		EXTEND
// slot 17336
                                if slot <> 17336 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 17338 {
                            if slot <= 17337 {
// TVCROLLDAP.agc:570
//		WRITE	CHAN6
// slot 17337
                                if slot <> 17337 or instruction <> 518 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 1, 6, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:571
//
// TVCROLLDAP.agc:572
//T6ENABL		CAF	BIT15
// slot 17338
                                if slot <> 17338 or instruction <> 14849 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2561), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17339 {
// TVCROLLDAP.agc:573
//		EXTEND
// slot 17339
                                if slot <> 17339 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:574
//		WOR	CHAN13
// slot 17340
                                if slot <> 17340 or instruction <> 2571 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 5, 11, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 17343 {
                        if slot <= 17341 {
// TVCROLLDAP.agc:575
//RDAPEND		TCF	TASKOVER	# EXIT ROLL DAP
// slot 17341
                            if slot <> 17341 or instruction <> 6868 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6868, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17342 {
// TVCROLLDAP.agc:576
//
// TVCROLLDAP.agc:577
//# Page 997
// TVCROLLDAP.agc:578
//# THIS T6 TASK SHUTS OFF ALL ROLL JETS
// TVCROLLDAP.agc:579
//
// TVCROLLDAP.agc:580
//NOROLL1		LXCH	BANKRUPT	# SHUT OFF ALL (ROLL) JETS, (A T6 TASK
// slot 17342
                                if slot <> 17342 or instruction <> 9230 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreExchange(words, 1, 14, readPhysical).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:581
//		CAF	ZERO		#	CALLED BY ..JETROLL..)
// slot 17343
                                if slot <> 17343 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
                    } else {
                        if slot <= 17345 {
                            if slot <= 17344 {
// TVCROLLDAP.agc:582
//		TS	ROLLFIRE	# ZERO INDICATES JETS NOW OFF
// slot 17344
                                if slot <> 17344 or instruction <> 23417 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23417, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:583
//		EXTEND
// slot 17345
                                if slot <> 17345 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17346 {
// TVCROLLDAP.agc:584
//KILLJETS	WRITE	CHAN6
// slot 17346
                                if slot <> 17346 or instruction <> 518 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 1, 6, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// TVCROLLDAP.agc:585
//		TCF	NOQRSM
// slot 17347
                                if slot <> 17347 or instruction <> 6877 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6877, words[0], readEffective).
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
set agcAotRoutes[989] to agcAotUnit989@.

agcAotInstallSourceRope(list(
// TVCROLLDAP.agc:586
//
// TVCROLLDAP.agc:587
//# Page 998
// TVCROLLDAP.agc:588
//# CONSTANTS FOR ROLL AUTOPILOT....
// TVCROLLDAP.agc:589
//
// TVCROLLDAP.agc:590
//		EBANK=	BZERO
// TVCROLLDAP.agc:591
//NOROL1T6	2CADR	NOROLL1
// slot 17348 17349
    17348, 3964, 17349, 28780,
// TVCROLLDAP.agc:592
//
// TVCROLLDAP.agc:593
//DB		DEC	.01388889	# DEAD BAND (5 DEG), SC.AT B+0 REV
// slot 17350
    17350, 456,
// TVCROLLDAP.agc:594
//
// TVCROLLDAP.agc:595
//-SLOPE		DEC	0.2		# -SWITCHLINE SLOPE(0.2 PER SEC) SC.AT B+0
// slot 17351
    17351, 6554,
// TVCROLLDAP.agc:596
//					#	PER SEC
// TVCROLLDAP.agc:597
//LMCRATE		DEC	.00027778 B+4	# LIMIT CYCLE RATE (0.1 DEG/SEC) SC.AT
// slot 17352
    17352, 146,
// TVCROLLDAP.agc:598
//					#	B-4 REV/SEC
// TVCROLLDAP.agc:599
//INTERCEP	DEC	.0025 B+3	# DB(-SLOPE) - LMCRATE, SC.AT B-3 REV/SC
// slot 17353
    17353, 656,
// TVCROLLDAP.agc:600
//
// TVCROLLDAP.agc:601
//MINLIM		DEC	.00277778 B+4	# RATELIM,MIN (1DEG/SEC), SC.AT B-4 REV/SC
// slot 17354
    17354, 1456,
// TVCROLLDAP.agc:602
//
// TVCROLLDAP.agc:603
//1/MINLIM	DEC	360 B-18	# RECIPROCAL THEREOF, SHIFTED 14 RIGHT
// slot 17355
    17355, 46,
// TVCROLLDAP.agc:604
//
// TVCROLLDAP.agc:605
//MAXLIM		DEC	.01388889 B+4	# RATELIM,MAX (5DEG/SEC), SC.AT B-4 REV/SC
// slot 17356
    17356, 7282,
// TVCROLLDAP.agc:606
//
// TVCROLLDAP.agc:607
//TMINFIRE	DEC	1.5 B+4		# 15 MS (14MIN), SC.AT 16 BITS/CS
// slot 17357
    17357, 48,
// TVCROLLDAP.agc:608
//
// TVCROLLDAP.agc:609
//TMAXFIRE	DEC	250 B+4		# 2.5 SEC, SC.AT 16 BITS/CS
// slot 17358
    17358, 8000,
// TVCROLLDAP.agc:610
//
// TVCROLLDAP.agc:611
//1/TMXFIR	=	BIT3		# RECIPROCAL THEREOF, SHIFTED 14 RIGHT,
// TVCROLLDAP.agc:612
//					#	ROUNDS TO OCT00004, SO ALLOWS 2.56
// TVCROLLDAP.agc:613
//					#	SEC FIRINGS BEFORE APPLYING LIMIT
// TVCROLLDAP.agc:614
//T6SCALE		=	PRIO31		# (B+3) (16 BITS/CS) (100CS/SEC)
// TVCROLLDAP.agc:615
//
// TVCROLLDAP.agc:616
//+ROLL1		= 	FIVE		# ONBITS FOR JETS 9 AND 11
// TVCROLLDAP.agc:617
//+ROLL2		=	OCT120		# ONBITS FOR JETS 13 AND 15
// TVCROLLDAP.agc:618
//-ROLL1		=	TEN		# ONBITS FOR JETS 12 NAD 10
// TVCROLLDAP.agc:619
//-ROLL2		OCT	240		# ONBITS FOR JETS 16 AND 14
// slot 17359
    17359, 320
)).

