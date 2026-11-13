// PORT: Original source unit FINDCDUW--GUIDAP_INTERFACE.agc.
agcAotInstallSourceRope(list(
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:2
//# Filename:	FINDCDUW--GUIDAP_INTERFACE.agc
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:7
//# Contact:	Hartmuth Gutsche <hgutsche@xplornet.com>.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:9
//# Pages:	908-925
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:10
//# Mod history:	2009-05-28 HG	Transcribed from page images.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:11
//#
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:12
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:13
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:14
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:15
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:16
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:17
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:18
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:19
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:20
//# actually created.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:21
//#
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:22
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:23
//#
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:24
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:25
//#	16:27 JULY 14, 1969
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:26
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:27
//# Page 908
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:28
//# PROGRAM NAME:  FINDCDUW
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:29
//# MOD NUMBER:  1	68-07-15
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:30
//# MOD AUTHOR:  KLUMPP
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:31
//#
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:32
//# OBJECTS OF MOD:	1.	TO SUPPLY COMMANDED GIMBAL ANGLES FOR NOUN 22.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:33
//#			2.	TO MAINTAIN CORRECT AND CURRENT THRUST
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:34
//#				DIRECTION DATA IN ALL MODES.  THIS IS DONE BY
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:35
//#				FETCHING FOR THE THRUST DIRECTION FILTER THE
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:36
//#				CDUD'S IN PNGCS-AUTO, THE CDU'S IN ALL OTHER
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:37
//#				MODES.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:38
//#			3.	TO SUBSTITUDE A STOPRATE FOR THE NORMAL
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:39
//#				AUTOPILOT COMMANDS WHENEVER
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:40
//#				1) NOT IN PNGCS-AUTO, OR
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:41
//#				2) ENGINE IS OFF.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:42
//#
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:43
//# FUNCTIONAL DESCRIPTION:
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:44
//#
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:45
//# FINDCDUW PROVIDES THE INTERFACES BETWEEN THE VARIOUS POWERED FLITE GUIDANCE PROGRAMS
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:46
//# AND THE DIGITAL AUTOPILOT.  THE INPUTS TO FINDCDUW ARE THE THRUST COMMAND VECTOR
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:47
//# AND THE WINDOW COMMAND VECTOR, AND THE OUTPUTS ARE THE GIMBAL ANGLE
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:48
//# INCREMENTS, THE COMMANDED ATTITUDE ANGLE RATES, AND THE COMMANDED
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:49
//# ATTITUDE LAG ANGLES (WHICH ACCOUNT FOR THE ANGLES BY WHICH THE BODY WILL
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:50
//# LAG BEHIND A RAMP COMMAND IN ATTITUDE ANGLE DUE TO THE FINITE ANGULAR
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:51
//# ACCELERATIONS AVAILABLE).
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:52
//#
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:53
//# FINDCDUW ALIGNS THE ESTIMATED THRUST VECTOR FROM THE THRUST DIRECTION
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:54
//# FILTER WITH THE THRUST COMMAND VECTOR, AND, WHEN XDVINHIB SET,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:55
//# ALIGNS THE +Z HALF OF THE LM ZX PLANE WITH THE WINDOW COMMAND VECTOR.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:56
//#
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:57
//# Page 909
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:58
//# SPECIFICATIONS:
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:59
//#
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:60
//# INITIALIZATION:	A SINGLE INTERPRETIVE CALL TO INITCDUW IS REQUIRED
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:61
//#			BEFORE EACH GUIDED MANEUVER USING FINDCDUW.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:62
//#
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:63
//# CALL:			INTERPRETIVE CALL TO FINDCDUW WITH THE THRUST COMMAND
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:64
//#			VECTOR IN MPAC.  INTERPRETIVE CALL TO FINDCDUW -2 WITH
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:65
//#			THE THRUST COMMAND VECTOR IN UNFC/2 AND NOT IN MPAC.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:66
//#
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:67
//# RETURNS:		NORMAL INTERPRETIVE IN ALL CASES
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:68
//#			1.	NORMALLY ALL AUTOPILOT CMDS ARE ISSUED.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:69
//#			2.	IF NOT PNGCS AUTO, DO STOPRATE AND RETURN
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:70
//#				WITHOUT ISSUING AUTOPILOT CMDS.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:71
//#			3.	IF ENGINE OFF, DO STOPRATE AND RETURN WITHOUT
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:72
//#				ISSUING AUTOPILOT CMDS.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:73
//#
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:74
//# ALARMS:		00401	IF INPUTS DETERMINE AN ATTITUDE IN GIMBAL LOCK.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:75
//#				FINDCDUW DRIVES CDUXD AND CDUYD TO THE RQD VALUES,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:76
//#				BUT DRIVES CDUZD ONLY TO THE GIMBAL LOCK CONE.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:77
//#
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:78
//#			00402	IF UNFC/2 OR UNWC/2 PRODUCE OVERFLOW WHEN
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:79
//#				UNITIZED USING NORMUNIT.  FINDCDUW ISSUES
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:80
//#				STOPRATE AS ONLY INPUT TO AUTOPILOT.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:81
//#
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:82
//# INPUTS:		UNFC/2		THRUST COMMAND VECTOR, NEED NOT BE SEMI-UNIT.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:83
//#			UNWC/2		WINDOW COMMAND VECTOR, NEED NOT BE SEMI-UNIT.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:84
//#			OGABIAS		POSSIBLE BIAS FOR OUTER GIMBAL ANGLE (ZEROED IN INITCDUW), UNITS OF PI.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:85
//#			XOVINHIB	FLAG DENOTING X AXIS OVERRIDE INHIBITED.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:86
//#			CSMDOCKD	FLAG DENOTING CSM DOCKED.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:87
//#			STEERSW		FLAG DENOTING INSUFF THRUST FOR THRUST DIR FLTR.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:88
//#
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:89
//# OUTPUTS:		DELCDUX,Y,Z
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:90
//#			OMEGAPD,+1,+2
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:91
//#			DELPEROR,+1,+2
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:92
//#			CPHI,+1,+2 FOR NOUN22
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:93
//#
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:94
//# DEBRIS:		FINDCDUW DESTROYS SINCDUX,Y,Z AND COSCDUX,Y,Z BY
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:95
//#			WRITING INTO THESE LOCATIONS THE SINES AND COSINES
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:96
//#			OF THE CDUD'S IN PNGCS-AUTO, OF THE CDU'S OTHERWISE.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:97
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:98
//# Page 910
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:99
//# INITIALIZATION FOR FINDCDUW
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:100
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:101
//		BANK	30
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:102
//		SETLOC	FCDUW
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:103
//		BANK
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:104
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:105
//		EBANK=	ECDUW
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:106
//		COUNT*	$$/FCDUW
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:107
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:108
//INITCDUW	VLOAD
// PORT: Fixed ROM slots 27204.
    27204, 65530,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:109
//			UNITX
// PORT: Fixed ROM slots 27205.
    27205, 6816,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:110
//		STORE	UNFV/2
// PORT: Fixed ROM slots 27206.
    27206, 3440,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:111
//		STORE	UNWC/2
// PORT: Fixed ROM slots 27207.
    27207, 3428,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:112
//		RVQ
// PORT: Fixed ROM slots 27208.
    27208, 65308,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:113
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:114
//# FINDCDUW PRELIMINARIES
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:115
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:116
//		VLOAD			# FINDCDUW -2:  ENTRY WHEN UNFC/2 PRE-STORD
// PORT: Fixed ROM slots 27209.
    27209, 65530,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:117
//			UNFC/2		# INPUT VECTORS NEED NOT BE SEMI-UNIT
// PORT: Fixed ROM slots 27210.
    27210, 3416,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:118
//FINDCDUW	BOV	SETPD		# FINDCDUW: ENTRY WHEN UNFC/2 IN MPAC
// PORT: Fixed ROM slots 27211.
    27211, 33024,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:119
//			FINDCDUW	# INTERPRETER NOW INITIALIZED
// PORT: Fixed ROM slots 27212.
    27212, 50326,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:120
//			22		# LOCS 0 THRU 21 FOR DIRECTION COSINE MAT
// PORT: Fixed ROM slots 27213.
    27213, 38,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:121
//		STQ	EXIT
// PORT: Fixed ROM slots 27214.
    27214, 65056,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:122
//			QCDUWUSR	# SAVE RETURN ADDRESS
// PORT: Fixed ROM slots 27215.
    27215, 3406
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27216–27252.
function agcAotUnit1716 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27233 {
        if slot <= 27224 {
            if slot <= 27219 {
                if slot <= 27217 {
                    if slot <= 27216 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:123
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:124
//# MORE HAUSKEEPING
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:125
//		CA	ECDUWL
// PORT: Fixed ROM slots 27216.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:126
//		XCH	EBANK		# SET EBANK
// PORT: Fixed ROM slots 27217.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:127
//		TS	ECDUWUSR	# SAVE USER'S EBANK
// PORT: Fixed ROM slots 27218.
                        if slot <> 27218 or instruction <> 23462 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23462, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:128
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:129
//		CA	DAPBOOLS
// PORT: Fixed ROM slots 27219.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:130
//		MASK	CSMDOCKD	# CSMDOCKD MUST NOT BE BIT15
// PORT: Fixed ROM slots 27220.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:131
//		CCS	A
// PORT: Fixed ROM slots 27221.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:132
//		CA	ONE		# INDEX IF CSM DOCKED
// PORT: Fixed ROM slots 27222.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:133
//		TS	NDXCDUW
// PORT: Fixed ROM slots 27223.
                            if slot <> 27223 or instruction <> 23464 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23464, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:134
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:135
//		CA	XOVINHIB	# XOVINHIB MUST NOT BE BIT15
// PORT: Fixed ROM slots 27224.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:136
//		TS	FLPAUTNO	# SET TO POS-NON-ZERO FLAG PNGCS AUTO NOT
// PORT: Fixed ROM slots 27225.
                        if slot <> 27225 or instruction <> 23466 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23466, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:137
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:138
//		MASK	DAPBOOLS
// PORT: Fixed ROM slots 27226.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:139
//		TS	FLAGOODW	# FLAG0ODW = ANY PNZ NUMBER IF XOV INHIBTD
// PORT: Fixed ROM slots 27227.
                        if slot <> 27227 or instruction <> 23465 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23465, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:140
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:141
//# Page 911
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:142
//# FETCH BASIC DATA
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:143
//		INHINT			# RELINT AT PAUTNO (TC INTPRET)
// PORT: Fixed ROM slots 27228.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:144
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:145
//		CA	CDUX		# FETCH CDUX,CDUY,CDUZ IN ALL CASES, BUT
// PORT: Fixed ROM slots 27229.
                        if slot <> 27229 or instruction <> 12314 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 26).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:146
//		TS	CDUSPOTX	#	REPLACE BELOW IF PNGCS AUTO
// PORT: Fixed ROM slots 27230.
                        if slot <> 27230 or instruction <> 23034 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23034, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 27231 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:147
//		CA	CDUY
// PORT: Fixed ROM slots 27231.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:148
//		TS	CDUSPOTY
// PORT: Fixed ROM slots 27232.
                            if slot <> 27232 or instruction <> 23030 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23030, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:149
//		CA	CDUZ
// PORT: Fixed ROM slots 27233.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:150
//		TS	CDUSPOTZ
// PORT: Fixed ROM slots 27234.
                        if slot <> 27234 or instruction <> 23032 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23032, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:151
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:152
//		CA	BIT10		# PNGCS CONTROL BIT
// PORT: Fixed ROM slots 27235.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:153
//		EXTEND
// PORT: Fixed ROM slots 27236.
                        if slot <> 27236 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:154
//		RAND	CHAN30
// PORT: Fixed ROM slots 27237.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:155
//		CCS	A
// PORT: Fixed ROM slots 27238.
                        if slot <> 27238 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:156
//		TCF	PAUTNO		# NOT PNGCS (BITS INVERTED)
// PORT: Fixed ROM slots 27239.
                        if slot <> 27239 or instruction <> 5748 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5748, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 27240 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:157
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:158
//		CA	BIT14		# AUTO MODE BIT
// PORT: Fixed ROM slots 27240.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:159
//		EXTEND
// PORT: Fixed ROM slots 27241.
                            if slot <> 27241 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:160
//		RAND	CHAN31
// PORT: Fixed ROM slots 27242.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:161
//		CCS	A
// PORT: Fixed ROM slots 27243.
                        if slot <> 27243 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:162
//		TCF	PAUTNO		# NOT AUTO (BITS INVERTED)
// PORT: Fixed ROM slots 27244.
                        if slot <> 27244 or instruction <> 5748 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5748, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 27245 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:163
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:164
//		TS	FLPAUTNO	# RESET FLAG PNGCS AUTO NOT
// PORT: Fixed ROM slots 27245.
                        if slot <> 27245 or instruction <> 23466 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23466, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 27246 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:165
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:166
//		CA	CDUXD		# PNGCS AUTO:  FETCH CDUXD,CDUYD,CDUZD
// PORT: Fixed ROM slots 27246.
                            if slot <> 27246 or instruction <> 13213 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 925).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:167
//		TS	CDUSPOTX
// PORT: Fixed ROM slots 27247.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:168
//		CA	CDUYD
// PORT: Fixed ROM slots 27248.
                        if slot <> 27248 or instruction <> 13214 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 926).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:169
//		TS	CDUSPOTY
// PORT: Fixed ROM slots 27249.
                        if slot <> 27249 or instruction <> 23030 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23030, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 27250 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:170
//		CA	CDUZD
// PORT: Fixed ROM slots 27250.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:171
//		TS	CDUSPOTZ
// PORT: Fixed ROM slots 27251.
                            if slot <> 27251 or instruction <> 23032 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23032, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:172
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:173
//# Page 912
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:174
//# FETCH INPUTS
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:175
//PAUTNO		TC	INTPRET		# ENTERING THRUST CMD STILL IN MPAC
// PORT: Fixed ROM slots 27252.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:176
//		RTB
// PORT: Fixed ROM slots 27253.
    27253, 65336,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:177
//			NORMUNIT
// PORT: Fixed ROM slots 27254.
    27254, 18348,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:178
//		STOVL	UNX/2		# SEMI-UNIT THRUST CMD AS INITIAL UNX/2
// PORT: Fixed ROM slots 27255.
    27255, 20482,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:179
//			UNWC/2
// PORT: Fixed ROM slots 27256.
    27256, 3428,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:180
//		RTB	RTB
// PORT: Fixed ROM slots 27257.
    27257, 39992,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:181
//			NORMUNIT
// PORT: Fixed ROM slots 27258.
    27258, 18348,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:182
//			QUICTRIG	# ALWAYS RQD TO OBTAIN TRIGS OF CDUD'S
// PORT: Fixed ROM slots 27259.
    27259, 40730,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:183
//		STOVL	UNZ/2		# SEMI-UNIT WINDOW CMD AS INITIAL UNZ/2
// PORT: Fixed ROM slots 27260.
    27260, 20506,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:184
//			DELV
// PORT: Fixed ROM slots 27261.
    27261, 426,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:185
//		BOVB	UNIT
// PORT: Fixed ROM slots 27262.
    27262, 44552,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:186
//			NOATTCNT	# AT LEAST ONE ENTERING CMD VCT ZERO
// PORT: Fixed ROM slots 27263.
    27263, 51152,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:187
//		BOV	CALL
// PORT: Fixed ROM slots 27264.
    27264, 37888,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:188
//			AFTRFLTR	# IF UNIT DELV OVERFLOWS SKIP FILTER
// PORT: Fixed ROM slots 27265.
    27265, 50458,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:189
//			*SMNB*		# YIELDS UNIT(DELV) IN VEH COORDS FOR FLTR
// PORT: Fixed ROM slots 27266.
    27266, 40818,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:190
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:191
//# THRUST DIRECTION FILTER
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:192
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:193
//		EXIT
// PORT: Fixed ROM slots 27267.
    27267, 65532
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27268–27276.
function agcAotUnit1717 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27271 {
        if slot <= 27269 {
            if slot <= 27268 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:194
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:195
//		CA	UNFVY/2		# FOR RESTARTS, UNFV/2 ALWAYS INTACT, MPAC
// PORT: Fixed ROM slots 27268.
                if slot <> 27268 or instruction <> 13241 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 953).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:196
//		LXCH	MPAC	+3	# 	RENEWD AFTER RETURN FROM CALLER,
// PORT: Fixed ROM slots 27269.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:197
//		TC	FLTRSUB		#	TWO FILTER UPDATES MAY BE DONE.
// PORT: Fixed ROM slots 27270.
                if slot <> 27270 or instruction <> 1859 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1859, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:198
//		TS	UNFVY/2		# UNFV/2 NEED NOT BE EXACTLY SEMI-UNIT.
// PORT: Fixed ROM slots 27271.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:199
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:200
//		CA	UNFVZ/2
// PORT: Fixed ROM slots 27272.
                if slot <> 27272 or instruction <> 13243 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 955).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:201
//		LXCH	MPAC +5
// PORT: Fixed ROM slots 27273.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:202
//		TC	FLTRSUB
// PORT: Fixed ROM slots 27274.
                if slot <> 27274 or instruction <> 1859 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1859, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27275 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:203
//		TS	UNFVZ/2
// PORT: Fixed ROM slots 27275.
                    if slot <> 27275 or instruction <> 23483 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23483, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:204
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:205
//		TC	INTPRET		# COMPLETES FILTER
// PORT: Fixed ROM slots 27276.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:206
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:207
//# Page 913
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:208
//# FIND A SUITABLE WINDOW POINTING VECTOR
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:209
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:210
//AFTRFLTR	SLOAD	BHIZ		# IF XOV NOT INHIBITED, GO FETCH ZNB
// PORT: Fixed ROM slots 27277.
    27277, 39098,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:211
//			FLAGOODW
// PORT: Fixed ROM slots 27278.
    27278, 3412,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:212
//			FETCHZNB
// PORT: Fixed ROM slots 27279.
    27279, 50470,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:213
//		VLOAD	CALL
// PORT: Fixed ROM slots 27280.
    27280, 38138,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:214
//			UNZ/2
// PORT: Fixed ROM slots 27281.
    27281, 26,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:215
//			UNWCTEST
// PORT: Fixed ROM slots 27282.
    27282, 50854,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:216
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:217
//FETCHZNB	VLOAD
// PORT: Fixed ROM slots 27283.
    27283, 65530,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:218
//			ZNBPIP
// PORT: Fixed ROM slots 27284.
    27284, 2276,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:219
//		STCALL	UNZ/2
// PORT: Fixed ROM slots 27285.
    27285, 28698,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:220
//			UNWCTEST
// PORT: Fixed ROM slots 27286.
    27286, 50854,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:221
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:222
//		VLOAD	VCOMP		# Z AND -X CAN'T BOTH PARALLEL UNFC/2
// PORT: Fixed ROM slots 27287.
    27287, 48890,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:223
//			XNBPIP
// PORT: Fixed ROM slots 27288.
    27288, 2252,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:224
//		STORE	UNZ/2
// PORT: Fixed ROM slots 27289.
    27289, 26,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:225
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:226
//# COMPUTE THE REQUIRED DIRECTION COSINE MATRIX
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:227
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:228
//DCMCL		VLOAD	VXV
// PORT: Fixed ROM slots 27290.
    27290, 40442,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:229
//			UNZ/2
// PORT: Fixed ROM slots 27291.
    27291, 26,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:230
//			UNX/2
// PORT: Fixed ROM slots 27292.
    27292, 2,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:231
//		UNIT	PUSH		# UNY/2 FIRST ITERATION
// PORT: Fixed ROM slots 27293.
    27293, 34396,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:232
//		VXV	VSL1
// PORT: Fixed ROM slots 27294.
    27294, 64058,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:233
//			UNX/2
// PORT: Fixed ROM slots 27295.
    27295, 2,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:234
//		STORE	UNZ/2		# -UNZ/2 FIRST ITERATION
// PORT: Fixed ROM slots 27296.
    27296, 26,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:235
//		VXSC	PDVL		# EXCHANGE -UNFVZ/2 UNZ/2 FOR UNY/2
// PORT: Fixed ROM slots 27297.
    27297, 52706,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:236
//			UNFVZ/2		# MUST BE SMALL
// PORT: Fixed ROM slots 27298.
    27298, 3448,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:237
//		VXSC	BVSU		# YIELDS -UNFVY/2 UNY/2-UNFVZ/2 UNZ/2
// PORT: Fixed ROM slots 27299.
    27299, 42466,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:238
//			UNFVY/2		# MUST BE SMALL
// PORT: Fixed ROM slots 27300.
    27300, 3444,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:239
//		VSL1	VAD
// PORT: Fixed ROM slots 27301.
    27301, 44532,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:240
//			UNX/2
// PORT: Fixed ROM slots 27302.
    27302, 2,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:241
//		UNIT			# TOTALLY ELIMINATES THRUST POINTING ERROR
// PORT: Fixed ROM slots 27303.
    27303, 65372,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:242
//		STORE	UNX/2		# UNX/2
// PORT: Fixed ROM slots 27304.
    27304, 2,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:243
//		VXV	VSL1
// PORT: Fixed ROM slots 27305.
    27305, 64058,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:244
//			UNZ/2		# -UNZ/2 WAS STORED HERE REMEMBER
// PORT: Fixed ROM slots 27306.
    27306, 26,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:245
//		STORE	UNY/2		# UNY/2
// PORT: Fixed ROM slots 27307.
    27307, 14,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:246
//		VCOMP	VXV
// PORT: Fixed ROM slots 27308.
    27308, 40316,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:247
//			UNX/2
// PORT: Fixed ROM slots 27309.
    27309, 2,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:248
//		VSL1
// PORT: Fixed ROM slots 27310.
    27310, 65524,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:249
//		STORE	UNZ/2		# UNZ/2
// PORT: Fixed ROM slots 27311.
    27311, 26,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:250
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:251
//# Page 914
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:252
//# COMPUTES THE REQUIRED GIMBAL ANGLES
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:253
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:254
//		CALL
// PORT: Fixed ROM slots 27312.
    27312, 65320,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:255
//			NB2CDUSP	# YIELDS THE RQD GIMBAL ANGLES, 2'S, PI
// PORT: Fixed ROM slots 27313.
    27313, 50870,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:256
//		EXIT
// PORT: Fixed ROM slots 27314.
    27314, 65532
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27315–27337.
function agcAotUnit1718 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27325 {
        if slot <= 27319 {
            if slot <= 27316 {
                if slot <= 27315 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:257
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:258
//# LIMIT THE MIDDLE GIMBAL ANGLE & COMPUTE THE UNLIMITED GIMBAL ANGLE CHGS
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:259
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:260
//		CA	MPAC +2		# LIMIT THE MGA
// PORT: Fixed ROM slots 27315.
                    if slot <> 27315 or instruction <> 12398 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 110).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:261
//		TS	L		# CAN'T LXCH:  NEED UNLIMITED MGA FOR ALARM
// PORT: Fixed ROM slots 27316.
                    if slot <> 27316 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 27317 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:262
//		CA	CDUZDLIM
// PORT: Fixed ROM slots 27317.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:263
//		TC	LIMITSUB	# YIELDS LIMITED MGA.  1 BIT ERROR POSSIBLE
// PORT: Fixed ROM slots 27318.
                        if slot <> 27318 or instruction <> 2007 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2007, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:264
//		XCH	MPAC +2		# 	BECAUSE USING 2'S COMP.  WHO CARES?
// PORT: Fixed ROM slots 27319.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:265
//		EXTEND
// PORT: Fixed ROM slots 27320.
                    if slot <> 27320 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27321 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:266
//		MSU	MPAC +2		# THIS BETTER YIELD ZERO
// PORT: Fixed ROM slots 27321.
                        if slot <> 27321 or instruction <> 8302 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMSU(words, 110).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:267
//		EXTEND
// PORT: Fixed ROM slots 27322.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:268
//		BZF	+2
// PORT: Fixed ROM slots 27323.
                    if slot <> 27323 or instruction <> 5821 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5821, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27324 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:269
//		TCF	ALARMMGA
// PORT: Fixed ROM slots 27324.
                        if slot <> 27324 or instruction <> 6126 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6126, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:270
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:271
//MGARET		INHINT			# RELINT AT TC INTPRET AFTER TCQCDUW
// PORT: Fixed ROM slots 27325.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:272
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:273
//		ZL
// PORT: Fixed ROM slots 27326.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:274
//		CA	TWO
// PORT: Fixed ROM slots 27327.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:275
//DELGMBLP	TS	TEM2
// PORT: Fixed ROM slots 27328.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:276
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:277
//		CA	L		# TO PREVENT FALSE STARTS ABOUT X, ZERO
// PORT: Fixed ROM slots 27329.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:278
//		EXTEND			#	FLAGOODW IF DELGMBZ OR Y TOO BIG.
// PORT: Fixed ROM slots 27330.
                        if slot <> 27330 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:279
//		SQUARE
// PORT: Fixed ROM slots 27331.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:280
//		AD	HI5		# WITHIN 1 BIT OF -(45 DEG SQUARED)
// PORT: Fixed ROM slots 27332.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:281
//		EXTEND
// PORT: Fixed ROM slots 27333.
                        if slot <> 27333 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:282
//		BZMF	+3
// PORT: Fixed ROM slots 27334.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:283
//		CA	ZERO
// PORT: Fixed ROM slots 27335.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:284
//		TS	FLAGOODW
// PORT: Fixed ROM slots 27336.
                        if slot <> 27336 or instruction <> 23465 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23465, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:285
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:286
//		INDEX	TEM2
// PORT: Fixed ROM slots 27337.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:287
//		CA	MPAC
// PORT: Fixed ROM slots 27338.
    27338, 24792
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27339–27339.
function agcAotUnit1719 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:288
//		INDEX	TEM2
// PORT: Fixed ROM slots 27339.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:289
//		TS	CPHI		# OUTPUTS TO NOUN22
// PORT: Fixed ROM slots 27340.
    27340, 45474
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27341–27342.
function agcAotUnit1720 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27341 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:290
//		EXTEND
// PORT: Fixed ROM slots 27341.
        if slot <> 27341 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:291
//		INDEX	TEM2
// PORT: Fixed ROM slots 27342.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:292
//		MSU	CDUXD		# NO MATTER THAT THESE SLIGHTLY DIFFERENT
// PORT: Fixed ROM slots 27343.
    27343, 18234
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27344–27345.
function agcAotUnit1721 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27344 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:293
//		COM			# FROM WHEN WE INITIALLY FETCHED THEM
// PORT: Fixed ROM slots 27344.
        if slot <> 27344 or instruction <> 16384 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            agcCoreCS(words, 0).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:294
//		INDEX	TEM2
// PORT: Fixed ROM slots 27345.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:295
//		TS	-DELGMB		# -UNLIMITED GIMBAL ANGLE CHGS, 1'S, PI
// PORT: Fixed ROM slots 27346.
    27346, 46970
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27347–27357.
function agcAotUnit1722 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27351 {
        if slot <= 27348 {
            if slot <= 27347 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:296
//		TS	L		# FOR PRECEDING TEST ON NEXT LOOP PASS
// PORT: Fixed ROM slots 27347.
                if slot <> 27347 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:297
//		CCS	TEM2
// PORT: Fixed ROM slots 27348.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:298
//		TCF	DELGMBLP
// PORT: Fixed ROM slots 27349.
                if slot <> 27349 or instruction <> 5824 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5824, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27350 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:299
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:300
//# Page 915
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:301
//# BRANCHES TO NOATTCNT
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:302
//		CCS	FLPAUTNO
// PORT: Fixed ROM slots 27350.
                    if slot <> 27350 or instruction <> 5034 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 938).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:303
//		TCF	NOATTCNT +2	# NO PNGCS AUTO
// PORT: Fixed ROM slots 27351.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:304
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:305
//		CA	FLAGWRD5
// PORT: Fixed ROM slots 27352.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:306
//		MASK	ENGONBIT
// PORT: Fixed ROM slots 27353.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:307
//		EXTEND
// PORT: Fixed ROM slots 27354.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:308
//		BZF	NOATTCNT +2	# ENGINE NOT ON
// PORT: Fixed ROM slots 27355.
                if slot <> 27355 or instruction <> 6122 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6122, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27356 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:309
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:310
//# Page 916
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:311
//# LIMIT THE ATTITUDE ANGLE CHANGES
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:312
//#
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:313
//# THIS SECTION LIMITS THE ATTITUDE ANGLE CHANGES ABOUT A SET OF ORTHOGONAL VEHICLE AXES X,YPRIME,ZPRIME,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:314
//# THESE AXES COINCIDE WITH THE COMMANDED VEHICLE AXES IF AND ONLY IF CDUXD IS ZERO.  THE PRIME SYSTEM IS
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:315
//# THE COMMANDED VEHICLE SYSTEM ROTATED ABOUT THE X AXIS TO BRING THE Z AXIS INTO ALIGNMENT WITH THE MIDDLE GIMBAL
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:316
//# AXIS.  ATTITUDE ANGLE CHANGES IN THE PRIME SYSTEM ARE RELATED TO SMALL GIMBAL ANGLE CHANGES BY:
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:317
//#
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:318
//#	[   -DELATTX    ]   [ 1     SIN(CDUZD)     0 ] [ -DELGMBX ]
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:319
//#	[               ]   [                        ] [          ]
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:320
//#	[ -DELATTYPRIME ] = [ 0     COS(CDUZD)     0 ] [ -DELGMBY ]
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:321
//#	[               ]   [                        ] [          ]
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:322
//#	[ -DELATTZPRIME ]   [ 0         0          1 ] [ -DELGMBZ ]
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:323
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:324
//		LXCH	-DELGMB +2	# SAME AS -DELATTZPRIME UNLIMITED
// PORT: Fixed ROM slots 27356.
                    if slot <> 27356 or instruction <> 10175 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 959, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:325
//		INDEX	NDXCDUW
// PORT: Fixed ROM slots 27357.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:326
//		CA	DAZMAX
// PORT: Fixed ROM slots 27358.
    27358, 28654
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27359–27365.
function agcAotUnit1723 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27361 {
        if slot <= 27359 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:327
//		TC	LIMITSUB
// PORT: Fixed ROM slots 27359.
            if slot <> 27359 or instruction <> 2007 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2007, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 27360 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:328
//		TS	-DELGMB +2	# -DELGMBZ
// PORT: Fixed ROM slots 27360.
                if slot <> 27360 or instruction <> 23487 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23487, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:329
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:330
//		CA	-DELGMB +1
// PORT: Fixed ROM slots 27361.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:331
//		EXTEND
// PORT: Fixed ROM slots 27362.
                if slot <> 27362 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:332
//		MP	COSCDUZ		# YIELDS -DELATTYPRIME/2 UNLIMITED
// PORT: Fixed ROM slots 27363.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:333
//		TS	L
// PORT: Fixed ROM slots 27364.
                if slot <> 27364 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:334
//		INDEX	NDXCDUW
// PORT: Fixed ROM slots 27365.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:335
//		CA	DAY/2MAX
// PORT: Fixed ROM slots 27366.
    27366, 28658
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27367–27378.
function agcAotUnit1724 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27372 {
        if slot <= 27369 {
            if slot <= 27367 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:336
//		TC	LIMITSUB
// PORT: Fixed ROM slots 27367.
                if slot <> 27367 or instruction <> 2007 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2007, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27368 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:337
//		EXTEND
// PORT: Fixed ROM slots 27368.
                    if slot <> 27368 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:338
//		DV	COSCDUZ
// PORT: Fixed ROM slots 27369.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:339
//		XCH	-DELGMB +1	# -DELGMBY, FETCHING UNLIMITED VALUE
// PORT: Fixed ROM slots 27370.
                if slot <> 27370 or instruction <> 24510 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 958, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 27371 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:340
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:341
//		EXTEND
// PORT: Fixed ROM slots 27371.
                    if slot <> 27371 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:342
//		MP	SINCDUZ
// PORT: Fixed ROM slots 27372.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:343
//		DDOUBL
// PORT: Fixed ROM slots 27373.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:344
//		COM
// PORT: Fixed ROM slots 27374.
                    if slot <> 27374 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:345
//		EXTEND			# YIELDS +DELATTX UNLIMITD, MAG < 180 DEG.
// PORT: Fixed ROM slots 27375.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:346
//		MSU	-DELGMB		#	BASED ON UNLIMITED DELGMBV.
// PORT: Fixed ROM slots 27376.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:347
//		TS	L		#	ONE BIT ERROR IF OPERANDS IN MSU
// PORT: Fixed ROM slots 27377.
                    if slot <> 27377 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:348
//		INDEX	NDXCDUW		#	OF MIXED SIGNS.  WHO CARES?
// PORT: Fixed ROM slots 27378.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:349
//		CA	DAXMAX
// PORT: Fixed ROM slots 27379.
    27379, 28654
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27380–27403.
function agcAotUnit1725 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27391 {
        if slot <= 27385 {
            if slot <= 27382 {
                if slot <= 27380 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:350
//		TC	LIMITSUB
// PORT: Fixed ROM slots 27380.
                    if slot <> 27380 or instruction <> 2007 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2007, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27381 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:351
//		TS	-DELGMB		# SAVE LIMITED +DELATTX
// PORT: Fixed ROM slots 27381.
                        if slot <> 27381 or instruction <> 23485 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23485, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:352
//		CCS	FLAGOODW
// PORT: Fixed ROM slots 27382.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:353
//		CS	-DELGMB		# FETCH IT BACK CHGING SIGN IF WINDOW GOOD
// PORT: Fixed ROM slots 27383.
                    if slot <> 27383 or instruction <> 17341 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 957).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27384 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:354
//		TS	-DELGMB		# OTHERWISE USE ZERO FOR -DELATTX
// PORT: Fixed ROM slots 27384.
                        if slot <> 27384 or instruction <> 23485 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23485, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:355
//		CS	-DELGMB +1
// PORT: Fixed ROM slots 27385.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:356
//		EXTEND
// PORT: Fixed ROM slots 27386.
                    if slot <> 27386 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27387 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:357
//		MP	SINCDUZ
// PORT: Fixed ROM slots 27387.
                        if slot <> 27387 or instruction <> 29152 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 480, readEffective:call(words, 480)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:358
//		DDOUBL			# YIELDS -CNTRIB TO -DELATTX FROM -DELGMBY
// PORT: Fixed ROM slots 27388.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:359
//		ADS	-DELGMB		# -DELGMBX.  NO OVERFLOW SINCE LIMITED TO
// PORT: Fixed ROM slots 27389.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:360
//					# 20DEG(1+SIN(70DEG)/COS(70DEG)) < 180DEG
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:361
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:362
//# Page 917
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:363
//# COMPUTE COMMANDED ATTITUDE RATES
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:364
//#
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:365
//#	[ OMEGAPD ]   [ -2         -4 SINCDUZ              +0    ] [ -DELGMBZ ]
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:366
//#	[         ]   [                                          ] [          ]
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:367
//#	[ OMEGAQD ] = [ +0     -8 COSCDUZ COSCDUX     -4 SINCDUX ] [ -DELGMBY ]
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:368
//#	[         ]   [                                          ] [          ]
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:369
//#	[ OMEGARD ]   [ +0     +8 COSCDUZ SINCDUX     -4 COSCDUX ] [ -DELGMBZ ]
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:370
//#
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:371
//# ATTITUDE ANGLE RATES IN UNITS OF PI/4 RAD/SEC = K TRIG FCNS IN UNITS OF 2 X GIMBAL ANGLE RATES IN UNITS OF
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:372
//# PI/2 RAD/SEC.  THE CONSTANTS ARE BASED ON DELGMB BEING THE GIMBAL ANGLE CHANGES IN UNITS OF PI RADIANS,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:373
//# AND 2 SECONDS BEING THE COMPUTATION PERIOD (THE PERIOD BETWEEN SUCCESSIVE PASSES THRU FINDCDUW).
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:374
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:375
//		CS	-DELGMB
// PORT: Fixed ROM slots 27390.
                        if slot <> 27390 or instruction <> 17341 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 957).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:376
//		TS	OMEGAPD
// PORT: Fixed ROM slots 27391.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:377
//		CS	-DELGMB +1
// PORT: Fixed ROM slots 27392.
                    if slot <> 27392 or instruction <> 17342 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 958).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27393 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:378
//		EXTEND
// PORT: Fixed ROM slots 27393.
                        if slot <> 27393 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:379
//		MP	SINCDUZ
// PORT: Fixed ROM slots 27394.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:380
//		DDOUBL
// PORT: Fixed ROM slots 27395.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:381
//		ADS	OMEGAPD
// PORT: Fixed ROM slots 27396.
                        if slot <> 27396 or instruction <> 12195 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 931).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:382
//		ADS	OMEGAPD
// PORT: Fixed ROM slots 27397.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:383
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:384
//		CS	-DELGMB +1
// PORT: Fixed ROM slots 27398.
                    if slot <> 27398 or instruction <> 17342 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 958).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27399 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:385
//		EXTEND
// PORT: Fixed ROM slots 27399.
                        if slot <> 27399 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:386
//		MP	COSCDUX
// PORT: Fixed ROM slots 27400.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:387
//		DDOUBL
// PORT: Fixed ROM slots 27401.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:388
//		EXTEND
// PORT: Fixed ROM slots 27402.
                        if slot <> 27402 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:389
//		MP	COSCDUZ
// PORT: Fixed ROM slots 27403.
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

// PORT: Physical bank 30. Shared continuation entries, slots 27404–27426.
function agcAotUnit1726 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27414 {
        if slot <= 27408 {
            if slot <= 27405 {
                if slot <= 27404 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:390
//		TS	OMEGAQD
// PORT: Fixed ROM slots 27404.
                    if slot <> 27404 or instruction <> 23460 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23460, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:391
//		CS	-DELGMB +2
// PORT: Fixed ROM slots 27405.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:392
//		EXTEND
// PORT: Fixed ROM slots 27406.
                    if slot <> 27406 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27407 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:393
//		MP	SINCDUX
// PORT: Fixed ROM slots 27407.
                        if slot <> 27407 or instruction <> 29154 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 482, readEffective:call(words, 482)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:394
//		ADS	OMEGAQD
// PORT: Fixed ROM slots 27408.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:395
//		ADS	OMEGAQD
// PORT: Fixed ROM slots 27409.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:396
//		ADS	OMEGAQD
// PORT: Fixed ROM slots 27410.
                        if slot <> 27410 or instruction <> 12196 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 932).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:397
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:398
//		CA	-DELGMB +1
// PORT: Fixed ROM slots 27411.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:399
//		EXTEND
// PORT: Fixed ROM slots 27412.
                    if slot <> 27412 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27413 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:400
//		MP	SINCDUX
// PORT: Fixed ROM slots 27413.
                        if slot <> 27413 or instruction <> 29154 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 482, readEffective:call(words, 482)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:401
//		DDOUBL
// PORT: Fixed ROM slots 27414.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:402
//		EXTEND
// PORT: Fixed ROM slots 27415.
                    if slot <> 27415 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27416 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:403
//		MP	COSCDUZ
// PORT: Fixed ROM slots 27416.
                        if slot <> 27416 or instruction <> 29158 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 486, readEffective:call(words, 486)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:404
//		TS	OMEGARD
// PORT: Fixed ROM slots 27417.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:405
//		CS	-DELGMB +2
// PORT: Fixed ROM slots 27418.
                    if slot <> 27418 or instruction <> 17343 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 959).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27419 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:406
//		EXTEND
// PORT: Fixed ROM slots 27419.
                        if slot <> 27419 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:407
//		MP	COSCDUX
// PORT: Fixed ROM slots 27420.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:408
//		ADS	OMEGARD
// PORT: Fixed ROM slots 27421.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:409
//		ADS	OMEGARD
// PORT: Fixed ROM slots 27422.
                        if slot <> 27422 or instruction <> 12197 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 933).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:410
//		ADS	OMEGARD
// PORT: Fixed ROM slots 27423.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:411
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:412
//# Page 918
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:413
//# FINAL TRANSFER
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:414
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:415
//		CA	TWO
// PORT: Fixed ROM slots 27424.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:416
//CDUWXFR		TS	TEM2
// PORT: Fixed ROM slots 27425.
                        if slot <> 27425 or instruction <> 22626 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22626, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:417
//		INDEX	TEM2
// PORT: Fixed ROM slots 27426.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:418
//		CA	-DELGMB
// PORT: Fixed ROM slots 27427.
    27427, 26490
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27428–27431.
function agcAotUnit1727 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27429 {
        if slot <= 27428 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:419
//		EXTEND
// PORT: Fixed ROM slots 27428.
            if slot <> 27428 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:420
//		MP	DT/DELT		# RATIO OF DAP INTERVAL TO CDUW INTERVAL
// PORT: Fixed ROM slots 27429.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:421
//		TC	ONESTO2S
// PORT: Fixed ROM slots 27430.
            if slot <> 27430 or instruction <> 2019 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2019, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:422
//		INDEX	TEM2
// PORT: Fixed ROM slots 27431.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:423
//		TS	DELCDUX		# ANGLE INTERFACE
// PORT: Fixed ROM slots 27432.
    27432, 46912
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27433–27433.
function agcAotUnit1728 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:424
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:425
//		INDEX	TEM2
// PORT: Fixed ROM slots 27433.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:426
//		CCS	OMEGAPD
// PORT: Fixed ROM slots 27434.
    27434, 10054
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27435–27439.
function agcAotUnit1729 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27436 {
        if slot <= 27435 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:427
//		AD	ONE
// PORT: Fixed ROM slots 27435.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:428
//		TCF	+2
// PORT: Fixed ROM slots 27436.
            if slot <> 27436 or instruction <> 5934 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5934, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 27437 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:429
//		AD	ONE
// PORT: Fixed ROM slots 27437.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:430
//		EXTEND			# WE NOW HAVE ABS(OMEGAPD,QD,RD)
// PORT: Fixed ROM slots 27438.
                if slot <> 27438 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:431
//		INDEX	TEM2
// PORT: Fixed ROM slots 27439.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:432
//		MP	OMEGAPD
// PORT: Fixed ROM slots 27440.
    27440, 59206
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27441–27444.
function agcAotUnit1730 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27442 {
        if slot <= 27441 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:433
//		EXTEND
// PORT: Fixed ROM slots 27441.
            if slot <> 27441 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:434
//		MP	BIT11		# 1/16
// PORT: Fixed ROM slots 27442.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:435
//		EXTEND
// PORT: Fixed ROM slots 27443.
            if slot <> 27443 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:436
//		INDEX	TEM2		#                  2
// PORT: Fixed ROM slots 27444.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:437
//		DV	1JACC		# UNITS PI/4 RAD/SEC
// PORT: Fixed ROM slots 27445.
    27445, 9904
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27446–27449.
function agcAotUnit1731 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27447 {
        if slot <= 27446 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:438
//		TS	L
// PORT: Fixed ROM slots 27446.
            if slot <> 27446 or instruction <> 22529 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22529, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:439
//		CA	DELERLIM
// PORT: Fixed ROM slots 27447.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:440
//		TC	LIMITSUB
// PORT: Fixed ROM slots 27448.
            if slot <> 27448 or instruction <> 2007 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2007, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:441
//		INDEX	TEM2
// PORT: Fixed ROM slots 27449.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:442
//		TS	DELPEROR	# LAG ANGLE = OMEGA ABS(OMEGA)/2 ACCEL
// PORT: Fixed ROM slots 27450.
    27450, 46462
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27451–27455.
function agcAotUnit1732 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27452 {
        if slot <= 27451 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:443
//		CCS	TEM2
// PORT: Fixed ROM slots 27451.
            if slot <> 27451 or instruction <> 4194 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 98).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:444
//		TCF	CDUWXFR
// PORT: Fixed ROM slots 27452.
            if slot <> 27452 or instruction <> 5921 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5921, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 27453 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:445
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:446
//# HAUSKEEPING AND RETURN
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:447
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:448
//TCQCDUW		CA	ECDUWUSR
// PORT: Fixed ROM slots 27453.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:449
//		TS	EBANK		# RETURN USER'S EBANK
// PORT: Fixed ROM slots 27454.
                if slot <> 27454 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:450
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:451
//		TC	INTPRET
// PORT: Fixed ROM slots 27455.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:452
//		SETPD	GOTO
// PORT: Fixed ROM slots 27456.
    27456, 43010,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:453
//			0
// PORT: Fixed ROM slots 27457.
    27457, 2,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:454
//			QCDUWUSR	# NORMAL AND ABNORMAL RETURN TO USER
// PORT: Fixed ROM slots 27458.
    27458, 3406
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27459–27465.
function agcAotUnit1733 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27461 {
        if slot <= 27459 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:455
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:456
//# Page 919
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:457
//# THRUST VECTOR FILTER SUBROUTINE
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:458
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:459
//FLTRSUB		EXTEND
// PORT: Fixed ROM slots 27459.
            if slot <> 27459 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 27460 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:460
//		QXCH	TEM2
// PORT: Fixed ROM slots 27460.
                if slot <> 27460 or instruction <> 9314 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 98, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:461
//		TS	TEM3		# SAVE ORIGINAL OFFSET
// PORT: Fixed ROM slots 27461.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:462
//		COM			# ONE MCT, NO WDS, CAN BE SAVED IF NEG OF
// PORT: Fixed ROM slots 27462.
                if slot <> 27462 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:463
//		AD	L		#	ORIG OFFSET ARRIVES IN A, BUT IT'S
// PORT: Fixed ROM slots 27463.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:464
//		EXTEND			# 	NOT WORTH THE INCREASED OBSCURITY.
// PORT: Fixed ROM slots 27464.
                if slot <> 27464 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:465
//		INDEX	NDXCDUW
// PORT: Fixed ROM slots 27465.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:466
//		MP	GAINFLTR
// PORT: Fixed ROM slots 27466.
    27466, 61412
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27467–27474.
function agcAotUnit1734 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27470 {
        if slot <= 27468 {
            if slot <= 27467 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:467
//		TS	L		# INCR TO OFFSET, UNLIMITED
// PORT: Fixed ROM slots 27467.
                if slot <> 27467 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:468
//		CA	DUNFVLIM	# SAME LIMIT FOR Y AND Z
// PORT: Fixed ROM slots 27468.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:469
//		TC	LIMITSUB	# YIELDS INCR TO OFFSET, LIMITED
// PORT: Fixed ROM slots 27469.
                if slot <> 27469 or instruction <> 2007 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2007, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:470
//		AD	TEM3		# ORIGINAL OFFSET
// PORT: Fixed ROM slots 27470.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:471
//		TS	L		# TOTAL OFFSET, UNLIMITED
// PORT: Fixed ROM slots 27471.
                if slot <> 27471 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:472
//		CA	UNFVLIM		# SAME LIMIT FOR Y AND Z
// PORT: Fixed ROM slots 27472.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:473
//		TC	LIMITSUB	# YIELDS TOTAL OFFSET, LIMITED
// PORT: Fixed ROM slots 27473.
                if slot <> 27473 or instruction <> 2007 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2007, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:474
//		TC	TEM2
// PORT: Fixed ROM slots 27474.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:475
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:476
//# SUBR TO TEST THE ANGLE BETWEEN THE PROPOSED WINDOW AND THRUST CMD VCTS
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:477
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:478
//UNWCTEST 	DOT	DSQ
// PORT: Fixed ROM slots 27475.
    27475, 52802,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:479
//			UNX/2
// PORT: Fixed ROM slots 27476.
    27476, 2,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:480
//		DSU	BMN
// PORT: Fixed ROM slots 27477.
    27477, 41002,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:481
//			DOTSWFMX
// PORT: Fixed ROM slots 27478.
    27478, 18414,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:482
//			DCMCL
// PORT: Fixed ROM slots 27479.
    27479, 50484,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:483
//		SSP	RVQ		# RVQ FOR ALT CHOICE IF DOT MAGN TOO LARGE
// PORT: Fixed ROM slots 27480.
    27480, 36530,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:484
//			FLAGOODW	# 	ZEROING WINDOW GOOD FLAG
// PORT: Fixed ROM slots 27481.
    27481, 3412,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:485
//			0
// PORT: Fixed ROM slots 27482.
    27482, 0,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:486
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:487
//# Page 920
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:488
//# NB2CDUSP RETURNS THE 2'S COMPLEMENT, PI, SP CDU ANGLES X,Y,Z IN MPAC,+1,+2 GIVEN THE MATRIX WHOSE ROW VECTORS
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:489
//# ARE THE SEMI-UNIT NAV BASE VECTORS X,Y,X EXPRESSED IN STABLE MEMBER COORDINATES, LOCATED AT 0 IN THE PUSH LIST.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:490
//# NB2CDUSP USES THE ARCTRGSP WHICH HAS A MAXIMUM ERROR OF +-4 BITS.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:491
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:492
//NB2CDUSP	DLOAD	DSQ
// PORT: Fixed ROM slots 27483.
    27483, 52938,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:493
//			2
// PORT: Fixed ROM slots 27484.
    27484, 6,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:494
//		BDSU	BPL
// PORT: Fixed ROM slots 27485.
    27485, 42018,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:495
//			DP1/4TH
// PORT: Fixed ROM slots 27486.
    27486, 6804,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:496
//			+3
// PORT: Fixed ROM slots 27487.
    27487, 50884,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:497
//		DLOAD
// PORT: Fixed ROM slots 27488.
    27488, 65482,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:498
//			ZEROVECS	# IN CASE SIN WAS SLIGHTLY > 1/2
// PORT: Fixed ROM slots 27489.
    27489, 6820,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:499
//		SQRT	EXIT		# YIELDS COS(CDUZ) IN UNITS OF 2
// PORT: Fixed ROM slots 27490.
    27490, 65260
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27491–27498.
function agcAotUnit1735 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27494 {
        if slot <= 27492 {
            if slot <= 27491 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:500
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:501
//		EXTEND
// PORT: Fixed ROM slots 27491.
                if slot <> 27491 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:502
//		DCA	MPAC
// PORT: Fixed ROM slots 27492.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:503
//		DDOUBL
// PORT: Fixed ROM slots 27493.
                if slot <> 27493 or instruction <> 8193 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDas(words, 1) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:504
//		TS	TEM5
// PORT: Fixed ROM slots 27494.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:505
//		TCF	+3
// PORT: Fixed ROM slots 27495.
                if slot <> 27495 or instruction <> 5994 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5994, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:506
//		CA	POSMAX		# OVERFLOW.  FETCH POSMAX, MPAC ALWAYS POS
// PORT: Fixed ROM slots 27496.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:507
//		TS	TEM5		# COS(CDUZ) IN TEM5, UNITS 1
// PORT: Fixed ROM slots 27497.
                if slot <> 27497 or instruction <> 22629 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22629, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:508
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:509
//		INDEX	FIXLOC
// PORT: Fixed ROM slots 27498.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:510
//		CA	2
// PORT: Fixed ROM slots 27499.
    27499, 24580
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27500–27517.
function agcAotUnit1736 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27508 {
        if slot <= 27503 {
            if slot <= 27501 {
                if slot <= 27500 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:511
//		LXCH	MPAC
// PORT: Fixed ROM slots 27500.
                    if slot <> 27500 or instruction <> 9324 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 108, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:512
//		TC	ARCTRGSP
// PORT: Fixed ROM slots 27501.
                    if slot <> 27501 or instruction <> 1938 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1938, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 27502 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:513
//		TS	MPAC +2		# CDUZ
// PORT: Fixed ROM slots 27502.
                    if slot <> 27502 or instruction <> 22638 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22638, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:514
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:515
//		CA	ZERO
// PORT: Fixed ROM slots 27503.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:516
//		TC	DVBYCOSM
// PORT: Fixed ROM slots 27504.
                    if slot <> 27504 or instruction <> 1920 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1920, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:517
//		CA	FOUR
// PORT: Fixed ROM slots 27505.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:518
//		TC	DVBYCOSM
// PORT: Fixed ROM slots 27506.
                    if slot <> 27506 or instruction <> 1920 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1920, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27507 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:519
//		CS	TEM1
// PORT: Fixed ROM slots 27507.
                        if slot <> 27507 or instruction <> 16481 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 97).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:520
//		TC	ARCTRGSP
// PORT: Fixed ROM slots 27508.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:521
//		TS	MPAC +1		# CDUY
// PORT: Fixed ROM slots 27509.
                    if slot <> 27509 or instruction <> 22637 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22637, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:522
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:523
//		CA	BIT4
// PORT: Fixed ROM slots 27510.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:524
//		TC	DVBYCOSM
// PORT: Fixed ROM slots 27511.
                    if slot <> 27511 or instruction <> 1920 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1920, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:525
//		CA	16OCT
// PORT: Fixed ROM slots 27512.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:526
//		TC	DVBYCOSM
// PORT: Fixed ROM slots 27513.
                    if slot <> 27513 or instruction <> 1920 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1920, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:527
//		CS	TEM1
// PORT: Fixed ROM slots 27514.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:528
//		TC	ARCTRGSP
// PORT: Fixed ROM slots 27515.
                    if slot <> 27515 or instruction <> 1938 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1938, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27516 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:529
//		TS	MPAC		# CDUX
// PORT: Fixed ROM slots 27516.
                        if slot <> 27516 or instruction <> 22636 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22636, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:530
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:531
//		TC	INTPRET
// PORT: Fixed ROM slots 27517.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:532
//		RVQ
// PORT: Fixed ROM slots 27518.
    27518, 65308,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:533
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:534
//16OCT		OCT	16
// PORT: Fixed ROM slots 27519.
    27519, 28
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27520–27522.
function agcAotUnit1737 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27520 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:535
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:536
//# Page 921
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:537
//# THE ELEMENTS OF THE NAV BASE MATRIX WHICH WE MUST DIVIDE BY COS(MGA)
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:538
//# ALREADY CONTAIN COS(MGA)/2 AS A FACTOR. THEREFORE THE QUOTIENT SHOULD
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:539
//# ORDINARILY NEVER EXCEED 1/2 IN MAGNITUDE.  BUT IF THE MGA IS NEAR PI/2
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:540
//# THEN COS(MGA) IS NEAR ZERO, AND THERE MAY BE SOME CHAFF IN THE OTHER
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:541
//# ELEMENTS OF THE MATRIX WHICH WOULD PRODUCE CHAOS UNDER DIVISION.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:542
//# BEFORE DIVIDING WE MAKE SURE COS(MGA) IS AT LEAST ONE BIT LARGER
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:543
//# THAN THE MAGNITUDE OF THE HIGH ORDER PART OF THE OPERAND.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:544
//#
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:545
//# IF ONE OR MORE DIVIDES CANNOT BE PERFORMED, THIS MEANS THAT THE
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:546
//# REQUIRED MGA IS VERY NEARLY +-PI/2 AND THEREFORE THE OTHER GIMBAL
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:547
//# ANGLES ARE INDETERMINATE.  THE INNER AND OUTER GIMBAL ANGLES RETURNED
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:548
//# IN THIS CASE WILL BE RANDOM MULTIPLES OF PI/2.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:549
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:550
//DVBYCOSM	AD	FIXLOC
// PORT: Fixed ROM slots 27520.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:551
//		TS	ADDRWD		# ADRES OF OPERAND
// PORT: Fixed ROM slots 27521.
            if slot <> 27521 or instruction <> 22606 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22606, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:552
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:553
//		INDEX	ADDRWD		# FETCH NEG ABS OF OPERAND, AD TEM5, AND
// PORT: Fixed ROM slots 27522.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:554
//		CA	0		#	SKIP DIVIDE IF RESULT NEG OR ZERO
// PORT: Fixed ROM slots 27523.
    27523, 24576
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27524–27531.
function agcAotUnit1738 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27527 {
        if slot <= 27525 {
            if slot <= 27524 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:555
//		EXTEND
// PORT: Fixed ROM slots 27524.
                if slot <> 27524 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:556
//		BZMF	+2
// PORT: Fixed ROM slots 27525.
                if slot <> 27525 or instruction <> 26503 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26503, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27526 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:557
//		COM
// PORT: Fixed ROM slots 27526.
                if slot <> 27526 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:558
//		AD	TEM5		# C(A) ZERO OR NEG, C(TEM5) ZERO OR POS
// PORT: Fixed ROM slots 27527.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:559
//		EXTEND
// PORT: Fixed ROM slots 27528.
                if slot <> 27528 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:560
//		BZMF	TSL&TCQ		# DIFFERENCE ALWAYS SMALL IF BRANCH
// PORT: Fixed ROM slots 27529.
                if slot <> 27529 or instruction <> 26511 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26511, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 27530 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:561
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:562
//		EXTEND			# TEM5 EXCEEDS ABS HIGH ORDER PART OF
// PORT: Fixed ROM slots 27530.
                if slot <> 27530 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:563
//		INDEX	ADDRWD		#	OPERAND BY AT LEAST ONE BIT.
// PORT: Fixed ROM slots 27531.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:564
//		DCA	0		#	THEREFORE IT EXCEEDS THE DP OPERAND
// PORT: Fixed ROM slots 27532.
    27532, 24578
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27533–27562.
function agcAotUnit1739 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27547 {
        if slot <= 27539 {
            if slot <= 27535 {
                if slot <= 27533 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:565
//		EXTEND			# 	AND DIVISION WILL ALWAYS SUCCEED.
// PORT: Fixed ROM slots 27533.
                    if slot <> 27533 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27534 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:566
//		DV	TEM5
// PORT: Fixed ROM slots 27534.
                        if slot <> 27534 or instruction <> 4197 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreDv(words, 101, readEffective:call(words, 101)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:567
//TSL&TCQ		TS	L
// PORT: Fixed ROM slots 27535.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:568
//		LXCH	TEM1
// PORT: Fixed ROM slots 27536.
                        if slot <> 27536 or instruction <> 9313 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 97, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:569
//		TC	Q
// PORT: Fixed ROM slots 27537.
                        if slot <> 27537 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 27538 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:570
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:571
//# Page 922
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:572
//# ARCTRGSP RETURNS THE 2'S COMPLEMENT, PI, SP ANGLE IN THE A REGISTER GIVEN ITS SINE IN A AND ITS COSINE IN L IN
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:573
//# UNITS OF 2.  THE RESULT IS AN UNAMBIGUOUS ANGLE ANYWHERE IN THE CIRCLE, WITH A MAXIMUM ERROR OF +-4 BITS.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:574
//# THE ERROR IS PRODUCED BY THE SUBROUTINE SPARCSIN WHICH IS USED ONLY IN THE REGION +-45 DEGREES.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:575
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:576
//ARCTRGSP	EXTEND
// PORT: Fixed ROM slots 27538.
                        if slot <> 27538 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:577
//		BZF	SINZERO		# TO AVOID DIVIDING BY ZERO
// PORT: Fixed ROM slots 27539.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:578
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:579
//		EXTEND
// PORT: Fixed ROM slots 27540.
                        if slot <> 27540 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:580
//		QXCH	TEM4
// PORT: Fixed ROM slots 27541.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:581
//		TS	TEM2
// PORT: Fixed ROM slots 27542.
                        if slot <> 27542 or instruction <> 22626 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22626, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:582
//		CA	L
// PORT: Fixed ROM slots 27543.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:583
//		TS	TEM3
// PORT: Fixed ROM slots 27544.
                        if slot <> 27544 or instruction <> 22627 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22627, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:584
//		CA	ZERO
// PORT: Fixed ROM slots 27545.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:585
//		EXTEND
// PORT: Fixed ROM slots 27546.
                        if slot <> 27546 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:586
//		DV	TEM2
// PORT: Fixed ROM slots 27547.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:587
//		EXTEND
// PORT: Fixed ROM slots 27548.
                    if slot <> 27548 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27549 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:588
//		BZF	USECOS
// PORT: Fixed ROM slots 27549.
                        if slot <> 27549 or instruction <> 6060 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6060, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:589
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:590
//		CCS	TEM3		# SIN IS SMALLER OR EQUAL
// PORT: Fixed ROM slots 27550.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:591
//		CA	ZERO
// PORT: Fixed ROM slots 27551.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:592
//		TCF	+4
// PORT: Fixed ROM slots 27552.
                        if slot <> 27552 or instruction <> 6052 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6052, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 27553 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:593
//		CS	TEM2		# IF COS NEG, REVERSE SIGN OF SIN,
// PORT: Fixed ROM slots 27553.
                        if slot <> 27553 or instruction <> 16482 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 98).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:594
//		TS	TEM2		#	ANGLE = PI-ARCSIN(SIN)
// PORT: Fixed ROM slots 27554.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:595
//		CA	NEGMAX		# PICK UP PI, 2'S COMPLEMENT
// PORT: Fixed ROM slots 27555.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:596
//		TS	TEM3		# WE NO LONGER NEED COS
// PORT: Fixed ROM slots 27556.
                        if slot <> 27556 or instruction <> 22627 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22627, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 27557 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:597
//		CA	TEM2
// PORT: Fixed ROM slots 27557.
                        if slot <> 27557 or instruction <> 12386 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 98).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:598
//		TC	SPARCSIN -1
// PORT: Fixed ROM slots 27558.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:599
//		TC	ONESTO2S
// PORT: Fixed ROM slots 27559.
                        if slot <> 27559 or instruction <> 2019 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2019, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:600
//		EXTEND
// PORT: Fixed ROM slots 27560.
                        if slot <> 27560 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 27561 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:601
//		MSU	TEM3
// PORT: Fixed ROM slots 27561.
                        if slot <> 27561 or instruction <> 8291 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMSU(words, 99).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:602
//1TO2&TCQ	TC	ONESTO2S
// PORT: Fixed ROM slots 27562.
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

// PORT: Physical bank 30. Shared continuation entries, slots 27563–27581.
function agcAotUnit1740 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27571 {
        if slot <= 27566 {
            if slot <= 27564 {
                if slot <= 27563 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:603
//		TC	TEM4
// PORT: Fixed ROM slots 27563.
                    if slot <> 27563 or instruction <> 100 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 100, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:604
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:605
//USECOS		CS	TEM3		# COS IS SMALLER
// PORT: Fixed ROM slots 27564.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:606
//		TC	SPARCSIN -1	# ANGLE = SIGN(SIN)(FI/2-ARCSIN(COS))
// PORT: Fixed ROM slots 27565.
                    if slot <> 27565 or instruction <> 1978 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1978, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:607
//		AD	HALF
// PORT: Fixed ROM slots 27566.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:608
//		TS	TEM3		# WE NO LONGER NEED COS
// PORT: Fixed ROM slots 27567.
                    if slot <> 27567 or instruction <> 22627 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22627, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:609
//		CCS	TEM2
// PORT: Fixed ROM slots 27568.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:610
//		CA	TEM3
// PORT: Fixed ROM slots 27569.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:611
//		TCF	1TO2&TCQ
// PORT: Fixed ROM slots 27570.
                        if slot <> 27570 or instruction <> 6058 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6058, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:612
//		CS	TEM3
// PORT: Fixed ROM slots 27571.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:613
//		TCF	1TO2&TCQ
// PORT: Fixed ROM slots 27572.
                    if slot <> 27572 or instruction <> 6058 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6058, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:614
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:615
//SINZERO		CCS	L
// PORT: Fixed ROM slots 27573.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:616
//		CA	ZERO
// PORT: Fixed ROM slots 27574.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:617
//		TC	Q
// PORT: Fixed ROM slots 27575.
                        if slot <> 27575 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:618
//		CA	NEGMAX		# PI, 2'S COMP
// PORT: Fixed ROM slots 27576.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:619
//		TC	Q
// PORT: Fixed ROM slots 27577.
                    if slot <> 27577 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:620
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:621
//# Page 923
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:622
//# SPARCSIN TAKES AN ARGUMENT SCALED UNITY IN A AND RETURNS AN ANGLE SCALED
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:623
//# 180 DEGREES IN A.  IT HAS BEEN UNIT TESTED IN THE REGION +-.94 (+-70
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:624
//# DEGREES) AND THE MAXIMUM ERROR IS +-5 BITS WITH AN AVERAGE TIME OF
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:625
//# 450 MICROSECONDS.  SPARCSIN -1 TAKES THE ARGUMENT SCALED TWO.  (BOB CRISP)
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:626
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:627
//		DOUBLE
// PORT: Fixed ROM slots 27578.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:628
//SPARCSIN	TS	SR
// PORT: Fixed ROM slots 27579.
                    if slot <> 27579 or instruction <> 22545 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22545, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27580 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:629
//		TCF	+4
// PORT: Fixed ROM slots 27580.
                        if slot <> 27580 or instruction <> 6080 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6080, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:630
//		INDEX	A
// PORT: Fixed ROM slots 27581.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:631
//		CS	LIMITS
// PORT: Fixed ROM slots 27582.
    27582, 37816
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27583–27601.
function agcAotUnit1741 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27591 {
        if slot <= 27586 {
            if slot <= 27584 {
                if slot <= 27583 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:632
//		TS	SR
// PORT: Fixed ROM slots 27583.
                    if slot <> 27583 or instruction <> 22545 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22545, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:633
//		EXTEND
// PORT: Fixed ROM slots 27584.
                    if slot <> 27584 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 27585 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:634
//		MP	A
// PORT: Fixed ROM slots 27585.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:635
//		TS	TEM1
// PORT: Fixed ROM slots 27586.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:636
//		EXTEND
// PORT: Fixed ROM slots 27587.
                    if slot <> 27587 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:637
//		MP	DPL9
// PORT: Fixed ROM slots 27588.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:638
//		AD	DPL7
// PORT: Fixed ROM slots 27589.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:639
//		EXTEND
// PORT: Fixed ROM slots 27590.
                        if slot <> 27590 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:640
//		MP	TEM1
// PORT: Fixed ROM slots 27591.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:641
//		AD	DPL5
// PORT: Fixed ROM slots 27592.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:642
//		EXTEND
// PORT: Fixed ROM slots 27593.
                    if slot <> 27593 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 27594 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:643
//		MP	TEM1
// PORT: Fixed ROM slots 27594.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:644
//		AD	DPL3
// PORT: Fixed ROM slots 27595.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:645
//		EXTEND
// PORT: Fixed ROM slots 27596.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:646
//		MP	TEM1
// PORT: Fixed ROM slots 27597.
                    if slot <> 27597 or instruction <> 28769 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 97, readEffective:call(words, 97)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:647
//		AD	DPL1
// PORT: Fixed ROM slots 27598.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:648
//		EXTEND
// PORT: Fixed ROM slots 27599.
                    if slot <> 27599 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27600 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:649
//		MP	SR
// PORT: Fixed ROM slots 27600.
                        if slot <> 27600 or instruction <> 28689 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 17, readEffective:call(words, 17)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:650
//		TC	Q
// PORT: Fixed ROM slots 27601.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:651
//DPL1		DEC	10502
// PORT: Fixed ROM slots 27602.
    27602, 21004,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:652
//DPL3		DEC	432
// PORT: Fixed ROM slots 27603.
    27603, 864,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:653
//DPL5		DEC	7300
// PORT: Fixed ROM slots 27604.
    27604, 14600,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:654
//DPL7		DEC	-11803
// PORT: Fixed ROM slots 27605.
    27605, 41928,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:655
//DPL9		DEC	8397
// PORT: Fixed ROM slots 27606.
    27606, 16794
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27607–27624.
function agcAotUnit1742 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27615 {
        if slot <= 27610 {
            if slot <= 27608 {
                if slot <= 27607 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:656
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:657
//# Page 924
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:658
//# LIMITSUB LIMITS THE MAGNITUDE OF THE POSITIVE OR NEGATIVE VARIABLE
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:659
//# ARRIVING IN L TO THE POSITIVE LIMIT ARRIVING IN A.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:660
//# THE SIGNED LIMITED VARIABLE IS RETURNED IN A.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:661
//#
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:662
//# VERSION COUTESY HUGH BLAIR-SMITH
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:663
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:664
//LIMITSUB	TS	TEM1
// PORT: Fixed ROM slots 27607.
                    if slot <> 27607 or instruction <> 22625 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22625, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:665
//		CA	ZERO
// PORT: Fixed ROM slots 27608.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:666
//		EXTEND
// PORT: Fixed ROM slots 27609.
                    if slot <> 27609 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:667
//		DV	TEM1
// PORT: Fixed ROM slots 27610.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:668
//		CCS	A
// PORT: Fixed ROM slots 27611.
                    if slot <> 27611 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:669
//		LXCH	TEM1
// PORT: Fixed ROM slots 27612.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:670
//		TCF	+2
// PORT: Fixed ROM slots 27613.
                    if slot <> 27613 or instruction <> 6111 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6111, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27614 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:671
//		TCF	+3
// PORT: Fixed ROM slots 27614.
                        if slot <> 27614 or instruction <> 6113 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6113, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:672
//		CA	L
// PORT: Fixed ROM slots 27615.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:673
//		TC	Q
// PORT: Fixed ROM slots 27616.
                    if slot <> 27616 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:674
//		CS	TEM1
// PORT: Fixed ROM slots 27617.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:675
//		TC	Q
// PORT: Fixed ROM slots 27618.
                    if slot <> 27618 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:676
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:677
//# SUBROUTINE TO CONVERT 1'S COMP SP TO 2'S COMP
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:678
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:679
//ONESTO2S	CCS	A
// PORT: Fixed ROM slots 27619.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:680
//		AD	ONE
// PORT: Fixed ROM slots 27620.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:681
//		TC	Q
// PORT: Fixed ROM slots 27621.
                    if slot <> 27621 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 27622 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:682
//		CS	A
// PORT: Fixed ROM slots 27622.
                    if slot <> 27622 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 27623 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:683
//		TC	Q
// PORT: Fixed ROM slots 27623.
                        if slot <> 27623 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:684
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:685
//# NO ATTITUDE CONTROL
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:686
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:687
//NOATTCNT	TC	ALARM
// PORT: Fixed ROM slots 27624.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:688
//		OCT	00402		# NO ATTITUDE CONTROL
// PORT: Fixed ROM slots 27625.
    27625, 516
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27626–27627.
function agcAotUnit1743 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27626 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:689
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:690
// +2		INHINT			# COME HERE FOR NOATTCNT WITHOUT ALARM
// PORT: Fixed ROM slots 27626.
        if slot <> 27626 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:691
// 		TC	IBNKCALL	# RELINT AT TC INTPRET AFTER TCQCDUW
// PORT: Fixed ROM slots 27627.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:692
//		FCADR	STOPRATE
// PORT: Fixed ROM slots 27628.
    27628, 33002
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27629–27630.
function agcAotUnit1744 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 27629 {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:693
//		TCF	TCQCDUW		# RETURN TO USER SKIPPING AUTOPILOT CMDS
// PORT: Fixed ROM slots 27629.
        if slot <> 27629 or instruction <> 5949 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5949, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:694
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:695
//# MIDDLE GIMBAL ANGLE ALARM
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:696
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:697
//ALARMMGA	TC	ALARM
// PORT: Fixed ROM slots 27630.
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
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:698
//		OCT	00401
// PORT: Fixed ROM slots 27631.
    27631, 514
)).

// PORT: Physical bank 30. Shared continuation entries, slots 27632–27632.
function agcAotUnit1745 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:699
//		TCF	MGARET
// PORT: Fixed ROM slots 27632.
    if slot <> 27632 or instruction <> 5821 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5821, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1745] to agcAotUnit1745@.

agcAotInstallSourceRope(list(
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:700
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:701
//# Page 925
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:702
//#******************************************************************
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:703
//# CONSTANTS
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:704
//#******************************************************************
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:705
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:706
//# ADDRESS CONSTANTS
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:707
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:708
//ECDUWL		ECADR	ECDUW
// PORT: Fixed ROM slots 27633.
    27633, 3404,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:709
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:710
//# THRUST DIRECTION FILTER CONSTANTS
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:711
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:712
//GAINFLTR	DEC	.2		# GAIN FILTER SANS CSM
// PORT: Fixed ROM slots 27634.
    27634, 6554,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:713
//		DEC	.1		# GAIN FILTER WITH CSM
// PORT: Fixed ROM slots 27635.
    27635, 3276,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:714
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:715
//DUNFVLIM	DEC	.007 B-1	# 7 MR MAX CHG IN F DIR IN VEH IN 2 SECS.
// PORT: Fixed ROM slots 27636.
    27636, 114,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:716
//					# THIS DOES NOT ALLOW FOR S/C ROT RATE.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:717
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:718
//UNFVLIM		DEC	.129 B-1	# 129 MR MAX THRUST OFFSET.  105 MR TRAVEL
// PORT: Fixed ROM slots 27637.
    27637, 2114,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:719
//					# +10MR DEFL+5MR MECH MOUNT+9MR ABLATION.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:720
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:721
//# CONSTANT RELATED TO GIMBAL ANGLE COMPUTATIONS
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:722
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:723
//DOTSWFMX	DEC	.93302 B-4	# LIM COLNRTY OF UNWC/2 & UNFC/2 TO 85 DEG
// PORT: Fixed ROM slots 27638.
    27638, 1910,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:724
//					# LOWER PART COMES FROM NEXT CONSTANT
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:725
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:726
//DAXMAX		DEC	.11111111111	# DELATTX LIM TO 20 DEG IN 2 SECS, 1'S, PI
// PORT: Fixed ROM slots 27639.
    27639, 3640,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:727
//		DEC	.0111111111	# 2 DEG WHEN CSM DOCKED
// PORT: Fixed ROM slots 27640.
    27640, 364,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:728
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:729
//DAY/2MAX	DEC	.05555555555	# LIKEWISE FOR DELATTY
// PORT: Fixed ROM slots 27641.
    27641, 1820,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:730
//		DEC	.0055555555
// PORT: Fixed ROM slots 27642.
    27642, 182,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:731
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:732
//DAZMAX		=	DAXMAX		# LIKEWISE FOR DELATTZ
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:733
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:734
//CDUZDLIM	DEC	.3888888888	# 70 DEG LIMIT FOR MGA, 1'S, PI
// PORT: Fixed ROM slots 27643.
    27643, 12744,
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:735
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:736
//# CONSTANTS FOR DATA TRANSFER
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:737
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:738
//DT/DELT		DEC	.05		# .1 SEC/2 SEC WHICH IS THE AUTOPILOT
// PORT: Fixed ROM slots 27644.
    27644, 1638
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:739
//					# CONTROL SAMPLE PERIOD/COMPUTATION PERIOD
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:740
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:741
//DELERLIM	=	DAY/2MAX	# 	0 DEG LIMIT FOR LAG ANGLES, 1'S, PI
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:742
//
// PORT: SOURCE FINDCDUW--GUIDAP_INTERFACE.agc:743
//# *** END OF FLY	.132 ***
