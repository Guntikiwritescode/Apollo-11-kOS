// PORT: Original source unit TVCSTROKETEST.agc.
// PORT: Physical bank 20. Shared continuation entries, slots 19265–19281.
function agcAotUnit1106 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19272 {
        if slot <= 19268 {
            if slot <= 19266 {
                if slot <= 19265 {
// PORT: SOURCE TVCSTROKETEST.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE TVCSTROKETEST.agc:2
//# Filename:	TVCSTROKETEST.agc
// PORT: SOURCE TVCSTROKETEST.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// PORT: SOURCE TVCSTROKETEST.agc:4
//#		It is part of the source code for the Command Module's (CM)
// PORT: SOURCE TVCSTROKETEST.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE TVCSTROKETEST.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE TVCSTROKETEST.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE TVCSTROKETEST.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE TVCSTROKETEST.agc:9
//# Pages:	979-983
// PORT: SOURCE TVCSTROKETEST.agc:10
//# Mod history:	2009-05-13 RSB	Adapted from the Colossus249/ file of the
// PORT: SOURCE TVCSTROKETEST.agc:11
//#				same name, using Comanche055 page images.
// PORT: SOURCE TVCSTROKETEST.agc:12
//#
// PORT: SOURCE TVCSTROKETEST.agc:13
//# This source code has been transcribed or otherwise adapted from digitized
// PORT: SOURCE TVCSTROKETEST.agc:14
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// PORT: SOURCE TVCSTROKETEST.agc:15
//# by Paul Fjeld, and arranged for by Deborah Douglas of the Museum.  Many
// PORT: SOURCE TVCSTROKETEST.agc:16
//# thanks to both.  The images (with suitable reduction in storage size and
// PORT: SOURCE TVCSTROKETEST.agc:17
//# consequent reduction in image quality as well) are available online at
// PORT: SOURCE TVCSTROKETEST.agc:18
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// PORT: SOURCE TVCSTROKETEST.agc:19
//# illegible, contact me at info@sandroid.org about getting access to the
// PORT: SOURCE TVCSTROKETEST.agc:20
//# (much) higher-quality images which Paul actually created.
// PORT: SOURCE TVCSTROKETEST.agc:21
//#
// PORT: SOURCE TVCSTROKETEST.agc:22
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE TVCSTROKETEST.agc:23
//#
// PORT: SOURCE TVCSTROKETEST.agc:24
//#	Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE TVCSTROKETEST.agc:25
//#	2021113-051.  10:28 APR. 1, 1969
// PORT: SOURCE TVCSTROKETEST.agc:26
//#
// PORT: SOURCE TVCSTROKETEST.agc:27
//#	This AGC program shall also be referred to as
// PORT: SOURCE TVCSTROKETEST.agc:28
//#			Colossus 2A
// PORT: SOURCE TVCSTROKETEST.agc:29
//
// PORT: SOURCE TVCSTROKETEST.agc:30
//# Page 979
// PORT: SOURCE TVCSTROKETEST.agc:31
//# NAME		STROKE TEST PACKAGE		(INCLUDING INITIALIZATION PACKAGE)
// PORT: SOURCE TVCSTROKETEST.agc:32
//# LOG SECTION...TVCSTROKETEST			SUBROUTINE...DAPCSM
// PORT: SOURCE TVCSTROKETEST.agc:33
//# MODIFIED BY SCHLUNDT				21 OCTOBER 1968
// PORT: SOURCE TVCSTROKETEST.agc:34
//#
// PORT: SOURCE TVCSTROKETEST.agc:35
//# FUNCTIONAL DESCRIPTION....
// PORT: SOURCE TVCSTROKETEST.agc:36
//#	STROKE TEST PACKAGE GENERATES A WAVEFORM DESIGNED TO EXCITE BENDING
// PORT: SOURCE TVCSTROKETEST.agc:37
//#	STRKTSTI (STROKE TEST INITIALIZATION) IS CALLED AS A JOB BY VB68.
// PORT: SOURCE TVCSTROKETEST.agc:38
//#		IT INITIALIZES ALL ERASABLES REQD FOR A STROKE TEST, AND
// PORT: SOURCE TVCSTROKETEST.agc:39
//#		THEN TESTS FOR CSM/LM (BIT 13 OF DAPDATR1). IF CSM/LM,
// PORT: SOURCE TVCSTROKETEST.agc:40
//#		IN EITHER HIGH OR LOW-BANDWIDTH MODE, THE TEST IS STARTED
// PORT: SOURCE TVCSTROKETEST.agc:41
//#		IMMEDIATELY.  IF NOT CSM/LM, PROGRAM EXITS WITH NO ACTION.
// PORT: SOURCE TVCSTROKETEST.agc:42
//#	HACK (STROKE TEST) GENERATES THE WAVEFORM BY DUMPING PULSE BURSTS
// PORT: SOURCE TVCSTROKETEST.agc:43
//#		OF PROPER SIGN AND IN PROPER SEQUENCE DIRECTLY INTO
// PORT: SOURCE TVCSTROKETEST.agc:44
//#		TVCPITCH, WORKING IN CONJUNCTION WITH BOTH PITCH AND YAW
// PORT: SOURCE TVCSTROKETEST.agc:45
//#		TVC DAPS, WITH INTERMEDIATE WAITLIST CALLS.  NOTE, HOWEVER
// PORT: SOURCE TVCSTROKETEST.agc:46
//#		THAT THE STROKE TEST IS PERFORMED ONLY IN THE PITCH AXIS.
// PORT: SOURCE TVCSTROKETEST.agc:47
//#		AN EXAMPLE WAVEFORM IS GIVEN BELOW, TO DEMONSTRATE STROKE-
// PORT: SOURCE TVCSTROKETEST.agc:48
//#		TEST PARAMETER SELECTION.
// PORT: SOURCE TVCSTROKETEST.agc:49
//#	RESTARTS CAUSE TEST TO BE TERMINATED.  ANOTHER V68 REQD IF TEST
// PORT: SOURCE TVCSTROKETEST.agc:50
//#		IS TO BE RE-RUN.
// PORT: SOURCE TVCSTROKETEST.agc:51
//#	PULSE BURST SIZE IS PAD-LOADED (ESTROKER) SO THAT AMPLITUDE OF
// PORT: SOURCE TVCSTROKETEST.agc:52
//#		WAVEFORM CAN BE CHANGED.  THERE ARE TEN PULSE BURSTS IN
// PORT: SOURCE TVCSTROKETEST.agc:53
//#		THE HALF-AMPLITUDE OF THE FIRST FREQUENCY SET IN THE
// PORT: SOURCE TVCSTROKETEST.agc:54
//#		STANDARD WAVEFORM.  AMPLITUDE IS 10(ESTROKER)(1/42.15),
// PORT: SOURCE TVCSTROKETEST.agc:55
//#		NOMINALLY 50/42.15 = 1.185 DEG
// PORT: SOURCE TVCSTROKETEST.agc:56
//#
// PORT: SOURCE TVCSTROKETEST.agc:57
//# CALLING SEQUENCE....
// PORT: SOURCE TVCSTROKETEST.agc:58
//#	EXTENDED VERB 68 SETS UP STRKTSTI JOB
// PORT: SOURCE TVCSTROKETEST.agc:59
//#	PITCH AND YAW TVCDAPS, FINDING STROKER NON-ZERO, DO A ..TC HACK..
// PORT: SOURCE TVCSTROKETEST.agc:60
//#	AN INTERNALLY-GENERATED WAITLIST CALL ENTERS AT ..HACKWLST..
// PORT: SOURCE TVCSTROKETEST.agc:61
//#
// PORT: SOURCE TVCSTROKETEST.agc:62
//# NORMAL EXIT MODES....
// PORT: SOURCE TVCSTROKETEST.agc:63
//#	TC BUNKER (..Q.. IF ENTRY FROM DAP, ..TCTSKOVR.. IF FROM WAITLIST) LIST
// PORT: SOURCE TVCSTROKETEST.agc:64
//#
// PORT: SOURCE TVCSTROKETEST.agc:65
//# SUBROUTINES CALLED....
// PORT: SOURCE TVCSTROKETEST.agc:66
//#	WAITLIST
// PORT: SOURCE TVCSTROKETEST.agc:67
//#
// PORT: SOURCE TVCSTROKETEST.agc:68
//# ALARM OR ABORT EXIT MODES....
// PORT: SOURCE TVCSTROKETEST.agc:69
//#	NONE
// PORT: SOURCE TVCSTROKETEST.agc:70
//#
// PORT: SOURCE TVCSTROKETEST.agc:71
//# ERASABLE INITIALIZATION REQUIRED....
// PORT: SOURCE TVCSTROKETEST.agc:72
//#	ESTROKER (PAD-LOAD)
// PORT: SOURCE TVCSTROKETEST.agc:73
//#	STROKER, CADDY, REVS, CARD, N
// PORT: SOURCE TVCSTROKETEST.agc:74
//#
// PORT: SOURCE TVCSTROKETEST.agc:75
//# OUTPUT....
// PORT: SOURCE TVCSTROKETEST.agc:76
//#	STRKTSTI...INITIALIZATION FOR STROKE TEST
// PORT: SOURCE TVCSTROKETEST.agc:77
//#	HACK, HACKWLST...PULSE BURSTS INTO TVCPITCH VIA..ADS..
// PORT: SOURCE TVCSTROKETEST.agc:78
//#			  RESETS STROKER = +0 WHEN TEST COMPLETED
// PORT: SOURCE TVCSTROKETEST.agc:79
//#
// PORT: SOURCE TVCSTROKETEST.agc:80
//# DEBRIS....
// PORT: SOURCE TVCSTROKETEST.agc:81
//#	N = CADDY = +0, CARD = -0, REVS = -1
// PORT: SOURCE TVCSTROKETEST.agc:82
//#	BUNKER
// PORT: SOURCE TVCSTROKETEST.agc:83
//# Page 980
// PORT: SOURCE TVCSTROKETEST.agc:84
//#
// PORT: SOURCE TVCSTROKETEST.agc:85
//# EXAMPLE STROKE TEST WAVE FORM, DEMONSTRATING PARAMETER SELECTION
// PORT: SOURCE TVCSTROKETEST.agc:86
//
// PORT: SOURCE TVCSTROKETEST.agc:87
//# NOTE....THIS IS NOT THE OFFICIAL WAVEFORM....
// PORT: SOURCE TVCSTROKETEST.agc:88
//#
// PORT: SOURCE TVCSTROKETEST.agc:89
//#        **              **
// PORT: SOURCE TVCSTROKETEST.agc:90
//#        **              **
// PORT: SOURCE TVCSTROKETEST.agc:91
//#        **              **		EXAMPLE WAVEFORM (EACH * REPRESENTS
// PORT: SOURCE TVCSTROKETEST.agc:92
//#       *  *            *  *		  (85.41 ARCSEC OF ACTUATOR CMND)
// PORT: SOURCE TVCSTROKETEST.agc:93
//#       *  *            *  *
// PORT: SOURCE TVCSTROKETEST.agc:94
//#       *  *            *  *
// PORT: SOURCE TVCSTROKETEST.agc:95
//#      *    *          *    *          **      **      **      **      **
// PORT: SOURCE TVCSTROKETEST.agc:96
//#      *    *          *    *          **      **      **      **      **
// PORT: SOURCE TVCSTROKETEST.agc:97
//#      *    *          *    *          **      **      **      **      **
// PORT: SOURCE TVCSTROKETEST.agc:98
//#     *      *        *      *        *  *    *  *    *  *    *  *    *  *    **  **  **  **  **
// PORT: SOURCE TVCSTROKETEST.agc:99
//#     *      *        *      *        *  *    *  *    *  *    *  *    *  *    **  **  **  **  **
// PORT: SOURCE TVCSTROKETEST.agc:100
//#     *      *        *      *        *  *    *  *    *  *    *  *    *  *    **  **  **  **  **
// PORT: SOURCE TVCSTROKETEST.agc:101
//# ----------------------------------------------------------------------------------------------------
// PORT: SOURCE TVCSTROKETEST.agc:102
//#             *      *        *      *    *  *    *  *    *  *    *  *    *  *  **  **  **  **  **
// PORT: SOURCE TVCSTROKETEST.agc:103
//#             *      *        *      *    *  *    *  *    *  *    *  *    *  *  **  **  **  **  **
// PORT: SOURCE TVCSTROKETEST.agc:104
//#             *      *        *      *    *  *    *  *    *  *    *  *    *  *  **  **  **  **  **
// PORT: SOURCE TVCSTROKETEST.agc:105
//#              *    *          *    *      **      **      **      **      **
// PORT: SOURCE TVCSTROKETEST.agc:106
//#              *    *          *    *      **      **      **      **      **
// PORT: SOURCE TVCSTROKETEST.agc:107
//#              *    *          *    *      **      **      **      **      **
// PORT: SOURCE TVCSTROKETEST.agc:108
//#               *  *            *  *
// PORT: SOURCE TVCSTROKETEST.agc:109
//#               *  *            *  *
// PORT: SOURCE TVCSTROKETEST.agc:110
//#               *  *            *  *
// PORT: SOURCE TVCSTROKETEST.agc:111
//#                **              **
// PORT: SOURCE TVCSTROKETEST.agc:112
//#                **              **
// PORT: SOURCE TVCSTROKETEST.agc:113
//#                **              **
// PORT: SOURCE TVCSTROKETEST.agc:114
//#
// PORT: SOURCE TVCSTROKETEST.agc:115
//# FOR THIS (UNOFFICIAL, EXAMPLE) WAVEFORM, THE REQUIRED PARAMETERS ARE AS FOLLOWS....
// PORT: SOURCE TVCSTROKETEST.agc:116
//#
// PORT: SOURCE TVCSTROKETEST.agc:117
//#	FCARD	 = +3		(NUMBER OF SETS)
// PORT: SOURCE TVCSTROKETEST.agc:118
//#	ESTROKER = +3		(PULSE BURST SIZE, SC.AT 85.41 ARCSEC/BIT)
// PORT: SOURCE TVCSTROKETEST.agc:119
//#
// PORT: SOURCE TVCSTROKETEST.agc:120
//#	SET1:
// PORT: SOURCE TVCSTROKETEST.agc:121
//#		FREVS	= +3	(NUMBER REVERSALS MINUS 1)
// PORT: SOURCE TVCSTROKETEST.agc:122
//#		FCADDY	= +4	(NUMBER OF PULSE BURSTS IN 1/2 AMPLITUDE)
// PORT: SOURCE TVCSTROKETEST.agc:123
//#	SET2:
// PORT: SOURCE TVCSTROKETEST.agc:124
//#		FCARD1	= +9	(NUMBER REVERSALS MINUS 1)
// PORT: SOURCE TVCSTROKETEST.agc:125
//#		FCARD4	= +2	(NUMBER OF PULSE BURSTS IN 1/2 AMPLITUDE)
// PORT: SOURCE TVCSTROKETEST.agc:126
//#	SET3:
// PORT: SOURCE TVCSTROKETEST.agc:127
//#		FCARD2	= +9	(NUMBER REVERSALS MINUS 1)
// PORT: SOURCE TVCSTROKETEST.agc:128
//#		FCARD5	= +1	(NUMBER OF PULSE BURSTS IN 1/2 AMPLITUDE)
// PORT: SOURCE TVCSTROKETEST.agc:129
//#	SET4:
// PORT: SOURCE TVCSTROKETEST.agc:130
//#		FCARD3	= +0	(NUMBER OF REVERSALS MINUS 1)
// PORT: SOURCE TVCSTROKETEST.agc:131
//#		FCARD6	= +0	(NUMBER OF PULSE BURSTS IN 1/2 AMPLUTUDE)
// PORT: SOURCE TVCSTROKETEST.agc:132
//
// PORT: SOURCE TVCSTROKETEST.agc:133
//# Page 981
// PORT: SOURCE TVCSTROKETEST.agc:134
//# STROKE TEST INITIALIZATION PACKAGE (AS A JOB, FROM VERB 68)
// PORT: SOURCE TVCSTROKETEST.agc:135
//
// PORT: SOURCE TVCSTROKETEST.agc:136
//		BANK	17
// PORT: SOURCE TVCSTROKETEST.agc:137
//		SETLOC	DAPS2
// PORT: SOURCE TVCSTROKETEST.agc:138
//		BANK
// PORT: SOURCE TVCSTROKETEST.agc:139
//
// PORT: SOURCE TVCSTROKETEST.agc:140
//		COUNT*	$$/STRK
// PORT: SOURCE TVCSTROKETEST.agc:141
//		EBANK=	CADDY
// PORT: SOURCE TVCSTROKETEST.agc:142
//
// PORT: SOURCE TVCSTROKETEST.agc:143
//STRKTSTI	TCR	TSTINIT		# STROKE TEST INITIALIZATION PKG (CALLED
// PORT: Fixed ROM slots 19265.
                    if slot <> 19265 or instruction <> 1866 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1866, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCSTROKETEST.agc:144
//					# AS A JOB BY VERB68)
// PORT: SOURCE TVCSTROKETEST.agc:145
//
// PORT: SOURCE TVCSTROKETEST.agc:146
//STRKCHK		INHINT
// PORT: Fixed ROM slots 19266.
                    if slot <> 19266 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19267 {
// PORT: SOURCE TVCSTROKETEST.agc:147
//
// PORT: SOURCE TVCSTROKETEST.agc:148
//		CAE	DAPDATR1	# CHECK FOR CSM/LM CONFIGURATION
// PORT: Fixed ROM slots 19267.
                    if slot <> 19267 or instruction <> 13110 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 822).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCSTROKETEST.agc:149
//		MASK	BIT14
// PORT: Fixed ROM slots 19268.
                    if slot <> 19268 or instruction <> 31234 { return choose false if checkOnly else -1. }
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
            }
        } else {
            if slot <= 19270 {
                if slot <= 19269 {
// PORT: SOURCE TVCSTROKETEST.agc:150
//		EXTEND
// PORT: Fixed ROM slots 19269.
                    if slot <> 19269 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCSTROKETEST.agc:151
//		BZF	+3
// PORT: Fixed ROM slots 19270.
                    if slot <> 19270 or instruction <> 5961 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5961, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19271 {
// PORT: SOURCE TVCSTROKETEST.agc:152
//
// PORT: SOURCE TVCSTROKETEST.agc:153
//		CAE	ESTROKER	# BEGIN ON NEXT DAP PASS (PITCH OR YAW)
// PORT: Fixed ROM slots 19271.
                    if slot <> 19271 or instruction <> 13067 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 779).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCSTROKETEST.agc:154
//		TS	STROKER		# (STROKING DONE IN PITCH ONLY, HOWEVER)
// PORT: Fixed ROM slots 19272.
                    if slot <> 19272 or instruction <> 23420 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23420, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 19276 {
            if slot <= 19274 {
                if slot <= 19273 {
// PORT: SOURCE TVCSTROKETEST.agc:155
//
// PORT: SOURCE TVCSTROKETEST.agc:156
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 19273.
                    if slot <> 19273 or instruction <> 6799 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6799, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCSTROKETEST.agc:157
//
// PORT: SOURCE TVCSTROKETEST.agc:158
//TSTINIT		CS	FCADDY		# NORMAL ENTRY FROM STRKTSTI
// PORT: Fixed ROM slots 19274.
                    if slot <> 19274 or instruction <> 18258 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 1874), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19275 {
// PORT: SOURCE TVCSTROKETEST.agc:159
//		TS	CADDY
// PORT: Fixed ROM slots 19275.
                    if slot <> 19275 or instruction <> 23469 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23469, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCSTROKETEST.agc:160
//		TS	N		#	NOTE SGN CHNG FCADDY(+) TO CADDY(-)
// PORT: Fixed ROM slots 19276.
                    if slot <> 19276 or instruction <> 23470 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23470, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 19278 {
                if slot <= 19277 {
// PORT: SOURCE TVCSTROKETEST.agc:161
//
// PORT: SOURCE TVCSTROKETEST.agc:162
//		CAF	FREVS
// PORT: Fixed ROM slots 19277.
                    if slot <> 19277 or instruction <> 14163 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1875), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCSTROKETEST.agc:163
//		TS	REVS
// PORT: Fixed ROM slots 19278.
                    if slot <> 19278 or instruction <> 23472 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23472, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19279 {
// PORT: SOURCE TVCSTROKETEST.agc:164
//
// PORT: SOURCE TVCSTROKETEST.agc:165
//		CS	FCARD		# 	NOTE SGN CHNG FCARD(+) TO CARD(-)
// PORT: Fixed ROM slots 19279.
                    if slot <> 19279 or instruction <> 18260 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 1876), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19280 {
// PORT: SOURCE TVCSTROKETEST.agc:166
//		TS	CARD
// PORT: Fixed ROM slots 19280.
                        if slot <> 19280 or instruction <> 23473 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23473, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCSTROKETEST.agc:167
//
// PORT: SOURCE TVCSTROKETEST.agc:168
//		TC	Q		# RETURN TO STRKTSTI+1 (OR CHKSTRK+2OR+4)
// PORT: Fixed ROM slots 19281.
                        if slot <> 19281 or instruction <> 2 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1106] to agcAotUnit1106@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TVCSTROKETEST.agc:169
//
// PORT: SOURCE TVCSTROKETEST.agc:170
//# Page 982
// PORT: SOURCE TVCSTROKETEST.agc:171
//# THE OFFICIAL STROKE TEST WAVEFORM (3 JAN, 1967) CONSISTS OF FOUR STROKE SETS, AS FOLLOWS....
// PORT: SOURCE TVCSTROKETEST.agc:172
//#
// PORT: SOURCE TVCSTROKETEST.agc:173
//#	SET 1...10 BURSTS IN 1/2 AMP,   4 REVERSALS
// PORT: SOURCE TVCSTROKETEST.agc:174
//#	SET 2... 6 BURSTS IN 1/2 AMP,	6 REVERSALS
// PORT: SOURCE TVCSTROKETEST.agc:175
//#	SET 3... 5 BURSTS IN 1/2 AMP,  10 REVERSALS
// PORT: SOURCE TVCSTROKETEST.agc:176
//#	SET 4... 4 BURSTS IN 1/2 AMP,  14 REVERSALS
// PORT: SOURCE TVCSTROKETEST.agc:177
//#
// PORT: SOURCE TVCSTROKETEST.agc:178
//# THE PULSE BURST SIZE (ESTROKER) IS PAD-LOADED (5 BITS AS OF 3JAN,1967)
// PORT: SOURCE TVCSTROKETEST.agc:179
//# THE REMAINING WAVEFORM-GENERATING PARAMETERS ARE AS FOLLOWS....
// PORT: SOURCE TVCSTROKETEST.agc:180
//
// PORT: SOURCE TVCSTROKETEST.agc:181
//FCADDY		DEC	10		# NO. PULSE BURSTS IN 1/2 AMP, SET1..(+10)
// PORT: Fixed ROM slots 19282.
    19282, 20,
// PORT: SOURCE TVCSTROKETEST.agc:182
//FREVS		DEC	3		# NO. REVERSALS MINUS 1, SET1........(  3)
// PORT: Fixed ROM slots 19283.
    19283, 6,
// PORT: SOURCE TVCSTROKETEST.agc:183
//
// PORT: SOURCE TVCSTROKETEST.agc:184
//FCARD		DEC	4		# NO. STROKE SETS....................(+ 4)
// PORT: Fixed ROM slots 19284.
    19284, 8,
// PORT: SOURCE TVCSTROKETEST.agc:185
//
// PORT: SOURCE TVCSTROKETEST.agc:186
//FCARD1		DEC	5		# NO. REVERSALS MINUS 1, SET2........(  5)
// PORT: Fixed ROM slots 19285.
    19285, 10,
// PORT: SOURCE TVCSTROKETEST.agc:187
//
// PORT: SOURCE TVCSTROKETEST.agc:188
//FCARD2		DEC	9		# 			    3........(  9)
// PORT: Fixed ROM slots 19286.
    19286, 18,
// PORT: SOURCE TVCSTROKETEST.agc:189
//FCARD3		DEC	13		#                           4........( 13)
// PORT: Fixed ROM slots 19287.
    19287, 26,
// PORT: SOURCE TVCSTROKETEST.agc:190
//
// PORT: SOURCE TVCSTROKETEST.agc:191
//FCARD4		DEC	6		# NO. PULSE BURSTS IN 1/2 AMP, SET2..(+ 6)
// PORT: Fixed ROM slots 19288.
    19288, 12,
// PORT: SOURCE TVCSTROKETEST.agc:192
//FCARD5		DEC	5		#                              SET3..(+ 5)
// PORT: Fixed ROM slots 19289.
    19289, 10,
// PORT: SOURCE TVCSTROKETEST.agc:193
//FCARD6		DEC	4		#                              SET4..(+ 4)
// PORT: Fixed ROM slots 19290.
    19290, 8
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19291–19294.
function agcAotUnit1107 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19292 {
        if slot <= 19291 {
// PORT: SOURCE TVCSTROKETEST.agc:194
//
// PORT: SOURCE TVCSTROKETEST.agc:195
//20MS		=	BIT2
// PORT: SOURCE TVCSTROKETEST.agc:196
//
// PORT: SOURCE TVCSTROKETEST.agc:197
//# STROKE TEST PACKAGE PROPER....
// PORT: SOURCE TVCSTROKETEST.agc:198
//
// PORT: SOURCE TVCSTROKETEST.agc:199
//		EBANK=	BUNKER
// PORT: SOURCE TVCSTROKETEST.agc:200
//
// PORT: SOURCE TVCSTROKETEST.agc:201
//HACK		EXTEND			# ENTRY (IN T5 RUPT) FROM TVCDAPS
// PORT: Fixed ROM slots 19291.
            if slot <> 19291 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TVCSTROKETEST.agc:202
//		QXCH	BUNKER		# SAVE Q FOR DAP RETURN
// PORT: Fixed ROM slots 19292.
            if slot <> 19292 or instruction <> 10159 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 943, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19293 {
// PORT: SOURCE TVCSTROKETEST.agc:203
//
// PORT: SOURCE TVCSTROKETEST.agc:204
//		CAF	20MS		# 2DAPSX2(PASSES/DAP)X2(CS/PASS)=8CS=TVCDT
// PORT: Fixed ROM slots 19293.
            if slot <> 19293 or instruction <> 14862 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TVCSTROKETEST.agc:205
//		TC	WAITLIST
// PORT: Fixed ROM slots 19294.
            if slot <> 19294 or instruction <> 2725 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2725, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1107] to agcAotUnit1107@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TVCSTROKETEST.agc:206
//		EBANK=	BUNKER
// PORT: SOURCE TVCSTROKETEST.agc:207
//		2CADR	HACKWLST
// PORT: Fixed ROM slots 19295 19296.
    19295, 3780, 19296, 32876
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19297–19317.
function agcAotUnit1108 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19306 {
        if slot <= 19301 {
            if slot <= 19298 {
                if slot <= 19297 {
// PORT: SOURCE TVCSTROKETEST.agc:208
//
// PORT: SOURCE TVCSTROKETEST.agc:209
//		TCF	+3
// PORT: Fixed ROM slots 19297.
                    if slot <> 19297 or instruction <> 5988 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5988, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCSTROKETEST.agc:210
//
// PORT: SOURCE TVCSTROKETEST.agc:211
//HACKWLST	CAF	TCTSKOVR	# ENTRY FROM WAITLIST
// PORT: Fixed ROM slots 19298.
                    if slot <> 19298 or instruction <> 14583 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2295), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19299 {
// PORT: SOURCE TVCSTROKETEST.agc:212
//		TS	BUNKER		# BUNKER IS TC TASKOVER
// PORT: Fixed ROM slots 19299.
                    if slot <> 19299 or instruction <> 23471 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23471, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19300 {
// PORT: SOURCE TVCSTROKETEST.agc:213
//
// PORT: SOURCE TVCSTROKETEST.agc:214
//		CA	STROKER		# STROKE
// PORT: Fixed ROM slots 19300.
                        if slot <> 19300 or instruction <> 13180 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 892).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCSTROKETEST.agc:215
//		ADS	TVCPITCH
// PORT: Fixed ROM slots 19301.
                        if slot <> 19301 or instruction <> 11308 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 44).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 19303 {
                if slot <= 19302 {
// PORT: SOURCE TVCSTROKETEST.agc:216
//
// PORT: SOURCE TVCSTROKETEST.agc:217
//		CAF	BIT11		# RELEASE THE ERROR COUNTERS
// PORT: Fixed ROM slots 19302.
                    if slot <> 19302 or instruction <> 14853 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2565), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCSTROKETEST.agc:218
//		EXTEND
// PORT: Fixed ROM slots 19303.
                    if slot <> 19303 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19304 {
// PORT: SOURCE TVCSTROKETEST.agc:219
//		WOR	CHAN14
// PORT: Fixed ROM slots 19304.
                    if slot <> 19304 or instruction <> 2572 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 5, 12, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19305 {
// PORT: SOURCE TVCSTROKETEST.agc:220
//		INCR	CADDY		# COUNT DOWN THE NO. BURSTS, THIS SLOPE
// PORT: Fixed ROM slots 19305.
                        if slot <> 19305 or instruction <> 11181 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 941).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCSTROKETEST.agc:221
//# Page 983
// PORT: SOURCE TVCSTROKETEST.agc:222
//		CS	CADDY
// PORT: Fixed ROM slots 19306.
                        if slot <> 19306 or instruction <> 17325 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 941).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 19311 {
            if slot <= 19308 {
                if slot <= 19307 {
// PORT: SOURCE TVCSTROKETEST.agc:223
//		EXTEND
// PORT: Fixed ROM slots 19307.
                    if slot <> 19307 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCSTROKETEST.agc:224
//		BZMF	+2
// PORT: Fixed ROM slots 19308.
                    if slot <> 19308 or instruction <> 26478 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26478, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19309 {
// PORT: SOURCE TVCSTROKETEST.agc:225
//		TC	BUNKER		# EXIT, WHILE ON A SLOPE
// PORT: Fixed ROM slots 19309.
                    if slot <> 19309 or instruction <> 943 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 943, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19310 {
// PORT: SOURCE TVCSTROKETEST.agc:226
//
// PORT: SOURCE TVCSTROKETEST.agc:227
//		CCS	REVS
// PORT: Fixed ROM slots 19310.
                        if slot <> 19310 or instruction <> 5040 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 944).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCSTROKETEST.agc:228
//		TCF	REVUP		# POSITIVE REVS
// PORT: Fixed ROM slots 19311.
                        if slot <> 19311 or instruction <> 6015 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6015, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 19314 {
                if slot <= 19312 {
// PORT: SOURCE TVCSTROKETEST.agc:229
//		TCF	REVUP +4	# FINAL REVERSAL, THIS SET
// PORT: Fixed ROM slots 19312.
                    if slot <> 19312 or instruction <> 6019 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6019, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19313 {
// PORT: SOURCE TVCSTROKETEST.agc:230
//
// PORT: SOURCE TVCSTROKETEST.agc:231
//		INCR	CARD		# NEGATIVE REVS SET LAST PASS, READY FOR
// PORT: Fixed ROM slots 19313.
                        if slot <> 19313 or instruction <> 11185 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 945).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCSTROKETEST.agc:232
//		CS	CARD		#	THE NEXT SET.  CHECK IF NO MORE SETS
// PORT: Fixed ROM slots 19314.
                        if slot <> 19314 or instruction <> 17329 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 945).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19315 {
// PORT: SOURCE TVCSTROKETEST.agc:233
//		EXTEND
// PORT: Fixed ROM slots 19315.
                    if slot <> 19315 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 19316 {
// PORT: SOURCE TVCSTROKETEST.agc:234
//		BZF	STROKILL	# ALL SETS COMPLETED
// PORT: Fixed ROM slots 19316.
                        if slot <> 19316 or instruction <> 6013 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6013, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TVCSTROKETEST.agc:235
//
// PORT: SOURCE TVCSTROKETEST.agc:236
//		INDEX	CARD
// PORT: Fixed ROM slots 19317.
                        if slot <> 19317 or instruction <> 21425 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21425, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21425, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1108] to agcAotUnit1108@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TVCSTROKETEST.agc:237
//		CAF	FCARD +4	# PICK UP NO. REVERSALS (-), NEXT SET
// PORT: Fixed ROM slots 19318.
    19318, 28336
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19319–19320.
function agcAotUnit1109 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19319 {
// PORT: SOURCE TVCSTROKETEST.agc:238
//		TS	REVS		# REINITIALIZE
// PORT: Fixed ROM slots 19319.
        if slot <> 19319 or instruction <> 23472 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23472, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE TVCSTROKETEST.agc:239
//		INDEX	CARD
// PORT: Fixed ROM slots 19320.
        if slot <> 19320 or instruction <> 21425 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21425, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21425, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1109] to agcAotUnit1109@.

agcAotInstallSourceRope(list(
// PORT: SOURCE TVCSTROKETEST.agc:240
//		CS	FCARD +7	# PICK UP NO. BURSTS IN 1/2AMP, NEXT SET
// PORT: Fixed ROM slots 19321.
    19321, 36534
)).

// PORT: Physical bank 20. Shared continuation entries, slots 19322–19337.
function agcAotUnit1110 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19329 {
        if slot <= 19325 {
            if slot <= 19323 {
                if slot <= 19322 {
// PORT: SOURCE TVCSTROKETEST.agc:241
//		TS	N		# REINITIALIZE
// PORT: Fixed ROM slots 19322.
                    if slot <> 19322 or instruction <> 23470 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23470, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCSTROKETEST.agc:242
//		TS	CADDY
// PORT: Fixed ROM slots 19323.
                    if slot <> 19323 or instruction <> 23469 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23469, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19324 {
// PORT: SOURCE TVCSTROKETEST.agc:243
//		TC	BUNKER		# EXIT, AT END OF SET
// PORT: Fixed ROM slots 19324.
                    if slot <> 19324 or instruction <> 943 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 943, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCSTROKETEST.agc:244
//
// PORT: SOURCE TVCSTROKETEST.agc:245
//STROKILL	TS	STROKER		# RESET (TO +0) TO END TEST
// PORT: Fixed ROM slots 19325.
                    if slot <> 19325 or instruction <> 23420 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23420, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 19327 {
                if slot <= 19326 {
// PORT: SOURCE TVCSTROKETEST.agc:246
//		TC	BUNKER		# EXIT, STROKE TEST FINIS
// PORT: Fixed ROM slots 19326.
                    if slot <> 19326 or instruction <> 943 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 943, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCSTROKETEST.agc:247
//
// PORT: SOURCE TVCSTROKETEST.agc:248
//REVUP		TS	REVS		# ALL REVERSALS EXCEPT LAST OF SET
// PORT: Fixed ROM slots 19327.
                    if slot <> 19327 or instruction <> 23472 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23472, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19328 {
// PORT: SOURCE TVCSTROKETEST.agc:249
//		CA	N
// PORT: Fixed ROM slots 19328.
                    if slot <> 19328 or instruction <> 13230 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 942).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCSTROKETEST.agc:250
//		DOUBLE			# 2 x 1/2AMP
// PORT: Fixed ROM slots 19329.
                    if slot <> 19329 or instruction <> 24576 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 19333 {
            if slot <= 19331 {
                if slot <= 19330 {
// PORT: SOURCE TVCSTROKETEST.agc:251
//		TCF	+4
// PORT: Fixed ROM slots 19330.
                    if slot <> 19330 or instruction <> 6022 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6022, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCSTROKETEST.agc:252
//
// PORT: SOURCE TVCSTROKETEST.agc:253
//	+4	CS	ONE		# FINAL REVERSAL, THIS SET
// PORT: Fixed ROM slots 19331.
                    if slot <> 19331 or instruction <> 18959 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19332 {
// PORT: SOURCE TVCSTROKETEST.agc:254
//		TS	REVS		# PREPARE TO BRANCH TO NEW BURST
// PORT: Fixed ROM slots 19332.
                    if slot <> 19332 or instruction <> 23472 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23472, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCSTROKETEST.agc:255
//		CA	N		# JUST RETURN TO ZERO, FINAL SLOPE OF SET
// PORT: Fixed ROM slots 19333.
                    if slot <> 19333 or instruction <> 13230 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 942).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 19335 {
                if slot <= 19334 {
// PORT: SOURCE TVCSTROKETEST.agc:256
//		TS	CADDY		# CADUP
// PORT: Fixed ROM slots 19334.
                    if slot <> 19334 or instruction <> 23469 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23469, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCSTROKETEST.agc:257
//
// PORT: SOURCE TVCSTROKETEST.agc:258
//		CS	STROKER		# CHANGE SIGN OF SLOPE
// PORT: Fixed ROM slots 19335.
                    if slot <> 19335 or instruction <> 17276 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 892).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 19336 {
// PORT: SOURCE TVCSTROKETEST.agc:259
//		TS	STROKER
// PORT: Fixed ROM slots 19336.
                    if slot <> 19336 or instruction <> 23420 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23420, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TVCSTROKETEST.agc:260
//		TC	BUNKER		# EXIT AT A REVERSAL (SLOPE CHANGE)
// PORT: Fixed ROM slots 19337.
                    if slot <> 19337 or instruction <> 943 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 943, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1110] to agcAotUnit1110@.

