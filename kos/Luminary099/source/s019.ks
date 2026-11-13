// FINDCDUW--GUIDAP_INTERFACE.agc
agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:1
//# Copyright:	Public domain.
// FINDCDUW--GUIDAP_INTERFACE.agc:2
//# Filename:	FINDCDUW--GUIDAP_INTERFACE.agc
// FINDCDUW--GUIDAP_INTERFACE.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// FINDCDUW--GUIDAP_INTERFACE.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// FINDCDUW--GUIDAP_INTERFACE.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// FINDCDUW--GUIDAP_INTERFACE.agc:6
//# Assembler:	yaYUL
// FINDCDUW--GUIDAP_INTERFACE.agc:7
//# Contact:	Hartmuth Gutsche <hgutsche@xplornet.com>.
// FINDCDUW--GUIDAP_INTERFACE.agc:8
//# Website:	www.ibiblio.org/apollo.
// FINDCDUW--GUIDAP_INTERFACE.agc:9
//# Pages:	908-925
// FINDCDUW--GUIDAP_INTERFACE.agc:10
//# Mod history:	2009-05-28 HG	Transcribed from page images.
// FINDCDUW--GUIDAP_INTERFACE.agc:11
//#
// FINDCDUW--GUIDAP_INTERFACE.agc:12
//# This source code has been transcribed or otherwise adapted from
// FINDCDUW--GUIDAP_INTERFACE.agc:13
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// FINDCDUW--GUIDAP_INTERFACE.agc:14
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// FINDCDUW--GUIDAP_INTERFACE.agc:15
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// FINDCDUW--GUIDAP_INTERFACE.agc:16
//# in storage size and consequent reduction in image quality as well) are
// FINDCDUW--GUIDAP_INTERFACE.agc:17
//# available online at www.ibiblio.org/apollo.  If for some reason you
// FINDCDUW--GUIDAP_INTERFACE.agc:18
//# find that the images are illegible, contact me at info@sandroid.org
// FINDCDUW--GUIDAP_INTERFACE.agc:19
//# about getting access to the (much) higher-quality images which Paul
// FINDCDUW--GUIDAP_INTERFACE.agc:20
//# actually created.
// FINDCDUW--GUIDAP_INTERFACE.agc:21
//#
// FINDCDUW--GUIDAP_INTERFACE.agc:22
//# Notations on the hardcopy document read, in part:
// FINDCDUW--GUIDAP_INTERFACE.agc:23
//#
// FINDCDUW--GUIDAP_INTERFACE.agc:24
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// FINDCDUW--GUIDAP_INTERFACE.agc:25
//#	16:27 JULY 14, 1969
// FINDCDUW--GUIDAP_INTERFACE.agc:26
//
// FINDCDUW--GUIDAP_INTERFACE.agc:27
//# Page 908
// FINDCDUW--GUIDAP_INTERFACE.agc:28
//# PROGRAM NAME:  FINDCDUW
// FINDCDUW--GUIDAP_INTERFACE.agc:29
//# MOD NUMBER:  1	68-07-15
// FINDCDUW--GUIDAP_INTERFACE.agc:30
//# MOD AUTHOR:  KLUMPP
// FINDCDUW--GUIDAP_INTERFACE.agc:31
//#
// FINDCDUW--GUIDAP_INTERFACE.agc:32
//# OBJECTS OF MOD:	1.	TO SUPPLY COMMANDED GIMBAL ANGLES FOR NOUN 22.
// FINDCDUW--GUIDAP_INTERFACE.agc:33
//#			2.	TO MAINTAIN CORRECT AND CURRENT THRUST
// FINDCDUW--GUIDAP_INTERFACE.agc:34
//#				DIRECTION DATA IN ALL MODES.  THIS IS DONE BY
// FINDCDUW--GUIDAP_INTERFACE.agc:35
//#				FETCHING FOR THE THRUST DIRECTION FILTER THE
// FINDCDUW--GUIDAP_INTERFACE.agc:36
//#				CDUD'S IN PNGCS-AUTO, THE CDU'S IN ALL OTHER
// FINDCDUW--GUIDAP_INTERFACE.agc:37
//#				MODES.
// FINDCDUW--GUIDAP_INTERFACE.agc:38
//#			3.	TO SUBSTITUDE A STOPRATE FOR THE NORMAL
// FINDCDUW--GUIDAP_INTERFACE.agc:39
//#				AUTOPILOT COMMANDS WHENEVER
// FINDCDUW--GUIDAP_INTERFACE.agc:40
//#				1) NOT IN PNGCS-AUTO, OR
// FINDCDUW--GUIDAP_INTERFACE.agc:41
//#				2) ENGINE IS OFF.
// FINDCDUW--GUIDAP_INTERFACE.agc:42
//#
// FINDCDUW--GUIDAP_INTERFACE.agc:43
//# FUNCTIONAL DESCRIPTION:
// FINDCDUW--GUIDAP_INTERFACE.agc:44
//#
// FINDCDUW--GUIDAP_INTERFACE.agc:45
//# FINDCDUW PROVIDES THE INTERFACES BETWEEN THE VARIOUS POWERED FLITE GUIDANCE PROGRAMS
// FINDCDUW--GUIDAP_INTERFACE.agc:46
//# AND THE DIGITAL AUTOPILOT.  THE INPUTS TO FINDCDUW ARE THE THRUST COMMAND VECTOR
// FINDCDUW--GUIDAP_INTERFACE.agc:47
//# AND THE WINDOW COMMAND VECTOR, AND THE OUTPUTS ARE THE GIMBAL ANGLE
// FINDCDUW--GUIDAP_INTERFACE.agc:48
//# INCREMENTS, THE COMMANDED ATTITUDE ANGLE RATES, AND THE COMMANDED
// FINDCDUW--GUIDAP_INTERFACE.agc:49
//# ATTITUDE LAG ANGLES (WHICH ACCOUNT FOR THE ANGLES BY WHICH THE BODY WILL
// FINDCDUW--GUIDAP_INTERFACE.agc:50
//# LAG BEHIND A RAMP COMMAND IN ATTITUDE ANGLE DUE TO THE FINITE ANGULAR
// FINDCDUW--GUIDAP_INTERFACE.agc:51
//# ACCELERATIONS AVAILABLE).
// FINDCDUW--GUIDAP_INTERFACE.agc:52
//#
// FINDCDUW--GUIDAP_INTERFACE.agc:53
//# FINDCDUW ALIGNS THE ESTIMATED THRUST VECTOR FROM THE THRUST DIRECTION
// FINDCDUW--GUIDAP_INTERFACE.agc:54
//# FILTER WITH THE THRUST COMMAND VECTOR, AND, WHEN XDVINHIB SET,
// FINDCDUW--GUIDAP_INTERFACE.agc:55
//# ALIGNS THE +Z HALF OF THE LM ZX PLANE WITH THE WINDOW COMMAND VECTOR.
// FINDCDUW--GUIDAP_INTERFACE.agc:56
//#
// FINDCDUW--GUIDAP_INTERFACE.agc:57
//# Page 909
// FINDCDUW--GUIDAP_INTERFACE.agc:58
//# SPECIFICATIONS:
// FINDCDUW--GUIDAP_INTERFACE.agc:59
//#
// FINDCDUW--GUIDAP_INTERFACE.agc:60
//# INITIALIZATION:	A SINGLE INTERPRETIVE CALL TO INITCDUW IS REQUIRED
// FINDCDUW--GUIDAP_INTERFACE.agc:61
//#			BEFORE EACH GUIDED MANEUVER USING FINDCDUW.
// FINDCDUW--GUIDAP_INTERFACE.agc:62
//#
// FINDCDUW--GUIDAP_INTERFACE.agc:63
//# CALL:			INTERPRETIVE CALL TO FINDCDUW WITH THE THRUST COMMAND
// FINDCDUW--GUIDAP_INTERFACE.agc:64
//#			VECTOR IN MPAC.  INTERPRETIVE CALL TO FINDCDUW -2 WITH
// FINDCDUW--GUIDAP_INTERFACE.agc:65
//#			THE THRUST COMMAND VECTOR IN UNFC/2 AND NOT IN MPAC.
// FINDCDUW--GUIDAP_INTERFACE.agc:66
//#
// FINDCDUW--GUIDAP_INTERFACE.agc:67
//# RETURNS:		NORMAL INTERPRETIVE IN ALL CASES
// FINDCDUW--GUIDAP_INTERFACE.agc:68
//#			1.	NORMALLY ALL AUTOPILOT CMDS ARE ISSUED.
// FINDCDUW--GUIDAP_INTERFACE.agc:69
//#			2.	IF NOT PNGCS AUTO, DO STOPRATE AND RETURN
// FINDCDUW--GUIDAP_INTERFACE.agc:70
//#				WITHOUT ISSUING AUTOPILOT CMDS.
// FINDCDUW--GUIDAP_INTERFACE.agc:71
//#			3.	IF ENGINE OFF, DO STOPRATE AND RETURN WITHOUT
// FINDCDUW--GUIDAP_INTERFACE.agc:72
//#				ISSUING AUTOPILOT CMDS.
// FINDCDUW--GUIDAP_INTERFACE.agc:73
//#
// FINDCDUW--GUIDAP_INTERFACE.agc:74
//# ALARMS:		00401	IF INPUTS DETERMINE AN ATTITUDE IN GIMBAL LOCK.
// FINDCDUW--GUIDAP_INTERFACE.agc:75
//#				FINDCDUW DRIVES CDUXD AND CDUYD TO THE RQD VALUES,
// FINDCDUW--GUIDAP_INTERFACE.agc:76
//#				BUT DRIVES CDUZD ONLY TO THE GIMBAL LOCK CONE.
// FINDCDUW--GUIDAP_INTERFACE.agc:77
//#
// FINDCDUW--GUIDAP_INTERFACE.agc:78
//#			00402	IF UNFC/2 OR UNWC/2 PRODUCE OVERFLOW WHEN
// FINDCDUW--GUIDAP_INTERFACE.agc:79
//#				UNITIZED USING NORMUNIT.  FINDCDUW ISSUES
// FINDCDUW--GUIDAP_INTERFACE.agc:80
//#				STOPRATE AS ONLY INPUT TO AUTOPILOT.
// FINDCDUW--GUIDAP_INTERFACE.agc:81
//#
// FINDCDUW--GUIDAP_INTERFACE.agc:82
//# INPUTS:		UNFC/2		THRUST COMMAND VECTOR, NEED NOT BE SEMI-UNIT.
// FINDCDUW--GUIDAP_INTERFACE.agc:83
//#			UNWC/2		WINDOW COMMAND VECTOR, NEED NOT BE SEMI-UNIT.
// FINDCDUW--GUIDAP_INTERFACE.agc:84
//#			OGABIAS		POSSIBLE BIAS FOR OUTER GIMBAL ANGLE (ZEROED IN INITCDUW), UNITS OF PI.
// FINDCDUW--GUIDAP_INTERFACE.agc:85
//#			XOVINHIB	FLAG DENOTING X AXIS OVERRIDE INHIBITED.
// FINDCDUW--GUIDAP_INTERFACE.agc:86
//#			CSMDOCKD	FLAG DENOTING CSM DOCKED.
// FINDCDUW--GUIDAP_INTERFACE.agc:87
//#			STEERSW		FLAG DENOTING INSUFF THRUST FOR THRUST DIR FLTR.
// FINDCDUW--GUIDAP_INTERFACE.agc:88
//#
// FINDCDUW--GUIDAP_INTERFACE.agc:89
//# OUTPUTS:		DELCDUX,Y,Z
// FINDCDUW--GUIDAP_INTERFACE.agc:90
//#			OMEGAPD,+1,+2
// FINDCDUW--GUIDAP_INTERFACE.agc:91
//#			DELPEROR,+1,+2
// FINDCDUW--GUIDAP_INTERFACE.agc:92
//#			CPHI,+1,+2 FOR NOUN22
// FINDCDUW--GUIDAP_INTERFACE.agc:93
//#
// FINDCDUW--GUIDAP_INTERFACE.agc:94
//# DEBRIS:		FINDCDUW DESTROYS SINCDUX,Y,Z AND COSCDUX,Y,Z BY
// FINDCDUW--GUIDAP_INTERFACE.agc:95
//#			WRITING INTO THESE LOCATIONS THE SINES AND COSINES
// FINDCDUW--GUIDAP_INTERFACE.agc:96
//#			OF THE CDUD'S IN PNGCS-AUTO, OF THE CDU'S OTHERWISE.
// FINDCDUW--GUIDAP_INTERFACE.agc:97
//
// FINDCDUW--GUIDAP_INTERFACE.agc:98
//# Page 910
// FINDCDUW--GUIDAP_INTERFACE.agc:99
//# INITIALIZATION FOR FINDCDUW
// FINDCDUW--GUIDAP_INTERFACE.agc:100
//
// FINDCDUW--GUIDAP_INTERFACE.agc:101
//		BANK	30
// FINDCDUW--GUIDAP_INTERFACE.agc:102
//		SETLOC	FCDUW
// FINDCDUW--GUIDAP_INTERFACE.agc:103
//		BANK
// FINDCDUW--GUIDAP_INTERFACE.agc:104
//
// FINDCDUW--GUIDAP_INTERFACE.agc:105
//		EBANK=	ECDUW
// FINDCDUW--GUIDAP_INTERFACE.agc:106
//		COUNT*	$$/FCDUW
// FINDCDUW--GUIDAP_INTERFACE.agc:107
//
// FINDCDUW--GUIDAP_INTERFACE.agc:108
//INITCDUW	VLOAD
// slot 27204
    27204, 65530,
// FINDCDUW--GUIDAP_INTERFACE.agc:109
//			UNITX
// slot 27205
    27205, 6816,
// FINDCDUW--GUIDAP_INTERFACE.agc:110
//		STORE	UNFV/2
// slot 27206
    27206, 3440,
// FINDCDUW--GUIDAP_INTERFACE.agc:111
//		STORE	UNWC/2
// slot 27207
    27207, 3428,
// FINDCDUW--GUIDAP_INTERFACE.agc:112
//		RVQ
// slot 27208
    27208, 65308,
// FINDCDUW--GUIDAP_INTERFACE.agc:113
//
// FINDCDUW--GUIDAP_INTERFACE.agc:114
//# FINDCDUW PRELIMINARIES
// FINDCDUW--GUIDAP_INTERFACE.agc:115
//
// FINDCDUW--GUIDAP_INTERFACE.agc:116
//		VLOAD			# FINDCDUW -2:  ENTRY WHEN UNFC/2 PRE-STORD
// slot 27209
    27209, 65530,
// FINDCDUW--GUIDAP_INTERFACE.agc:117
//			UNFC/2		# INPUT VECTORS NEED NOT BE SEMI-UNIT
// slot 27210
    27210, 3416,
// FINDCDUW--GUIDAP_INTERFACE.agc:118
//FINDCDUW	BOV	SETPD		# FINDCDUW: ENTRY WHEN UNFC/2 IN MPAC
// slot 27211
    27211, 33024,
// FINDCDUW--GUIDAP_INTERFACE.agc:119
//			FINDCDUW	# INTERPRETER NOW INITIALIZED
// slot 27212
    27212, 50326,
// FINDCDUW--GUIDAP_INTERFACE.agc:120
//			22		# LOCS 0 THRU 21 FOR DIRECTION COSINE MAT
// slot 27213
    27213, 38,
// FINDCDUW--GUIDAP_INTERFACE.agc:121
//		STQ	EXIT
// slot 27214
    27214, 65056,
// FINDCDUW--GUIDAP_INTERFACE.agc:122
//			QCDUWUSR	# SAVE RETURN ADDRESS
// slot 27215
    27215, 3406
)).

// bank 30, slots 27216-27252
function agcAotUnit1716 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27233 {
        if slot <= 27224 {
            if slot <= 27219 {
                if slot <= 27217 {
                    if slot <= 27216 {
// FINDCDUW--GUIDAP_INTERFACE.agc:123
//
// FINDCDUW--GUIDAP_INTERFACE.agc:124
//# MORE HAUSKEEPING
// FINDCDUW--GUIDAP_INTERFACE.agc:125
//		CA	ECDUWL
// slot 27216
                        if slot <> 27216 or instruction <> 14321 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2033), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:126
//		XCH	EBANK		# SET EBANK
// slot 27217
                        if slot <> 27217 or instruction <> 23555 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 3, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 27218 {
// FINDCDUW--GUIDAP_INTERFACE.agc:127
//		TS	ECDUWUSR	# SAVE USER'S EBANK
// slot 27218
                        if slot <> 27218 or instruction <> 23462 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23462, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:128
//
// FINDCDUW--GUIDAP_INTERFACE.agc:129
//		CA	DAPBOOLS
// slot 27219
                        if slot <> 27219 or instruction <> 12361 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 73).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 27221 {
                    if slot <= 27220 {
// FINDCDUW--GUIDAP_INTERFACE.agc:130
//		MASK	CSMDOCKD	# CSMDOCKD MUST NOT BE BIT15
// slot 27220
                        if slot <> 27220 or instruction <> 31199 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                            if fixedOperand = 4096 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 4096), 2) * 4096).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:131
//		CCS	A
// slot 27221
                        if slot <> 27221 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 27222 {
// FINDCDUW--GUIDAP_INTERFACE.agc:132
//		CA	ONE		# INDEX IF CSM DOCKED
// slot 27222
                        if slot <> 27222 or instruction <> 14827 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 27223 {
// FINDCDUW--GUIDAP_INTERFACE.agc:133
//		TS	NDXCDUW
// slot 27223
                            if slot <> 27223 or instruction <> 23464 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23464, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:134
//
// FINDCDUW--GUIDAP_INTERFACE.agc:135
//		CA	XOVINHIB	# XOVINHIB MUST NOT BE BIT15
// slot 27224
                            if slot <> 27224 or instruction <> 14819 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 27228 {
                if slot <= 27226 {
                    if slot <= 27225 {
// FINDCDUW--GUIDAP_INTERFACE.agc:136
//		TS	FLPAUTNO	# SET TO POS-NON-ZERO FLAG PNGCS AUTO NOT
// slot 27225
                        if slot <> 27225 or instruction <> 23466 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23466, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:137
//
// FINDCDUW--GUIDAP_INTERFACE.agc:138
//		MASK	DAPBOOLS
// slot 27226
                        if slot <> 27226 or instruction <> 28745 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 73).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 27227 {
// FINDCDUW--GUIDAP_INTERFACE.agc:139
//		TS	FLAGOODW	# FLAG0ODW = ANY PNZ NUMBER IF XOV INHIBTD
// slot 27227
                        if slot <> 27227 or instruction <> 23465 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23465, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:140
//
// FINDCDUW--GUIDAP_INTERFACE.agc:141
//# Page 911
// FINDCDUW--GUIDAP_INTERFACE.agc:142
//# FETCH BASIC DATA
// FINDCDUW--GUIDAP_INTERFACE.agc:143
//		INHINT			# RELINT AT PAUTNO (TC INTPRET)
// slot 27228
                        if slot <> 27228 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 27230 {
                    if slot <= 27229 {
// FINDCDUW--GUIDAP_INTERFACE.agc:144
//
// FINDCDUW--GUIDAP_INTERFACE.agc:145
//		CA	CDUX		# FETCH CDUX,CDUY,CDUZ IN ALL CASES, BUT
// slot 27229
                        if slot <> 27229 or instruction <> 12314 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 26).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:146
//		TS	CDUSPOTX	#	REPLACE BELOW IF PNGCS AUTO
// slot 27230
                        if slot <> 27230 or instruction <> 23034 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23034, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 27231 {
// FINDCDUW--GUIDAP_INTERFACE.agc:147
//		CA	CDUY
// slot 27231
                        if slot <> 27231 or instruction <> 12315 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 27).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 27232 {
// FINDCDUW--GUIDAP_INTERFACE.agc:148
//		TS	CDUSPOTY
// slot 27232
                            if slot <> 27232 or instruction <> 23030 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23030, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:149
//		CA	CDUZ
// slot 27233
                            if slot <> 27233 or instruction <> 12316 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 28).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 27242 {
            if slot <= 27237 {
                if slot <= 27235 {
                    if slot <= 27234 {
// FINDCDUW--GUIDAP_INTERFACE.agc:150
//		TS	CDUSPOTZ
// slot 27234
                        if slot <> 27234 or instruction <> 23032 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23032, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:151
//
// FINDCDUW--GUIDAP_INTERFACE.agc:152
//		CA	BIT10		# PNGCS CONTROL BIT
// slot 27235
                        if slot <> 27235 or instruction <> 14818 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 27236 {
// FINDCDUW--GUIDAP_INTERFACE.agc:153
//		EXTEND
// slot 27236
                        if slot <> 27236 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:154
//		RAND	CHAN30
// slot 27237
                        if slot <> 27237 or instruction <> 1048 { return choose false if checkOnly else -1. }
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
                if slot <= 27239 {
                    if slot <= 27238 {
// FINDCDUW--GUIDAP_INTERFACE.agc:155
//		CCS	A
// slot 27238
                        if slot <> 27238 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:156
//		TCF	PAUTNO		# NOT PNGCS (BITS INVERTED)
// slot 27239
                        if slot <> 27239 or instruction <> 5748 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5748, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 27240 {
// FINDCDUW--GUIDAP_INTERFACE.agc:157
//
// FINDCDUW--GUIDAP_INTERFACE.agc:158
//		CA	BIT14		# AUTO MODE BIT
// slot 27240
                        if slot <> 27240 or instruction <> 14814 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 27241 {
// FINDCDUW--GUIDAP_INTERFACE.agc:159
//		EXTEND
// slot 27241
                            if slot <> 27241 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:160
//		RAND	CHAN31
// slot 27242
                            if slot <> 27242 or instruction <> 1049 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreChannelInstruction(words, 2, 25, channelAdapter).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 27247 {
                if slot <= 27244 {
                    if slot <= 27243 {
// FINDCDUW--GUIDAP_INTERFACE.agc:161
//		CCS	A
// slot 27243
                        if slot <> 27243 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:162
//		TCF	PAUTNO		# NOT AUTO (BITS INVERTED)
// slot 27244
                        if slot <> 27244 or instruction <> 5748 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5748, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 27245 {
// FINDCDUW--GUIDAP_INTERFACE.agc:163
//
// FINDCDUW--GUIDAP_INTERFACE.agc:164
//		TS	FLPAUTNO	# RESET FLAG PNGCS AUTO NOT
// slot 27245
                        if slot <> 27245 or instruction <> 23466 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23466, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 27246 {
// FINDCDUW--GUIDAP_INTERFACE.agc:165
//
// FINDCDUW--GUIDAP_INTERFACE.agc:166
//		CA	CDUXD		# PNGCS AUTO:  FETCH CDUXD,CDUYD,CDUZD
// slot 27246
                            if slot <> 27246 or instruction <> 13213 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 925).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:167
//		TS	CDUSPOTX
// slot 27247
                            if slot <> 27247 or instruction <> 23034 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23034, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 27249 {
                    if slot <= 27248 {
// FINDCDUW--GUIDAP_INTERFACE.agc:168
//		CA	CDUYD
// slot 27248
                        if slot <> 27248 or instruction <> 13214 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 926).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:169
//		TS	CDUSPOTY
// slot 27249
                        if slot <> 27249 or instruction <> 23030 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23030, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 27250 {
// FINDCDUW--GUIDAP_INTERFACE.agc:170
//		CA	CDUZD
// slot 27250
                        if slot <> 27250 or instruction <> 13215 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 927).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 27251 {
// FINDCDUW--GUIDAP_INTERFACE.agc:171
//		TS	CDUSPOTZ
// slot 27251
                            if slot <> 27251 or instruction <> 23032 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23032, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:172
//
// FINDCDUW--GUIDAP_INTERFACE.agc:173
//# Page 912
// FINDCDUW--GUIDAP_INTERFACE.agc:174
//# FETCH INPUTS
// FINDCDUW--GUIDAP_INTERFACE.agc:175
//PAUTNO		TC	INTPRET		# ENTERING THRUST CMD STILL IN MPAC
// slot 27252
                            if slot <> 27252 or instruction <> 3103 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3103, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1716] to agcAotUnit1716@.

agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:176
//		RTB
// slot 27253
    27253, 65336,
// FINDCDUW--GUIDAP_INTERFACE.agc:177
//			NORMUNIT
// slot 27254
    27254, 18348,
// FINDCDUW--GUIDAP_INTERFACE.agc:178
//		STOVL	UNX/2		# SEMI-UNIT THRUST CMD AS INITIAL UNX/2
// slot 27255
    27255, 20482,
// FINDCDUW--GUIDAP_INTERFACE.agc:179
//			UNWC/2
// slot 27256
    27256, 3428,
// FINDCDUW--GUIDAP_INTERFACE.agc:180
//		RTB	RTB
// slot 27257
    27257, 39992,
// FINDCDUW--GUIDAP_INTERFACE.agc:181
//			NORMUNIT
// slot 27258
    27258, 18348,
// FINDCDUW--GUIDAP_INTERFACE.agc:182
//			QUICTRIG	# ALWAYS RQD TO OBTAIN TRIGS OF CDUD'S
// slot 27259
    27259, 40730,
// FINDCDUW--GUIDAP_INTERFACE.agc:183
//		STOVL	UNZ/2		# SEMI-UNIT WINDOW CMD AS INITIAL UNZ/2
// slot 27260
    27260, 20506,
// FINDCDUW--GUIDAP_INTERFACE.agc:184
//			DELV
// slot 27261
    27261, 426,
// FINDCDUW--GUIDAP_INTERFACE.agc:185
//		BOVB	UNIT
// slot 27262
    27262, 44552,
// FINDCDUW--GUIDAP_INTERFACE.agc:186
//			NOATTCNT	# AT LEAST ONE ENTERING CMD VCT ZERO
// slot 27263
    27263, 51152,
// FINDCDUW--GUIDAP_INTERFACE.agc:187
//		BOV	CALL
// slot 27264
    27264, 37888,
// FINDCDUW--GUIDAP_INTERFACE.agc:188
//			AFTRFLTR	# IF UNIT DELV OVERFLOWS SKIP FILTER
// slot 27265
    27265, 50458,
// FINDCDUW--GUIDAP_INTERFACE.agc:189
//			*SMNB*		# YIELDS UNIT(DELV) IN VEH COORDS FOR FLTR
// slot 27266
    27266, 40818,
// FINDCDUW--GUIDAP_INTERFACE.agc:190
//
// FINDCDUW--GUIDAP_INTERFACE.agc:191
//# THRUST DIRECTION FILTER
// FINDCDUW--GUIDAP_INTERFACE.agc:192
//
// FINDCDUW--GUIDAP_INTERFACE.agc:193
//		EXIT
// slot 27267
    27267, 65532
)).

// bank 30, slots 27268-27276
function agcAotUnit1717 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27271 {
        if slot <= 27269 {
            if slot <= 27268 {
// FINDCDUW--GUIDAP_INTERFACE.agc:194
//
// FINDCDUW--GUIDAP_INTERFACE.agc:195
//		CA	UNFVY/2		# FOR RESTARTS, UNFV/2 ALWAYS INTACT, MPAC
// slot 27268
                if slot <> 27268 or instruction <> 13241 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 953).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:196
//		LXCH	MPAC	+3	# 	RENEWD AFTER RETURN FROM CALLER,
// slot 27269
                if slot <> 27269 or instruction <> 9327 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 111, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27270 {
// FINDCDUW--GUIDAP_INTERFACE.agc:197
//		TC	FLTRSUB		#	TWO FILTER UPDATES MAY BE DONE.
// slot 27270
                if slot <> 27270 or instruction <> 1859 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1859, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:198
//		TS	UNFVY/2		# UNFV/2 NEED NOT BE EXACTLY SEMI-UNIT.
// slot 27271
                if slot <> 27271 or instruction <> 23481 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23481, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 27273 {
            if slot <= 27272 {
// FINDCDUW--GUIDAP_INTERFACE.agc:199
//
// FINDCDUW--GUIDAP_INTERFACE.agc:200
//		CA	UNFVZ/2
// slot 27272
                if slot <> 27272 or instruction <> 13243 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 955).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:201
//		LXCH	MPAC +5
// slot 27273
                if slot <> 27273 or instruction <> 9329 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 113, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27274 {
// FINDCDUW--GUIDAP_INTERFACE.agc:202
//		TC	FLTRSUB
// slot 27274
                if slot <> 27274 or instruction <> 1859 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1859, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27275 {
// FINDCDUW--GUIDAP_INTERFACE.agc:203
//		TS	UNFVZ/2
// slot 27275
                    if slot <> 27275 or instruction <> 23483 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23483, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:204
//
// FINDCDUW--GUIDAP_INTERFACE.agc:205
//		TC	INTPRET		# COMPLETES FILTER
// slot 27276
                    if slot <> 27276 or instruction <> 3103 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3103, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1717] to agcAotUnit1717@.

agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:206
//
// FINDCDUW--GUIDAP_INTERFACE.agc:207
//# Page 913
// FINDCDUW--GUIDAP_INTERFACE.agc:208
//# FIND A SUITABLE WINDOW POINTING VECTOR
// FINDCDUW--GUIDAP_INTERFACE.agc:209
//
// FINDCDUW--GUIDAP_INTERFACE.agc:210
//AFTRFLTR	SLOAD	BHIZ		# IF XOV NOT INHIBITED, GO FETCH ZNB
// slot 27277
    27277, 39098,
// FINDCDUW--GUIDAP_INTERFACE.agc:211
//			FLAGOODW
// slot 27278
    27278, 3412,
// FINDCDUW--GUIDAP_INTERFACE.agc:212
//			FETCHZNB
// slot 27279
    27279, 50470,
// FINDCDUW--GUIDAP_INTERFACE.agc:213
//		VLOAD	CALL
// slot 27280
    27280, 38138,
// FINDCDUW--GUIDAP_INTERFACE.agc:214
//			UNZ/2
// slot 27281
    27281, 26,
// FINDCDUW--GUIDAP_INTERFACE.agc:215
//			UNWCTEST
// slot 27282
    27282, 50854,
// FINDCDUW--GUIDAP_INTERFACE.agc:216
//
// FINDCDUW--GUIDAP_INTERFACE.agc:217
//FETCHZNB	VLOAD
// slot 27283
    27283, 65530,
// FINDCDUW--GUIDAP_INTERFACE.agc:218
//			ZNBPIP
// slot 27284
    27284, 2276,
// FINDCDUW--GUIDAP_INTERFACE.agc:219
//		STCALL	UNZ/2
// slot 27285
    27285, 28698,
// FINDCDUW--GUIDAP_INTERFACE.agc:220
//			UNWCTEST
// slot 27286
    27286, 50854,
// FINDCDUW--GUIDAP_INTERFACE.agc:221
//
// FINDCDUW--GUIDAP_INTERFACE.agc:222
//		VLOAD	VCOMP		# Z AND -X CAN'T BOTH PARALLEL UNFC/2
// slot 27287
    27287, 48890,
// FINDCDUW--GUIDAP_INTERFACE.agc:223
//			XNBPIP
// slot 27288
    27288, 2252,
// FINDCDUW--GUIDAP_INTERFACE.agc:224
//		STORE	UNZ/2
// slot 27289
    27289, 26,
// FINDCDUW--GUIDAP_INTERFACE.agc:225
//
// FINDCDUW--GUIDAP_INTERFACE.agc:226
//# COMPUTE THE REQUIRED DIRECTION COSINE MATRIX
// FINDCDUW--GUIDAP_INTERFACE.agc:227
//
// FINDCDUW--GUIDAP_INTERFACE.agc:228
//DCMCL		VLOAD	VXV
// slot 27290
    27290, 40442,
// FINDCDUW--GUIDAP_INTERFACE.agc:229
//			UNZ/2
// slot 27291
    27291, 26,
// FINDCDUW--GUIDAP_INTERFACE.agc:230
//			UNX/2
// slot 27292
    27292, 2,
// FINDCDUW--GUIDAP_INTERFACE.agc:231
//		UNIT	PUSH		# UNY/2 FIRST ITERATION
// slot 27293
    27293, 34396,
// FINDCDUW--GUIDAP_INTERFACE.agc:232
//		VXV	VSL1
// slot 27294
    27294, 64058,
// FINDCDUW--GUIDAP_INTERFACE.agc:233
//			UNX/2
// slot 27295
    27295, 2,
// FINDCDUW--GUIDAP_INTERFACE.agc:234
//		STORE	UNZ/2		# -UNZ/2 FIRST ITERATION
// slot 27296
    27296, 26,
// FINDCDUW--GUIDAP_INTERFACE.agc:235
//		VXSC	PDVL		# EXCHANGE -UNFVZ/2 UNZ/2 FOR UNY/2
// slot 27297
    27297, 52706,
// FINDCDUW--GUIDAP_INTERFACE.agc:236
//			UNFVZ/2		# MUST BE SMALL
// slot 27298
    27298, 3448,
// FINDCDUW--GUIDAP_INTERFACE.agc:237
//		VXSC	BVSU		# YIELDS -UNFVY/2 UNY/2-UNFVZ/2 UNZ/2
// slot 27299
    27299, 42466,
// FINDCDUW--GUIDAP_INTERFACE.agc:238
//			UNFVY/2		# MUST BE SMALL
// slot 27300
    27300, 3444,
// FINDCDUW--GUIDAP_INTERFACE.agc:239
//		VSL1	VAD
// slot 27301
    27301, 44532,
// FINDCDUW--GUIDAP_INTERFACE.agc:240
//			UNX/2
// slot 27302
    27302, 2,
// FINDCDUW--GUIDAP_INTERFACE.agc:241
//		UNIT			# TOTALLY ELIMINATES THRUST POINTING ERROR
// slot 27303
    27303, 65372,
// FINDCDUW--GUIDAP_INTERFACE.agc:242
//		STORE	UNX/2		# UNX/2
// slot 27304
    27304, 2,
// FINDCDUW--GUIDAP_INTERFACE.agc:243
//		VXV	VSL1
// slot 27305
    27305, 64058,
// FINDCDUW--GUIDAP_INTERFACE.agc:244
//			UNZ/2		# -UNZ/2 WAS STORED HERE REMEMBER
// slot 27306
    27306, 26,
// FINDCDUW--GUIDAP_INTERFACE.agc:245
//		STORE	UNY/2		# UNY/2
// slot 27307
    27307, 14,
// FINDCDUW--GUIDAP_INTERFACE.agc:246
//		VCOMP	VXV
// slot 27308
    27308, 40316,
// FINDCDUW--GUIDAP_INTERFACE.agc:247
//			UNX/2
// slot 27309
    27309, 2,
// FINDCDUW--GUIDAP_INTERFACE.agc:248
//		VSL1
// slot 27310
    27310, 65524,
// FINDCDUW--GUIDAP_INTERFACE.agc:249
//		STORE	UNZ/2		# UNZ/2
// slot 27311
    27311, 26,
// FINDCDUW--GUIDAP_INTERFACE.agc:250
//
// FINDCDUW--GUIDAP_INTERFACE.agc:251
//# Page 914
// FINDCDUW--GUIDAP_INTERFACE.agc:252
//# COMPUTES THE REQUIRED GIMBAL ANGLES
// FINDCDUW--GUIDAP_INTERFACE.agc:253
//
// FINDCDUW--GUIDAP_INTERFACE.agc:254
//		CALL
// slot 27312
    27312, 65320,
// FINDCDUW--GUIDAP_INTERFACE.agc:255
//			NB2CDUSP	# YIELDS THE RQD GIMBAL ANGLES, 2'S, PI
// slot 27313
    27313, 50870,
// FINDCDUW--GUIDAP_INTERFACE.agc:256
//		EXIT
// slot 27314
    27314, 65532
)).

// bank 30, slots 27315-27337
function agcAotUnit1718 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27325 {
        if slot <= 27319 {
            if slot <= 27316 {
                if slot <= 27315 {
// FINDCDUW--GUIDAP_INTERFACE.agc:257
//
// FINDCDUW--GUIDAP_INTERFACE.agc:258
//# LIMIT THE MIDDLE GIMBAL ANGLE & COMPUTE THE UNLIMITED GIMBAL ANGLE CHGS
// FINDCDUW--GUIDAP_INTERFACE.agc:259
//
// FINDCDUW--GUIDAP_INTERFACE.agc:260
//		CA	MPAC +2		# LIMIT THE MGA
// slot 27315
                    if slot <> 27315 or instruction <> 12398 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 110).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:261
//		TS	L		# CAN'T LXCH:  NEED UNLIMITED MGA FOR ALARM
// slot 27316
                    if slot <> 27316 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 27317 {
// FINDCDUW--GUIDAP_INTERFACE.agc:262
//		CA	CDUZDLIM
// slot 27317
                    if slot <> 27317 or instruction <> 14331 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2043), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27318 {
// FINDCDUW--GUIDAP_INTERFACE.agc:263
//		TC	LIMITSUB	# YIELDS LIMITED MGA.  1 BIT ERROR POSSIBLE
// slot 27318
                        if slot <> 27318 or instruction <> 2007 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2007, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:264
//		XCH	MPAC +2		# 	BECAUSE USING 2'S COMP.  WHO CARES?
// slot 27319
                        if slot <> 27319 or instruction <> 23662 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 110, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 27322 {
                if slot <= 27320 {
// FINDCDUW--GUIDAP_INTERFACE.agc:265
//		EXTEND
// slot 27320
                    if slot <> 27320 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27321 {
// FINDCDUW--GUIDAP_INTERFACE.agc:266
//		MSU	MPAC +2		# THIS BETTER YIELD ZERO
// slot 27321
                        if slot <> 27321 or instruction <> 8302 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMSU(words, 110).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:267
//		EXTEND
// slot 27322
                        if slot <> 27322 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 27323 {
// FINDCDUW--GUIDAP_INTERFACE.agc:268
//		BZF	+2
// slot 27323
                    if slot <> 27323 or instruction <> 5821 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5821, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27324 {
// FINDCDUW--GUIDAP_INTERFACE.agc:269
//		TCF	ALARMMGA
// slot 27324
                        if slot <> 27324 or instruction <> 6126 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6126, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:270
//
// FINDCDUW--GUIDAP_INTERFACE.agc:271
//MGARET		INHINT			# RELINT AT TC INTPRET AFTER TCQCDUW
// slot 27325
                        if slot <> 27325 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 27331 {
            if slot <= 27328 {
                if slot <= 27326 {
// FINDCDUW--GUIDAP_INTERFACE.agc:272
//
// FINDCDUW--GUIDAP_INTERFACE.agc:273
//		ZL
// slot 27326
                    if slot <> 27326 or instruction <> 9223 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 7, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27327 {
// FINDCDUW--GUIDAP_INTERFACE.agc:274
//		CA	TWO
// slot 27327
                        if slot <> 27327 or instruction <> 14826 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:275
//DELGMBLP	TS	TEM2
// slot 27328
                        if slot <> 27328 or instruction <> 22626 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22626, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 27329 {
// FINDCDUW--GUIDAP_INTERFACE.agc:276
//
// FINDCDUW--GUIDAP_INTERFACE.agc:277
//		CA	L		# TO PREVENT FALSE STARTS ABOUT X, ZERO
// slot 27329
                    if slot <> 27329 or instruction <> 12289 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27330 {
// FINDCDUW--GUIDAP_INTERFACE.agc:278
//		EXTEND			#	FLAGOODW IF DELGMBZ OR Y TOO BIG.
// slot 27330
                        if slot <> 27330 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:279
//		SQUARE
// slot 27331
                        if slot <> 27331 or instruction <> 28672 { return choose false if checkOnly else -1. }
                        if extended {
                            if agcOverflowDirection(words[0]) <> 0 { return choose false if checkOnly else -1. }
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 0, readEffective:call(words, 0)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 27334 {
                if slot <= 27332 {
// FINDCDUW--GUIDAP_INTERFACE.agc:280
//		AD	HI5		# WITHIN 1 BIT OF -(45 DEG SQUARED)
// slot 27332
                    if slot <> 27332 or instruction <> 26856 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2280), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27333 {
// FINDCDUW--GUIDAP_INTERFACE.agc:281
//		EXTEND
// slot 27333
                        if slot <> 27333 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:282
//		BZMF	+3
// slot 27334
                        if slot <> 27334 or instruction <> 26313 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26313, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 27335 {
// FINDCDUW--GUIDAP_INTERFACE.agc:283
//		CA	ZERO
// slot 27335
                    if slot <> 27335 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27336 {
// FINDCDUW--GUIDAP_INTERFACE.agc:284
//		TS	FLAGOODW
// slot 27336
                        if slot <> 27336 or instruction <> 23465 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23465, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:285
//
// FINDCDUW--GUIDAP_INTERFACE.agc:286
//		INDEX	TEM2
// slot 27337
                        if slot <> 27337 or instruction <> 20578 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20578, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20578, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1718] to agcAotUnit1718@.

agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:287
//		CA	MPAC
// slot 27338
    27338, 24792
)).

// bank 30, slots 27339-27339
function agcAotUnit1719 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// FINDCDUW--GUIDAP_INTERFACE.agc:288
//		INDEX	TEM2
// slot 27339
    if slot <> 27339 or instruction <> 20578 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20578, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20578, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1719] to agcAotUnit1719@.

agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:289
//		TS	CPHI		# OUTPUTS TO NOUN22
// slot 27340
    27340, 45474
)).

// bank 30, slots 27341-27342
function agcAotUnit1720 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27341 {
// FINDCDUW--GUIDAP_INTERFACE.agc:290
//		EXTEND
// slot 27341
        if slot <> 27341 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:291
//		INDEX	TEM2
// slot 27342
        if slot <> 27342 or instruction <> 20578 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20578, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20578, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1720] to agcAotUnit1720@.

agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:292
//		MSU	CDUXD		# NO MATTER THAT THESE SLIGHTLY DIFFERENT
// slot 27343
    27343, 18234
)).

// bank 30, slots 27344-27345
function agcAotUnit1721 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27344 {
// FINDCDUW--GUIDAP_INTERFACE.agc:293
//		COM			# FROM WHEN WE INITIALLY FETCHED THEM
// slot 27344
        if slot <> 27344 or instruction <> 16384 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            agcCoreCS(words, 0).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:294
//		INDEX	TEM2
// slot 27345
        if slot <> 27345 or instruction <> 20578 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20578, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20578, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1721] to agcAotUnit1721@.

agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:295
//		TS	-DELGMB		# -UNLIMITED GIMBAL ANGLE CHGS, 1'S, PI
// slot 27346
    27346, 46970
)).

// bank 30, slots 27347-27357
function agcAotUnit1722 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27351 {
        if slot <= 27348 {
            if slot <= 27347 {
// FINDCDUW--GUIDAP_INTERFACE.agc:296
//		TS	L		# FOR PRECEDING TEST ON NEXT LOOP PASS
// slot 27347
                if slot <> 27347 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:297
//		CCS	TEM2
// slot 27348
                if slot <> 27348 or instruction <> 4194 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 98).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27349 {
// FINDCDUW--GUIDAP_INTERFACE.agc:298
//		TCF	DELGMBLP
// slot 27349
                if slot <> 27349 or instruction <> 5824 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5824, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27350 {
// FINDCDUW--GUIDAP_INTERFACE.agc:299
//
// FINDCDUW--GUIDAP_INTERFACE.agc:300
//# Page 915
// FINDCDUW--GUIDAP_INTERFACE.agc:301
//# BRANCHES TO NOATTCNT
// FINDCDUW--GUIDAP_INTERFACE.agc:302
//		CCS	FLPAUTNO
// slot 27350
                    if slot <> 27350 or instruction <> 5034 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 938).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:303
//		TCF	NOATTCNT +2	# NO PNGCS AUTO
// slot 27351
                    if slot <> 27351 or instruction <> 6122 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6122, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 27354 {
            if slot <= 27352 {
// FINDCDUW--GUIDAP_INTERFACE.agc:304
//
// FINDCDUW--GUIDAP_INTERFACE.agc:305
//		CA	FLAGWRD5
// slot 27352
                if slot <> 27352 or instruction <> 12353 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 65).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27353 {
// FINDCDUW--GUIDAP_INTERFACE.agc:306
//		MASK	ENGONBIT
// slot 27353
                    if slot <> 27353 or instruction <> 31205 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                        if fixedOperand = 64 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 64), 2) * 64).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:307
//		EXTEND
// slot 27354
                    if slot <> 27354 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 27355 {
// FINDCDUW--GUIDAP_INTERFACE.agc:308
//		BZF	NOATTCNT +2	# ENGINE NOT ON
// slot 27355
                if slot <> 27355 or instruction <> 6122 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6122, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27356 {
// FINDCDUW--GUIDAP_INTERFACE.agc:309
//
// FINDCDUW--GUIDAP_INTERFACE.agc:310
//# Page 916
// FINDCDUW--GUIDAP_INTERFACE.agc:311
//# LIMIT THE ATTITUDE ANGLE CHANGES
// FINDCDUW--GUIDAP_INTERFACE.agc:312
//#
// FINDCDUW--GUIDAP_INTERFACE.agc:313
//# THIS SECTION LIMITS THE ATTITUDE ANGLE CHANGES ABOUT A SET OF ORTHOGONAL VEHICLE AXES X,YPRIME,ZPRIME,
// FINDCDUW--GUIDAP_INTERFACE.agc:314
//# THESE AXES COINCIDE WITH THE COMMANDED VEHICLE AXES IF AND ONLY IF CDUXD IS ZERO.  THE PRIME SYSTEM IS
// FINDCDUW--GUIDAP_INTERFACE.agc:315
//# THE COMMANDED VEHICLE SYSTEM ROTATED ABOUT THE X AXIS TO BRING THE Z AXIS INTO ALIGNMENT WITH THE MIDDLE GIMBAL
// FINDCDUW--GUIDAP_INTERFACE.agc:316
//# AXIS.  ATTITUDE ANGLE CHANGES IN THE PRIME SYSTEM ARE RELATED TO SMALL GIMBAL ANGLE CHANGES BY:
// FINDCDUW--GUIDAP_INTERFACE.agc:317
//#
// FINDCDUW--GUIDAP_INTERFACE.agc:318
//#	[   -DELATTX    ]   [ 1     SIN(CDUZD)     0 ] [ -DELGMBX ]
// FINDCDUW--GUIDAP_INTERFACE.agc:319
//#	[               ]   [                        ] [          ]
// FINDCDUW--GUIDAP_INTERFACE.agc:320
//#	[ -DELATTYPRIME ] = [ 0     COS(CDUZD)     0 ] [ -DELGMBY ]
// FINDCDUW--GUIDAP_INTERFACE.agc:321
//#	[               ]   [                        ] [          ]
// FINDCDUW--GUIDAP_INTERFACE.agc:322
//#	[ -DELATTZPRIME ]   [ 0         0          1 ] [ -DELGMBZ ]
// FINDCDUW--GUIDAP_INTERFACE.agc:323
//
// FINDCDUW--GUIDAP_INTERFACE.agc:324
//		LXCH	-DELGMB +2	# SAME AS -DELATTZPRIME UNLIMITED
// slot 27356
                    if slot <> 27356 or instruction <> 10175 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 959, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:325
//		INDEX	NDXCDUW
// slot 27357
                    if slot <> 27357 or instruction <> 21416 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21416, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21416, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1722] to agcAotUnit1722@.

agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:326
//		CA	DAZMAX
// slot 27358
    27358, 28654
)).

// bank 30, slots 27359-27365
function agcAotUnit1723 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27361 {
        if slot <= 27359 {
// FINDCDUW--GUIDAP_INTERFACE.agc:327
//		TC	LIMITSUB
// slot 27359
            if slot <> 27359 or instruction <> 2007 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2007, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 27360 {
// FINDCDUW--GUIDAP_INTERFACE.agc:328
//		TS	-DELGMB +2	# -DELGMBZ
// slot 27360
                if slot <> 27360 or instruction <> 23487 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23487, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:329
//
// FINDCDUW--GUIDAP_INTERFACE.agc:330
//		CA	-DELGMB +1
// slot 27361
                if slot <> 27361 or instruction <> 13246 { return choose false if checkOnly else -1. }
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
        if slot <= 27363 {
            if slot <= 27362 {
// FINDCDUW--GUIDAP_INTERFACE.agc:331
//		EXTEND
// slot 27362
                if slot <> 27362 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:332
//		MP	COSCDUZ		# YIELDS -DELATTYPRIME/2 UNLIMITED
// slot 27363
                if slot <> 27363 or instruction <> 29158 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 486, readEffective:call(words, 486)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27364 {
// FINDCDUW--GUIDAP_INTERFACE.agc:333
//		TS	L
// slot 27364
                if slot <> 27364 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:334
//		INDEX	NDXCDUW
// slot 27365
                if slot <> 27365 or instruction <> 21416 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21416, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21416, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1723] to agcAotUnit1723@.

agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:335
//		CA	DAY/2MAX
// slot 27366
    27366, 28658
)).

// bank 30, slots 27367-27378
function agcAotUnit1724 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27372 {
        if slot <= 27369 {
            if slot <= 27367 {
// FINDCDUW--GUIDAP_INTERFACE.agc:336
//		TC	LIMITSUB
// slot 27367
                if slot <> 27367 or instruction <> 2007 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2007, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27368 {
// FINDCDUW--GUIDAP_INTERFACE.agc:337
//		EXTEND
// slot 27368
                    if slot <> 27368 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:338
//		DV	COSCDUZ
// slot 27369
                    if slot <> 27369 or instruction <> 4582 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreDv(words, 486, readEffective:call(words, 486)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 27370 {
// FINDCDUW--GUIDAP_INTERFACE.agc:339
//		XCH	-DELGMB +1	# -DELGMBY, FETCHING UNLIMITED VALUE
// slot 27370
                if slot <> 27370 or instruction <> 24510 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 958, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27371 {
// FINDCDUW--GUIDAP_INTERFACE.agc:340
//
// FINDCDUW--GUIDAP_INTERFACE.agc:341
//		EXTEND
// slot 27371
                    if slot <> 27371 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:342
//		MP	SINCDUZ
// slot 27372
                    if slot <> 27372 or instruction <> 29152 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 480, readEffective:call(words, 480)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 27375 {
            if slot <= 27373 {
// FINDCDUW--GUIDAP_INTERFACE.agc:343
//		DDOUBL
// slot 27373
                if slot <> 27373 or instruction <> 8193 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 1) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27374 {
// FINDCDUW--GUIDAP_INTERFACE.agc:344
//		COM
// slot 27374
                    if slot <> 27374 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:345
//		EXTEND			# YIELDS +DELATTX UNLIMITD, MAG < 180 DEG.
// slot 27375
                    if slot <> 27375 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 27376 {
// FINDCDUW--GUIDAP_INTERFACE.agc:346
//		MSU	-DELGMB		#	BASED ON UNLIMITED DELGMBV.
// slot 27376
                if slot <> 27376 or instruction <> 9149 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMSU(words, 957).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27377 {
// FINDCDUW--GUIDAP_INTERFACE.agc:347
//		TS	L		#	ONE BIT ERROR IF OPERANDS IN MSU
// slot 27377
                    if slot <> 27377 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:348
//		INDEX	NDXCDUW		#	OF MIXED SIGNS.  WHO CARES?
// slot 27378
                    if slot <> 27378 or instruction <> 21416 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21416, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21416, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1724] to agcAotUnit1724@.

agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:349
//		CA	DAXMAX
// slot 27379
    27379, 28654
)).

// bank 30, slots 27380-27403
function agcAotUnit1725 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27391 {
        if slot <= 27385 {
            if slot <= 27382 {
                if slot <= 27380 {
// FINDCDUW--GUIDAP_INTERFACE.agc:350
//		TC	LIMITSUB
// slot 27380
                    if slot <> 27380 or instruction <> 2007 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2007, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27381 {
// FINDCDUW--GUIDAP_INTERFACE.agc:351
//		TS	-DELGMB		# SAVE LIMITED +DELATTX
// slot 27381
                        if slot <> 27381 or instruction <> 23485 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23485, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:352
//		CCS	FLAGOODW
// slot 27382
                        if slot <> 27382 or instruction <> 5033 { return choose false if checkOnly else -1. }
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
                if slot <= 27383 {
// FINDCDUW--GUIDAP_INTERFACE.agc:353
//		CS	-DELGMB		# FETCH IT BACK CHGING SIGN IF WINDOW GOOD
// slot 27383
                    if slot <> 27383 or instruction <> 17341 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 957).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27384 {
// FINDCDUW--GUIDAP_INTERFACE.agc:354
//		TS	-DELGMB		# OTHERWISE USE ZERO FOR -DELATTX
// slot 27384
                        if slot <> 27384 or instruction <> 23485 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23485, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:355
//		CS	-DELGMB +1
// slot 27385
                        if slot <> 27385 or instruction <> 17342 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 958).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 27388 {
                if slot <= 27386 {
// FINDCDUW--GUIDAP_INTERFACE.agc:356
//		EXTEND
// slot 27386
                    if slot <> 27386 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27387 {
// FINDCDUW--GUIDAP_INTERFACE.agc:357
//		MP	SINCDUZ
// slot 27387
                        if slot <> 27387 or instruction <> 29152 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 480, readEffective:call(words, 480)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:358
//		DDOUBL			# YIELDS -CNTRIB TO -DELATTX FROM -DELGMBY
// slot 27388
                        if slot <> 27388 or instruction <> 8193 { return choose false if checkOnly else -1. }
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
                if slot <= 27389 {
// FINDCDUW--GUIDAP_INTERFACE.agc:359
//		ADS	-DELGMB		# -DELGMBX.  NO OVERFLOW SINCE LIMITED TO
// slot 27389
                    if slot <> 27389 or instruction <> 12221 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 957).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27390 {
// FINDCDUW--GUIDAP_INTERFACE.agc:360
//					# 20DEG(1+SIN(70DEG)/COS(70DEG)) < 180DEG
// FINDCDUW--GUIDAP_INTERFACE.agc:361
//
// FINDCDUW--GUIDAP_INTERFACE.agc:362
//# Page 917
// FINDCDUW--GUIDAP_INTERFACE.agc:363
//# COMPUTE COMMANDED ATTITUDE RATES
// FINDCDUW--GUIDAP_INTERFACE.agc:364
//#
// FINDCDUW--GUIDAP_INTERFACE.agc:365
//#	[ OMEGAPD ]   [ -2         -4 SINCDUZ              +0    ] [ -DELGMBZ ]
// FINDCDUW--GUIDAP_INTERFACE.agc:366
//#	[         ]   [                                          ] [          ]
// FINDCDUW--GUIDAP_INTERFACE.agc:367
//#	[ OMEGAQD ] = [ +0     -8 COSCDUZ COSCDUX     -4 SINCDUX ] [ -DELGMBY ]
// FINDCDUW--GUIDAP_INTERFACE.agc:368
//#	[         ]   [                                          ] [          ]
// FINDCDUW--GUIDAP_INTERFACE.agc:369
//#	[ OMEGARD ]   [ +0     +8 COSCDUZ SINCDUX     -4 COSCDUX ] [ -DELGMBZ ]
// FINDCDUW--GUIDAP_INTERFACE.agc:370
//#
// FINDCDUW--GUIDAP_INTERFACE.agc:371
//# ATTITUDE ANGLE RATES IN UNITS OF PI/4 RAD/SEC = K TRIG FCNS IN UNITS OF 2 X GIMBAL ANGLE RATES IN UNITS OF
// FINDCDUW--GUIDAP_INTERFACE.agc:372
//# PI/2 RAD/SEC.  THE CONSTANTS ARE BASED ON DELGMB BEING THE GIMBAL ANGLE CHANGES IN UNITS OF PI RADIANS,
// FINDCDUW--GUIDAP_INTERFACE.agc:373
//# AND 2 SECONDS BEING THE COMPUTATION PERIOD (THE PERIOD BETWEEN SUCCESSIVE PASSES THRU FINDCDUW).
// FINDCDUW--GUIDAP_INTERFACE.agc:374
//
// FINDCDUW--GUIDAP_INTERFACE.agc:375
//		CS	-DELGMB
// slot 27390
                        if slot <> 27390 or instruction <> 17341 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 957).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:376
//		TS	OMEGAPD
// slot 27391
                        if slot <> 27391 or instruction <> 23459 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23459, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 27397 {
            if slot <= 27394 {
                if slot <= 27392 {
// FINDCDUW--GUIDAP_INTERFACE.agc:377
//		CS	-DELGMB +1
// slot 27392
                    if slot <> 27392 or instruction <> 17342 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 958).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27393 {
// FINDCDUW--GUIDAP_INTERFACE.agc:378
//		EXTEND
// slot 27393
                        if slot <> 27393 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:379
//		MP	SINCDUZ
// slot 27394
                        if slot <> 27394 or instruction <> 29152 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 480, readEffective:call(words, 480)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 27395 {
// FINDCDUW--GUIDAP_INTERFACE.agc:380
//		DDOUBL
// slot 27395
                    if slot <> 27395 or instruction <> 8193 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 1) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27396 {
// FINDCDUW--GUIDAP_INTERFACE.agc:381
//		ADS	OMEGAPD
// slot 27396
                        if slot <> 27396 or instruction <> 12195 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 931).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:382
//		ADS	OMEGAPD
// slot 27397
                        if slot <> 27397 or instruction <> 12195 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 931).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 27400 {
                if slot <= 27398 {
// FINDCDUW--GUIDAP_INTERFACE.agc:383
//
// FINDCDUW--GUIDAP_INTERFACE.agc:384
//		CS	-DELGMB +1
// slot 27398
                    if slot <> 27398 or instruction <> 17342 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 958).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27399 {
// FINDCDUW--GUIDAP_INTERFACE.agc:385
//		EXTEND
// slot 27399
                        if slot <> 27399 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:386
//		MP	COSCDUX
// slot 27400
                        if slot <> 27400 or instruction <> 29160 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 488, readEffective:call(words, 488)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 27401 {
// FINDCDUW--GUIDAP_INTERFACE.agc:387
//		DDOUBL
// slot 27401
                    if slot <> 27401 or instruction <> 8193 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 1) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27402 {
// FINDCDUW--GUIDAP_INTERFACE.agc:388
//		EXTEND
// slot 27402
                        if slot <> 27402 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:389
//		MP	COSCDUZ
// slot 27403
                        if slot <> 27403 or instruction <> 29158 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 486, readEffective:call(words, 486)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1725] to agcAotUnit1725@.

// bank 30, slots 27404-27426
function agcAotUnit1726 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27414 {
        if slot <= 27408 {
            if slot <= 27405 {
                if slot <= 27404 {
// FINDCDUW--GUIDAP_INTERFACE.agc:390
//		TS	OMEGAQD
// slot 27404
                    if slot <> 27404 or instruction <> 23460 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23460, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:391
//		CS	-DELGMB +2
// slot 27405
                    if slot <> 27405 or instruction <> 17343 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 959).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 27406 {
// FINDCDUW--GUIDAP_INTERFACE.agc:392
//		EXTEND
// slot 27406
                    if slot <> 27406 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27407 {
// FINDCDUW--GUIDAP_INTERFACE.agc:393
//		MP	SINCDUX
// slot 27407
                        if slot <> 27407 or instruction <> 29154 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 482, readEffective:call(words, 482)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:394
//		ADS	OMEGAQD
// slot 27408
                        if slot <> 27408 or instruction <> 12196 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 932).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 27411 {
                if slot <= 27409 {
// FINDCDUW--GUIDAP_INTERFACE.agc:395
//		ADS	OMEGAQD
// slot 27409
                    if slot <> 27409 or instruction <> 12196 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 932).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27410 {
// FINDCDUW--GUIDAP_INTERFACE.agc:396
//		ADS	OMEGAQD
// slot 27410
                        if slot <> 27410 or instruction <> 12196 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 932).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:397
//
// FINDCDUW--GUIDAP_INTERFACE.agc:398
//		CA	-DELGMB +1
// slot 27411
                        if slot <> 27411 or instruction <> 13246 { return choose false if checkOnly else -1. }
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
                if slot <= 27412 {
// FINDCDUW--GUIDAP_INTERFACE.agc:399
//		EXTEND
// slot 27412
                    if slot <> 27412 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27413 {
// FINDCDUW--GUIDAP_INTERFACE.agc:400
//		MP	SINCDUX
// slot 27413
                        if slot <> 27413 or instruction <> 29154 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 482, readEffective:call(words, 482)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:401
//		DDOUBL
// slot 27414
                        if slot <> 27414 or instruction <> 8193 { return choose false if checkOnly else -1. }
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
    } else {
        if slot <= 27420 {
            if slot <= 27417 {
                if slot <= 27415 {
// FINDCDUW--GUIDAP_INTERFACE.agc:402
//		EXTEND
// slot 27415
                    if slot <> 27415 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27416 {
// FINDCDUW--GUIDAP_INTERFACE.agc:403
//		MP	COSCDUZ
// slot 27416
                        if slot <> 27416 or instruction <> 29158 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 486, readEffective:call(words, 486)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:404
//		TS	OMEGARD
// slot 27417
                        if slot <> 27417 or instruction <> 23461 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23461, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 27418 {
// FINDCDUW--GUIDAP_INTERFACE.agc:405
//		CS	-DELGMB +2
// slot 27418
                    if slot <> 27418 or instruction <> 17343 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 959).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27419 {
// FINDCDUW--GUIDAP_INTERFACE.agc:406
//		EXTEND
// slot 27419
                        if slot <> 27419 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:407
//		MP	COSCDUX
// slot 27420
                        if slot <> 27420 or instruction <> 29160 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 488, readEffective:call(words, 488)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 27423 {
                if slot <= 27421 {
// FINDCDUW--GUIDAP_INTERFACE.agc:408
//		ADS	OMEGARD
// slot 27421
                    if slot <> 27421 or instruction <> 12197 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 933).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27422 {
// FINDCDUW--GUIDAP_INTERFACE.agc:409
//		ADS	OMEGARD
// slot 27422
                        if slot <> 27422 or instruction <> 12197 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 933).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:410
//		ADS	OMEGARD
// slot 27423
                        if slot <> 27423 or instruction <> 12197 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 933).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 27424 {
// FINDCDUW--GUIDAP_INTERFACE.agc:411
//
// FINDCDUW--GUIDAP_INTERFACE.agc:412
//# Page 918
// FINDCDUW--GUIDAP_INTERFACE.agc:413
//# FINAL TRANSFER
// FINDCDUW--GUIDAP_INTERFACE.agc:414
//
// FINDCDUW--GUIDAP_INTERFACE.agc:415
//		CA	TWO
// slot 27424
                    if slot <> 27424 or instruction <> 14826 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27425 {
// FINDCDUW--GUIDAP_INTERFACE.agc:416
//CDUWXFR		TS	TEM2
// slot 27425
                        if slot <> 27425 or instruction <> 22626 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22626, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:417
//		INDEX	TEM2
// slot 27426
                        if slot <> 27426 or instruction <> 20578 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20578, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 20578, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1726] to agcAotUnit1726@.

agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:418
//		CA	-DELGMB
// slot 27427
    27427, 26490
)).

// bank 30, slots 27428-27431
function agcAotUnit1727 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27429 {
        if slot <= 27428 {
// FINDCDUW--GUIDAP_INTERFACE.agc:419
//		EXTEND
// slot 27428
            if slot <> 27428 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:420
//		MP	DT/DELT		# RATIO OF DAP INTERVAL TO CDUW INTERVAL
// slot 27429
            if slot <> 27429 or instruction <> 30716 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 2044, readEffective:call(words, 2044)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 27430 {
// FINDCDUW--GUIDAP_INTERFACE.agc:421
//		TC	ONESTO2S
// slot 27430
            if slot <> 27430 or instruction <> 2019 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2019, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:422
//		INDEX	TEM2
// slot 27431
            if slot <> 27431 or instruction <> 20578 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20578, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20578, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1727] to agcAotUnit1727@.

agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:423
//		TS	DELCDUX		# ANGLE INTERFACE
// slot 27432
    27432, 46912
)).

// bank 30, slots 27433-27433
function agcAotUnit1728 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// FINDCDUW--GUIDAP_INTERFACE.agc:424
//
// FINDCDUW--GUIDAP_INTERFACE.agc:425
//		INDEX	TEM2
// slot 27433
    if slot <> 27433 or instruction <> 20578 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20578, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20578, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1728] to agcAotUnit1728@.

agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:426
//		CCS	OMEGAPD
// slot 27434
    27434, 10054
)).

// bank 30, slots 27435-27439
function agcAotUnit1729 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27436 {
        if slot <= 27435 {
// FINDCDUW--GUIDAP_INTERFACE.agc:427
//		AD	ONE
// slot 27435
            if slot <> 27435 or instruction <> 27115 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:428
//		TCF	+2
// slot 27436
            if slot <> 27436 or instruction <> 5934 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5934, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 27437 {
// FINDCDUW--GUIDAP_INTERFACE.agc:429
//		AD	ONE
// slot 27437
            if slot <> 27437 or instruction <> 27115 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 27438 {
// FINDCDUW--GUIDAP_INTERFACE.agc:430
//		EXTEND			# WE NOW HAVE ABS(OMEGAPD,QD,RD)
// slot 27438
                if slot <> 27438 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:431
//		INDEX	TEM2
// slot 27439
                if slot <> 27439 or instruction <> 20578 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20578, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20578, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1729] to agcAotUnit1729@.

agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:432
//		MP	OMEGAPD
// slot 27440
    27440, 59206
)).

// bank 30, slots 27441-27444
function agcAotUnit1730 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27442 {
        if slot <= 27441 {
// FINDCDUW--GUIDAP_INTERFACE.agc:433
//		EXTEND
// slot 27441
            if slot <> 27441 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:434
//		MP	BIT11		# 1/16
// slot 27442
            if slot <> 27442 or instruction <> 31201 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 2529, readEffective:call(words, 2529)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 27443 {
// FINDCDUW--GUIDAP_INTERFACE.agc:435
//		EXTEND
// slot 27443
            if slot <> 27443 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:436
//		INDEX	TEM2		#                  2
// slot 27444
            if slot <> 27444 or instruction <> 20578 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20578, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20578, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1730] to agcAotUnit1730@.

agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:437
//		DV	1JACC		# UNITS PI/4 RAD/SEC
// slot 27445
    27445, 9904
)).

// bank 30, slots 27446-27449
function agcAotUnit1731 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27447 {
        if slot <= 27446 {
// FINDCDUW--GUIDAP_INTERFACE.agc:438
//		TS	L
// slot 27446
            if slot <> 27446 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:439
//		CA	DELERLIM
// slot 27447
            if slot <> 27447 or instruction <> 14329 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2041), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 27448 {
// FINDCDUW--GUIDAP_INTERFACE.agc:440
//		TC	LIMITSUB
// slot 27448
            if slot <> 27448 or instruction <> 2007 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2007, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:441
//		INDEX	TEM2
// slot 27449
            if slot <> 27449 or instruction <> 20578 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20578, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20578, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1731] to agcAotUnit1731@.

agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:442
//		TS	DELPEROR	# LAG ANGLE = OMEGA ABS(OMEGA)/2 ACCEL
// slot 27450
    27450, 46462
)).

// bank 30, slots 27451-27455
function agcAotUnit1732 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27452 {
        if slot <= 27451 {
// FINDCDUW--GUIDAP_INTERFACE.agc:443
//		CCS	TEM2
// slot 27451
            if slot <> 27451 or instruction <> 4194 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 98).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:444
//		TCF	CDUWXFR
// slot 27452
            if slot <> 27452 or instruction <> 5921 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5921, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 27453 {
// FINDCDUW--GUIDAP_INTERFACE.agc:445
//
// FINDCDUW--GUIDAP_INTERFACE.agc:446
//# HAUSKEEPING AND RETURN
// FINDCDUW--GUIDAP_INTERFACE.agc:447
//
// FINDCDUW--GUIDAP_INTERFACE.agc:448
//TCQCDUW		CA	ECDUWUSR
// slot 27453
            if slot <> 27453 or instruction <> 13222 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 934).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 27454 {
// FINDCDUW--GUIDAP_INTERFACE.agc:449
//		TS	EBANK		# RETURN USER'S EBANK
// slot 27454
                if slot <> 27454 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:450
//
// FINDCDUW--GUIDAP_INTERFACE.agc:451
//		TC	INTPRET
// slot 27455
                if slot <> 27455 or instruction <> 3103 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3103, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1732] to agcAotUnit1732@.

agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:452
//		SETPD	GOTO
// slot 27456
    27456, 43010,
// FINDCDUW--GUIDAP_INTERFACE.agc:453
//			0
// slot 27457
    27457, 2,
// FINDCDUW--GUIDAP_INTERFACE.agc:454
//			QCDUWUSR	# NORMAL AND ABNORMAL RETURN TO USER
// slot 27458
    27458, 3406
)).

// bank 30, slots 27459-27465
function agcAotUnit1733 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27461 {
        if slot <= 27459 {
// FINDCDUW--GUIDAP_INTERFACE.agc:455
//
// FINDCDUW--GUIDAP_INTERFACE.agc:456
//# Page 919
// FINDCDUW--GUIDAP_INTERFACE.agc:457
//# THRUST VECTOR FILTER SUBROUTINE
// FINDCDUW--GUIDAP_INTERFACE.agc:458
//
// FINDCDUW--GUIDAP_INTERFACE.agc:459
//FLTRSUB		EXTEND
// slot 27459
            if slot <> 27459 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 27460 {
// FINDCDUW--GUIDAP_INTERFACE.agc:460
//		QXCH	TEM2
// slot 27460
                if slot <> 27460 or instruction <> 9314 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 98, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:461
//		TS	TEM3		# SAVE ORIGINAL OFFSET
// slot 27461
                if slot <> 27461 or instruction <> 22627 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22627, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 27463 {
            if slot <= 27462 {
// FINDCDUW--GUIDAP_INTERFACE.agc:462
//		COM			# ONE MCT, NO WDS, CAN BE SAVED IF NEG OF
// slot 27462
                if slot <> 27462 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:463
//		AD	L		#	ORIG OFFSET ARRIVES IN A, BUT IT'S
// slot 27463
                if slot <> 27463 or instruction <> 24577 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 1).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27464 {
// FINDCDUW--GUIDAP_INTERFACE.agc:464
//		EXTEND			# 	NOT WORTH THE INCREASED OBSCURITY.
// slot 27464
                if slot <> 27464 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:465
//		INDEX	NDXCDUW
// slot 27465
                if slot <> 27465 or instruction <> 21416 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21416, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21416, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1733] to agcAotUnit1733@.

agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:466
//		MP	GAINFLTR
// slot 27466
    27466, 61412
)).

// bank 30, slots 27467-27474
function agcAotUnit1734 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27470 {
        if slot <= 27468 {
            if slot <= 27467 {
// FINDCDUW--GUIDAP_INTERFACE.agc:467
//		TS	L		# INCR TO OFFSET, UNLIMITED
// slot 27467
                if slot <> 27467 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:468
//		CA	DUNFVLIM	# SAME LIMIT FOR Y AND Z
// slot 27468
                if slot <> 27468 or instruction <> 14324 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2036), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27469 {
// FINDCDUW--GUIDAP_INTERFACE.agc:469
//		TC	LIMITSUB	# YIELDS INCR TO OFFSET, LIMITED
// slot 27469
                if slot <> 27469 or instruction <> 2007 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2007, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:470
//		AD	TEM3		# ORIGINAL OFFSET
// slot 27470
                if slot <> 27470 or instruction <> 24675 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 99).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 27472 {
            if slot <= 27471 {
// FINDCDUW--GUIDAP_INTERFACE.agc:471
//		TS	L		# TOTAL OFFSET, UNLIMITED
// slot 27471
                if slot <> 27471 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:472
//		CA	UNFVLIM		# SAME LIMIT FOR Y AND Z
// slot 27472
                if slot <> 27472 or instruction <> 14325 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2037), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27473 {
// FINDCDUW--GUIDAP_INTERFACE.agc:473
//		TC	LIMITSUB	# YIELDS TOTAL OFFSET, LIMITED
// slot 27473
                if slot <> 27473 or instruction <> 2007 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2007, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:474
//		TC	TEM2
// slot 27474
                if slot <> 27474 or instruction <> 98 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 98, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1734] to agcAotUnit1734@.

agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:475
//
// FINDCDUW--GUIDAP_INTERFACE.agc:476
//# SUBR TO TEST THE ANGLE BETWEEN THE PROPOSED WINDOW AND THRUST CMD VCTS
// FINDCDUW--GUIDAP_INTERFACE.agc:477
//
// FINDCDUW--GUIDAP_INTERFACE.agc:478
//UNWCTEST 	DOT	DSQ
// slot 27475
    27475, 52802,
// FINDCDUW--GUIDAP_INTERFACE.agc:479
//			UNX/2
// slot 27476
    27476, 2,
// FINDCDUW--GUIDAP_INTERFACE.agc:480
//		DSU	BMN
// slot 27477
    27477, 41002,
// FINDCDUW--GUIDAP_INTERFACE.agc:481
//			DOTSWFMX
// slot 27478
    27478, 18414,
// FINDCDUW--GUIDAP_INTERFACE.agc:482
//			DCMCL
// slot 27479
    27479, 50484,
// FINDCDUW--GUIDAP_INTERFACE.agc:483
//		SSP	RVQ		# RVQ FOR ALT CHOICE IF DOT MAGN TOO LARGE
// slot 27480
    27480, 36530,
// FINDCDUW--GUIDAP_INTERFACE.agc:484
//			FLAGOODW	# 	ZEROING WINDOW GOOD FLAG
// slot 27481
    27481, 3412,
// FINDCDUW--GUIDAP_INTERFACE.agc:485
//			0
// slot 27482
    27482, 0,
// FINDCDUW--GUIDAP_INTERFACE.agc:486
//
// FINDCDUW--GUIDAP_INTERFACE.agc:487
//# Page 920
// FINDCDUW--GUIDAP_INTERFACE.agc:488
//# NB2CDUSP RETURNS THE 2'S COMPLEMENT, PI, SP CDU ANGLES X,Y,Z IN MPAC,+1,+2 GIVEN THE MATRIX WHOSE ROW VECTORS
// FINDCDUW--GUIDAP_INTERFACE.agc:489
//# ARE THE SEMI-UNIT NAV BASE VECTORS X,Y,X EXPRESSED IN STABLE MEMBER COORDINATES, LOCATED AT 0 IN THE PUSH LIST.
// FINDCDUW--GUIDAP_INTERFACE.agc:490
//# NB2CDUSP USES THE ARCTRGSP WHICH HAS A MAXIMUM ERROR OF +-4 BITS.
// FINDCDUW--GUIDAP_INTERFACE.agc:491
//
// FINDCDUW--GUIDAP_INTERFACE.agc:492
//NB2CDUSP	DLOAD	DSQ
// slot 27483
    27483, 52938,
// FINDCDUW--GUIDAP_INTERFACE.agc:493
//			2
// slot 27484
    27484, 6,
// FINDCDUW--GUIDAP_INTERFACE.agc:494
//		BDSU	BPL
// slot 27485
    27485, 42018,
// FINDCDUW--GUIDAP_INTERFACE.agc:495
//			DP1/4TH
// slot 27486
    27486, 6804,
// FINDCDUW--GUIDAP_INTERFACE.agc:496
//			+3
// slot 27487
    27487, 50884,
// FINDCDUW--GUIDAP_INTERFACE.agc:497
//		DLOAD
// slot 27488
    27488, 65482,
// FINDCDUW--GUIDAP_INTERFACE.agc:498
//			ZEROVECS	# IN CASE SIN WAS SLIGHTLY > 1/2
// slot 27489
    27489, 6820,
// FINDCDUW--GUIDAP_INTERFACE.agc:499
//		SQRT	EXIT		# YIELDS COS(CDUZ) IN UNITS OF 2
// slot 27490
    27490, 65260
)).

// bank 30, slots 27491-27498
function agcAotUnit1735 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27494 {
        if slot <= 27492 {
            if slot <= 27491 {
// FINDCDUW--GUIDAP_INTERFACE.agc:500
//
// FINDCDUW--GUIDAP_INTERFACE.agc:501
//		EXTEND
// slot 27491
                if slot <> 27491 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:502
//		DCA	MPAC
// slot 27492
                if slot <> 27492 or instruction <> 12397 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 109, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27493 {
// FINDCDUW--GUIDAP_INTERFACE.agc:503
//		DDOUBL
// slot 27493
                if slot <> 27493 or instruction <> 8193 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 1) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:504
//		TS	TEM5
// slot 27494
                if slot <> 27494 or instruction <> 22629 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22629, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 27496 {
            if slot <= 27495 {
// FINDCDUW--GUIDAP_INTERFACE.agc:505
//		TCF	+3
// slot 27495
                if slot <> 27495 or instruction <> 5994 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5994, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:506
//		CA	POSMAX		# OVERFLOW.  FETCH POSMAX, MPAC ALWAYS POS
// slot 27496
                if slot <> 27496 or instruction <> 14811 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27497 {
// FINDCDUW--GUIDAP_INTERFACE.agc:507
//		TS	TEM5		# COS(CDUZ) IN TEM5, UNITS 1
// slot 27497
                if slot <> 27497 or instruction <> 22629 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22629, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:508
//
// FINDCDUW--GUIDAP_INTERFACE.agc:509
//		INDEX	FIXLOC
// slot 27498
                if slot <> 27498 or instruction <> 20560 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[1735] to agcAotUnit1735@.

agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:510
//		CA	2
// slot 27499
    27499, 24580
)).

// bank 30, slots 27500-27517
function agcAotUnit1736 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27508 {
        if slot <= 27503 {
            if slot <= 27501 {
                if slot <= 27500 {
// FINDCDUW--GUIDAP_INTERFACE.agc:511
//		LXCH	MPAC
// slot 27500
                    if slot <> 27500 or instruction <> 9324 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 108, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:512
//		TC	ARCTRGSP
// slot 27501
                    if slot <> 27501 or instruction <> 1938 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1938, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 27502 {
// FINDCDUW--GUIDAP_INTERFACE.agc:513
//		TS	MPAC +2		# CDUZ
// slot 27502
                    if slot <> 27502 or instruction <> 22638 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22638, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:514
//
// FINDCDUW--GUIDAP_INTERFACE.agc:515
//		CA	ZERO
// slot 27503
                    if slot <> 27503 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 27505 {
                if slot <= 27504 {
// FINDCDUW--GUIDAP_INTERFACE.agc:516
//		TC	DVBYCOSM
// slot 27504
                    if slot <> 27504 or instruction <> 1920 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1920, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:517
//		CA	FOUR
// slot 27505
                    if slot <> 27505 or instruction <> 14825 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 27506 {
// FINDCDUW--GUIDAP_INTERFACE.agc:518
//		TC	DVBYCOSM
// slot 27506
                    if slot <> 27506 or instruction <> 1920 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1920, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27507 {
// FINDCDUW--GUIDAP_INTERFACE.agc:519
//		CS	TEM1
// slot 27507
                        if slot <> 27507 or instruction <> 16481 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 97).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:520
//		TC	ARCTRGSP
// slot 27508
                        if slot <> 27508 or instruction <> 1938 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1938, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 27512 {
            if slot <= 27510 {
                if slot <= 27509 {
// FINDCDUW--GUIDAP_INTERFACE.agc:521
//		TS	MPAC +1		# CDUY
// slot 27509
                    if slot <> 27509 or instruction <> 22637 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22637, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:522
//
// FINDCDUW--GUIDAP_INTERFACE.agc:523
//		CA	BIT4
// slot 27510
                    if slot <> 27510 or instruction <> 14824 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 27511 {
// FINDCDUW--GUIDAP_INTERFACE.agc:524
//		TC	DVBYCOSM
// slot 27511
                    if slot <> 27511 or instruction <> 1920 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1920, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:525
//		CA	16OCT
// slot 27512
                    if slot <> 27512 or instruction <> 14207 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1919), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 27514 {
                if slot <= 27513 {
// FINDCDUW--GUIDAP_INTERFACE.agc:526
//		TC	DVBYCOSM
// slot 27513
                    if slot <> 27513 or instruction <> 1920 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1920, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:527
//		CS	TEM1
// slot 27514
                    if slot <> 27514 or instruction <> 16481 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 97).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 27515 {
// FINDCDUW--GUIDAP_INTERFACE.agc:528
//		TC	ARCTRGSP
// slot 27515
                    if slot <> 27515 or instruction <> 1938 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1938, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27516 {
// FINDCDUW--GUIDAP_INTERFACE.agc:529
//		TS	MPAC		# CDUX
// slot 27516
                        if slot <> 27516 or instruction <> 22636 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22636, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:530
//
// FINDCDUW--GUIDAP_INTERFACE.agc:531
//		TC	INTPRET
// slot 27517
                        if slot <> 27517 or instruction <> 3103 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3103, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1736] to agcAotUnit1736@.

agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:532
//		RVQ
// slot 27518
    27518, 65308,
// FINDCDUW--GUIDAP_INTERFACE.agc:533
//
// FINDCDUW--GUIDAP_INTERFACE.agc:534
//16OCT		OCT	16
// slot 27519
    27519, 28
)).

// bank 30, slots 27520-27522
function agcAotUnit1737 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27520 {
// FINDCDUW--GUIDAP_INTERFACE.agc:535
//
// FINDCDUW--GUIDAP_INTERFACE.agc:536
//# Page 921
// FINDCDUW--GUIDAP_INTERFACE.agc:537
//# THE ELEMENTS OF THE NAV BASE MATRIX WHICH WE MUST DIVIDE BY COS(MGA)
// FINDCDUW--GUIDAP_INTERFACE.agc:538
//# ALREADY CONTAIN COS(MGA)/2 AS A FACTOR. THEREFORE THE QUOTIENT SHOULD
// FINDCDUW--GUIDAP_INTERFACE.agc:539
//# ORDINARILY NEVER EXCEED 1/2 IN MAGNITUDE.  BUT IF THE MGA IS NEAR PI/2
// FINDCDUW--GUIDAP_INTERFACE.agc:540
//# THEN COS(MGA) IS NEAR ZERO, AND THERE MAY BE SOME CHAFF IN THE OTHER
// FINDCDUW--GUIDAP_INTERFACE.agc:541
//# ELEMENTS OF THE MATRIX WHICH WOULD PRODUCE CHAOS UNDER DIVISION.
// FINDCDUW--GUIDAP_INTERFACE.agc:542
//# BEFORE DIVIDING WE MAKE SURE COS(MGA) IS AT LEAST ONE BIT LARGER
// FINDCDUW--GUIDAP_INTERFACE.agc:543
//# THAN THE MAGNITUDE OF THE HIGH ORDER PART OF THE OPERAND.
// FINDCDUW--GUIDAP_INTERFACE.agc:544
//#
// FINDCDUW--GUIDAP_INTERFACE.agc:545
//# IF ONE OR MORE DIVIDES CANNOT BE PERFORMED, THIS MEANS THAT THE
// FINDCDUW--GUIDAP_INTERFACE.agc:546
//# REQUIRED MGA IS VERY NEARLY +-PI/2 AND THEREFORE THE OTHER GIMBAL
// FINDCDUW--GUIDAP_INTERFACE.agc:547
//# ANGLES ARE INDETERMINATE.  THE INNER AND OUTER GIMBAL ANGLES RETURNED
// FINDCDUW--GUIDAP_INTERFACE.agc:548
//# IN THIS CASE WILL BE RANDOM MULTIPLES OF PI/2.
// FINDCDUW--GUIDAP_INTERFACE.agc:549
//
// FINDCDUW--GUIDAP_INTERFACE.agc:550
//DVBYCOSM	AD	FIXLOC
// slot 27520
        if slot <> 27520 or instruction <> 24656 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreAD(words, 80).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 27521 {
// FINDCDUW--GUIDAP_INTERFACE.agc:551
//		TS	ADDRWD		# ADRES OF OPERAND
// slot 27521
            if slot <> 27521 or instruction <> 22606 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22606, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:552
//
// FINDCDUW--GUIDAP_INTERFACE.agc:553
//		INDEX	ADDRWD		# FETCH NEG ABS OF OPERAND, AD TEM5, AND
// slot 27522
            if slot <> 27522 or instruction <> 20558 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20558, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20558, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1737] to agcAotUnit1737@.

agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:554
//		CA	0		#	SKIP DIVIDE IF RESULT NEG OR ZERO
// slot 27523
    27523, 24576
)).

// bank 30, slots 27524-27531
function agcAotUnit1738 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27527 {
        if slot <= 27525 {
            if slot <= 27524 {
// FINDCDUW--GUIDAP_INTERFACE.agc:555
//		EXTEND
// slot 27524
                if slot <> 27524 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:556
//		BZMF	+2
// slot 27525
                if slot <> 27525 or instruction <> 26503 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26503, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27526 {
// FINDCDUW--GUIDAP_INTERFACE.agc:557
//		COM
// slot 27526
                if slot <> 27526 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:558
//		AD	TEM5		# C(A) ZERO OR NEG, C(TEM5) ZERO OR POS
// slot 27527
                if slot <> 27527 or instruction <> 24677 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 101).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 27529 {
            if slot <= 27528 {
// FINDCDUW--GUIDAP_INTERFACE.agc:559
//		EXTEND
// slot 27528
                if slot <> 27528 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:560
//		BZMF	TSL&TCQ		# DIFFERENCE ALWAYS SMALL IF BRANCH
// slot 27529
                if slot <> 27529 or instruction <> 26511 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26511, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27530 {
// FINDCDUW--GUIDAP_INTERFACE.agc:561
//
// FINDCDUW--GUIDAP_INTERFACE.agc:562
//		EXTEND			# TEM5 EXCEEDS ABS HIGH ORDER PART OF
// slot 27530
                if slot <> 27530 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:563
//		INDEX	ADDRWD		#	OPERAND BY AT LEAST ONE BIT.
// slot 27531
                if slot <> 27531 or instruction <> 20558 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20558, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20558, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1738] to agcAotUnit1738@.

agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:564
//		DCA	0		#	THEREFORE IT EXCEEDS THE DP OPERAND
// slot 27532
    27532, 24578
)).

// bank 30, slots 27533-27562
function agcAotUnit1739 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27547 {
        if slot <= 27539 {
            if slot <= 27535 {
                if slot <= 27533 {
// FINDCDUW--GUIDAP_INTERFACE.agc:565
//		EXTEND			# 	AND DIVISION WILL ALWAYS SUCCEED.
// slot 27533
                    if slot <> 27533 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27534 {
// FINDCDUW--GUIDAP_INTERFACE.agc:566
//		DV	TEM5
// slot 27534
                        if slot <> 27534 or instruction <> 4197 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreDv(words, 101, readEffective:call(words, 101)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:567
//TSL&TCQ		TS	L
// slot 27535
                        if slot <> 27535 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 27537 {
                    if slot <= 27536 {
// FINDCDUW--GUIDAP_INTERFACE.agc:568
//		LXCH	TEM1
// slot 27536
                        if slot <> 27536 or instruction <> 9313 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 97, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:569
//		TC	Q
// slot 27537
                        if slot <> 27537 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 27538 {
// FINDCDUW--GUIDAP_INTERFACE.agc:570
//
// FINDCDUW--GUIDAP_INTERFACE.agc:571
//# Page 922
// FINDCDUW--GUIDAP_INTERFACE.agc:572
//# ARCTRGSP RETURNS THE 2'S COMPLEMENT, PI, SP ANGLE IN THE A REGISTER GIVEN ITS SINE IN A AND ITS COSINE IN L IN
// FINDCDUW--GUIDAP_INTERFACE.agc:573
//# UNITS OF 2.  THE RESULT IS AN UNAMBIGUOUS ANGLE ANYWHERE IN THE CIRCLE, WITH A MAXIMUM ERROR OF +-4 BITS.
// FINDCDUW--GUIDAP_INTERFACE.agc:574
//# THE ERROR IS PRODUCED BY THE SUBROUTINE SPARCSIN WHICH IS USED ONLY IN THE REGION +-45 DEGREES.
// FINDCDUW--GUIDAP_INTERFACE.agc:575
//
// FINDCDUW--GUIDAP_INTERFACE.agc:576
//ARCTRGSP	EXTEND
// slot 27538
                        if slot <> 27538 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:577
//		BZF	SINZERO		# TO AVOID DIVIDING BY ZERO
// slot 27539
                        if slot <> 27539 or instruction <> 6069 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6069, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 27543 {
                if slot <= 27541 {
                    if slot <= 27540 {
// FINDCDUW--GUIDAP_INTERFACE.agc:578
//
// FINDCDUW--GUIDAP_INTERFACE.agc:579
//		EXTEND
// slot 27540
                        if slot <> 27540 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:580
//		QXCH	TEM4
// slot 27541
                        if slot <> 27541 or instruction <> 9316 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 2, 100, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 27542 {
// FINDCDUW--GUIDAP_INTERFACE.agc:581
//		TS	TEM2
// slot 27542
                        if slot <> 27542 or instruction <> 22626 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22626, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:582
//		CA	L
// slot 27543
                        if slot <> 27543 or instruction <> 12289 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 1).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 27545 {
                    if slot <= 27544 {
// FINDCDUW--GUIDAP_INTERFACE.agc:583
//		TS	TEM3
// slot 27544
                        if slot <> 27544 or instruction <> 22627 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22627, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:584
//		CA	ZERO
// slot 27545
                        if slot <> 27545 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 27546 {
// FINDCDUW--GUIDAP_INTERFACE.agc:585
//		EXTEND
// slot 27546
                        if slot <> 27546 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:586
//		DV	TEM2
// slot 27547
                        if slot <> 27547 or instruction <> 4194 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreDv(words, 98, readEffective:call(words, 98)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 27554 {
            if slot <= 27550 {
                if slot <= 27548 {
// FINDCDUW--GUIDAP_INTERFACE.agc:587
//		EXTEND
// slot 27548
                    if slot <> 27548 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27549 {
// FINDCDUW--GUIDAP_INTERFACE.agc:588
//		BZF	USECOS
// slot 27549
                        if slot <> 27549 or instruction <> 6060 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6060, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:589
//
// FINDCDUW--GUIDAP_INTERFACE.agc:590
//		CCS	TEM3		# SIN IS SMALLER OR EQUAL
// slot 27550
                        if slot <> 27550 or instruction <> 4195 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 99).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 27552 {
                    if slot <= 27551 {
// FINDCDUW--GUIDAP_INTERFACE.agc:591
//		CA	ZERO
// slot 27551
                        if slot <> 27551 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:592
//		TCF	+4
// slot 27552
                        if slot <> 27552 or instruction <> 6052 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6052, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 27553 {
// FINDCDUW--GUIDAP_INTERFACE.agc:593
//		CS	TEM2		# IF COS NEG, REVERSE SIGN OF SIN,
// slot 27553
                        if slot <> 27553 or instruction <> 16482 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 98).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:594
//		TS	TEM2		#	ANGLE = PI-ARCSIN(SIN)
// slot 27554
                        if slot <> 27554 or instruction <> 22626 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22626, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 27558 {
                if slot <= 27556 {
                    if slot <= 27555 {
// FINDCDUW--GUIDAP_INTERFACE.agc:595
//		CA	NEGMAX		# PICK UP PI, 2'S COMPLEMENT
// slot 27555
                        if slot <> 27555 or instruction <> 14813 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:596
//		TS	TEM3		# WE NO LONGER NEED COS
// slot 27556
                        if slot <> 27556 or instruction <> 22627 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22627, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 27557 {
// FINDCDUW--GUIDAP_INTERFACE.agc:597
//		CA	TEM2
// slot 27557
                        if slot <> 27557 or instruction <> 12386 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 98).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:598
//		TC	SPARCSIN -1
// slot 27558
                        if slot <> 27558 or instruction <> 1978 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1978, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 27560 {
                    if slot <= 27559 {
// FINDCDUW--GUIDAP_INTERFACE.agc:599
//		TC	ONESTO2S
// slot 27559
                        if slot <> 27559 or instruction <> 2019 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2019, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:600
//		EXTEND
// slot 27560
                        if slot <> 27560 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 27561 {
// FINDCDUW--GUIDAP_INTERFACE.agc:601
//		MSU	TEM3
// slot 27561
                        if slot <> 27561 or instruction <> 8291 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMSU(words, 99).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:602
//1TO2&TCQ	TC	ONESTO2S
// slot 27562
                        if slot <> 27562 or instruction <> 2019 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2019, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1739] to agcAotUnit1739@.

// bank 30, slots 27563-27581
function agcAotUnit1740 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27571 {
        if slot <= 27566 {
            if slot <= 27564 {
                if slot <= 27563 {
// FINDCDUW--GUIDAP_INTERFACE.agc:603
//		TC	TEM4
// slot 27563
                    if slot <> 27563 or instruction <> 100 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 100, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:604
//
// FINDCDUW--GUIDAP_INTERFACE.agc:605
//USECOS		CS	TEM3		# COS IS SMALLER
// slot 27564
                    if slot <> 27564 or instruction <> 16483 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 99).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 27565 {
// FINDCDUW--GUIDAP_INTERFACE.agc:606
//		TC	SPARCSIN -1	# ANGLE = SIGN(SIN)(FI/2-ARCSIN(COS))
// slot 27565
                    if slot <> 27565 or instruction <> 1978 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1978, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:607
//		AD	HALF
// slot 27566
                    if slot <> 27566 or instruction <> 27102 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 27568 {
                if slot <= 27567 {
// FINDCDUW--GUIDAP_INTERFACE.agc:608
//		TS	TEM3		# WE NO LONGER NEED COS
// slot 27567
                    if slot <> 27567 or instruction <> 22627 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22627, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:609
//		CCS	TEM2
// slot 27568
                    if slot <> 27568 or instruction <> 4194 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 98).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 27569 {
// FINDCDUW--GUIDAP_INTERFACE.agc:610
//		CA	TEM3
// slot 27569
                    if slot <> 27569 or instruction <> 12387 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 99).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27570 {
// FINDCDUW--GUIDAP_INTERFACE.agc:611
//		TCF	1TO2&TCQ
// slot 27570
                        if slot <> 27570 or instruction <> 6058 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6058, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:612
//		CS	TEM3
// slot 27571
                        if slot <> 27571 or instruction <> 16483 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 99).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 27576 {
            if slot <= 27573 {
                if slot <= 27572 {
// FINDCDUW--GUIDAP_INTERFACE.agc:613
//		TCF	1TO2&TCQ
// slot 27572
                    if slot <> 27572 or instruction <> 6058 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6058, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:614
//
// FINDCDUW--GUIDAP_INTERFACE.agc:615
//SINZERO		CCS	L
// slot 27573
                    if slot <> 27573 or instruction <> 4097 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 27574 {
// FINDCDUW--GUIDAP_INTERFACE.agc:616
//		CA	ZERO
// slot 27574
                    if slot <> 27574 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27575 {
// FINDCDUW--GUIDAP_INTERFACE.agc:617
//		TC	Q
// slot 27575
                        if slot <> 27575 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:618
//		CA	NEGMAX		# PI, 2'S COMP
// slot 27576
                        if slot <> 27576 or instruction <> 14813 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 27578 {
                if slot <= 27577 {
// FINDCDUW--GUIDAP_INTERFACE.agc:619
//		TC	Q
// slot 27577
                    if slot <> 27577 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:620
//
// FINDCDUW--GUIDAP_INTERFACE.agc:621
//# Page 923
// FINDCDUW--GUIDAP_INTERFACE.agc:622
//# SPARCSIN TAKES AN ARGUMENT SCALED UNITY IN A AND RETURNS AN ANGLE SCALED
// FINDCDUW--GUIDAP_INTERFACE.agc:623
//# 180 DEGREES IN A.  IT HAS BEEN UNIT TESTED IN THE REGION +-.94 (+-70
// FINDCDUW--GUIDAP_INTERFACE.agc:624
//# DEGREES) AND THE MAXIMUM ERROR IS +-5 BITS WITH AN AVERAGE TIME OF
// FINDCDUW--GUIDAP_INTERFACE.agc:625
//# 450 MICROSECONDS.  SPARCSIN -1 TAKES THE ARGUMENT SCALED TWO.  (BOB CRISP)
// FINDCDUW--GUIDAP_INTERFACE.agc:626
//
// FINDCDUW--GUIDAP_INTERFACE.agc:627
//		DOUBLE
// slot 27578
                    if slot <> 27578 or instruction <> 24576 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 27579 {
// FINDCDUW--GUIDAP_INTERFACE.agc:628
//SPARCSIN	TS	SR
// slot 27579
                    if slot <> 27579 or instruction <> 22545 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22545, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27580 {
// FINDCDUW--GUIDAP_INTERFACE.agc:629
//		TCF	+4
// slot 27580
                        if slot <> 27580 or instruction <> 6080 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6080, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:630
//		INDEX	A
// slot 27581
                        if slot <> 27581 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1740] to agcAotUnit1740@.

agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:631
//		CS	LIMITS
// slot 27582
    27582, 37816
)).

// bank 30, slots 27583-27601
function agcAotUnit1741 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27591 {
        if slot <= 27586 {
            if slot <= 27584 {
                if slot <= 27583 {
// FINDCDUW--GUIDAP_INTERFACE.agc:632
//		TS	SR
// slot 27583
                    if slot <> 27583 or instruction <> 22545 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22545, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:633
//		EXTEND
// slot 27584
                    if slot <> 27584 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 27585 {
// FINDCDUW--GUIDAP_INTERFACE.agc:634
//		MP	A
// slot 27585
                    if slot <> 27585 or instruction <> 28672 { return choose false if checkOnly else -1. }
                    if extended {
                        if agcOverflowDirection(words[0]) <> 0 { return choose false if checkOnly else -1. }
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 0, readEffective:call(words, 0)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:635
//		TS	TEM1
// slot 27586
                    if slot <> 27586 or instruction <> 22625 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22625, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 27588 {
                if slot <= 27587 {
// FINDCDUW--GUIDAP_INTERFACE.agc:636
//		EXTEND
// slot 27587
                    if slot <> 27587 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:637
//		MP	DPL9
// slot 27588
                    if slot <> 27588 or instruction <> 30678 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 2006, readEffective:call(words, 2006)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 27589 {
// FINDCDUW--GUIDAP_INTERFACE.agc:638
//		AD	DPL7
// slot 27589
                    if slot <> 27589 or instruction <> 26581 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2005), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27590 {
// FINDCDUW--GUIDAP_INTERFACE.agc:639
//		EXTEND
// slot 27590
                        if slot <> 27590 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:640
//		MP	TEM1
// slot 27591
                        if slot <> 27591 or instruction <> 28769 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 97, readEffective:call(words, 97)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 27596 {
            if slot <= 27593 {
                if slot <= 27592 {
// FINDCDUW--GUIDAP_INTERFACE.agc:641
//		AD	DPL5
// slot 27592
                    if slot <> 27592 or instruction <> 26580 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2004), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:642
//		EXTEND
// slot 27593
                    if slot <> 27593 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 27594 {
// FINDCDUW--GUIDAP_INTERFACE.agc:643
//		MP	TEM1
// slot 27594
                    if slot <> 27594 or instruction <> 28769 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 97, readEffective:call(words, 97)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27595 {
// FINDCDUW--GUIDAP_INTERFACE.agc:644
//		AD	DPL3
// slot 27595
                        if slot <> 27595 or instruction <> 26579 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2003), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:645
//		EXTEND
// slot 27596
                        if slot <> 27596 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 27598 {
                if slot <= 27597 {
// FINDCDUW--GUIDAP_INTERFACE.agc:646
//		MP	TEM1
// slot 27597
                    if slot <> 27597 or instruction <> 28769 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 97, readEffective:call(words, 97)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:647
//		AD	DPL1
// slot 27598
                    if slot <> 27598 or instruction <> 26578 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2002), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 27599 {
// FINDCDUW--GUIDAP_INTERFACE.agc:648
//		EXTEND
// slot 27599
                    if slot <> 27599 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27600 {
// FINDCDUW--GUIDAP_INTERFACE.agc:649
//		MP	SR
// slot 27600
                        if slot <> 27600 or instruction <> 28689 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 17, readEffective:call(words, 17)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:650
//		TC	Q
// slot 27601
                        if slot <> 27601 or instruction <> 2 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1741] to agcAotUnit1741@.

agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:651
//DPL1		DEC	10502
// slot 27602
    27602, 21004,
// FINDCDUW--GUIDAP_INTERFACE.agc:652
//DPL3		DEC	432
// slot 27603
    27603, 864,
// FINDCDUW--GUIDAP_INTERFACE.agc:653
//DPL5		DEC	7300
// slot 27604
    27604, 14600,
// FINDCDUW--GUIDAP_INTERFACE.agc:654
//DPL7		DEC	-11803
// slot 27605
    27605, 41928,
// FINDCDUW--GUIDAP_INTERFACE.agc:655
//DPL9		DEC	8397
// slot 27606
    27606, 16794
)).

// bank 30, slots 27607-27624
function agcAotUnit1742 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27615 {
        if slot <= 27610 {
            if slot <= 27608 {
                if slot <= 27607 {
// FINDCDUW--GUIDAP_INTERFACE.agc:656
//
// FINDCDUW--GUIDAP_INTERFACE.agc:657
//# Page 924
// FINDCDUW--GUIDAP_INTERFACE.agc:658
//# LIMITSUB LIMITS THE MAGNITUDE OF THE POSITIVE OR NEGATIVE VARIABLE
// FINDCDUW--GUIDAP_INTERFACE.agc:659
//# ARRIVING IN L TO THE POSITIVE LIMIT ARRIVING IN A.
// FINDCDUW--GUIDAP_INTERFACE.agc:660
//# THE SIGNED LIMITED VARIABLE IS RETURNED IN A.
// FINDCDUW--GUIDAP_INTERFACE.agc:661
//#
// FINDCDUW--GUIDAP_INTERFACE.agc:662
//# VERSION COUTESY HUGH BLAIR-SMITH
// FINDCDUW--GUIDAP_INTERFACE.agc:663
//
// FINDCDUW--GUIDAP_INTERFACE.agc:664
//LIMITSUB	TS	TEM1
// slot 27607
                    if slot <> 27607 or instruction <> 22625 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22625, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:665
//		CA	ZERO
// slot 27608
                    if slot <> 27608 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 27609 {
// FINDCDUW--GUIDAP_INTERFACE.agc:666
//		EXTEND
// slot 27609
                    if slot <> 27609 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:667
//		DV	TEM1
// slot 27610
                    if slot <> 27610 or instruction <> 4193 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreDv(words, 97, readEffective:call(words, 97)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 27612 {
                if slot <= 27611 {
// FINDCDUW--GUIDAP_INTERFACE.agc:668
//		CCS	A
// slot 27611
                    if slot <> 27611 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:669
//		LXCH	TEM1
// slot 27612
                    if slot <> 27612 or instruction <> 9313 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 97, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 27613 {
// FINDCDUW--GUIDAP_INTERFACE.agc:670
//		TCF	+2
// slot 27613
                    if slot <> 27613 or instruction <> 6111 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6111, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27614 {
// FINDCDUW--GUIDAP_INTERFACE.agc:671
//		TCF	+3
// slot 27614
                        if slot <> 27614 or instruction <> 6113 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6113, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:672
//		CA	L
// slot 27615
                        if slot <> 27615 or instruction <> 12289 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 1).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 27619 {
            if slot <= 27617 {
                if slot <= 27616 {
// FINDCDUW--GUIDAP_INTERFACE.agc:673
//		TC	Q
// slot 27616
                    if slot <> 27616 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:674
//		CS	TEM1
// slot 27617
                    if slot <> 27617 or instruction <> 16481 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 97).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 27618 {
// FINDCDUW--GUIDAP_INTERFACE.agc:675
//		TC	Q
// slot 27618
                    if slot <> 27618 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:676
//
// FINDCDUW--GUIDAP_INTERFACE.agc:677
//# SUBROUTINE TO CONVERT 1'S COMP SP TO 2'S COMP
// FINDCDUW--GUIDAP_INTERFACE.agc:678
//
// FINDCDUW--GUIDAP_INTERFACE.agc:679
//ONESTO2S	CCS	A
// slot 27619
                    if slot <> 27619 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
            if slot <= 27621 {
                if slot <= 27620 {
// FINDCDUW--GUIDAP_INTERFACE.agc:680
//		AD	ONE
// slot 27620
                    if slot <> 27620 or instruction <> 27115 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:681
//		TC	Q
// slot 27621
                    if slot <> 27621 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 27622 {
// FINDCDUW--GUIDAP_INTERFACE.agc:682
//		CS	A
// slot 27622
                    if slot <> 27622 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27623 {
// FINDCDUW--GUIDAP_INTERFACE.agc:683
//		TC	Q
// slot 27623
                        if slot <> 27623 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:684
//
// FINDCDUW--GUIDAP_INTERFACE.agc:685
//# NO ATTITUDE CONTROL
// FINDCDUW--GUIDAP_INTERFACE.agc:686
//
// FINDCDUW--GUIDAP_INTERFACE.agc:687
//NOATTCNT	TC	ALARM
// slot 27624
                        if slot <> 27624 or instruction <> 2935 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2935, words[0], readEffective).
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
// FINDCDUW--GUIDAP_INTERFACE.agc:688
//		OCT	00402		# NO ATTITUDE CONTROL
// slot 27625
    27625, 516
)).

// bank 30, slots 27626-27627
function agcAotUnit1743 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27626 {
// FINDCDUW--GUIDAP_INTERFACE.agc:689
//
// FINDCDUW--GUIDAP_INTERFACE.agc:690
// +2		INHINT			# COME HERE FOR NOATTCNT WITHOUT ALARM
// slot 27626
        if slot <> 27626 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:691
// 		TC	IBNKCALL	# RELINT AT TC INTPRET AFTER TCQCDUW
// slot 27627
        if slot <> 27627 or instruction <> 2492 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2492, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1743] to agcAotUnit1743@.

agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:692
//		FCADR	STOPRATE
// slot 27628
    27628, 33002
)).

// bank 30, slots 27629-27630
function agcAotUnit1744 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27629 {
// FINDCDUW--GUIDAP_INTERFACE.agc:693
//		TCF	TCQCDUW		# RETURN TO USER SKIPPING AUTOPILOT CMDS
// slot 27629
        if slot <> 27629 or instruction <> 5949 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5949, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// FINDCDUW--GUIDAP_INTERFACE.agc:694
//
// FINDCDUW--GUIDAP_INTERFACE.agc:695
//# MIDDLE GIMBAL ANGLE ALARM
// FINDCDUW--GUIDAP_INTERFACE.agc:696
//
// FINDCDUW--GUIDAP_INTERFACE.agc:697
//ALARMMGA	TC	ALARM
// slot 27630
        if slot <> 27630 or instruction <> 2935 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2935, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1744] to agcAotUnit1744@.

agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:698
//		OCT	00401
// slot 27631
    27631, 514
)).

// bank 30, slots 27632-27632
function agcAotUnit1745 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// FINDCDUW--GUIDAP_INTERFACE.agc:699
//		TCF	MGARET
// slot 27632
    if slot <> 27632 or instruction <> 5821 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5821, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1745] to agcAotUnit1745@.

agcAotInstallSourceRope(list(
// FINDCDUW--GUIDAP_INTERFACE.agc:700
//
// FINDCDUW--GUIDAP_INTERFACE.agc:701
//# Page 925
// FINDCDUW--GUIDAP_INTERFACE.agc:702
//#******************************************************************
// FINDCDUW--GUIDAP_INTERFACE.agc:703
//# CONSTANTS
// FINDCDUW--GUIDAP_INTERFACE.agc:704
//#******************************************************************
// FINDCDUW--GUIDAP_INTERFACE.agc:705
//
// FINDCDUW--GUIDAP_INTERFACE.agc:706
//# ADDRESS CONSTANTS
// FINDCDUW--GUIDAP_INTERFACE.agc:707
//
// FINDCDUW--GUIDAP_INTERFACE.agc:708
//ECDUWL		ECADR	ECDUW
// slot 27633
    27633, 3404,
// FINDCDUW--GUIDAP_INTERFACE.agc:709
//
// FINDCDUW--GUIDAP_INTERFACE.agc:710
//# THRUST DIRECTION FILTER CONSTANTS
// FINDCDUW--GUIDAP_INTERFACE.agc:711
//
// FINDCDUW--GUIDAP_INTERFACE.agc:712
//GAINFLTR	DEC	.2		# GAIN FILTER SANS CSM
// slot 27634
    27634, 6554,
// FINDCDUW--GUIDAP_INTERFACE.agc:713
//		DEC	.1		# GAIN FILTER WITH CSM
// slot 27635
    27635, 3276,
// FINDCDUW--GUIDAP_INTERFACE.agc:714
//
// FINDCDUW--GUIDAP_INTERFACE.agc:715
//DUNFVLIM	DEC	.007 B-1	# 7 MR MAX CHG IN F DIR IN VEH IN 2 SECS.
// slot 27636
    27636, 114,
// FINDCDUW--GUIDAP_INTERFACE.agc:716
//					# THIS DOES NOT ALLOW FOR S/C ROT RATE.
// FINDCDUW--GUIDAP_INTERFACE.agc:717
//
// FINDCDUW--GUIDAP_INTERFACE.agc:718
//UNFVLIM		DEC	.129 B-1	# 129 MR MAX THRUST OFFSET.  105 MR TRAVEL
// slot 27637
    27637, 2114,
// FINDCDUW--GUIDAP_INTERFACE.agc:719
//					# +10MR DEFL+5MR MECH MOUNT+9MR ABLATION.
// FINDCDUW--GUIDAP_INTERFACE.agc:720
//
// FINDCDUW--GUIDAP_INTERFACE.agc:721
//# CONSTANT RELATED TO GIMBAL ANGLE COMPUTATIONS
// FINDCDUW--GUIDAP_INTERFACE.agc:722
//
// FINDCDUW--GUIDAP_INTERFACE.agc:723
//DOTSWFMX	DEC	.93302 B-4	# LIM COLNRTY OF UNWC/2 & UNFC/2 TO 85 DEG
// slot 27638
    27638, 1910,
// FINDCDUW--GUIDAP_INTERFACE.agc:724
//					# LOWER PART COMES FROM NEXT CONSTANT
// FINDCDUW--GUIDAP_INTERFACE.agc:725
//
// FINDCDUW--GUIDAP_INTERFACE.agc:726
//DAXMAX		DEC	.11111111111	# DELATTX LIM TO 20 DEG IN 2 SECS, 1'S, PI
// slot 27639
    27639, 3640,
// FINDCDUW--GUIDAP_INTERFACE.agc:727
//		DEC	.0111111111	# 2 DEG WHEN CSM DOCKED
// slot 27640
    27640, 364,
// FINDCDUW--GUIDAP_INTERFACE.agc:728
//
// FINDCDUW--GUIDAP_INTERFACE.agc:729
//DAY/2MAX	DEC	.05555555555	# LIKEWISE FOR DELATTY
// slot 27641
    27641, 1820,
// FINDCDUW--GUIDAP_INTERFACE.agc:730
//		DEC	.0055555555
// slot 27642
    27642, 182,
// FINDCDUW--GUIDAP_INTERFACE.agc:731
//
// FINDCDUW--GUIDAP_INTERFACE.agc:732
//DAZMAX		=	DAXMAX		# LIKEWISE FOR DELATTZ
// FINDCDUW--GUIDAP_INTERFACE.agc:733
//
// FINDCDUW--GUIDAP_INTERFACE.agc:734
//CDUZDLIM	DEC	.3888888888	# 70 DEG LIMIT FOR MGA, 1'S, PI
// slot 27643
    27643, 12744,
// FINDCDUW--GUIDAP_INTERFACE.agc:735
//
// FINDCDUW--GUIDAP_INTERFACE.agc:736
//# CONSTANTS FOR DATA TRANSFER
// FINDCDUW--GUIDAP_INTERFACE.agc:737
//
// FINDCDUW--GUIDAP_INTERFACE.agc:738
//DT/DELT		DEC	.05		# .1 SEC/2 SEC WHICH IS THE AUTOPILOT
// slot 27644
    27644, 1638
)).

// no code for the lines below
// FINDCDUW--GUIDAP_INTERFACE.agc:739
//					# CONTROL SAMPLE PERIOD/COMPUTATION PERIOD
// FINDCDUW--GUIDAP_INTERFACE.agc:740
//
// FINDCDUW--GUIDAP_INTERFACE.agc:741
//DELERLIM	=	DAY/2MAX	# 	0 DEG LIMIT FOR LAG ANGLES, 1'S, PI
// FINDCDUW--GUIDAP_INTERFACE.agc:742
//
// FINDCDUW--GUIDAP_INTERFACE.agc:743
//# *** END OF FLY	.132 ***
