// PORT: Original source unit TVCROLLDAP.agc.
// PORT: Physical bank 16. Shared continuation entries, slots 17082–17124.
function agcAotUnit978 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17102 {
        if slot <= 17091 {
            if slot <= 17086 {
                if slot <= 17083 {
                    if slot <= 17082 {
// PORT: SOURCE TVCROLLDAP.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE TVCROLLDAP.agc:2
//# Filename:	TVCROLLDAP.agc
// PORT: SOURCE TVCROLLDAP.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// PORT: SOURCE TVCROLLDAP.agc:4
//#		It is part of the source code for the Command Module's (CM)
// PORT: SOURCE TVCROLLDAP.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE TVCROLLDAP.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE TVCROLLDAP.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE TVCROLLDAP.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE TVCROLLDAP.agc:9
//# Pages:	984-998
// PORT: SOURCE TVCROLLDAP.agc:10
//# Mod history:	2009-05-13 RSB	Adapted from the Colossus249/ file of the
// PORT: SOURCE TVCROLLDAP.agc:11
//#				same name, using Comanche055 page images.
// PORT: SOURCE TVCROLLDAP.agc:12
//#
// PORT: SOURCE TVCROLLDAP.agc:13
//# This source code has been transcribed or otherwise adapted from digitized
// PORT: SOURCE TVCROLLDAP.agc:14
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// PORT: SOURCE TVCROLLDAP.agc:15
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// PORT: SOURCE TVCROLLDAP.agc:16
//# thanks to both.  The images (with suitable reduction in storage size and
// PORT: SOURCE TVCROLLDAP.agc:17
//# consequent reduction in image quality as well) are available online at
// PORT: SOURCE TVCROLLDAP.agc:18
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// PORT: SOURCE TVCROLLDAP.agc:19
//# illegible, contact me at info@sandroid.org about getting access to the
// PORT: SOURCE TVCROLLDAP.agc:20
//# (much) higher-quality images which Paul actually created.
// PORT: SOURCE TVCROLLDAP.agc:21
//#
// PORT: SOURCE TVCROLLDAP.agc:22
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE TVCROLLDAP.agc:23
//#
// PORT: SOURCE TVCROLLDAP.agc:24
//#	Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE TVCROLLDAP.agc:25
//#	2021113-051.  10:28 APR. 1, 1969
// PORT: SOURCE TVCROLLDAP.agc:26
//#
// PORT: SOURCE TVCROLLDAP.agc:27
//#	This AGC program shall also be referred to as
// PORT: SOURCE TVCROLLDAP.agc:28
//#			Colossus 2A
// PORT: SOURCE TVCROLLDAP.agc:29
//
// PORT: SOURCE TVCROLLDAP.agc:30
//# Page 984
// PORT: SOURCE TVCROLLDAP.agc:31
//# PROGRAM NAME...TVC ROLL AUTOPILOT
// PORT: SOURCE TVCROLLDAP.agc:32
//# LOG SECTION...TVCROLLDAP			SUBROUTINE...DAPCSM
// PORT: SOURCE TVCROLLDAP.agc:33
//# MOD BY SCHLUNDT				21 OCTOBER 1968
// PORT: SOURCE TVCROLLDAP.agc:34
//
// PORT: SOURCE TVCROLLDAP.agc:35
//
// PORT: SOURCE TVCROLLDAP.agc:36
//# FUNCTIONAL DESCRIPTION....
// PORT: SOURCE TVCROLLDAP.agc:37
//
// PORT: SOURCE TVCROLLDAP.agc:38
//#      *AN ADAPTATION OF THE LEM P-AXIS CONTROLLER
// PORT: SOURCE TVCROLLDAP.agc:39
//#      *MAINTAIN OGA WITHIN 5 DEG DEADBND OF OGAD, WHERE OGAD = OGA AS SEEN
// PORT: SOURCE TVCROLLDAP.agc:40
//#	BY IGNITION (P40)
// PORT: SOURCE TVCROLLDAP.agc:41
//#      *MAINTAIN OGA RATE LESS THAN 0.1 DEG/SEC LIMIT CYCLE RATE
// PORT: SOURCE TVCROLLDAP.agc:42
//#      *SWITCHING LOGIC IN PHASE PLANE.... SEE GSOP CHAPTER 3
// PORT: SOURCE TVCROLLDAP.agc:43
//#      *USES T6 CLOCK TO TIME JET FIRINGS
// PORT: SOURCE TVCROLLDAP.agc:44
//#      *MAXIMUM JET FIRING TIME = 2.56 SECONDS, LIMITED TO 2.5 IF GREATER
// PORT: SOURCE TVCROLLDAP.agc:45
//#      *MINIMUM JET FIRING TIME = 15 MS
// PORT: SOURCE TVCROLLDAP.agc:46
//#      *JET PAIRS FIRE ALTERNATELY
// PORT: SOURCE TVCROLLDAP.agc:47
//#      *AT LEAST 1/2 SECOND DELAY BEFORE A NEW JET PAIR IS FIRED
// PORT: SOURCE TVCROLLDAP.agc:48
//#      *JET FIRINGS MAY NOT BE EXTENDED, ONLY SHORTENED, WHEN RE-EVALUATION
// PORT: SOURCE TVCROLLDAP.agc:49
//#	OF A JET FIRING TIME IS MADE ON A LATER PASS
// PORT: SOURCE TVCROLLDAP.agc:50
//
// PORT: SOURCE TVCROLLDAP.agc:51
//# CALLING SEQUENCE....
// PORT: SOURCE TVCROLLDAP.agc:52
//
// PORT: SOURCE TVCROLLDAP.agc:53
//#      *ROLLDAP CALL VIA WAITLIST, IN PARTICULAR BY TVCEXEC (EVERY 1/2 SEC)
// PORT: SOURCE TVCROLLDAP.agc:54
//#	WITH A 3CS DELAY TO ALLOW FREE TIME FOR OTHER RUPTS (DWNRPT, ETC.)
// PORT: SOURCE TVCROLLDAP.agc:55
//
// PORT: SOURCE TVCROLLDAP.agc:56
//# NORMAL EXIT MODES.... ENDOFJOB
// PORT: SOURCE TVCROLLDAP.agc:57
//
// PORT: SOURCE TVCROLLDAP.agc:58
//# ALARM OR ABORT EXIT MODES.... NONE
// PORT: SOURCE TVCROLLDAP.agc:59
//
// PORT: SOURCE TVCROLLDAP.agc:60
//# SUBROUTINES CALLED.....NONE
// PORT: SOURCE TVCROLLDAP.agc:61
//
// PORT: SOURCE TVCROLLDAP.agc:62
//# OTHER INTERFACES....
// PORT: SOURCE TVCROLLDAP.agc:63
//
// PORT: SOURCE TVCROLLDAP.agc:64
//#      *TVCEXEC SETS UP ROLLDAP TASK EVERY 1/2 SECOND AND UPDATES 1/CONACC
// PORT: SOURCE TVCROLLDAP.agc:65
//#	EVERY 10 SECONDS (VIA MASSPROP AND S40.15)
// PORT: SOURCE TVCROLLDAP.agc:66
//#      *RESTARTS SUSPEND ROLL DAP COMPUTATIONS UNTIL THE NEXT 1/2 SEC
// PORT: SOURCE TVCROLLDAP.agc:67
//#	SAMPLE PERIOD.  (THE PART OF TVCEXECUTIVE THAT CALLS ROLL DAP IS
// PORT: SOURCE TVCROLLDAP.agc:68
//#	NOT RESTARTED.)  THE OGAD FROM IGNITION IS MAINTAINED.
// PORT: SOURCE TVCROLLDAP.agc:69
//
// PORT: SOURCE TVCROLLDAP.agc:70
//# ERASABLE INITIALIZATION REQUIRED....
// PORT: SOURCE TVCROLLDAP.agc:71
//
// PORT: SOURCE TVCROLLDAP.agc:72
//#      *1/CONACC (S40.15)
// PORT: SOURCE TVCROLLDAP.agc:73
//#      *OGAD (CDUX AT IGNITION)
// PORT: SOURCE TVCROLLDAP.agc:74
//#      *OGANOW (CDUX AT TVCINIT4 AND TVCEXECUTIVE)
// PORT: SOURCE TVCROLLDAP.agc:75
//#      *OGAPAST (OGANOW AT TVCEXECUTIVE)
// PORT: SOURCE TVCROLLDAP.agc:76
//#      *ROLLFIRE = TEMREG = ROLLWORD = 0 (MRCLEAN LOOP IN TVCDAPON)
// PORT: SOURCE TVCROLLDAP.agc:77
//#
// PORT: SOURCE TVCROLLDAP.agc:78
//# OUTPUT....
// PORT: SOURCE TVCROLLDAP.agc:79
//
// PORT: SOURCE TVCROLLDAP.agc:80
//#      *ROLL JET PAIR FIRINGS
// PORT: SOURCE TVCROLLDAP.agc:81
//
// PORT: SOURCE TVCROLLDAP.agc:82
//# Page 985
// PORT: SOURCE TVCROLLDAP.agc:83
//# DEBRIS.... MISCELLANEOUS, SHAREABLE WITH RCS/ENTRY, IN EBANK6 ONLY
// PORT: SOURCE TVCROLLDAP.agc:84
//
// PORT: SOURCE TVCROLLDAP.agc:85
//# Page 986
// PORT: SOURCE TVCROLLDAP.agc:86
//# SOME NOTES ON THE ROLL AUTOPILOT, AND IN PARTICULAR, ON ITS SWITCHING
// PORT: SOURCE TVCROLLDAP.agc:87
//# LOGIC.  SEE SECTION THREE OF THE GSOP (SUNDISK/COLOSSUS) FOR DETAILS.
// PORT: SOURCE TVCROLLDAP.agc:88
//
// PORT: SOURCE TVCROLLDAP.agc:89
//# SWITCHING LOGIC IN THE PHASE PLANE....
// PORT: SOURCE TVCROLLDAP.agc:90
//
// PORT: SOURCE TVCROLLDAP.agc:91
//#                              OGARATE
// PORT: SOURCE TVCROLLDAP.agc:92
//#                                 *
// PORT: SOURCE TVCROLLDAP.agc:93
//#                                 *
// PORT: SOURCE TVCROLLDAP.agc:94
//#  * * * * * * * * * * *          *
// PORT: SOURCE TVCROLLDAP.agc:95
//#                                 *     (REGION 1, SEE TEXT BELOW)
// PORT: SOURCE TVCROLLDAP.agc:96
//#                            *    *
// PORT: SOURCE TVCROLLDAP.agc:97
//#                                 *
// PORT: SOURCE TVCROLLDAP.agc:98
//# * * * * * * *     (COAST)       *     ...PARABOLA (SWITCHING = CONTROL)
// PORT: SOURCE TVCROLLDAP.agc:99
//#               *                 *    .
// PORT: SOURCE TVCROLLDAP.agc:100
//#                 *               *   *
// PORT: SOURCE TVCROLLDAP.agc:101
//#                   *             *                (FIRE NEG ROLL JETS)
// PORT: SOURCE TVCROLLDAP.agc:102
//#                     *           *      *
// PORT: SOURCE TVCROLLDAP.agc:103
//#     (-DB,+LMCRATE)....*         *
// PORT: SOURCE TVCROLLDAP.agc:104
//#                       *         *        *
// PORT: SOURCE TVCROLLDAP.agc:105
//#                       *         *			         OGAERROR
// PORT: SOURCE TVCROLLDAP.agc:106
//# ************************************************************************
// PORT: SOURCE TVCROLLDAP.agc:107
//#                                 *         *                (-AK, OGAERR)
// PORT: SOURCE TVCROLLDAP.agc:108
//#                        *        *         *      (REGION 6-PRIME)
// PORT: SOURCE TVCROLLDAP.agc:109
//#                                 *         *      (SEE TEXT BELOW)
// PORT: SOURCE TVCROLLDAP.agc:110
//#                          *      *           *
// PORT: SOURCE TVCROLLDAP.agc:111
//#                                 *             *     ...STRAIGHT LINE
// PORT: SOURCE TVCROLLDAP.agc:112
//#    (FIRE POS ROLL JETS)     *   *               *  .
// PORT: SOURCE TVCROLLDAP.agc:113
//#                                 *   (COAST)       *
// PORT: SOURCE TVCROLLDAP.agc:114
//#                                 *                   * * * * * * * * * *
// PORT: SOURCE TVCROLLDAP.agc:115
//#                                 *                         -MINLIM
// PORT: SOURCE TVCROLLDAP.agc:116
//#                                 *    *
// PORT: SOURCE TVCROLLDAP.agc:117
//#                                 *
// PORT: SOURCE TVCROLLDAP.agc:118
//#                                 *          * * * * * * * * * * * * * * *
// PORT: SOURCE TVCROLLDAP.agc:119
//#                                 *                        -MAXLIM
// PORT: SOURCE TVCROLLDAP.agc:120
//#                                 *
// PORT: SOURCE TVCROLLDAP.agc:121
//#                                 *
// PORT: SOURCE TVCROLLDAP.agc:122
//
// PORT: SOURCE TVCROLLDAP.agc:123
//# SWITCHING PARABOLAS ARE CONTROL PARABOLAS, THUS REQUIRING KNOWLEDGE OF
// PORT: SOURCE TVCROLLDAP.agc:124
//#	CONTROL ACCELERATION CONACC, OR ITS RECIPROCAL, 1/CONACC, THE TVC
// PORT: SOURCE TVCROLLDAP.agc:125
//#	ROLL DAP GAIN (SEE TVCEXECUTIVE VARIABLE GAIN PACKAGE).  JET
// PORT: SOURCE TVCROLLDAP.agc:126
//#	FIRING TIME IS SIMPLY THAT REQUIRED TO ACHIEVE THE DESIRED OGARATE,
// PORT: SOURCE TVCROLLDAP.agc:127
//#	SUBJECT TO THE LIMITATIONS DISCUSSED UNDER FUNCTIONAL DESCRIPTION,
// PORT: SOURCE TVCROLLDAP.agc:128
//#	ABOVE.
// PORT: SOURCE TVCROLLDAP.agc:129
//
// PORT: SOURCE TVCROLLDAP.agc:130
//# THE THREE CONTROL REGIONS (+, -, AND ZERO TORQUE) ARE COMPRIZED OF
// PORT: SOURCE TVCROLLDAP.agc:131
//#	TWELVE SUBSET REGIONS ( 1...6, AND THE CORRESPONDING 1-PRIME...
// PORT: SOURCE TVCROLLDAP.agc:132
//#	6-PRIME ) SEE SECTION 3 OF THE GSOP (SUNDISK OR COLOSSUS)
// PORT: SOURCE TVCROLLDAP.agc:133
//# Page 987
// PORT: SOURCE TVCROLLDAP.agc:134
//#
// PORT: SOURCE TVCROLLDAP.agc:135
//# GIVEN THE OPERATING POINT NOT IN THE COAST REGION, THE DESIRED OGARATE
// PORT: SOURCE TVCROLLDAP.agc:136
//#	IS AT THE POINT OF PENETRATION OF THE COAST REGION BY THE CONTROL
// PORT: SOURCE TVCROLLDAP.agc:137
//#	PARABOLA WHICH PASSES THROUGH THE OPERATING POINT.  FOR REGION 3
// PORT: SOURCE TVCROLLDAP.agc:138
//#	DESIRED OGARATE IS SIMPLY +-MAXLIM.  FOR REGIONS 1 OR 6 THE SOLUTION
// PORT: SOURCE TVCROLLDAP.agc:139
//#	TO A QUADRATIC IS REQUIRED (THE PENETRATION IS ALONG THE STRAIGHT
// PORT: SOURCE TVCROLLDAP.agc:140
//#	LINE OR MINLIM BOUNDRY SWITCH LINES).  AN APPROXIMATION IS MADE
// PORT: SOURCE TVCROLLDAP.agc:141
//#	INSTEAD.  TAKE AN OPERATING POINT IN REGION 6' .  PASS A TANGENT TO
// PORT: SOURCE TVCROLLDAP.agc:142
//#	THE CONTROL PARABOLA THROUGH THE OPERATING POINT, AND FIND ITS
// PORT: SOURCE TVCROLLDAP.agc:143
//#	INTERSECTION WITH THE STRAIGHT LINE SECTION OF THE SWITCH CURVE...
// PORT: SOURCE TVCROLLDAP.agc:144
//#	THE INTERSECTION DEFINES THE DESIRED OGARATE.  IF THE OPERATING POINT IS
// PORT: SOURCE TVCROLLDAP.agc:145
//#	CLOSE TO THE SWITCH LINE, THE APPROXIMATION IS QUITE GOOD (INDEED
// PORT: SOURCE TVCROLLDAP.agc:146
//#	THE APPROXIMATE AND QUADRATIC SOLUTIONS CONVERGE IN THE LIMIT AS
// PORT: SOURCE TVCROLLDAP.agc:147
//#	THE SWITCH LINE IS APPROACHED).  IF THE OPERATING POINT IS NOT CLOSE
// PORT: SOURCE TVCROLLDAP.agc:148
//#	TO THE SWITCH LINE, THE APPROXIMATE SOLUTION GIVES VALID TREND
// PORT: SOURCE TVCROLLDAP.agc:149
//#	INFORMATION (DIRECTION OF DESIRED OGARATE) AT LEAST.  THE
// PORT: SOURCE TVCROLLDAP.agc:150
//#	RE-EVALUATION OF DESIRED OGARATE IN SUBSEQUENT ROLL DAP PASSES (1/2
// PORT: SOURCE TVCROLLDAP.agc:151
//#	SECOND INTERVALS) WILL BENEFIT FROM THE CONVERGENT NATURE OF THE
// PORT: SOURCE TVCROLLDAP.agc:152
//#	APPROXIMATION.
// PORT: SOURCE TVCROLLDAP.agc:153
//
// PORT: SOURCE TVCROLLDAP.agc:154
//# FOR LARGE OGAERROR THE TANGENT INTERSECTS +-MINLIM SWITCH BOUNDARY BEFORE
// PORT: SOURCE TVCROLLDAP.agc:155
//#	INTERSECTING THE STRAIGHT LINE SWITCH.  HOWEVER THE MINLIM IS
// PORT: SOURCE TVCROLLDAP.agc:156
//#	IGNORED IN COMPUTING THE FIRING TIME, SO THAT THE EXTENSION (INTO
// PORT: SOURCE TVCROLLDAP.agc:157
//#	THE COAST REGION) OF THE STRAIGHT LINE SWITCH IS WHAT IS FIRED TO.
// PORT: SOURCE TVCROLLDAP.agc:158
//#	IF THE ROLL DAP FINDS ITSELF IN THE COAST REGION BEFORE REACHING
// PORT: SOURCE TVCROLLDAP.agc:159
//#	THE DESIRED INTERSECTION (IE. IN THE REGION BETWEEN THE MINLIM
// PORT: SOURCE TVCROLLDAP.agc:160
//#	AND THE STRAIGHT LINE SWITCH) IT WILL EXHIBIT NORMAL COAST-REGION
// PORT: SOURCE TVCROLLDAP.agc:161
//#	BEHAVIOR AND TURN OFF THE JETS.  THE PURPOSE OF THIS FIRING POLICY
// PORT: SOURCE TVCROLLDAP.agc:162
//#	IS TO MAINTAIN STATIC ROLL STABILITY IN THE EVENT OF A JET
// PORT: SOURCE TVCROLLDAP.agc:163
//#	FAILED-ON.
// PORT: SOURCE TVCROLLDAP.agc:164
//
// PORT: SOURCE TVCROLLDAP.agc:165
//# WHEN THE OPERATING POINT IS IN REGION 1 THE SAME APPROXIMATION IS
// PORT: SOURCE TVCROLLDAP.agc:166
//#	MADE, BUT AT AN ARTIFICIALLY-CREATED OR DUMMY OPERATING POINT,
// PORT: SOURCE TVCROLLDAP.agc:167
//#	DEFINED BY.. OGAERROR = INTERSECTION OF CONTROL PARABOLA AND
// PORT: SOURCE TVCROLLDAP.agc:168
//#	OGAERROR AXIS, OGARATE = +-LMCRATE WHERE SIGN IS OPPOSITE THAT OF
// PORT: SOURCE TVCROLLDAP.agc:169
//#	REAL OPERATING POINT RATE.  WHEN THE OPERATING POINT HAS PASSED
// PORT: SOURCE TVCROLLDAP.agc:170
//#	FROM REGION 1 TO REGION 6', THE DUMMY POINT IS NO LONGER REQUIRED,
// PORT: SOURCE TVCROLLDAP.agc:171
//#	AND THE SOLUTION REVERTS TO THAT OF A REGULAR REGION 6' POINT.
// PORT: SOURCE TVCROLLDAP.agc:172
//
// PORT: SOURCE TVCROLLDAP.agc:173
//
// PORT: SOURCE TVCROLLDAP.agc:174
//# EQUATION FOR SWITCHING PARABOLA (SEE FIGURE ABOVE)....
// PORT: SOURCE TVCROLLDAP.agc:175
//#				  2
// PORT: SOURCE TVCROLLDAP.agc:176
//#	SOGAERROR = (DB - (SOGARATE) (1/CONACC)/2) SGN(SOGARATE)
// PORT: SOURCE TVCROLLDAP.agc:177
//
// PORT: SOURCE TVCROLLDAP.agc:178
//
// PORT: SOURCE TVCROLLDAP.agc:179
//# EQUATION FOR SWITCHING STRAIGHT LINE SEGMENT....
// PORT: SOURCE TVCROLLDAP.agc:180
//
// PORT: SOURCE TVCROLLDAP.agc:181
//#	SOGARATE = -(-SLOPE)(SOGAERROR) - SGN(SOGARATE) INTERCEP
// PORT: SOURCE TVCROLLDAP.agc:182
//
// PORT: SOURCE TVCROLLDAP.agc:183
//#		WHERE  INTERCEP = DB(-SLOPE) - LMCRATE
// PORT: SOURCE TVCROLLDAP.agc:184
//# Page 988
// PORT: SOURCE TVCROLLDAP.agc:185
//#
// PORT: SOURCE TVCROLLDAP.agc:186
//# EQUATION FOR INTERSECTION, CONTROL PARABOLA AND STRAIGHT SWITCH LINE....
// PORT: SOURCE TVCROLLDAP.agc:187
//
// PORT: SOURCE TVCROLLDAP.agc:188
//#	DOGADOT = NUM/DEN, WHERE
// PORT: SOURCE TVCROLLDAP.agc:189
//#				   2
// PORT: SOURCE TVCROLLDAP.agc:190
//#	    NUM = (-SLOPE)(OGARATE) (1/CONACC)
// PORT: SOURCE TVCROLLDAP.agc:191
//#		    +SGN(DELOGA)(-SLOPE)(OGAERROR - SGN(DELOGA)(DB))
// PORT: SOURCE TVCROLLDAP.agc:192
//#		    +LMCRATE
// PORT: SOURCE TVCROLLDAP.agc:193
//
// PORT: SOURCE TVCROLLDAP.agc:194
//#	    DEN = (-SLOPE)(LMCRATE)(1/CONACC) - SGN(DELOGA)
// PORT: SOURCE TVCROLLDAP.agc:195
//
// PORT: SOURCE TVCROLLDAP.agc:196
//#					      2
// PORT: SOURCE TVCROLLDAP.agc:197
//#	    DELOGA = OGAERROR - (DB - (OGADOT) (1/CONACC)/2) SGN(OGARATE)
// PORT: SOURCE TVCROLLDAP.agc:198
//
// PORT: SOURCE TVCROLLDAP.agc:199
//
// PORT: SOURCE TVCROLLDAP.agc:200
//# FOR REGIONS 6 AND 6-PRIME USE ACTUAL OPERATING POINT (OGA, OGARATE)
// PORT: SOURCE TVCROLLDAP.agc:201
//#	FOR OGAERROR AND OGARATE IN THE INTERSECTION EQUATIONS ABOVE.
// PORT: SOURCE TVCROLLDAP.agc:202
//#	FOR REGIONS 1 AND 1-PRIME USE DUMMY OPERATING POINT FOR OGAERROR
// PORT: SOURCE TVCROLLDAP.agc:203
//#	AND OGARATE, WHERE THE DUMMY POINT IS GIVEN BY....
// PORT: SOURCE TVCROLLDAP.agc:204
//#	OGAERROR= DELOGA + DB SGN(OGARATE)
// PORT: SOURCE TVCROLLDAP.agc:205
//#	OGARATE= -LMCRATE SGN(OGARATE)
// PORT: SOURCE TVCROLLDAP.agc:206
//#
// PORT: SOURCE TVCROLLDAP.agc:207
//# NOTE, OGAERROR = OGA - OGAD USES DUMMY REGISTER OGA IN ROLL DAP CODING
// PORT: SOURCE TVCROLLDAP.agc:208
//#	ALSO, AT POINT WHERE DOGARATE IS COMPUTED, REGISTER DELOGA IS USED
// PORT: SOURCE TVCROLLDAP.agc:209
//#	AS A DUMMY REGISTER FOR THE OGAERROR IN THE NUM EQUATION ABOVE
// PORT: SOURCE TVCROLLDAP.agc:210
//# Page 989
// PORT: SOURCE TVCROLLDAP.agc:211
//
// PORT: SOURCE TVCROLLDAP.agc:212
//# ROLLDAP CODING....
// PORT: SOURCE TVCROLLDAP.agc:213
//
// PORT: SOURCE TVCROLLDAP.agc:214
//		SETLOC	DAPROLL
// PORT: SOURCE TVCROLLDAP.agc:215
//		BANK
// PORT: SOURCE TVCROLLDAP.agc:216
//		EBANK=	OGANOW
// PORT: SOURCE TVCROLLDAP.agc:217
//		COUNT*	$$/ROLL
// PORT: SOURCE TVCROLLDAP.agc:218
//ROLLDAP		CAE	OGANOW		# OGA RATE ESTIMATOR...SIMPLE FIRST-ORDER
// PORT: Fixed ROM slots 17082.
                        if slot <> 17082 or instruction <> 13234 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 946).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCROLLDAP.agc:219
//		EXTEND			#	DIFFERENCE (SAMPLE TIME = 1/2 SEC)
// PORT: Fixed ROM slots 17083.
                        if slot <> 17083 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17084 {
// PORT: SOURCE TVCROLLDAP.agc:220
//		MSU	OGAPAST
// PORT: Fixed ROM slots 17084.
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
// PORT: SOURCE TVCROLLDAP.agc:221
//		EXTEND
// PORT: Fixed ROM slots 17085.
                            if slot <> 17085 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCROLLDAP.agc:222
//		MP	BIT5
// PORT: Fixed ROM slots 17086.
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
// PORT: SOURCE TVCROLLDAP.agc:223
//		LXCH	A
// PORT: Fixed ROM slots 17087.
                        if slot <> 17087 or instruction <> 9216 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 0, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCROLLDAP.agc:224
//		TS	OGARATE		# SC.AT B-4 REV/SEC
// PORT: Fixed ROM slots 17088.
                        if slot <> 17088 or instruction <> 23387 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23387, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17089 {
// PORT: SOURCE TVCROLLDAP.agc:225
//
// PORT: SOURCE TVCROLLDAP.agc:226
//# COMPUTATIONS WHICH FOLLOW USE OGA FOR OGAERR (SAME REGISTER)
// PORT: SOURCE TVCROLLDAP.agc:227
//# EXAMINE DURATION OF LAST JET FIRING IF JETS ARE NOW ON.
// PORT: SOURCE TVCROLLDAP.agc:228
//
// PORT: SOURCE TVCROLLDAP.agc:229
//DURATION	CA	ROLLFIRE	# SAME SGN AS PRESENT TORQ,MAGN=POSMAX
// PORT: Fixed ROM slots 17089.
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
// PORT: SOURCE TVCROLLDAP.agc:230
//		EXTEND
// PORT: Fixed ROM slots 17090.
                            if slot <> 17090 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCROLLDAP.agc:231
//		BZF	+2		# ROLL JETS ARE NOW OFF.
// PORT: Fixed ROM slots 17091.
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
// PORT: SOURCE TVCROLLDAP.agc:232
//		TCF	ROLLOGIC	# ENTER LOGIC,JETS NOW ON.
// PORT: Fixed ROM slots 17092.
                        if slot <> 17092 or instruction <> 5835 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5835, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCROLLDAP.agc:233
//
// PORT: SOURCE TVCROLLDAP.agc:234
//		CAE	TEMREG		# EXAMINE LAST FIRING INTERVAL
// PORT: Fixed ROM slots 17093.
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
// PORT: SOURCE TVCROLLDAP.agc:235
//		EXTEND			# IF POSITIVE, DONT FIRE
// PORT: Fixed ROM slots 17094.
                        if slot <> 17094 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17095 {
// PORT: SOURCE TVCROLLDAP.agc:236
//		BZF	ROLLOGIC	# ENTER LOGIC, JETS NOW OFF.
// PORT: Fixed ROM slots 17095.
                            if slot <> 17095 or instruction <> 5835 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5835, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCROLLDAP.agc:237
//
// PORT: SOURCE TVCROLLDAP.agc:238
//		CAF	ZERO		# JETS HAVE NOT BEEN OFF FOR 1/2 SEC. WAIT
// PORT: Fixed ROM slots 17096.
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
// PORT: SOURCE TVCROLLDAP.agc:239
//		TS	TEMREG		# RESET TEMREG
// PORT: Fixed ROM slots 17097.
                        if slot <> 17097 or instruction <> 23419 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23419, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17098 {
// PORT: SOURCE TVCROLLDAP.agc:240
//WAIT1/2		TCF	TASKOVER	# EXIT ROLL DAP
// PORT: Fixed ROM slots 17098.
                            if slot <> 17098 or instruction <> 6868 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6868, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCROLLDAP.agc:241
//
// PORT: SOURCE TVCROLLDAP.agc:242
//# COMPUTE DB-(1/2 CONACC) (OGARATE)SQ  (1/2 IN THE SCALING)
// PORT: SOURCE TVCROLLDAP.agc:243
//
// PORT: SOURCE TVCROLLDAP.agc:244
//ROLLOGIC	CS	OGARATE		# SCALED AT 2(-4) REV/SEC
// PORT: Fixed ROM slots 17099.
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
// PORT: SOURCE TVCROLLDAP.agc:245
//		EXTEND
// PORT: Fixed ROM slots 17100.
                        if slot <> 17100 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17101 {
// PORT: SOURCE TVCROLLDAP.agc:246
//		MP	1/CONACC	# SCALED AT 2(+9) SEC SQ /REV
// PORT: Fixed ROM slots 17101.
                            if slot <> 17101 or instruction <> 29600 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 928, readEffective:call(words, 928)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCROLLDAP.agc:247
//		EXTEND
// PORT: Fixed ROM slots 17102.
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
// PORT: SOURCE TVCROLLDAP.agc:248
//		MP	OGARATE
// PORT: Fixed ROM slots 17103.
                        if slot <> 17103 or instruction <> 29531 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 859, readEffective:call(words, 859)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCROLLDAP.agc:249
//		AD	DB		# SCALED AT 2(+0) REV
// PORT: Fixed ROM slots 17104.
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
// PORT: SOURCE TVCROLLDAP.agc:250
//		TS	TEMREG		# QUANTITY SCALED AT 2(+0) REV.
// PORT: Fixed ROM slots 17105.
                        if slot <> 17105 or instruction <> 23419 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23419, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17106 {
// PORT: SOURCE TVCROLLDAP.agc:251
//
// PORT: SOURCE TVCROLLDAP.agc:252
//# GET SIGN OF OGARATE
// PORT: SOURCE TVCROLLDAP.agc:253
//
// PORT: SOURCE TVCROLLDAP.agc:254
//		CA	OGARATE
// PORT: Fixed ROM slots 17106.
                            if slot <> 17106 or instruction <> 13147 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 859).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCROLLDAP.agc:255
//		EXTEND
// PORT: Fixed ROM slots 17107.
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
// PORT: SOURCE TVCROLLDAP.agc:256
//		BZMF	+3		# LET SGN(0) BE NEGATIVE
// PORT: Fixed ROM slots 17108.
                        if slot <> 17108 or instruction <> 26327 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26327, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17109 {
// PORT: SOURCE TVCROLLDAP.agc:257
//		CA	BIT1
// PORT: Fixed ROM slots 17109.
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
// PORT: SOURCE TVCROLLDAP.agc:258
//		TCF	+2
// PORT: Fixed ROM slots 17110.
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
// PORT: SOURCE TVCROLLDAP.agc:259
//		CS	BIT1
// PORT: Fixed ROM slots 17111.
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
// PORT: SOURCE TVCROLLDAP.agc:260
//		TS	SGNRT		# + OR -  2(-14)
// PORT: Fixed ROM slots 17112.
                            if slot <> 17112 or instruction <> 23478 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23478, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCROLLDAP.agc:261
//
// PORT: SOURCE TVCROLLDAP.agc:262
//# Page 990
// PORT: SOURCE TVCROLLDAP.agc:263
//# CALCULATE DISTANCE FROM SWITCH PARABOLA (DELOGA)
// PORT: SOURCE TVCROLLDAP.agc:264
//
// PORT: SOURCE TVCROLLDAP.agc:265
//		EXTEND
// PORT: Fixed ROM slots 17113.
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
// PORT: SOURCE TVCROLLDAP.agc:266
//		MP	TEMREG		# SGN(OGARATE) TEMREG NOW IN L
// PORT: Fixed ROM slots 17114.
                        if slot <> 17114 or instruction <> 29563 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 891, readEffective:call(words, 891)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCROLLDAP.agc:267
//		CS	L
// PORT: Fixed ROM slots 17115.
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
// PORT: SOURCE TVCROLLDAP.agc:268
//		AD	OGA		# SCALED AT 2(+0) REV
// PORT: Fixed ROM slots 17116.
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
// PORT: SOURCE TVCROLLDAP.agc:269
//DELOGAC		TS	DELOGA		# SC.AT B+0 REV, PLUS TO RIGHT OF C-PARAB
// PORT: Fixed ROM slots 17117.
                            if slot <> 17117 or instruction <> 23479 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23479, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCROLLDAP.agc:270
//
// PORT: SOURCE TVCROLLDAP.agc:271
//# EXAMINE SGN(DELOGA) AND CREATE CA OR CS INSTR. DEPENDING UPON SIGN.
// PORT: SOURCE TVCROLLDAP.agc:272
//
// PORT: SOURCE TVCROLLDAP.agc:273
//		EXTEND
// PORT: Fixed ROM slots 17118.
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
// PORT: SOURCE TVCROLLDAP.agc:274
//		BZMF	+3
// PORT: Fixed ROM slots 17119.
                        if slot <> 17119 or instruction <> 26338 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26338, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 17120 {
// PORT: SOURCE TVCROLLDAP.agc:275
//		CAF	PRIO30		# =CA (30000)
// PORT: Fixed ROM slots 17120.
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
// PORT: SOURCE TVCROLLDAP.agc:276
//		TCF	+2
// PORT: Fixed ROM slots 17121.
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
// PORT: SOURCE TVCROLLDAP.agc:277
//		CAF	BIT15		# =CS (40000)
// PORT: Fixed ROM slots 17122.
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
// PORT: SOURCE TVCROLLDAP.agc:278
//		TS	I
// PORT: Fixed ROM slots 17123.
                            if slot <> 17123 or instruction <> 23480 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23480, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TVCROLLDAP.agc:279
//
// PORT: SOURCE TVCROLLDAP.agc:280
//		INDEX	I		# TSET ON I SGN(OGARATE)
// PORT: Fixed ROM slots 17124.
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
// PORT: SOURCE TVCROLLDAP.agc:281
//		0	SGNRT		# CA OR CS
// PORT: Fixed ROM slots 17125.
    17125, 1900
)).

// PORT: Physical bank 16. Shared continuation entries, slots 17126–17129.
function agcAotUnit979 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17127 {
        if slot <= 17126 {
// PORT: SOURCE TVCROLLDAP.agc:282
//		COM
// PORT: Fixed ROM slots 17126.
            if slot <> 17126 or instruction <> 16384 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 0).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TVCROLLDAP.agc:283
//		EXTEND
// PORT: Fixed ROM slots 17127.
            if slot <> 17127 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17128 {
// PORT: SOURCE TVCROLLDAP.agc:284
//REG1TST		BZMF	ROLLON		# IF REGION 1 (DELOGA OGARATE SAME SIGN)
// PORT: Fixed ROM slots 17128.
            if slot <> 17128 or instruction <> 26385 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26385, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TVCROLLDAP.agc:285
//
// PORT: SOURCE TVCROLLDAP.agc:286
//# NO JET FIRE YET.  TEST FOR MAX OGARATE
// PORT: SOURCE TVCROLLDAP.agc:287
//
// PORT: SOURCE TVCROLLDAP.agc:288
//		INDEX	I
// PORT: Fixed ROM slots 17129.
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
// PORT: SOURCE TVCROLLDAP.agc:289
//		0	OGARATE		# CA OR CS...BOTH MUST BE NEG. HERE
// PORT: Fixed ROM slots 17130.
    17130, 1718
)).

// PORT: Physical bank 16. Shared continuation entries, slots 17131–17146.
function agcAotUnit980 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17138 {
        if slot <= 17134 {
            if slot <= 17132 {
                if slot <= 17131 {
// PORT: SOURCE TVCROLLDAP.agc:290
//		TS	IOGARATE	# I.E. I OGARATE
// PORT: Fixed ROM slots 17131.
                    if slot <> 17131 or instruction <> 23481 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23481, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCROLLDAP.agc:291
//		AD	MAXLIM		# SCALED AT 2(-4) REV/SEC
// PORT: Fixed ROM slots 17132.
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
// PORT: SOURCE TVCROLLDAP.agc:292
//		EXTEND
// PORT: Fixed ROM slots 17133.
                    if slot <> 17133 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCROLLDAP.agc:293
//REG3TST		BZMF	RATELIM		# IF REGION 3 (RATES TOO HIGH, FIRE JETS)
// PORT: Fixed ROM slots 17134.
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
// PORT: SOURCE TVCROLLDAP.agc:294
//
// PORT: SOURCE TVCROLLDAP.agc:295
//# COMPUTATION OF I((-SLOPE)OGA + OGARATE) - INTERCEPT..NOTE THAT STR. LINE
// PORT: SOURCE TVCROLLDAP.agc:296
//# SWITCH SLOPE IS (SLOPE) DEG/SEC/DEG, A NEG QUANTITY
// PORT: SOURCE TVCROLLDAP.agc:297
//
// PORT: SOURCE TVCROLLDAP.agc:298
//		CA	OGARATE
// PORT: Fixed ROM slots 17135.
                    if slot <> 17135 or instruction <> 13147 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 859).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCROLLDAP.agc:299
//		EXTEND
// PORT: Fixed ROM slots 17136.
                    if slot <> 17136 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17137 {
// PORT: SOURCE TVCROLLDAP.agc:300
//		MP	BIT14
// PORT: Fixed ROM slots 17137.
                    if slot <> 17137 or instruction <> 31234 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 2562, readEffective:call(words, 2562)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCROLLDAP.agc:301
//		TS	TEMREG
// PORT: Fixed ROM slots 17138.
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
// PORT: SOURCE TVCROLLDAP.agc:302
//		CA	OGA
// PORT: Fixed ROM slots 17139.
                    if slot <> 17139 or instruction <> 13236 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 948).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCROLLDAP.agc:303
//		EXTEND
// PORT: Fixed ROM slots 17140.
                    if slot <> 17140 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 17141 {
// PORT: SOURCE TVCROLLDAP.agc:304
//		MP	-SLOPE
// PORT: Fixed ROM slots 17141.
                    if slot <> 17141 or instruction <> 30663 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 1991, readEffective:call(words, 1991)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCROLLDAP.agc:305
//		DDOUBL
// PORT: Fixed ROM slots 17142.
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
// PORT: SOURCE TVCROLLDAP.agc:306
//		DDOUBL
// PORT: Fixed ROM slots 17143.
                    if slot <> 17143 or instruction <> 8193 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 1) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCROLLDAP.agc:307
//		DDOUBL			# (OGA ERROR MUST BE LESS THAN +-225 DEG)
// PORT: Fixed ROM slots 17144.
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
// PORT: SOURCE TVCROLLDAP.agc:308
//		AD	TEMREG
// PORT: Fixed ROM slots 17145.
                    if slot <> 17145 or instruction <> 25467 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 891).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCROLLDAP.agc:309
//
// PORT: SOURCE TVCROLLDAP.agc:310
//		INDEX	I
// PORT: Fixed ROM slots 17146.
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
// PORT: SOURCE TVCROLLDAP.agc:311
//		0	A		# I((-SLOPE)OGA+OGARATE) AT 2(-3)REV/SEC
// PORT: Fixed ROM slots 17147.
    17147, 0
)).

// PORT: Physical bank 16. Shared continuation entries, slots 17148–17157.
function agcAotUnit981 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17152 {
        if slot <= 17149 {
            if slot <= 17148 {
// PORT: SOURCE TVCROLLDAP.agc:312
//		COM
// PORT: Fixed ROM slots 17148.
                if slot <> 17148 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCROLLDAP.agc:313
//# Page 991
// PORT: SOURCE TVCROLLDAP.agc:314
//		AD	INTERCEP	# SCALED AT 2(-3) REV.
// PORT: Fixed ROM slots 17149.
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
// PORT: SOURCE TVCROLLDAP.agc:315
//		COM
// PORT: Fixed ROM slots 17150.
                if slot <> 17150 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17151 {
// PORT: SOURCE TVCROLLDAP.agc:316
//		EXTEND
// PORT: Fixed ROM slots 17151.
                    if slot <> 17151 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCROLLDAP.agc:317
//REG2TST		BZMF	NOROLL		# IP REGION 2 (COAST SIDE OF STRT LINE)
// PORT: Fixed ROM slots 17152.
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
// PORT: SOURCE TVCROLLDAP.agc:318
//
// PORT: SOURCE TVCROLLDAP.agc:319
//# CHECK TO SEE IF OGARATE IS ABOVE MINLIM BOUNDARY
// PORT: SOURCE TVCROLLDAP.agc:320
//
// PORT: SOURCE TVCROLLDAP.agc:321
//		CA	IOGARATE	# ALWAYS NEGATIVE
// PORT: Fixed ROM slots 17153.
                if slot <> 17153 or instruction <> 13241 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 953).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCROLLDAP.agc:322
//		AD	MINLIM		# SCALED AT 2(-4) REV/SEC
// PORT: Fixed ROM slots 17154.
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
// PORT: SOURCE TVCROLLDAP.agc:323
//		EXTEND
// PORT: Fixed ROM slots 17155.
                if slot <> 17155 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17156 {
// PORT: SOURCE TVCROLLDAP.agc:324
//REG4TST		BZMF	NOROLL		# IF REGION 4 (COAST SIDE OF MINLIM)
// PORT: Fixed ROM slots 17156.
                    if slot <> 17156 or instruction <> 26505 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26505, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCROLLDAP.agc:325
//
// PORT: SOURCE TVCROLLDAP.agc:326
//# ALL AREAS CHECKED EXCEPT LAST AREA...NO FIRE IN THIS SMALL SEGMENT
// PORT: SOURCE TVCROLLDAP.agc:327
//
// PORT: SOURCE TVCROLLDAP.agc:328
//		INDEX	I
// PORT: Fixed ROM slots 17157.
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
// PORT: SOURCE TVCROLLDAP.agc:329
//		0	OGA
// PORT: Fixed ROM slots 17158.
    17158, 1896
)).

// PORT: Physical bank 16. Shared continuation entries, slots 17159–17169.
function agcAotUnit982 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17163 {
        if slot <= 17160 {
            if slot <= 17159 {
// PORT: SOURCE TVCROLLDAP.agc:330
//		COM
// PORT: Fixed ROM slots 17159.
                if slot <> 17159 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCROLLDAP.agc:331
//		AD	DB
// PORT: Fixed ROM slots 17160.
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
// PORT: SOURCE TVCROLLDAP.agc:332
//		COM
// PORT: Fixed ROM slots 17161.
                if slot <> 17161 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17162 {
// PORT: SOURCE TVCROLLDAP.agc:333
//		EXTEND
// PORT: Fixed ROM slots 17162.
                    if slot <> 17162 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCROLLDAP.agc:334
//REG5TST		BZMF	NOROLL		# IF REGION 5 (COAST SIDE OF DB)
// PORT: Fixed ROM slots 17163.
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
// PORT: SOURCE TVCROLLDAP.agc:335
//
// PORT: SOURCE TVCROLLDAP.agc:336
//# JETS MUST FIRE NOW.OGARATE IS NEG.(OR VICE VERSA).USE DIRECT STR. LINE.
// PORT: SOURCE TVCROLLDAP.agc:337
//# DELOGA AND DELOGART ARE USED AS DUMMY VARIABLES IN THE SOLUTION OF A
// PORT: SOURCE TVCROLLDAP.agc:338
//# STRAIGHT LINE APPROXIMATION TO A QUADRATIC SOLUTION OF THE INTERSECTION
// PORT: SOURCE TVCROLLDAP.agc:339
//# OF THE CONTROL PARABOLA AND THE STRAIGHT-LINE SWITCH LINE.  THE STRAIGHT
// PORT: SOURCE TVCROLLDAP.agc:340
//# LINE IS THE TANGENT TO THE CONTROL PARABOLA AT THE OPERATING POINT.  (FOR
// PORT: SOURCE TVCROLLDAP.agc:341
//# OPERATING POINTS IN REGIONS 6 AND 6')
// PORT: SOURCE TVCROLLDAP.agc:342
//
// PORT: SOURCE TVCROLLDAP.agc:343
//REGION6		CAE	OGA		# USE ACTUAL OPERATING POINT FOR TANGENT
// PORT: Fixed ROM slots 17164.
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
// PORT: SOURCE TVCROLLDAP.agc:344
//		TS	DELOGA		# ACTUAL STATE
// PORT: Fixed ROM slots 17165.
                    if slot <> 17165 or instruction <> 23479 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23479, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCROLLDAP.agc:345
//		CA	OGARATE
// PORT: Fixed ROM slots 17166.
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
// PORT: SOURCE TVCROLLDAP.agc:346
//		TS	DELOGART	# ACTUAL STATE,I.E. DEL OGARATE
// PORT: Fixed ROM slots 17167.
                if slot <> 17167 or instruction <> 23477 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23477, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17168 {
// PORT: SOURCE TVCROLLDAP.agc:347
//		TCF	ONROLL
// PORT: Fixed ROM slots 17168.
                    if slot <> 17168 or instruction <> 5912 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5912, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCROLLDAP.agc:348
//
// PORT: SOURCE TVCROLLDAP.agc:349
//# JETS ALSO FIRE FROM HERE EXCEPT OGARATE IS POS (VICE VERSA),USE INDIRECT
// PORT: SOURCE TVCROLLDAP.agc:350
//# STRAIGHT LINE ESTABLISHED BY TANGENT TO A CONTROL PARABOLA AT    ((DELOGA
// PORT: SOURCE TVCROLLDAP.agc:351
//# + DB SGN(DELOGA) ), -LMCRATE SGN(DELOGA) )	(THIS IS THE DUMMY
// PORT: SOURCE TVCROLLDAP.agc:352
//# OPERATING POINT FOR OPERATING POINTS IN REGIONS 1 AND 1' )
// PORT: SOURCE TVCROLLDAP.agc:353
//
// PORT: SOURCE TVCROLLDAP.agc:354
//ROLLON		INDEX	I
// PORT: Fixed ROM slots 17169.
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
// PORT: SOURCE TVCROLLDAP.agc:355
//		0	DB
// PORT: Fixed ROM slots 17170.
    17170, 3980
)).

// PORT: Physical bank 16. Shared continuation entries, slots 17171–17173.
function agcAotUnit983 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17171 {
// PORT: SOURCE TVCROLLDAP.agc:356
//		ADS	DELOGA		# DELOGA WAS DIST. FROM SWITCH PARABOLA
// PORT: Fixed ROM slots 17171.
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
// PORT: SOURCE TVCROLLDAP.agc:357
//
// PORT: SOURCE TVCROLLDAP.agc:358
//		CS	LMCRATE		# LIMIT CYCLE RATE AT 2(-4) REV/SEC
// PORT: Fixed ROM slots 17172.
            if slot <> 17172 or instruction <> 18376 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 1992), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TVCROLLDAP.agc:359
//		INDEX	I
// PORT: Fixed ROM slots 17173.
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
// PORT: SOURCE TVCROLLDAP.agc:360
//		0	A
// PORT: Fixed ROM slots 17174.
    17174, 0
)).

// PORT: Physical bank 16. Shared continuation entries, slots 17175–17186.
function agcAotUnit984 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17180 {
        if slot <= 17177 {
            if slot <= 17175 {
// PORT: SOURCE TVCROLLDAP.agc:361
//		TS	DELOGART	# EVALUATE STATE FOR INDIRECT LINE.
// PORT: Fixed ROM slots 17175.
                if slot <> 17175 or instruction <> 23477 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23477, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17176 {
// PORT: SOURCE TVCROLLDAP.agc:362
//
// PORT: SOURCE TVCROLLDAP.agc:363
//# Page 992
// PORT: SOURCE TVCROLLDAP.agc:364
//# SOLVE STRAIGHT LINES SIMULTANEOUSLY TO OBTAIN DESIRED OGARATE.
// PORT: SOURCE TVCROLLDAP.agc:365
//
// PORT: SOURCE TVCROLLDAP.agc:366
//ONROLL		EXTEND			# DELOGART IN ACC. ON ARRIVAL
// PORT: Fixed ROM slots 17176.
                    if slot <> 17176 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCROLLDAP.agc:367
//		MP	1/CONACC
// PORT: Fixed ROM slots 17177.
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
// PORT: SOURCE TVCROLLDAP.agc:368
//		DOUBLE
// PORT: Fixed ROM slots 17178.
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
// PORT: SOURCE TVCROLLDAP.agc:369
//		EXTEND
// PORT: Fixed ROM slots 17179.
                    if slot <> 17179 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCROLLDAP.agc:370
//		MP	-SLOPE
// PORT: Fixed ROM slots 17180.
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
// PORT: SOURCE TVCROLLDAP.agc:371
//		TS	TEMREG		# 2(-SLOPE)RATE /CONACC
// PORT: Fixed ROM slots 17181.
                if slot <> 17181 or instruction <> 23419 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23419, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17182 {
// PORT: SOURCE TVCROLLDAP.agc:372
//		EXTEND
// PORT: Fixed ROM slots 17182.
                    if slot <> 17182 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCROLLDAP.agc:373
//		MP	DELOGART
// PORT: Fixed ROM slots 17183.
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
// PORT: SOURCE TVCROLLDAP.agc:374
//		TS	DELOGART	# 2(-SLOPE)(RATESQ)/CONACC
// PORT: Fixed ROM slots 17184.
                if slot <> 17184 or instruction <> 23477 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23477, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17185 {
// PORT: SOURCE TVCROLLDAP.agc:375
//		CS	BIT11
// PORT: Fixed ROM slots 17185.
                    if slot <> 17185 or instruction <> 18949 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2565), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCROLLDAP.agc:376
//		INDEX	I
// PORT: Fixed ROM slots 17186.
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
// PORT: SOURCE TVCROLLDAP.agc:377
//		0	A
// PORT: Fixed ROM slots 17187.
    17187, 0
)).

// PORT: Physical bank 16. Shared continuation entries, slots 17188–17189.
function agcAotUnit985 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17188 {
// PORT: SOURCE TVCROLLDAP.agc:378
//RATEDEN		ADS	TEMREG		# DENOMINATOR COMPLETED
// PORT: Fixed ROM slots 17188.
        if slot <> 17188 or instruction <> 12155 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreADS(words, 891).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE TVCROLLDAP.agc:379
//
// PORT: SOURCE TVCROLLDAP.agc:380
//		INDEX	I
// PORT: Fixed ROM slots 17189.
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
// PORT: SOURCE TVCROLLDAP.agc:381
//		0	DELOGA
// PORT: Fixed ROM slots 17190.
    17190, 1902
)).

// PORT: Physical bank 16. Shared continuation entries, slots 17191–17217.
function agcAotUnit986 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17203 {
        if slot <= 17196 {
            if slot <= 17193 {
                if slot <= 17191 {
// PORT: SOURCE TVCROLLDAP.agc:382
//		COM
// PORT: Fixed ROM slots 17191.
                    if slot <> 17191 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17192 {
// PORT: SOURCE TVCROLLDAP.agc:383
//		AD	DB
// PORT: Fixed ROM slots 17192.
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
// PORT: SOURCE TVCROLLDAP.agc:384
//		COM
// PORT: Fixed ROM slots 17193.
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
// PORT: SOURCE TVCROLLDAP.agc:385
//		EXTEND
// PORT: Fixed ROM slots 17194.
                    if slot <> 17194 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17195 {
// PORT: SOURCE TVCROLLDAP.agc:386
//		MP	-SLOPE
// PORT: Fixed ROM slots 17195.
                        if slot <> 17195 or instruction <> 30663 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 1991, readEffective:call(words, 1991)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCROLLDAP.agc:387
//		ADS	DELOGART
// PORT: Fixed ROM slots 17196.
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
// PORT: SOURCE TVCROLLDAP.agc:388
//		CA	LMCRATE
// PORT: Fixed ROM slots 17197.
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
// PORT: SOURCE TVCROLLDAP.agc:389
//		EXTEND
// PORT: Fixed ROM slots 17198.
                        if slot <> 17198 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCROLLDAP.agc:390
//		MP	BIT11
// PORT: Fixed ROM slots 17199.
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
// PORT: SOURCE TVCROLLDAP.agc:391
//RATENUM		AD	DELOGART	# NUMERATOR COMPLETED
// PORT: Fixed ROM slots 17200.
                        if slot <> 17200 or instruction <> 25525 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 949).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCROLLDAP.agc:392
//
// PORT: SOURCE TVCROLLDAP.agc:393
//		XCH	L		# PLACE NUMERATOR IN L FOR OVERFL. CHECK
// PORT: Fixed ROM slots 17201.
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
// PORT: SOURCE TVCROLLDAP.agc:394
//		CA	ZERO
// PORT: Fixed ROM slots 17202.
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
// PORT: SOURCE TVCROLLDAP.agc:395
//		EXTEND
// PORT: Fixed ROM slots 17203.
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
// PORT: SOURCE TVCROLLDAP.agc:396
//		DV	TEMREG		# OVERFLOW, IF ANYTHING, NOW APPEARS IN A
// PORT: Fixed ROM slots 17204.
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
// PORT: SOURCE TVCROLLDAP.agc:397
//		EXTEND
// PORT: Fixed ROM slots 17205.
                        if slot <> 17205 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCROLLDAP.agc:398
//		BZF	DVOK		# NO OVERFLOW....(0,L)/TEMREG = 0,L
// PORT: Fixed ROM slots 17206.
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
// PORT: SOURCE TVCROLLDAP.agc:399
//
// PORT: SOURCE TVCROLLDAP.agc:400
//MINLIMAP	CCS	A
// PORT: Fixed ROM slots 17207.
                        if slot <> 17207 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCROLLDAP.agc:401
//		CAF	POSMAX		# 	POSITIVE OVERFLOW
// PORT: Fixed ROM slots 17208.
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
// PORT: SOURCE TVCROLLDAP.agc:402
//		TCF	ROLLSET
// PORT: Fixed ROM slots 17209.
                        if slot <> 17209 or instruction <> 5955 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5955, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCROLLDAP.agc:403
//		CS	POSMAX		#	NEGATIVE OVERFLOW
// PORT: Fixed ROM slots 17210.
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
// PORT: SOURCE TVCROLLDAP.agc:404
//		TCF	ROLLSET
// PORT: Fixed ROM slots 17211.
                    if slot <> 17211 or instruction <> 5955 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5955, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 17212 {
// PORT: SOURCE TVCROLLDAP.agc:405
//
// PORT: SOURCE TVCROLLDAP.agc:406
//DVOK		LXCH	A		# PUT NUMERATOR BACK INTO A, 0 INTO L
// PORT: Fixed ROM slots 17212.
                        if slot <> 17212 or instruction <> 9216 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 0, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCROLLDAP.agc:407
//		EXTEND
// PORT: Fixed ROM slots 17213.
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
// PORT: SOURCE TVCROLLDAP.agc:408
//		DV	TEMREG		# RESULT OF DIVISION IS DESIRED OGARATE
// PORT: Fixed ROM slots 17214.
                        if slot <> 17214 or instruction <> 4987 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreDv(words, 891, readEffective:call(words, 891)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCROLLDAP.agc:409
//		TCF	ROLLSET		#	( SCALED AT B-4 REV/SEC )
// PORT: Fixed ROM slots 17215.
                        if slot <> 17215 or instruction <> 5955 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5955, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 17216 {
// PORT: SOURCE TVCROLLDAP.agc:410
//
// PORT: SOURCE TVCROLLDAP.agc:411
//RATELIM		CS	MAXLIM
// PORT: Fixed ROM slots 17216.
                        if slot <> 17216 or instruction <> 18380 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 1996), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCROLLDAP.agc:412
//		INDEX	I
// PORT: Fixed ROM slots 17217.
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
// PORT: SOURCE TVCROLLDAP.agc:413
//# Page 993
// PORT: SOURCE TVCROLLDAP.agc:414
//		0	A		# IF I = CA, DESIRED RATE IS	-MAXLIM
// PORT: Fixed ROM slots 17218.
    17218, 0
)).

// PORT: Physical bank 16. Shared continuation entries, slots 17219–17224.
function agcAotUnit987 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17221 {
        if slot <= 17219 {
// PORT: SOURCE TVCROLLDAP.agc:415
//
// PORT: SOURCE TVCROLLDAP.agc:416
//# COMPUTE JET FIRE TIME, BASED ON DESIRED RATE MINUS PRESENT RATE
// PORT: SOURCE TVCROLLDAP.agc:417
//
// PORT: SOURCE TVCROLLDAP.agc:418
//ROLLSET		TS	TEMREG		# STORE DESIRED OGARATE (SCALED B-4)
// PORT: Fixed ROM slots 17219.
            if slot <> 17219 or instruction <> 23419 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23419, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 17220 {
// PORT: SOURCE TVCROLLDAP.agc:419
//		EXTEND
// PORT: Fixed ROM slots 17220.
                if slot <> 17220 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCROLLDAP.agc:420
//		SU	OGARATE		# RATE DIFF. SCALED AT 2(-4) REV/SEC
// PORT: Fixed ROM slots 17221.
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
// PORT: SOURCE TVCROLLDAP.agc:421
//		TS	TEMREG		#	OVERFLOW PROTECT
// PORT: Fixed ROM slots 17222.
            if slot <> 17222 or instruction <> 23419 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23419, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 17223 {
// PORT: SOURCE TVCROLLDAP.agc:422
//		TCF	+3		#	    "       "
// PORT: Fixed ROM slots 17223.
                if slot <> 17223 or instruction <> 5962 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5962, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCROLLDAP.agc:423
//		INDEX	A		#           "       "
// PORT: Fixed ROM slots 17224.
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
// PORT: SOURCE TVCROLLDAP.agc:424
//		CS	LIMITS		#	    "       "
// PORT: Fixed ROM slots 17225.
    17225, 37888
)).

// PORT: Physical bank 16. Shared continuation entries, slots 17226–17234.
function agcAotUnit988 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17229 {
        if slot <= 17227 {
            if slot <= 17226 {
// PORT: SOURCE TVCROLLDAP.agc:425
//		EXTEND
// PORT: Fixed ROM slots 17226.
                if slot <> 17226 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCROLLDAP.agc:426
//		MP	T6SCALE		# T6SCALE = 8/10.24
// PORT: Fixed ROM slots 17227.
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
// PORT: SOURCE TVCROLLDAP.agc:427
//		EXTEND
// PORT: Fixed ROM slots 17228.
                if slot <> 17228 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCROLLDAP.agc:428
//		MP	1/CONACC	# SCALED AT B+9 SECSQ/REV (MAX < .60)
// PORT: Fixed ROM slots 17229.
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
// PORT: SOURCE TVCROLLDAP.agc:429
//		DDOUBL
// PORT: Fixed ROM slots 17230.
                if slot <> 17230 or instruction <> 8193 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 1) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TVCROLLDAP.agc:430
//		DDOUBL
// PORT: Fixed ROM slots 17231.
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
// PORT: SOURCE TVCROLLDAP.agc:431
//		TS	TEMREG		#	OVERFLOW PROTECT
// PORT: Fixed ROM slots 17232.
                if slot <> 17232 or instruction <> 23419 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23419, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 17233 {
// PORT: SOURCE TVCROLLDAP.agc:432
//		TCF	+3		#	    "	    "
// PORT: Fixed ROM slots 17233.
                    if slot <> 17233 or instruction <> 5972 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5972, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCROLLDAP.agc:433
//		INDEX	A		#   	    "	    "
// PORT: Fixed ROM slots 17234.
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
// PORT: SOURCE TVCROLLDAP.agc:434
//		CS	LIMITS		# 	    " 	    "
// PORT: Fixed ROM slots 17235.
    17235, 37888
)).

// PORT: Physical bank 16. Shared continuation entries, slots 17236–17347.
function agcAotUnit989 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17291 {
        if slot <= 17263 {
            if slot <= 17249 {
                if slot <= 17242 {
                    if slot <= 17238 {
                        if slot <= 17236 {
// PORT: SOURCE TVCROLLDAP.agc:435
//		TS	TEMREG		# JET FIRE TIME AT 625 MICROSEC/BIT
// PORT: Fixed ROM slots 17236.
                            if slot <> 17236 or instruction <> 23419 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23419, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17237 {
// PORT: SOURCE TVCROLLDAP.agc:436
//		EXTEND			# POS MEANS POSITIVE ROLL TORQUE.
// PORT: Fixed ROM slots 17237.
                                if slot <> 17237 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:437
//		BZF	NOROLL
// PORT: Fixed ROM slots 17238.
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
// PORT: SOURCE TVCROLLDAP.agc:438
//
// PORT: SOURCE TVCROLLDAP.agc:439
//# JET FIRE TIME IS NZ, TEST FOR JETS NOW ON.
// PORT: SOURCE TVCROLLDAP.agc:440
//
// PORT: SOURCE TVCROLLDAP.agc:441
//		CAE	TEMREG		# DESIRED CHANGE IN OGARATE
// PORT: Fixed ROM slots 17239.
                                if slot <> 17239 or instruction <> 13179 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 891).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:442
//		EXTEND
// PORT: Fixed ROM slots 17240.
                                if slot <> 17240 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17241 {
// PORT: SOURCE TVCROLLDAP.agc:443
//		MP	ROLLFIRE	# (SGN OF TORQUE..ZERO IF JETS NOW OFF)
// PORT: Fixed ROM slots 17241.
                                if slot <> 17241 or instruction <> 29561 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 889, readEffective:call(words, 889)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:444
//		CCS	A
// PORT: Fixed ROM slots 17242.
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
// PORT: SOURCE TVCROLLDAP.agc:445
//		TCF	MOREROLL	# CONTINUE FIRING WITH PRESENT POLARITY
// PORT: Fixed ROM slots 17243.
                            if slot <> 17243 or instruction <> 5983 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5983, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17244 {
// PORT: SOURCE TVCROLLDAP.agc:446
//		TCF	NEWROLL		# START NEW FIRING NOW, PLUS
// PORT: Fixed ROM slots 17244.
                                if slot <> 17244 or instruction <> 5986 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5986, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:447
//		TCF	NOROLL		# TERMINATE OLD FIRING, NEW SIGN REQUESTED
// PORT: Fixed ROM slots 17245.
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
// PORT: SOURCE TVCROLLDAP.agc:448
//		TCF	NEWROLL		# START NEW FIRING NOW, MINUS
// PORT: Fixed ROM slots 17246.
                                if slot <> 17246 or instruction <> 5986 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5986, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:449
//
// PORT: SOURCE TVCROLLDAP.agc:450
//# CONTINUE PRESENT FIRING
// PORT: SOURCE TVCROLLDAP.agc:451
//
// PORT: SOURCE TVCROLLDAP.agc:452
//MOREROLL	CAF	ZERO
// PORT: Fixed ROM slots 17247.
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
// PORT: SOURCE TVCROLLDAP.agc:453
//		TS	I		# USE TEMP. AS MOREROLL SWITCH
// PORT: Fixed ROM slots 17248.
                                if slot <> 17248 or instruction <> 23480 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23480, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:454
//		TCF	MAXTFIRE
// PORT: Fixed ROM slots 17249.
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
// PORT: SOURCE TVCROLLDAP.agc:455
//
// PORT: SOURCE TVCROLLDAP.agc:456
//# START NEW FIRING BUT CHECK IF GREATER THAN MIN FIRE TIME.
// PORT: SOURCE TVCROLLDAP.agc:457
//
// PORT: SOURCE TVCROLLDAP.agc:458
//NEWROLL		CCS	TEMREG		# CALL THIS T6FIRE
// PORT: Fixed ROM slots 17250.
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
// PORT: SOURCE TVCROLLDAP.agc:459
//		AD	ONE
// PORT: Fixed ROM slots 17251.
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
// PORT: SOURCE TVCROLLDAP.agc:460
//		TCF	+2
// PORT: Fixed ROM slots 17252.
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
// PORT: SOURCE TVCROLLDAP.agc:461
//		AD	ONE
// PORT: Fixed ROM slots 17253.
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
// PORT: SOURCE TVCROLLDAP.agc:462
//		COM			# -MAG(T6FIRE)
// PORT: Fixed ROM slots 17254.
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
// PORT: SOURCE TVCROLLDAP.agc:463
//		AD	TMINFIRE	# TMINFIRE-MAG(T6FIRE)
// PORT: Fixed ROM slots 17255.
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
// PORT: SOURCE TVCROLLDAP.agc:464
//# Page 994
// PORT: SOURCE TVCROLLDAP.agc:465
//		COM
// PORT: Fixed ROM slots 17256.
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
// PORT: SOURCE TVCROLLDAP.agc:466
//		EXTEND
// PORT: Fixed ROM slots 17257.
                            if slot <> 17257 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17258 {
// PORT: SOURCE TVCROLLDAP.agc:467
//MINTST		BZMF	NOROLL		# IF NOT GREATER THAN TMINFIRE (NEW FIRE)
// PORT: Fixed ROM slots 17258.
                                if slot <> 17258 or instruction <> 26505 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 26505, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:468
//
// PORT: SOURCE TVCROLLDAP.agc:469
//# PROCEED WITH NEW FIRING BUT NOT LONGER THAN TMAXFIRE.
// PORT: SOURCE TVCROLLDAP.agc:470
//
// PORT: SOURCE TVCROLLDAP.agc:471
//MAXTFIRE	CA	TEMREG
// PORT: Fixed ROM slots 17259.
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
// PORT: SOURCE TVCROLLDAP.agc:472
//		EXTEND
// PORT: Fixed ROM slots 17260.
                                if slot <> 17260 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:473
//		MP	1/TMXFIR	# I.E. 1/TMAXFIRE
// PORT: Fixed ROM slots 17261.
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
// PORT: SOURCE TVCROLLDAP.agc:474
//		EXTEND
// PORT: Fixed ROM slots 17262.
                                if slot <> 17262 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:475
//MAXTST		BZF	NOMXFIRE	# IF LESS THAN TMAXFIRE
// PORT: Fixed ROM slots 17263.
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
// PORT: SOURCE TVCROLLDAP.agc:476
//
// PORT: SOURCE TVCROLLDAP.agc:477
//		CCS	A
// PORT: Fixed ROM slots 17264.
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
// PORT: SOURCE TVCROLLDAP.agc:478
//		CAF	TMAXFIRE	# USE MAXIMUM
// PORT: Fixed ROM slots 17265.
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
// PORT: SOURCE TVCROLLDAP.agc:479
//		TCF	+2
// PORT: Fixed ROM slots 17266.
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
// PORT: SOURCE TVCROLLDAP.agc:480
//		CS	TMAXFIRE	# USE MAXIMUM
// PORT: Fixed ROM slots 17267.
                                if slot <> 17267 or instruction <> 18382 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 1998), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:481
//		TS	TEMREG
// PORT: Fixed ROM slots 17268.
                                if slot <> 17268 or instruction <> 23419 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23419, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17269 {
// PORT: SOURCE TVCROLLDAP.agc:482
//
// PORT: SOURCE TVCROLLDAP.agc:483
//# SET UP SIGN OF REQUIRED TORQUE.
// PORT: SOURCE TVCROLLDAP.agc:484
//
// PORT: SOURCE TVCROLLDAP.agc:485
//NOMXFIRE	CCS	TEMREG		# FOR TORQUE SIGN
// PORT: Fixed ROM slots 17269.
                                if slot <> 17269 or instruction <> 4987 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 891).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:486
//		CA	POSMAX		# POSITIVE TORQUE REQUIRED
// PORT: Fixed ROM slots 17270.
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
// PORT: SOURCE TVCROLLDAP.agc:487
//		TCF	+2
// PORT: Fixed ROM slots 17271.
                            if slot <> 17271 or instruction <> 6009 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6009, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17272 {
// PORT: SOURCE TVCROLLDAP.agc:488
//		CA	NEGMAX		# NEGATIVE TORQUE REQUIRED
// PORT: Fixed ROM slots 17272.
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
// PORT: SOURCE TVCROLLDAP.agc:489
//		TS	ROLLFIRE	# SET ROLLFIRE FOR + OR - TORQUE
// PORT: Fixed ROM slots 17273.
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
// PORT: SOURCE TVCROLLDAP.agc:490
//
// PORT: SOURCE TVCROLLDAP.agc:491
//		COM			# COMPLEMENT... POS. FOR NEG. TORQUE
// PORT: Fixed ROM slots 17274.
                                if slot <> 17274 or instruction <> 16384 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 0).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:492
//		EXTEND
// PORT: Fixed ROM slots 17275.
                                if slot <> 17275 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17276 {
// PORT: SOURCE TVCROLLDAP.agc:493
//		BZMF	+3		# POSITIVE TORQUE REQUIRED
// PORT: Fixed ROM slots 17276.
                                if slot <> 17276 or instruction <> 26495 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 26495, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:494
//		CS	TEMREG
// PORT: Fixed ROM slots 17277.
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
// PORT: SOURCE TVCROLLDAP.agc:495
//		TS	TEMREG
// PORT: Fixed ROM slots 17278.
                            if slot <> 17278 or instruction <> 23419 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23419, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17279 {
// PORT: SOURCE TVCROLLDAP.agc:496
//
// PORT: SOURCE TVCROLLDAP.agc:497
//FIRELOOK	CA	I		# IS IT MOREROLL
// PORT: Fixed ROM slots 17279.
                                if slot <> 17279 or instruction <> 13240 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 952).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:498
//		EXTEND
// PORT: Fixed ROM slots 17280.
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
// PORT: SOURCE TVCROLLDAP.agc:499
//		BZF	FIREPLUG	# YES
// PORT: Fixed ROM slots 17281.
                                if slot <> 17281 or instruction <> 6019 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6019, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:500
//		TCF	JETROLL		# MAG(T6FIRE) NOW IN TEMREG
// PORT: Fixed ROM slots 17282.
                                if slot <> 17282 or instruction <> 6028 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6028, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17283 {
// PORT: SOURCE TVCROLLDAP.agc:501
//
// PORT: SOURCE TVCROLLDAP.agc:502
//FIREPLUG	CAE	TIME6		# CHECK FOR EXTENDED FIRING
// PORT: Fixed ROM slots 17283.
                                if slot <> 17283 or instruction <> 12313 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 25).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:503
//		EXTEND
// PORT: Fixed ROM slots 17284.
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
// PORT: SOURCE TVCROLLDAP.agc:504
//		SU	TEMREG
// PORT: Fixed ROM slots 17285.
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
// PORT: SOURCE TVCROLLDAP.agc:505
//		EXTEND
// PORT: Fixed ROM slots 17286.
                                if slot <> 17286 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:506
//EXTENTST	BZMF	TASKOVER	# IF EXTENSION WANTED, DONT, EXIT ROLL DAP
// PORT: Fixed ROM slots 17287.
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
// PORT: SOURCE TVCROLLDAP.agc:507
//		TCF	JETROLL
// PORT: Fixed ROM slots 17288.
                                if slot <> 17288 or instruction <> 6028 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6028, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:508
//
// PORT: SOURCE TVCROLLDAP.agc:509
//NOROLL		CS	ZERO		# COAST....(NEG ZERO FOR TIME6)
// PORT: Fixed ROM slots 17289.
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
// PORT: SOURCE TVCROLLDAP.agc:510
//		TS	ROLLFIRE	# NOTE, JETS CAN FIRE NEXT PASS
// PORT: Fixed ROM slots 17290.
                                if slot <> 17290 or instruction <> 23417 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23417, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:511
//		TS	TEMREG
// PORT: Fixed ROM slots 17291.
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
// PORT: SOURCE TVCROLLDAP.agc:512
//
// PORT: SOURCE TVCROLLDAP.agc:513
//JETROLL		EXTEND
// PORT: Fixed ROM slots 17292.
                            if slot <> 17292 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17293 {
// PORT: SOURCE TVCROLLDAP.agc:514
//		DCA	NOROL1T6
// PORT: Fixed ROM slots 17293.
                                if slot <> 17293 or instruction <> 14277 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 1989, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:515
//# Page 995
// PORT: SOURCE TVCROLLDAP.agc:516
//		DXCH	T6LOC
// PORT: Fixed ROM slots 17294.
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
// PORT: SOURCE TVCROLLDAP.agc:517
//		CA	TEMREG		# ENTER JET FIRING TIME
// PORT: Fixed ROM slots 17295.
                                if slot <> 17295 or instruction <> 13179 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 891).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:518
//		TS	TIME6
// PORT: Fixed ROM slots 17296.
                                if slot <> 17296 or instruction <> 22553 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22553, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17297 {
// PORT: SOURCE TVCROLLDAP.agc:519
//
// PORT: SOURCE TVCROLLDAP.agc:520
//		CA	I		# I=0 IF MOREROLL,KEEP SAME JETS ON
// PORT: Fixed ROM slots 17297.
                                if slot <> 17297 or instruction <> 13240 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 952).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:521
//		EXTEND
// PORT: Fixed ROM slots 17298.
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
// PORT: SOURCE TVCROLLDAP.agc:522
//SAMEJETS	BZF	TASKOVER	# IF JETS ON KEEP SAME JETS.  EXIT ROLL DAP
// PORT: Fixed ROM slots 17299.
                            if slot <> 17299 or instruction <> 6868 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6868, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17300 {
// PORT: SOURCE TVCROLLDAP.agc:523
//
// PORT: SOURCE TVCROLLDAP.agc:524
//		CCS	ROLLFIRE
// PORT: Fixed ROM slots 17300.
                                if slot <> 17300 or instruction <> 4985 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 889).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:525
//		TCF	+TORQUE
// PORT: Fixed ROM slots 17301.
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
// PORT: SOURCE TVCROLLDAP.agc:526
//		TCF	T6ENABL
// PORT: Fixed ROM slots 17302.
                                if slot <> 17302 or instruction <> 6074 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6074, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:527
//		TCF	-TORQUE
// PORT: Fixed ROM slots 17303.
                                if slot <> 17303 or instruction <> 6058 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6058, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17304 {
// PORT: SOURCE TVCROLLDAP.agc:528
//		TCF	T6ENABL
// PORT: Fixed ROM slots 17304.
                                if slot <> 17304 or instruction <> 6074 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6074, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:529
//
// PORT: SOURCE TVCROLLDAP.agc:530
//# PROCEED WITH + TORQUE
// PORT: SOURCE TVCROLLDAP.agc:531
//
// PORT: SOURCE TVCROLLDAP.agc:532
//+TORQUE		CA	ROLLWORD	# WHAT WAS THE LAST +TORQUE COMBINATION
// PORT: Fixed ROM slots 17305.
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
// PORT: SOURCE TVCROLLDAP.agc:533
//		MASK	BIT1		# WAS IT NO.9-11
// PORT: Fixed ROM slots 17306.
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
// PORT: SOURCE TVCROLLDAP.agc:534
//		EXTEND
// PORT: Fixed ROM slots 17307.
                                if slot <> 17307 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:535
//		BZF	NO.9-11		# NOT 9-11, SO USE IT THIS TIME
// PORT: Fixed ROM slots 17308.
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
// PORT: SOURCE TVCROLLDAP.agc:536
//
// PORT: SOURCE TVCROLLDAP.agc:537
//NO.13-15	CS	BIT1
// PORT: Fixed ROM slots 17309.
                                if slot <> 17309 or instruction <> 18959 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:538
//		MASK	ROLLWORD
// PORT: Fixed ROM slots 17310.
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
// PORT: SOURCE TVCROLLDAP.agc:539
//		TS	ROLLWORD	# CHANGE BIT 1 TO ZERO
// PORT: Fixed ROM slots 17311.
                                if slot <> 17311 or instruction <> 23418 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23418, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:540
//		CAF	+ROLL2
// PORT: Fixed ROM slots 17312.
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
// PORT: SOURCE TVCROLLDAP.agc:541
//		EXTEND
// PORT: Fixed ROM slots 17313.
                            if slot <> 17313 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17314 {
// PORT: SOURCE TVCROLLDAP.agc:542
//		WRITE	CHAN6
// PORT: Fixed ROM slots 17314.
                                if slot <> 17314 or instruction <> 518 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 1, 6, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:543
//		TCF	T6ENABL
// PORT: Fixed ROM slots 17315.
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
// PORT: SOURCE TVCROLLDAP.agc:544
//
// PORT: SOURCE TVCROLLDAP.agc:545
//NO.9-11		CAF	BIT1		# 1ST + JETS TO FIRE (MRCLEAN OS ROLLWORD)
// PORT: Fixed ROM slots 17316.
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
// PORT: SOURCE TVCROLLDAP.agc:546
//		ADS	ROLLWORD	# CHANGE BIT 1 TO ONE
// PORT: Fixed ROM slots 17317.
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
// PORT: SOURCE TVCROLLDAP.agc:547
//		CAF	+ROLL1
// PORT: Fixed ROM slots 17318.
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
// PORT: SOURCE TVCROLLDAP.agc:548
//		EXTEND
// PORT: Fixed ROM slots 17319.
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
// PORT: SOURCE TVCROLLDAP.agc:549
//		WRITE	CHAN6
// PORT: Fixed ROM slots 17320.
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
// PORT: SOURCE TVCROLLDAP.agc:550
//		TCF	T6ENABL
// PORT: Fixed ROM slots 17321.
                                if slot <> 17321 or instruction <> 6074 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6074, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:551
//
// PORT: SOURCE TVCROLLDAP.agc:552
//-TORQUE		CA	ROLLWORD	# WHAT WAS LAST -TORQUE COMBINATION
// PORT: Fixed ROM slots 17322.
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
// PORT: SOURCE TVCROLLDAP.agc:553
//		MASK	BIT2		# WAS IT NO.12-10
// PORT: Fixed ROM slots 17323.
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
// PORT: SOURCE TVCROLLDAP.agc:554
//		EXTEND
// PORT: Fixed ROM slots 17324.
                                if slot <> 17324 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17325 {
// PORT: SOURCE TVCROLLDAP.agc:555
//		BZF	NO.12-10	# NOT 12-10, SO USE IT THIS TIME
// PORT: Fixed ROM slots 17325.
                                if slot <> 17325 or instruction <> 6069 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6069, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:556
//
// PORT: SOURCE TVCROLLDAP.agc:557
//NO.16-14	CS	BIT2
// PORT: Fixed ROM slots 17326.
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
// PORT: SOURCE TVCROLLDAP.agc:558
//		MASK	ROLLWORD
// PORT: Fixed ROM slots 17327.
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
// PORT: SOURCE TVCROLLDAP.agc:559
//		TS	ROLLWORD	# CHANGE BIT 2 TO ZERO
// PORT: Fixed ROM slots 17328.
                                if slot <> 17328 or instruction <> 23418 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23418, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:560
//		CAF	-ROLL2
// PORT: Fixed ROM slots 17329.
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
// PORT: SOURCE TVCROLLDAP.agc:561
//		EXTEND
// PORT: Fixed ROM slots 17330.
                                if slot <> 17330 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:562
//		WRITE	CHAN6
// PORT: Fixed ROM slots 17331.
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
// PORT: SOURCE TVCROLLDAP.agc:563
//		TCF	T6ENABL
// PORT: Fixed ROM slots 17332.
                                if slot <> 17332 or instruction <> 6074 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6074, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:564
//
// PORT: SOURCE TVCROLLDAP.agc:565
//NO.12-10	CAF	BIT2		# 1ST -JETS TO FIRE (MRCLEAN OS ROLLWORD)
// PORT: Fixed ROM slots 17333.
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
// PORT: SOURCE TVCROLLDAP.agc:566
//# Page 996
// PORT: SOURCE TVCROLLDAP.agc:567
//		ADS	ROLLWORD	# CHANGE BIT 2 TO ONE
// PORT: Fixed ROM slots 17334.
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
// PORT: SOURCE TVCROLLDAP.agc:568
//		CAF	-ROLL1
// PORT: Fixed ROM slots 17335.
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
// PORT: SOURCE TVCROLLDAP.agc:569
//		EXTEND
// PORT: Fixed ROM slots 17336.
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
// PORT: SOURCE TVCROLLDAP.agc:570
//		WRITE	CHAN6
// PORT: Fixed ROM slots 17337.
                                if slot <> 17337 or instruction <> 518 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 1, 6, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:571
//
// PORT: SOURCE TVCROLLDAP.agc:572
//T6ENABL		CAF	BIT15
// PORT: Fixed ROM slots 17338.
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
// PORT: SOURCE TVCROLLDAP.agc:573
//		EXTEND
// PORT: Fixed ROM slots 17339.
                                if slot <> 17339 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:574
//		WOR	CHAN13
// PORT: Fixed ROM slots 17340.
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
// PORT: SOURCE TVCROLLDAP.agc:575
//RDAPEND		TCF	TASKOVER	# EXIT ROLL DAP
// PORT: Fixed ROM slots 17341.
                            if slot <> 17341 or instruction <> 6868 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6868, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 17342 {
// PORT: SOURCE TVCROLLDAP.agc:576
//
// PORT: SOURCE TVCROLLDAP.agc:577
//# Page 997
// PORT: SOURCE TVCROLLDAP.agc:578
//# THIS T6 TASK SHUTS OFF ALL ROLL JETS
// PORT: SOURCE TVCROLLDAP.agc:579
//
// PORT: SOURCE TVCROLLDAP.agc:580
//NOROLL1		LXCH	BANKRUPT	# SHUT OFF ALL (ROLL) JETS, (A T6 TASK
// PORT: Fixed ROM slots 17342.
                                if slot <> 17342 or instruction <> 9230 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreExchange(words, 1, 14, readPhysical).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:581
//		CAF	ZERO		#	CALLED BY ..JETROLL..)
// PORT: Fixed ROM slots 17343.
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
// PORT: SOURCE TVCROLLDAP.agc:582
//		TS	ROLLFIRE	# ZERO INDICATES JETS NOW OFF
// PORT: Fixed ROM slots 17344.
                                if slot <> 17344 or instruction <> 23417 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23417, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:583
//		EXTEND
// PORT: Fixed ROM slots 17345.
                                if slot <> 17345 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 17346 {
// PORT: SOURCE TVCROLLDAP.agc:584
//KILLJETS	WRITE	CHAN6
// PORT: Fixed ROM slots 17346.
                                if slot <> 17346 or instruction <> 518 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 1, 6, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE TVCROLLDAP.agc:585
//		TCF	NOQRSM
// PORT: Fixed ROM slots 17347.
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
// PORT: SOURCE TVCROLLDAP.agc:586
//
// PORT: SOURCE TVCROLLDAP.agc:587
//# Page 998
// PORT: SOURCE TVCROLLDAP.agc:588
//# CONSTANTS FOR ROLL AUTOPILOT....
// PORT: SOURCE TVCROLLDAP.agc:589
//
// PORT: SOURCE TVCROLLDAP.agc:590
//		EBANK=	BZERO
// PORT: SOURCE TVCROLLDAP.agc:591
//NOROL1T6	2CADR	NOROLL1
// PORT: Fixed ROM slots 17348 17349.
    17348, 3964, 17349, 28780,
// PORT: SOURCE TVCROLLDAP.agc:592
//
// PORT: SOURCE TVCROLLDAP.agc:593
//DB		DEC	.01388889	# DEAD BAND (5 DEG), SC.AT B+0 REV
// PORT: Fixed ROM slots 17350.
    17350, 456,
// PORT: SOURCE TVCROLLDAP.agc:594
//
// PORT: SOURCE TVCROLLDAP.agc:595
//-SLOPE		DEC	0.2		# -SWITCHLINE SLOPE(0.2 PER SEC) SC.AT B+0
// PORT: Fixed ROM slots 17351.
    17351, 6554,
// PORT: SOURCE TVCROLLDAP.agc:596
//					#	PER SEC
// PORT: SOURCE TVCROLLDAP.agc:597
//LMCRATE		DEC	.00027778 B+4	# LIMIT CYCLE RATE (0.1 DEG/SEC) SC.AT
// PORT: Fixed ROM slots 17352.
    17352, 146,
// PORT: SOURCE TVCROLLDAP.agc:598
//					#	B-4 REV/SEC
// PORT: SOURCE TVCROLLDAP.agc:599
//INTERCEP	DEC	.0025 B+3	# DB(-SLOPE) - LMCRATE, SC.AT B-3 REV/SC
// PORT: Fixed ROM slots 17353.
    17353, 656,
// PORT: SOURCE TVCROLLDAP.agc:600
//
// PORT: SOURCE TVCROLLDAP.agc:601
//MINLIM		DEC	.00277778 B+4	# RATELIM,MIN (1DEG/SEC), SC.AT B-4 REV/SC
// PORT: Fixed ROM slots 17354.
    17354, 1456,
// PORT: SOURCE TVCROLLDAP.agc:602
//
// PORT: SOURCE TVCROLLDAP.agc:603
//1/MINLIM	DEC	360 B-18	# RECIPROCAL THEREOF, SHIFTED 14 RIGHT
// PORT: Fixed ROM slots 17355.
    17355, 46,
// PORT: SOURCE TVCROLLDAP.agc:604
//
// PORT: SOURCE TVCROLLDAP.agc:605
//MAXLIM		DEC	.01388889 B+4	# RATELIM,MAX (5DEG/SEC), SC.AT B-4 REV/SC
// PORT: Fixed ROM slots 17356.
    17356, 7282,
// PORT: SOURCE TVCROLLDAP.agc:606
//
// PORT: SOURCE TVCROLLDAP.agc:607
//TMINFIRE	DEC	1.5 B+4		# 15 MS (14MIN), SC.AT 16 BITS/CS
// PORT: Fixed ROM slots 17357.
    17357, 48,
// PORT: SOURCE TVCROLLDAP.agc:608
//
// PORT: SOURCE TVCROLLDAP.agc:609
//TMAXFIRE	DEC	250 B+4		# 2.5 SEC, SC.AT 16 BITS/CS
// PORT: Fixed ROM slots 17358.
    17358, 8000,
// PORT: SOURCE TVCROLLDAP.agc:610
//
// PORT: SOURCE TVCROLLDAP.agc:611
//1/TMXFIR	=	BIT3		# RECIPROCAL THEREOF, SHIFTED 14 RIGHT,
// PORT: SOURCE TVCROLLDAP.agc:612
//					#	ROUNDS TO OCT00004, SO ALLOWS 2.56
// PORT: SOURCE TVCROLLDAP.agc:613
//					#	SEC FIRINGS BEFORE APPLYING LIMIT
// PORT: SOURCE TVCROLLDAP.agc:614
//T6SCALE		=	PRIO31		# (B+3) (16 BITS/CS) (100CS/SEC)
// PORT: SOURCE TVCROLLDAP.agc:615
//
// PORT: SOURCE TVCROLLDAP.agc:616
//+ROLL1		= 	FIVE		# ONBITS FOR JETS 9 AND 11
// PORT: SOURCE TVCROLLDAP.agc:617
//+ROLL2		=	OCT120		# ONBITS FOR JETS 13 AND 15
// PORT: SOURCE TVCROLLDAP.agc:618
//-ROLL1		=	TEN		# ONBITS FOR JETS 12 NAD 10
// PORT: SOURCE TVCROLLDAP.agc:619
//-ROLL2		OCT	240		# ONBITS FOR JETS 16 AND 14
// PORT: Fixed ROM slots 17359.
    17359, 320
)).

