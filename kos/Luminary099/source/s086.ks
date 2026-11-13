// TJET_LAW.agc
// bank 17, slots 18090-18092
function agcAotUnit1093 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18090 {
// TJET_LAW.agc:1
//# Copyright:	Public domain.
// TJET_LAW.agc:2
//# Filename:	TJET_LAW.agc
// TJET_LAW.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// TJET_LAW.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// TJET_LAW.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// TJET_LAW.agc:6
//# Assembler:	yaYUL
// TJET_LAW.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// TJET_LAW.agc:8
//# Website:	www.ibiblio.org/apollo.
// TJET_LAW.agc:9
//# Pages:	1460-1469
// TJET_LAW.agc:10
//# Mod history:	2009-05-27 RSB	Adapted from the corresponding
// TJET_LAW.agc:11
//#				Luminary131 file, using page
// TJET_LAW.agc:12
//#				images from Luminary 1A.
// TJET_LAW.agc:13
//#		2009-06-06 RSB	Eliminated a stray instruction that had crept
// TJET_LAW.agc:14
//#				in somehow.
// TJET_LAW.agc:15
//#
// TJET_LAW.agc:16
//# This source code has been transcribed or otherwise adapted from
// TJET_LAW.agc:17
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// TJET_LAW.agc:18
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// TJET_LAW.agc:19
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// TJET_LAW.agc:20
//# in storage size and consequent reduction in image quality as well) are
// TJET_LAW.agc:21
//# available online at www.ibiblio.org/apollo.  If for some reason you
// TJET_LAW.agc:22
//# find that the images are illegible, contact me at info@sandroid.org
// TJET_LAW.agc:23
//# about getting access to the (much) higher-quality images which Paul
// TJET_LAW.agc:24
//# actually created.
// TJET_LAW.agc:25
//#
// TJET_LAW.agc:26
//# Notations on the hardcopy document read, in part:
// TJET_LAW.agc:27
//#
// TJET_LAW.agc:28
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// TJET_LAW.agc:29
//#	16:27 JULY 14, 1969
// TJET_LAW.agc:30
//
// TJET_LAW.agc:31
//# Page 1460
// TJET_LAW.agc:32
//# PROGRAM DESCRIPTION
// TJET_LAW.agc:33
//# DESIGNED BY:	R. D. GOSS AND P. S. WEISSMAN
// TJET_LAW.agc:34
//# CODED BY:  P. S. WEISSMAN, 28 FEBRUARY 1968
// TJET_LAW.agc:35
//#
// TJET_LAW.agc:36
//# TJETLAW IS CALLED AS A SUBROUTINE WHEN THE LEM IS NOT DOCKED AND THE AUTOPILOT IS IN THE AUTOMATIC OR
// TJET_LAW.agc:37
//# ATTITUDE-HOLD MODE TO CALCULATE THE JET-FIRING-TIME (TJET) REQUIRED FOR THE AXIS INDICATED BY AXISCTR:
// TJET_LAW.agc:38
//#	-1	INDICATES THE P-AXIS
// TJET_LAW.agc:39
//#	+0	INDICATES THE U-AXIS
// TJET_LAW.agc:40
//#	+1	INDICATES THE V-AXIS
// TJET_LAW.agc:41
//# THE REGISTERS E AND EDOT CONTAIN THE APPROPRIATE ATTITUDE ERROR AND ERROR RATE AND SENSETYP SHOWS WHETHER
// TJET_LAW.agc:42
//# UNBALANCED COUPLES ARE PREFERRED.  TJETLAW ALSO USES VARIOUS FUNCTIONS OF ACCELERATION AND DEADBAND WHICH ARE
// TJET_LAW.agc:43
//# COMPUTED IN THE 1/ACCONT SECTION OF 1/ACCS AND ARE STORED IN SUCH AN ORDER THAT THEY CAN BE CONVENIENTLY
// TJET_LAW.agc:44
//# ACCESSED BY INDEXING.
// TJET_LAW.agc:45
//#
// TJET_LAW.agc:46
//# THE SIGN OF THE REQUIRED ROTATION IS CARRIED THROUGH TJETLAW AS ROTSENSE AND IS FINALLY APPLIED TO TJET JUST
// TJET_LAW.agc:47
//# PREVIOUS TO ITS STORAGE IN THE LOCATION CORRESPONDING TO THE AXIS (TJP, TJU, OR TJV).  THE NUMBER OF JETS THAT
// TJET_LAW.agc:48
//# TJETLAW ASSUMES WILL BE USED AS INDICATED BY THE SETTING OF NUMBERT FOR THE U- OR V-AXIS.  TWO JETS ARE ALWAYS
// TJET_LAW.agc:49
//# ASSUMED FOR THE P-AXIS ALTHOUGH FOUR JETS WILL BE FIRED WHEN FIREFCT IS MORE NEGATIVE THAN -4.0 DEGREES
// TJET_LAW.agc:50
//# (FIREFCT IS THE DISTANCE TO A SWITCH CURVE IN THE PHASE PLANE) AND A LONG FIRING IS CALLED FOR.
// TJET_LAW.agc:51
//#
// TJET_LAW.agc:52
//# IN ORDER TO AVOID SCALING DIFFICULTIES, SIMPLE ALGORITHMS TAGGED RUFLAW1, -2 AND -3 ARE RESORTED TO WHEN THE
// TJET_LAW.agc:53
//# ERROR AND/OR ERROR RATE ARE LARGE.
// TJET_LAW.agc:54
//#
// TJET_LAW.agc:55
//# CALLING SEQUENCE:
// TJET_LAW.agc:56
//#		TC	TJETLAW		# (MUST BE IN JASK)
// TJET_LAW.agc:57
//#	OR
// TJET_LAW.agc:58
//#		INHINT			# (MUST BE IN JASK)
// TJET_LAW.agc:59
//#		TC	IBNKCALL
// TJET_LAW.agc:60
//#		CADR	TJETLAW
// TJET_LAW.agc:61
//#		RELINT
// TJET_LAW.agc:62
//#
// TJET_LAW.agc:63
//# EXIT:		RETURN TO Q.
// TJET_LAW.agc:64
//#
// TJET_LAW.agc:65
//# INPUT:
// TJET_LAW.agc:66
//#	FROM THE CALLER:  E, EDOT, AXISCTR, SENSETYP, TJP, -U, -V.
// TJET_LAW.agc:67
//#	FROM 1/ACCONT:  48 ERASABLES BEGINNING AT BLOCKTOP (INCLUDING FLAT, ZONE3LIM AND ACCSWU, -V).
// TJET_LAW.agc:68
//#
// TJET_LAW.agc:69
//# OUTPUT:
// TJET_LAW.agc:70
//#	TJP, -U OR -V, NUMBERT (DAPTEMP5), FIREFCT (DAPTEMP3).
// TJET_LAW.agc:71
//#
// TJET_LAW.agc:72
//# DEBRIS:
// TJET_LAW.agc:73
//#	A, L, Q, E, EDOT, DAPTEMP1-6, DAPTEMP1-4.
// TJET_LAW.agc:74
//#
// TJET_LAW.agc:75
//# ALARM:  NONE
// TJET_LAW.agc:76
//
// TJET_LAW.agc:77
//		BANK	17
// TJET_LAW.agc:78
//		SETLOC	DAPS2
// TJET_LAW.agc:79
//		BANK
// TJET_LAW.agc:80
//		EBANK=	TJP
// TJET_LAW.agc:81
//# Page 1461
// TJET_LAW.agc:82
//		COUNT*	$$/DAPTJ
// TJET_LAW.agc:83
//
// TJET_LAW.agc:84
//TJETLAW		EXTEND			# SAVE Q FOR RETURN.
// slot 18090
        if slot <> 18090 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 18091 {
// TJET_LAW.agc:85
//		QXCH	HOLDQ
// slot 18091
            if slot <> 18091 or instruction <> 10213 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 997, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// TJET_LAW.agc:86
//
// TJET_LAW.agc:87
//# SET INDEXERS TO CORRESPOND TO THE AXIS AND TO THE SIGN OF EDOT
// TJET_LAW.agc:88
//
// TJET_LAW.agc:89
//		INDEX	AXISCTR		# AXISDIFF(-1)=NO OF LOCATIONS BET P AND U
// slot 18092
            if slot <> 18092 or instruction <> 21317 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21317, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21317, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1093] to agcAotUnit1093@.

agcAotInstallSourceRope(list(
// TJET_LAW.agc:90
//		CAF	AXISDIFF	# AXISDIFF(0)=0
// slot 18093
    18093, 28580
)).

// bank 17, slots 18094-18140
function agcAotUnit1094 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18116 {
        if slot <= 18104 {
            if slot <= 18098 {
                if slot <= 18095 {
                    if slot <= 18094 {
// TJET_LAW.agc:91
//		TS	ADRSDIF1	# AXISDIFF(+1)=NO OF LOCATIONS BET V AND U
// slot 18094
                        if slot <> 18094 or instruction <> 23526 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23526, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:92
//
// TJET_LAW.agc:93
//		CAE	EDOT		# IF EDOT NEGATIVE, PICK UP SET OF VALUES
// slot 18095
                        if slot <> 18095 or instruction <> 13079 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 791).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18096 {
// TJET_LAW.agc:94
//		EXTEND			#	THAT ALLOW USE OF SAME CODING AS FOR
// slot 18096
                        if slot <> 18096 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18097 {
// TJET_LAW.agc:95
//		BZMF	NEGEDOT		#	POSITIVE EDOT.
// slot 18097
                            if slot <> 18097 or instruction <> 26294 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 26294, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TJET_LAW.agc:96
//		CAE	ADRSDIF1	# SET A SECOND INDEXER WHICH MAY BE
// slot 18098
                            if slot <> 18098 or instruction <> 13286 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 998).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18101 {
                    if slot <= 18099 {
// TJET_LAW.agc:97
//		TS	ADRSDIF2	# 	MODIFIED BY A DECISION FOR MAX JETS.
// slot 18099
                        if slot <> 18099 or instruction <> 23524 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23524, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18100 {
// TJET_LAW.agc:98
//		CAF	SENSOR		# FOR POSITIVE EDOT, ROTSENSE IS
// slot 18100
                            if slot <> 18100 or instruction <> 14292 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2004), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TJET_LAW.agc:99
//		TCF	SETSENSE	# 	INITIALIZED POSITIVE.
// slot 18101
                            if slot <> 18101 or instruction <> 5822 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5822, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18102 {
// TJET_LAW.agc:100
//
// TJET_LAW.agc:101
//NEGEDOT		CS	E		# IN ORDER FOR NEG EDOT CASE TO USE CODING
// slot 18102
                        if slot <> 18102 or instruction <> 17386 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 1002).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18103 {
// TJET_LAW.agc:102
//		TS	E		#	OF POS EDOT, MUST MODIFY AS FOLLOWS:
// slot 18103
                            if slot <> 18103 or instruction <> 23530 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23530, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TJET_LAW.agc:103
//		CS	EDOT		#	1. COMPLEMENT E AND EDOT.
// slot 18104
                            if slot <> 18104 or instruction <> 17175 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 791).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 18110 {
                if slot <= 18107 {
                    if slot <= 18105 {
// TJET_LAW.agc:104
//		TS	EDOT		#	2. SET SENSE OF ROTATION TO NEGATIVE
// slot 18105
                        if slot <> 18105 or instruction <> 23319 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23319, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18106 {
// TJET_LAW.agc:105
//		CAF	BIT1		#	   (REVERSED LATER IF NECESSARY).
// slot 18106
                            if slot <> 18106 or instruction <> 14827 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TJET_LAW.agc:106
//		ADS	ADRSDIF1	#	3. INCREMENT INDEXERS BY ONE SO THAT
// slot 18107
                            if slot <> 18107 or instruction <> 12262 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 998).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18108 {
// TJET_LAW.agc:107
//		TS	ADRSDIF2	#	   THE PROPER PARAMETERS ARE ACCESSED.
// slot 18108
                        if slot <> 18108 or instruction <> 23524 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23524, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18109 {
// TJET_LAW.agc:108
//		CS	SENSOR
// slot 18109
                            if slot <> 18109 or instruction <> 18388 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2004), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TJET_LAW.agc:109
//SETSENSE	TS	ROTSENSE
// slot 18110
                            if slot <> 18110 or instruction <> 23520 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23520, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18113 {
                    if slot <= 18111 {
// TJET_LAW.agc:110
//
// TJET_LAW.agc:111
//# TEST MAGNITUDE OF E (ATTITUDE ERROR, SINGLE-PRECISION, SCALED AT PI RADIANS):
// TJET_LAW.agc:112
//#	IF GREATER THAN (OR EQUAL TO) PI/16 RADIANS, GO TO THE SIMPLIFIED TJET ROUTINE.
// TJET_LAW.agc:113
//#	IF LESS THAN PI/16 RADIANS, RESCALE TO PI/4
// TJET_LAW.agc:114
//
// TJET_LAW.agc:115
//		CAE	E		# PICK UP ATTITUDE ERROR FOR THIS AXIS
// slot 18111
                        if slot <> 18111 or instruction <> 13290 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 1002).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18112 {
// TJET_LAW.agc:116
//		EXTEND
// slot 18112
                            if slot <> 18112 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TJET_LAW.agc:117
//		MP	BIT5		# SHIFT RIGHT TEN BITS:  IF A-REGISTER IS
// slot 18113
                            if slot <> 18113 or instruction <> 31207 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2535, readEffective:call(words, 2535)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18114 {
// TJET_LAW.agc:118
//		CCS	A		#	ZERO, RESCALE AND TEST EDOT.
// slot 18114
                        if slot <> 18114 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18115 {
// TJET_LAW.agc:119
//		TCF	RUFLAW2
// slot 18115
                            if slot <> 18115 or instruction <> 6068 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6068, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TJET_LAW.agc:120
//		TCF	SCALEE
// slot 18116
                            if slot <> 18116 or instruction <> 5830 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5830, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 18128 {
            if slot <= 18122 {
                if slot <= 18119 {
                    if slot <= 18117 {
// TJET_LAW.agc:121
//		TCF	RUFLAW1
// slot 18117
                        if slot <> 18117 or instruction <> 6040 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6040, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18118 {
// TJET_LAW.agc:122
//SCALEE		CAF	BIT13		# ERROR IS IN L SCALED AT PI/16.  RESCALE
// slot 18118
                            if slot <> 18118 or instruction <> 14815 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TJET_LAW.agc:123
//		EXTEND			#	IT TO PI/4 AND SAVE IT.
// slot 18119
                            if slot <> 18119 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18120 {
// TJET_LAW.agc:124
//		MP	L
// slot 18120
                        if slot <> 18120 or instruction <> 28673 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 1, readEffective:call(words, 1)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18121 {
// TJET_LAW.agc:125
//		TS	E
// slot 18121
                            if slot <> 18121 or instruction <> 23530 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23530, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TJET_LAW.agc:126
//
// TJET_LAW.agc:127
//# TEST MAGNITUDE OF EDOT (ERROR RATE SCALED AT PI/4 RADIANS/SECOND)
// TJET_LAW.agc:128
//#	IF GREATER THAN (OR EQUAL TO) PI/32 RADIANS/SECOND, GO TO THE SIMPLIFIED TJET ROUTINE.
// TJET_LAW.agc:129
//#	IF LESS THAN PI/32 RADIANS/SECOND, THEN RESCALE TO PI/32 RADIANS/SECOND.
// TJET_LAW.agc:130
//
// TJET_LAW.agc:131
//		CAE	EDOT		# PICK UP SINGLE-PRECISION ERROR-RATE
// slot 18122
                            if slot <> 18122 or instruction <> 13079 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 791).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18125 {
                    if slot <= 18123 {
// TJET_LAW.agc:132
//# Page 1462
// TJET_LAW.agc:133
//		EXTEND			# FOR THIS AXIS=
// slot 18123
                        if slot <> 18123 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18124 {
// TJET_LAW.agc:134
//		MP	BIT4		# SHIFT RIGHT ELEVEN BITS, IF THE A-REG IS
// slot 18124
                            if slot <> 18124 or instruction <> 31208 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2536, readEffective:call(words, 2536)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TJET_LAW.agc:135
//		EXTEND			# ZERO, THEN RESCALE AND USE FINELAW.
// slot 18125
                            if slot <> 18125 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18126 {
// TJET_LAW.agc:136
//		BZF	SCALEDOT
// slot 18126
                        if slot <> 18126 or instruction <> 5840 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5840, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18127 {
// TJET_LAW.agc:137
//		TCF	RUFLAW3
// slot 18127
                            if slot <> 18127 or instruction <> 6074 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6074, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TJET_LAW.agc:138
//
// TJET_LAW.agc:139
//# *** FINELAW STARTS HERE ***
// TJET_LAW.agc:140
//
// TJET_LAW.agc:141
//SCALEDOT	LXCH	EDOT		# EDOT IS SCALED AT PI/32 RADIANS/SECOND.
// slot 18128
                            if slot <> 18128 or instruction <> 10007 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreExchange(words, 1, 791, readPhysical).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 18134 {
                if slot <= 18131 {
                    if slot <= 18129 {
// TJET_LAW.agc:142
//
// TJET_LAW.agc:143
//		CAE	EDOT		# COMPUTE (EDOT)(EDOT)
// slot 18129
                        if slot <> 18129 or instruction <> 13079 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 791).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18130 {
// TJET_LAW.agc:144
//		EXTEND
// slot 18130
                            if slot <> 18130 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TJET_LAW.agc:145
//		SQUARE			# PRODUCT SCALED AT PI(2)/2(10) RAD/SEC.
// slot 18131
                            if slot <> 18131 or instruction <> 28672 { return choose false if checkOnly else -1. }
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
                } else {
                    if slot <= 18132 {
// TJET_LAW.agc:146
//		EXTEND
// slot 18132
                        if slot <> 18132 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18133 {
// TJET_LAW.agc:147
//		MP	BIT13		# SHIFT RIGHT TWO BITS TO RESCALE TO EDOTSQ
// slot 18133
                            if slot <> 18133 or instruction <> 31199 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2527, readEffective:call(words, 2527)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TJET_LAW.agc:148
//		TS	EDOTSQ		#	TO PI(2)/2(8) RAD(2)/SEC(2).
// slot 18134
                            if slot <> 18134 or instruction <> 23519 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23519, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18137 {
                    if slot <= 18135 {
// TJET_LAW.agc:149
//
// TJET_LAW.agc:150
//ERRTEST		CCS	E		# DOES BIG ERROR (THREE DEG BEYOND THE
// slot 18135
                        if slot <> 18135 or instruction <> 5098 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 1002).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18136 {
// TJET_LAW.agc:151
//		AD	-3DEG		# DEADBAND) REQUIRE MAXIMUM JETS?
// slot 18136
                            if slot <> 18136 or instruction <> 26581 { return choose false if checkOnly else -1. }
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
// TJET_LAW.agc:152
//		TCF	+2
// slot 18137
                            if slot <> 18137 or instruction <> 5851 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5851, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18138 {
// TJET_LAW.agc:153
//		AD	-3DEG
// slot 18138
                        if slot <> 18138 or instruction <> 26581 { return choose false if checkOnly else -1. }
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
                        if slot <= 18139 {
// TJET_LAW.agc:154
//		EXTEND
// slot 18139
                            if slot <> 18139 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TJET_LAW.agc:155
//		INDEX	ADRSDIF1
// slot 18140
                            if slot <> 18140 or instruction <> 21478 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 21478, words[0], readEffective).
                            }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 21478, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1094] to agcAotUnit1094@.

agcAotInstallSourceRope(list(
// TJET_LAW.agc:156
//		SU	FIREDB
// slot 18141
    18141, 50946
)).

// bank 17, slots 18142-18154
function agcAotUnit1095 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18147 {
        if slot <= 18144 {
            if slot <= 18142 {
// TJET_LAW.agc:157
//		EXTEND
// slot 18142
                if slot <> 18142 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18143 {
// TJET_LAW.agc:158
//		BZMF	SENSTEST	# IF NOT:  ARE UNBALANCED JETS PREFERRED?
// slot 18143
                    if slot <> 18143 or instruction <> 26340 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26340, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TJET_LAW.agc:159
//MAXJETS		CAF	TWO		# IF YES:  INCREMENT ADDRESS LOCATOR AND
// slot 18144
                    if slot <> 18144 or instruction <> 14826 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 18145 {
// TJET_LAW.agc:160
//		ADS	ADRSDIF2	#	   SET SWITCH FOR JET SELECT LOGIC TO 4.
// slot 18145
                if slot <> 18145 or instruction <> 12260 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 996).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18146 {
// TJET_LAW.agc:161
//		CAF	FOUR		#	   (ALWAYS DO THIS FOR P-AXIS)
// slot 18146
                    if slot <> 18146 or instruction <> 14825 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TJET_LAW.agc:162
//		TCF	TJCALC
// slot 18147
                    if slot <> 18147 or instruction <> 5863 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5863, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 18150 {
            if slot <= 18148 {
// TJET_LAW.agc:163
//SENSTEST	CCS	SENSETYP	# DOES TRANSLATION PREFER MIN JETS.
// slot 18148
                if slot <> 18148 or instruction <> 4928 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 832).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18149 {
// TJET_LAW.agc:164
//		TCF	TJCALC		# YES.  USE MIN-JET PARAMETERS
// slot 18149
                    if slot <> 18149 or instruction <> 5863 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5863, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TJET_LAW.agc:165
//		TCF	MAXJETS		# NO.  GET THE MAX-JET PARAMETERS.
// slot 18150
                    if slot <> 18150 or instruction <> 5856 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5856, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 18152 {
                if slot <= 18151 {
// TJET_LAW.agc:166
//TJCALC		TS	NUMBERT		# SET TO +0,1,4 FOR (U,V-AXES) JET SELECT.
// slot 18151
                    if slot <> 18151 or instruction <> 23523 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23523, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TJET_LAW.agc:167
//
// TJET_LAW.agc:168
//# BEGINNING OF TJET CALCULATIONS:
// TJET_LAW.agc:169
//
// TJET_LAW.agc:170
//		CS	EDOTSQ		# SCALED AT PI(2)/2(8).
// slot 18152
                    if slot <> 18152 or instruction <> 17375 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 991).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18153 {
// TJET_LAW.agc:171
//		EXTEND
// slot 18153
                    if slot <> 18153 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TJET_LAW.agc:172
//		INDEX	ADRSDIF2
// slot 18154
                    if slot <> 18154 or instruction <> 21476 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21476, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21476, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1095] to agcAotUnit1095@.

agcAotInstallSourceRope(list(
// TJET_LAW.agc:173
//		MP	1/ANET1		# .5/ACC SCALED AT 2(6)/PI SEC(2)/RADIAN.
// slot 18155
    18155, 59118
)).

// bank 17, slots 18156-18156
function agcAotUnit1096 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// TJET_LAW.agc:174
//		INDEX	ADRSDIF1
// slot 18156
    if slot <> 18156 or instruction <> 21478 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21478, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21478, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1096] to agcAotUnit1096@.

agcAotInstallSourceRope(list(
// TJET_LAW.agc:175
//		AD	FIREDB		# DEADBAND SCALED AT PI/4 RADIAN.
// slot 18157
    18157, 50946
)).

// bank 17, slots 18158-18163
function agcAotUnit1097 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18160 {
        if slot <= 18158 {
// TJET_LAW.agc:176
//		EXTEND
// slot 18158
            if slot <> 18158 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18159 {
// TJET_LAW.agc:177
//		SU	E		# ATTITUDE ERROR SCALED AT PI/4 RADIAN.
// slot 18159
                if slot <> 18159 or instruction <> 25578 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreSU(words, 1002).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// TJET_LAW.agc:178
//		TS	FIREFCT		# -E-.5(EDOTSQ)/ACC-DB AT PI/4 RADIAN.
// slot 18160
                if slot <> 18160 or instruction <> 23521 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23521, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 18161 {
// TJET_LAW.agc:179
//		EXTEND
// slot 18161
            if slot <> 18161 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18162 {
// TJET_LAW.agc:180
//		BZMF	ZON1,2,3
// slot 18162
                if slot <> 18162 or instruction <> 26466 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26466, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TJET_LAW.agc:181
//
// TJET_LAW.agc:182
//ZONE4,5		INDEX	ADRSDIF1
// slot 18163
                if slot <> 18163 or instruction <> 21478 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21478, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21478, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1097] to agcAotUnit1097@.

agcAotInstallSourceRope(list(
// TJET_LAW.agc:183
//		CAE	1/ACOAST	# .5/ACC SCALED AT 2(6)/PI WHERE
// slot 18164
    18164, 26358
)).

// bank 17, slots 18165-18168
function agcAotUnit1098 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18166 {
        if slot <= 18165 {
// TJET_LAW.agc:184
//# Page 1463
// TJET_LAW.agc:185
//		EXTEND			# ACC = MAX(AMIN, AOS-).
// slot 18165
            if slot <> 18165 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// TJET_LAW.agc:186
//		MP	EDOTSQ		# SCALED AT PI/2(8).
// slot 18166
            if slot <> 18166 or instruction <> 29663 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 991, readEffective:call(words, 991)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 18167 {
// TJET_LAW.agc:187
//		AD	E		# SCALED AT PI/4
// slot 18167
            if slot <> 18167 or instruction <> 25578 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 1002).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// TJET_LAW.agc:188
//		INDEX	ADRSDIF1
// slot 18168
            if slot <> 18168 or instruction <> 21478 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21478, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21478, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1098] to agcAotUnit1098@.

agcAotInstallSourceRope(list(
// TJET_LAW.agc:189
//		AD	COASTDB		# SCALED AT PI/4 POS. FOR NEG. INTERCEPT.
// slot 18169
    18169, 50950
)).

// bank 17, slots 18170-18172
function agcAotUnit1099 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18170 {
// TJET_LAW.agc:190
//		EXTEND			# TEST E+.5(EDOTSQ)/ACC+DB AT PI/4 RADIAN.
// slot 18170
        if slot <> 18170 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 18171 {
// TJET_LAW.agc:191
//		BZMF	ZONE5		# IF FUNCTION NEGATIVE, FIND TJET.
// slot 18171
            if slot <> 18171 or instruction <> 26390 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26390, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// TJET_LAW.agc:192
//					# IF FUNCTION POSITIVE, IN ZONE 4.
// TJET_LAW.agc:193
//
// TJET_LAW.agc:194
//# ZONE 4 IS THE COAST REGION.  HOWEVER, IF THE JETS ARE ON AND DRIVING TOWARD
// TJET_LAW.agc:195
//#	A. THE AXIS WITHIN + OR - (DB + FLAT) FOR DRIFTING FLIGHT, OR
// TJET_LAW.agc:196
//#	B. THE USUAL TARGET PARABOLA FOR POWERED FLIGHT
// TJET_LAW.agc:197
//# THEN THE THRUSTERS ARE KEPT ON.
// TJET_LAW.agc:198
//
// TJET_LAW.agc:199
//ZONE4		INDEX	AXISCTR		# IS THE CURRENT VALUE IN TJET NON-ZERO
// slot 18172
            if slot <> 18172 or instruction <> 21317 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21317, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21317, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1099] to agcAotUnit1099@.

agcAotInstallSourceRope(list(
// TJET_LAW.agc:200
//		CS	TJETU		# 	WITH SENSE OPPOSITE TO EDOT,
// slot 18173
    18173, 34474
)).

// bank 17, slots 18174-18181
function agcAotUnit1100 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18177 {
        if slot <= 18175 {
            if slot <= 18174 {
// TJET_LAW.agc:201
//		EXTEND			#	(I.E., ARE JETS ON AND FIRING TOWARD
// slot 18174
                if slot <> 18174 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TJET_LAW.agc:202
//		MP	ROTSENSE	#	THE DESIRABLE STATE).
// slot 18175
                if slot <> 18175 or instruction <> 29664 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 992, readEffective:call(words, 992)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18176 {
// TJET_LAW.agc:203
//		EXTEND
// slot 18176
                if slot <> 18176 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TJET_LAW.agc:204
//		BZMF	COASTTJ		# NO.  COAST.
// slot 18177
                if slot <> 18177 or instruction <> 26386 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26386, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 18179 {
            if slot <= 18178 {
// TJET_LAW.agc:205
//
// TJET_LAW.agc:206
//JETSON		CCS	FLAT		# YES.  IS THIS DRIFTING OR POWERED FLIGHT?
// slot 18178
                if slot <> 18178 or instruction <> 4973 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 877).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// TJET_LAW.agc:207
//		TCF	DRIFT/ON	# DRIFTING.  GO MAKE FURTHER TEST.
// slot 18179
                if slot <> 18179 or instruction <> 5900 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5900, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18180 {
// TJET_LAW.agc:208
//
// TJET_LAW.agc:209
//		CS	FIREFCT		# POWERED (OR ULLAGE).  CAN TARGET PARABOLA
// slot 18180
                if slot <> 18180 or instruction <> 17377 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 993).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// TJET_LAW.agc:210
//		INDEX	ADRSDIF1	#	BE REACHED FROM THIS POINT IN THE
// slot 18181
                if slot <> 18181 or instruction <> 21478 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21478, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21478, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1100] to agcAotUnit1100@.

agcAotInstallSourceRope(list(
// TJET_LAW.agc:211
//		AD	AXISDIST	#	PHASE PLANE?
// slot 18182
    18182, 50954
)).

// bank 17, slots 18183-18188
function agcAotUnit1101 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18185 {
        if slot <= 18183 {
// TJET_LAW.agc:212
//		EXTEND
// slot 18183
            if slot <> 18183 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18184 {
// TJET_LAW.agc:213
//		BZMF	COASTTJ		# NO. SET TJET = 0.
// slot 18184
                if slot <> 18184 or instruction <> 26386 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26386, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TJET_LAW.agc:214
//		TC	Z123COMP	# YES.  CALCULATE TJET AS THOUGH IN ZONE 1
// slot 18185
                if slot <> 18185 or instruction <> 1878 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1878, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 18186 {
// TJET_LAW.agc:215
//		CAE	FIREFCT		#	AFTER COMPUTING THE REQUIRED
// slot 18186
            if slot <> 18186 or instruction <> 13281 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 993).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18187 {
// TJET_LAW.agc:216
//		TCF	ZONE1		#	PARAMETERS.
// slot 18187
                if slot <> 18187 or instruction <> 6002 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6002, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TJET_LAW.agc:217
//
// TJET_LAW.agc:218
//DRIFT/ON	INDEX	ADRSDIF1	# CAN TARGET STRIP OF AXIS BE REACHED FROM
// slot 18188
                if slot <> 18188 or instruction <> 21478 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21478, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21478, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1101] to agcAotUnit1101@.

agcAotInstallSourceRope(list(
// TJET_LAW.agc:219
//		CS	FIREDB		#	THIS POINT IN THE PHASE PLANE?
// slot 18189
    18189, 34562
)).

// bank 17, slots 18190-18206
function agcAotUnit1102 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18197 {
        if slot <= 18193 {
            if slot <= 18191 {
                if slot <= 18190 {
// TJET_LAW.agc:220
//		DOUBLE
// slot 18190
                    if slot <> 18190 or instruction <> 24576 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TJET_LAW.agc:221
//		AD	FIREFCT
// slot 18191
                    if slot <> 18191 or instruction <> 25569 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 993).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18192 {
// TJET_LAW.agc:222
//		EXTEND
// slot 18192
                    if slot <> 18192 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TJET_LAW.agc:223
//		BZMF	+3
// slot 18193
                    if slot <> 18193 or instruction <> 26388 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26388, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 18195 {
                if slot <= 18194 {
// TJET_LAW.agc:224
//COASTTJ		CAF	ZERO		# NO.  SET TJET = 0.
// slot 18194
                    if slot <> 18194 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TJET_LAW.agc:225
//		TCF	RETURNTJ
// slot 18195
                    if slot <> 18195 or instruction <> 5942 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5942, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18196 {
// TJET_LAW.agc:226
//
// TJET_LAW.agc:227
//		TC	Z123COMP	# YES. CALCULATE TJET AS THOUGH IN ZONE 2
// slot 18196
                    if slot <> 18196 or instruction <> 1878 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1878, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TJET_LAW.agc:228
//		TCF	ZONE2,3		#	OR 3 AFTER COMPUTING REQUIRED VALUES.
// slot 18197
                    if slot <> 18197 or instruction <> 5991 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5991, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 18201 {
            if slot <= 18199 {
                if slot <= 18198 {
// TJET_LAW.agc:229
//
// TJET_LAW.agc:230
//ZONE5		TS	L		# TEMPORARILY STORE FUNCTION IN L.
// slot 18198
                    if slot <> 18198 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TJET_LAW.agc:231
//		CCS	ROTSENSE	# MODIFY ADRSDIF2 FOR ACCESSING 1/ANET2
// slot 18199
                    if slot <> 18199 or instruction <> 5088 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 992).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18200 {
// TJET_LAW.agc:232
//		TCF	+4		# AND ACCFCTZ5, WHICH MUST BE PICKED UP
// slot 18200
                    if slot <> 18200 or instruction <> 5916 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5916, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TJET_LAW.agc:233
//		TC	CCSHOLE		# FROM THE NEXT LOWER REGISTER IF THE
// slot 18201
                    if slot <> 18201 or instruction <> 3013 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3013, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 18203 {
                if slot <= 18202 {
// TJET_LAW.agc:234
//		CS	TWO		# (ACTUAL) ERROR RATE IS NEGATIVE.
// slot 18202
                    if slot <> 18202 or instruction <> 18922 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TJET_LAW.agc:235
//# Page 1464
// TJET_LAW.agc:236
//		ADS	ADRSDIF2
// slot 18203
                    if slot <> 18203 or instruction <> 12260 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 996).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18204 {
// TJET_LAW.agc:237
//
// TJET_LAW.agc:238
// +4		CAE	L
// slot 18204
                    if slot <> 18204 or instruction <> 12289 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18205 {
// TJET_LAW.agc:239
//		EXTEND
// slot 18205
                        if slot <> 18205 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:240
//		INDEX	ADRSDIF2	# TTOAXIS AND HH ARE THE PARAMETERS UPON
// slot 18206
                        if slot <> 18206 or instruction <> 21476 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21476, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21476, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1102] to agcAotUnit1102@.

agcAotInstallSourceRope(list(
// TJET_LAW.agc:241
//		MP	ACCFCTZ5	#	WHICH THE APPROXIMATIONS TO TJET ARE
// slot 18207
    18207, 59132
)).

// bank 17, slots 18208-18211
function agcAotUnit1103 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18209 {
        if slot <= 18208 {
// TJET_LAW.agc:242
//		DDOUBL			#	ABASED.
// slot 18208
            if slot <> 18208 or instruction <> 8193 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDas(words, 1) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// TJET_LAW.agc:243
//		DDOUBL
// slot 18209
            if slot <> 18209 or instruction <> 8193 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDas(words, 1) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 18210 {
// TJET_LAW.agc:244
//		DXCH	HH		# DOUBLE PRECISION H SCALED AT 8 SEC(2).
// slot 18210
            if slot <> 18210 or instruction <> 22504 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 1000, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// TJET_LAW.agc:245
//		INDEX	ADRSDIF2
// slot 18211
            if slot <> 18211 or instruction <> 21476 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21476, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21476, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1103] to agcAotUnit1103@.

agcAotInstallSourceRope(list(
// TJET_LAW.agc:246
//		CAE	1/ANET2		# SCALED AT 2(7)/PI SEC(2)/RAD.
// slot 18212
    18212, 26352
)).

// bank 17, slots 18213-18228
function agcAotUnit1104 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18220 {
        if slot <= 18216 {
            if slot <= 18214 {
                if slot <= 18213 {
// TJET_LAW.agc:247
//		EXTEND
// slot 18213
                    if slot <> 18213 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TJET_LAW.agc:248
//		MP	EDOT		# SCALED AT PI/2(5)
// slot 18214
                    if slot <> 18214 or instruction <> 29463 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 791, readEffective:call(words, 791)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18215 {
// TJET_LAW.agc:249
//		TS	TTOAXIS		# SCALED AT 4 SEC.
// slot 18215
                    if slot <> 18215 or instruction <> 23522 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23522, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TJET_LAW.agc:250
//
// TJET_LAW.agc:251
//# TEST WHETHER TJET GREATER THAN 50 MSEC.
// TJET_LAW.agc:252
//
// TJET_LAW.agc:253
//		EXTEND
// slot 18216
                    if slot <> 18216 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 18218 {
                if slot <= 18217 {
// TJET_LAW.agc:254
//		MP	-.05AT2		# H - .05 TTOAXIS - .00125 G.T. ZERO
// slot 18217
                    if slot <> 18217 or instruction <> 30684 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 2012, readEffective:call(words, 2012)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TJET_LAW.agc:255
//		AD	HH		# 	(SCALED AT 8 SEC(2) ).
// slot 18218
                    if slot <> 18218 or instruction <> 25575 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 999).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18219 {
// TJET_LAW.agc:256
//		AD	NEG2
// slot 18219
                    if slot <> 18219 or instruction <> 28646 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 4070), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TJET_LAW.agc:257
//		EXTEND
// slot 18220
                    if slot <> 18220 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 18224 {
            if slot <= 18222 {
                if slot <= 18221 {
// TJET_LAW.agc:258
//		BZMF	FORMULA1
// slot 18221
                    if slot <> 18221 or instruction <> 26435 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26435, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TJET_LAW.agc:259
//
// TJET_LAW.agc:260
//# TEST WHETHER TJET GREATER THAN 150 MSEC.
// TJET_LAW.agc:261
//
// TJET_LAW.agc:262
//		CAE	TTOAXIS
// slot 18222
                    if slot <> 18222 or instruction <> 13282 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 994).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18223 {
// TJET_LAW.agc:263
//		EXTEND
// slot 18223
                    if slot <> 18223 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TJET_LAW.agc:264
//		MP	-.15AT2		# H - .15 TTOAXIS - .01125 G.T. ZERO
// slot 18224
                    if slot <> 18224 or instruction <> 30685 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 2013, readEffective:call(words, 2013)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 18226 {
                if slot <= 18225 {
// TJET_LAW.agc:265
//		AD	HH		#	(SCALED AT 8 SEC(2) )
// slot 18225
                    if slot <> 18225 or instruction <> 25575 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 999).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TJET_LAW.agc:266
//		AD	-.0112A8
// slot 18226
                    if slot <> 18226 or instruction <> 26582 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2006), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18227 {
// TJET_LAW.agc:267
//		EXTEND
// slot 18227
                    if slot <> 18227 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TJET_LAW.agc:268
//		BZMF	FORMULA2
// slot 18228
                    if slot <> 18228 or instruction <> 26443 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26443, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1104] to agcAotUnit1104@.

// bank 17, slots 18229-18232
function agcAotUnit1105 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18230 {
        if slot <= 18229 {
// TJET_LAW.agc:269
//
// TJET_LAW.agc:270
//# IF TJET GREATER THAN 150 MSEC, ASSIGN IT VALUE OF 250 MSEC, SINCE THIS
// TJET_LAW.agc:271
//# IS ENOUGH TO ASSURE NO SKIP NEXT CSP (100 MSEC).
// TJET_LAW.agc:272
//
// TJET_LAW.agc:273
//FULLTIME	CAF	BIT11		# 250 MSEC SCALED AT 4 SEC.
// slot 18229
            if slot <> 18229 or instruction <> 14817 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// TJET_LAW.agc:274
//
// TJET_LAW.agc:275
//# RETURN TO CALLING PROGRAM WITH JET TIME SCALED AS TIME6 AND SIGNED.
// TJET_LAW.agc:276
//
// TJET_LAW.agc:277
//RETURNTJ	EXTEND			# ALL BRANCHES TERMINATE HERE WITH TJET
// slot 18230
            if slot <> 18230 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 18231 {
// TJET_LAW.agc:278
//		MP	ROTSENSE	#	(SCALED AT 4 SEC) IN THE ACCUMULATOR.
// slot 18231
            if slot <> 18231 or instruction <> 29664 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 992, readEffective:call(words, 992)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// TJET_LAW.agc:279
//		INDEX	AXISCTR		# ROTSENSE APPLIES SIGN AND CHANGES SCALE.
// slot 18232
            if slot <> 18232 or instruction <> 21317 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21317, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21317, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1105] to agcAotUnit1105@.

agcAotInstallSourceRope(list(
// TJET_LAW.agc:280
//		TS	TJETU
// slot 18233
    18233, 46762
)).

// bank 17, slots 18234-18235
function agcAotUnit1106 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18234 {
// TJET_LAW.agc:281
//		EXTEND
// slot 18234
        if slot <> 18234 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// TJET_LAW.agc:282
//		INDEX	AXISCTR
// slot 18235
        if slot <> 18235 or instruction <> 21317 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21317, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21317, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1106] to agcAotUnit1106@.

agcAotInstallSourceRope(list(
// TJET_LAW.agc:283
//		MP	ACCSWU		# SET SWITCH FOR JET SELECT IF ROTATION IS
// slot 18236
    18236, 59086
)).

// bank 17, slots 18237-18266
function agcAotUnit1107 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18251 {
        if slot <= 18243 {
            if slot <= 18239 {
                if slot <= 18237 {
// TJET_LAW.agc:284
//		CAE	L
// slot 18237
                    if slot <> 18237 or instruction <> 12289 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18238 {
// TJET_LAW.agc:285
//		EXTEND			#	IN A SENSE FOR WHICH 1/ACCS HAS FORCED
// slot 18238
                        if slot <> 18238 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:286
//		BZMF	+3		#	A MAX-JET CALCULATION.
// slot 18239
                        if slot <> 18239 or instruction <> 26434 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26434, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18241 {
                    if slot <= 18240 {
// TJET_LAW.agc:287
//		CAF	FOUR
// slot 18240
                        if slot <> 18240 or instruction <> 14825 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:288
//# Page 1465
// TJET_LAW.agc:289
//		TS	NUMBERT
// slot 18241
                        if slot <> 18241 or instruction <> 23523 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23523, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18242 {
// TJET_LAW.agc:290
//		TC	HOLDQ		# RETURN VIA SAVED Q.
// slot 18242
                        if slot <> 18242 or instruction <> 997 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 997, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:291
//
// TJET_LAW.agc:292
//# TJET = H/(.025 + TTOAXIS) 	FOR TJET LESS THAN 50 MSEC.
// TJET_LAW.agc:293
//
// TJET_LAW.agc:294
//FORMULA1	CS	-.025AT4	# .025 SEC SCALED AT 4.
// slot 18243
                        if slot <> 18243 or instruction <> 18395 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2011), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 18247 {
                if slot <= 18245 {
                    if slot <= 18244 {
// TJET_LAW.agc:295
//		AD	TTOAXIS		# SCALED AT 4 SECONDS.
// slot 18244
                        if slot <> 18244 or instruction <> 25570 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 994).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:296
//		DXCH	HH		# STORE DENOMINATOR IN FIRST WORD OF H,
// slot 18245
                        if slot <> 18245 or instruction <> 22504 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 1000, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18246 {
// TJET_LAW.agc:297
//		EXTEND			#	WHICH NEED NOT BE PRESERVED.  PICK UP
// slot 18246
                        if slot <> 18246 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:298
//		DV	HH		#	DP H AND DIVIDE BY DENOMINATOR.
// slot 18247
                        if slot <> 18247 or instruction <> 5095 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreDv(words, 999, readEffective:call(words, 999)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18249 {
                    if slot <= 18248 {
// TJET_LAW.agc:299
//		EXTEND
// slot 18248
                        if slot <> 18248 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:300
//		MP	BIT14		# RESCALE TJET FROM 2 TO USUAL 4 SEC.
// slot 18249
                        if slot <> 18249 or instruction <> 31198 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2526, readEffective:call(words, 2526)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18250 {
// TJET_LAW.agc:301
//		TCF	CHKMINTJ	# CHECK THAT TJET IS NOT LESS THAN MINIMUM
// slot 18250
                        if slot <> 18250 or instruction <> 6035 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6035, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:302
//
// TJET_LAW.agc:303
//# TJET = (H + .00375)/(0.1 + TTOAXIS)	FOR TJET GREATER THAN 50 MSEC.
// TJET_LAW.agc:304
//
// TJET_LAW.agc:305
//FORMULA2	EXTEND
// slot 18251
                        if slot <> 18251 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 18258 {
            if slot <= 18254 {
                if slot <= 18252 {
// TJET_LAW.agc:306
//		DCA	.00375A8	# .00375 SEC(2) SCALED AT 8.
// slot 18252
                    if slot <> 18252 or instruction <> 14303 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 2015, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18253 {
// TJET_LAW.agc:307
//		DAS	HH		# STORE NUMERATOR IN DP H, WHICH NEED NOT
// slot 18253
                        if slot <> 18253 or instruction <> 9192 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 1000) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:308
//					#	BE PRESERVED.
// TJET_LAW.agc:309
//		CAE	TTOAXIS		# SCALED AT 4 SEC.
// slot 18254
                        if slot <> 18254 or instruction <> 13282 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 994).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18256 {
                    if slot <= 18255 {
// TJET_LAW.agc:310
//		AD	.1AT4		# 0.1 SEC SCALED AT 4.
// slot 18255
                        if slot <> 18255 or instruction <> 26583 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2007), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:311
//		DXCH	HH		# STORE DENOMINATOR IN FIRST WORD OF H,
// slot 18256
                        if slot <> 18256 or instruction <> 22504 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 1000, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18257 {
// TJET_LAW.agc:312
//		EXTEND			#	WHICH NEED NOT BE PRESERVED.  PICK UP
// slot 18257
                        if slot <> 18257 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:313
//		DV	HH		#	DP NUMERATOR AND DIVIDE BY DENOMINATOR
// slot 18258
                        if slot <> 18258 or instruction <> 5095 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreDv(words, 999, readEffective:call(words, 999)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 18262 {
                if slot <= 18260 {
                    if slot <= 18259 {
// TJET_LAW.agc:314
//		EXTEND
// slot 18259
                        if slot <> 18259 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:315
//		MP	BIT14		# RESCALE TJET FROM 2 TO USUAL 4 SEC.
// slot 18260
                        if slot <> 18260 or instruction <> 31198 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2526, readEffective:call(words, 2526)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18261 {
// TJET_LAW.agc:316
//		TCF	RETURNTJ	# END SUBROUTINE.
// slot 18261
                        if slot <> 18261 or instruction <> 5942 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5942, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:317
//
// TJET_LAW.agc:318
//# SUBROUTINIZED COMPUTATIONS REQUIRED FOR ALL ENTRIES INTO CODING FOR ZONES 1, 2, AND 3.
// TJET_LAW.agc:319
//# REACHED BY TC FROM 3 POINTS IN TJETLAW.
// TJET_LAW.agc:320
//
// TJET_LAW.agc:321
//Z123COMP	CS	ROTSENSE	# USED IN RETURNTJ SECTION TO RESCALE TJET
// slot 18262
                        if slot <> 18262 or instruction <> 17376 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 992).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18264 {
                    if slot <= 18263 {
// TJET_LAW.agc:322
//		TS	ROTSENSE	# 	AS TIME6 AND GIVE IT PROPER SIGN.
// slot 18263
                        if slot <> 18263 or instruction <> 23520 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23520, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:323
//		CAE	EDOT		# SCALED AT PI/2(5) RAD/SEC.
// slot 18264
                        if slot <> 18264 or instruction <> 13079 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 791).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18265 {
// TJET_LAW.agc:324
//		EXTEND
// slot 18265
                        if slot <> 18265 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:325
//		INDEX	ADRSDIF2
// slot 18266
                        if slot <> 18266 or instruction <> 21476 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21476, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21476, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1107] to agcAotUnit1107@.

agcAotInstallSourceRope(list(
// TJET_LAW.agc:326
//		MP	1/ANET1		# SCALED AT 2(7)/PI SEC(2)/RAD.
// slot 18267
    18267, 59118
)).

// bank 17, slots 18268-18291
function agcAotUnit1108 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18279 {
        if slot <= 18273 {
            if slot <= 18270 {
                if slot <= 18268 {
// TJET_LAW.agc:327
//		TS	TTOAXIS		# STORE TIME-TO-AXIS SCALED AT 4 SECONDS.
// slot 18268
                    if slot <> 18268 or instruction <> 23522 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23522, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18269 {
// TJET_LAW.agc:328
//		AD	-TJMAX
// slot 18269
                        if slot <> 18269 or instruction <> 26592 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2016), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:329
//		EXTEND			# IS TIME TO AXIS LESS THAN 150 MSEC.
// slot 18270
                        if slot <> 18270 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18271 {
// TJET_LAW.agc:330
//		BZMF	+2
// slot 18271
                    if slot <> 18271 or instruction <> 26465 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26465, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18272 {
// TJET_LAW.agc:331
//		TCF	FULLTIME	# NO. FIRE JETS, DO NOT CALCULATE TJET.
// slot 18272
                        if slot <> 18272 or instruction <> 5941 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5941, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:332
//		RETURN			# YES.  GO ON TO FIND TJET
// slot 18273
                        if slot <> 18273 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 18276 {
                if slot <= 18274 {
// TJET_LAW.agc:333
//
// TJET_LAW.agc:334
//ZON1,2,3	TC	Z123COMP	# SUBROUTINIZED PREPARATION FOR ZONE1,2,3.
// slot 18274
                    if slot <> 18274 or instruction <> 1878 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1878, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18275 {
// TJET_LAW.agc:335
//
// TJET_LAW.agc:336
//# IF THE (NEG) DISTANCE BEYOND PARABOLA IS LESS THAN FLAT, USE SPECIAL
// TJET_LAW.agc:337
//# LOGIC TO ACQUIRE MINIMUM IMPULSE LIMIT CYCLE.  DURING POWERED FLIGHT
// TJET_LAW.agc:338
//# Page 1466
// TJET_LAW.agc:339
//# OR ULLAGE, FLAT = 0
// TJET_LAW.agc:340
//
// TJET_LAW.agc:341
//		CAE	FIREFCT		# SCALED AT PI/4 RAD.
// slot 18275
                        if slot <> 18275 or instruction <> 13281 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 993).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:342
//		AD	FLAT
// slot 18276
                        if slot <> 18276 or instruction <> 25453 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 877).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18277 {
// TJET_LAW.agc:343
//		EXTEND
// slot 18277
                    if slot <> 18277 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18278 {
// TJET_LAW.agc:344
//		BZMF	ZONE1		# NOT IN SPECIAL ZONES.
// slot 18278
                        if slot <> 18278 or instruction <> 26482 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26482, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:345
//
// TJET_LAW.agc:346
//# FIRE FOR AXIS OR, IF CLOSE, FIRE MINIMUM IMPULSE.  IF ON AXIS, COAST.
// TJET_LAW.agc:347
//
// TJET_LAW.agc:348
//ZONE2,3		CS	ZONE3LIM	# HEIGHT OF MIN-IMPULSE ZONE SET BY 1/ACCS
// slot 18279
                        if slot <> 18279 or instruction <> 17262 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 878).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 18285 {
            if slot <= 18282 {
                if slot <= 18280 {
// TJET_LAW.agc:349
//		AD	TTOAXIS		#	35 MSEC IN DRIFTING FLIGHT
// slot 18280
                    if slot <> 18280 or instruction <> 25570 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 994).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18281 {
// TJET_LAW.agc:350
//		EXTEND			#	ZERO WHEN TRYING TO ENTER GTS CONTROL.
// slot 18281
                        if slot <> 18281 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:351
//		BZMF	ZONE3
// slot 18282
                        if slot <> 18282 or instruction <> 26477 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26477, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18283 {
// TJET_LAW.agc:352
//ZONE2		CAE	TTOAXIS		# FIRE TO AXIS.
// slot 18283
                    if slot <> 18283 or instruction <> 13282 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 994).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18284 {
// TJET_LAW.agc:353
//		TCF	RETURNTJ
// slot 18284
                        if slot <> 18284 or instruction <> 5942 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5942, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:354
//ZONE3		CCS	EDOT		# CHECK IF EDOT IS ZERO.
// slot 18285
                        if slot <> 18285 or instruction <> 4887 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 791).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 18288 {
                if slot <= 18286 {
// TJET_LAW.agc:355
//		CAF	BIT6		# FIRE A ONE-JET MINIMUM IMPULSE.
// slot 18286
                    if slot <> 18286 or instruction <> 14822 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18287 {
// TJET_LAW.agc:356
//		TCF	RETURNTJ	# TJET = +0.
// slot 18287
                        if slot <> 18287 or instruction <> 5942 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5942, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:357
//		TC	CCSHOLE		# CANNOT BE BECAUSE NEG EDOT COMPLEMENTED.
// slot 18288
                        if slot <> 18288 or instruction <> 3013 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3013, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18289 {
// TJET_LAW.agc:358
//		TCF	RETURNTJ	# TJET = +0.
// slot 18289
                    if slot <> 18289 or instruction <> 5942 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5942, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18290 {
// TJET_LAW.agc:359
//
// TJET_LAW.agc:360
//ZONE1		EXTEND
// slot 18290
                        if slot <> 18290 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:361
//		INDEX	ADRSDIF1
// slot 18291
                        if slot <> 18291 or instruction <> 21478 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21478, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21478, words[0], readEffective).
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
// TJET_LAW.agc:362
//		SU	AXISDIST	# SCALED AT PI/4 RAD.
// slot 18292
    18292, 50954
)).

// bank 17, slots 18293-18294
function agcAotUnit1109 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18293 {
// TJET_LAW.agc:363
//		EXTEND
// slot 18293
        if slot <> 18293 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// TJET_LAW.agc:364
//		INDEX	ADRSDIF2
// slot 18294
        if slot <> 18294 or instruction <> 21476 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21476, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21476, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1109] to agcAotUnit1109@.

agcAotInstallSourceRope(list(
// TJET_LAW.agc:365
//		MP	ACCFCTZ1	# SCALED AT 2(7)/PI SEC(2)/RAD.
// slot 18295
    18295, 59130
)).

// bank 17, slots 18296-18335
function agcAotUnit1110 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18315 {
        if slot <= 18305 {
            if slot <= 18300 {
                if slot <= 18297 {
                    if slot <= 18296 {
// TJET_LAW.agc:366
//		DDOUBL
// slot 18296
                        if slot <> 18296 or instruction <> 8193 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 1) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:367
//		DDOUBL
// slot 18297
                        if slot <> 18297 or instruction <> 8193 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 1) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18298 {
// TJET_LAW.agc:368
//		DXCH	HH		# DOUBLE PRECISION H SCALED AT 8 SEC(2).
// slot 18298
                        if slot <> 18298 or instruction <> 22504 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 1000, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18299 {
// TJET_LAW.agc:369
//
// TJET_LAW.agc:370
//# TEST WHETHER TOTAL TIME REQUIRED GREATER THAN 150 MSEC:
// TJET_LAW.agc:371
//#	                     2                                   2
// TJET_LAW.agc:372
//# 	IS .5(.150 - TTOAXIS)  - H  NEGATIVE (SCALED AT 8 SECONDS )
// TJET_LAW.agc:373
//
// TJET_LAW.agc:374
//		CAE	TTOAXIS		# TTOAXIS SCALED AT 4 SECONDS.
// slot 18299
                            if slot <> 18299 or instruction <> 13282 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 994).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TJET_LAW.agc:375
//		AD	-TJMAX		# -.150 SECOND SCALED AT 4.
// slot 18300
                            if slot <> 18300 or instruction <> 26592 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2016), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18302 {
                    if slot <= 18301 {
// TJET_LAW.agc:376
//		EXTEND
// slot 18301
                        if slot <> 18301 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:377
//		SQUARE
// slot 18302
                        if slot <> 18302 or instruction <> 28672 { return choose false if checkOnly else -1. }
                        if extended {
                            if agcOverflowDirection(words[0]) <> 0 { return choose false if checkOnly else -1. }
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 0, readEffective:call(words, 0)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18303 {
// TJET_LAW.agc:378
//		EXTEND
// slot 18303
                        if slot <> 18303 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18304 {
// TJET_LAW.agc:379
//		SU	HH		# HIGH WORD OF H SCALED AT 8 SEC(2).
// slot 18304
                            if slot <> 18304 or instruction <> 25575 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreSU(words, 999).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TJET_LAW.agc:380
//		EXTEND
// slot 18305
                            if slot <> 18305 or instruction <> 6 { return choose false if checkOnly else -1. }
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
            if slot <= 18310 {
                if slot <= 18307 {
                    if slot <= 18306 {
// TJET_LAW.agc:381
//		BZMF	FULLTIME	# YES.  NEED NOT CALCULATE TJET.
// slot 18306
                        if slot <> 18306 or instruction <> 26421 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26421, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:382
//
// TJET_LAW.agc:383
//# TEST WHETHER TIME BEYOND AXIS GREATER THAN 50 MSEC TO DETERMINE WHICH APPROXIMATION TO USE.
// TJET_LAW.agc:384
//
// TJET_LAW.agc:385
//		CAE	HH
// slot 18307
                        if slot <> 18307 or instruction <> 13287 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 999).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18308 {
// TJET_LAW.agc:386
//		AD	NEG2
// slot 18308
                        if slot <> 18308 or instruction <> 28646 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 4070), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18309 {
// TJET_LAW.agc:387
//		EXTEND
// slot 18309
                            if slot <> 18309 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TJET_LAW.agc:388
//		BZMF	FORMULA3
// slot 18310
                            if slot <> 18310 or instruction <> 26510 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 26510, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18312 {
                    if slot <= 18311 {
// TJET_LAW.agc:389
//
// TJET_LAW.agc:390
//# Page 1467
// TJET_LAW.agc:391
//# TJET = H/0.1 + TTOAXIS + .0375	FOR APPROXIMATION OVER MORE THAN 50 MSEC.
// TJET_LAW.agc:392
//
// TJET_LAW.agc:393
//		CAF	.1AT2		# STORE .1 SEC SCALED AT 2 FOR DIVISION.
// slot 18311
                        if slot <> 18311 or instruction <> 14296 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2008), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:394
//		DXCH	HH		# DP H SCALED AT 8 SEC(2) NEED NOT BE
// slot 18312
                        if slot <> 18312 or instruction <> 22504 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 1000, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18313 {
// TJET_LAW.agc:395
//		EXTEND			#	PRESERVED.
// slot 18313
                        if slot <> 18313 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18314 {
// TJET_LAW.agc:396
//		DV	HH		# QUOTIENT SCALED AT 4 SECONDS.
// slot 18314
                            if slot <> 18314 or instruction <> 5095 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreDv(words, 999, readEffective:call(words, 999)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TJET_LAW.agc:397
//		AD	TTOAXIS		# SCALED AT 4 SEC.
// slot 18315
                            if slot <> 18315 or instruction <> 25570 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 994).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 18325 {
            if slot <= 18320 {
                if slot <= 18317 {
                    if slot <= 18316 {
// TJET_LAW.agc:398
//		AD	.0375AT4	# .0375 SEC SCALED AT 4.
// slot 18316
                        if slot <> 18316 or instruction <> 26585 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2009), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:399
//		TCF	RETURNTJ	# END COMPUTATION.
// slot 18317
                        if slot <> 18317 or instruction <> 5942 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5942, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18318 {
// TJET_LAW.agc:400
//
// TJET_LAW.agc:401
//# TJET - H/.O25 + TTOAXIS 	FOR APPROXIMATION OVER LESS THAN 50 MSEC.
// TJET_LAW.agc:402
//
// TJET_LAW.agc:403
//FORMULA3	CS	-.025AT2	# STORE +.25 SEC SCALED AT 2 FOR DIVISION
// slot 18318
                        if slot <> 18318 or instruction <> 18394 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2010), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18319 {
// TJET_LAW.agc:404
//		DXCH	HH		# PICK UP DP H AT 8, WHICH NEED NOT BE
// slot 18319
                            if slot <> 18319 or instruction <> 22504 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 1000, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TJET_LAW.agc:405
//		EXTEND			# 	PRESERVED.
// slot 18320
                            if slot <> 18320 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18322 {
                    if slot <= 18321 {
// TJET_LAW.agc:406
//		DV	HH		# QUOTIENT SCALED AT 4 SECONDS.
// slot 18321
                        if slot <> 18321 or instruction <> 5095 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreDv(words, 999, readEffective:call(words, 999)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:407
//		AD	TTOAXIS		# SCALED AT 4 SEC.
// slot 18322
                        if slot <> 18322 or instruction <> 25570 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 994).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18323 {
// TJET_LAW.agc:408
//
// TJET_LAW.agc:409
//# IF COMPUTED JET TIME IS LESS THAN TJMIN, TJET IS SET TO ZERO.
// TJET_LAW.agc:410
//# MINIMUM IMPULSES REQUIRED IN ZONE 3 ARE NOT SUBJECT TO THIS CONSTRAINT, NATURALLY.
// TJET_LAW.agc:411
//
// TJET_LAW.agc:412
//CHKMINTJ	AD	-TJMIN		# IS COMPUTED TIME LESS THAN THE MINIMUM.
// slot 18323
                        if slot <> 18323 or instruction <> 26594 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2018), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18324 {
// TJET_LAW.agc:413
//		EXTEND
// slot 18324
                            if slot <> 18324 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TJET_LAW.agc:414
//		BZMF	COASTTJ		# YES, SET TIME TO ZERO.
// slot 18325
                            if slot <> 18325 or instruction <> 26386 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 26386, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 18330 {
                if slot <= 18327 {
                    if slot <= 18326 {
// TJET_LAW.agc:415
//		AD	TJMIN		# NO, RESTORE COMPUTED TIME.
// slot 18326
                        if slot <> 18326 or instruction <> 26593 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2017), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:416
//		TCF	RETURNTJ	# END COMPUTATION.
// slot 18327
                        if slot <> 18327 or instruction <> 5942 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5942, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18328 {
// TJET_LAW.agc:417
//
// TJET_LAW.agc:418
//# Page 1468
// TJET_LAW.agc:419
//# *** ROUGHLAW ***
// TJET_LAW.agc:420
//#
// TJET_LAW.agc:421
//# BEFORE ENTRY TO RUFLAW:
// TJET_LAW.agc:422
//#	1. INDEXERS ADRSDIF1 AND ADRSDIF2 ARE SET ON BASIS OF AXIS, AND SIGN OF EDOT.
// TJET_LAW.agc:423
//#	2. IF EDOT WAS NEGATIVE, E AND EDOT ARE ROTATED INTO UPPER HALF-PLANE AND ROTSENSE IS MADE NEGATIVE.
// TJET_LAW.agc:424
//#	3. E IS SCALED AT PI RADIANS AND EDOT AT PI/4 RAD/SEC.
// TJET_LAW.agc:425
//#	   (EXCEPT THE RUFLAW3 ENTRY WHEN E IS AT PI/4)
// TJET_LAW.agc:426
//#
// TJET_LAW.agc:427
//# RUFLAW1:	ERROR MORE NEGATIVE THAN PI/16 RAD.  FIRE TO A RATE OF 6.5 DEG/SEC (IF JET TIME EXCEEDS 20 MSEC.).
// TJET_LAW.agc:428
//# RUFLAW2:	ERROR MORE POSITIVE THAN PI/16 RAD.  FIRE TO AN OPPOSING RATE OF 6.5 DEG/SEC.
// TJET_LAW.agc:429
//# RUFLAW3:	ERROR RATE GREATER THAN PI/32 RAD/SEC AND ERROR WITHIN BOUNDS.  COAST IF BELOW FIREFCT, FIRE IF ABOVE
// TJET_LAW.agc:430
//
// TJET_LAW.agc:431
//RUFLAW1		CS	RUFRATE		# DECREMENT EDOT BY .1444 RAD/SEC AT PI/4
// slot 18328
                        if slot <> 18328 or instruction <> 18403 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2019), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18329 {
// TJET_LAW.agc:432
//		ADS	EDOT		#	WHICH IS THE TARGET RATE
// slot 18329
                            if slot <> 18329 or instruction <> 12055 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 791).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TJET_LAW.agc:433
//		EXTEND
// slot 18330
                            if slot <> 18330 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18332 {
                    if slot <= 18331 {
// TJET_LAW.agc:434
//		BZMF	SMALRATE	# BRANCH IF RATE LESS THAN TARGET.
// slot 18331
                        if slot <> 18331 or instruction <> 26540 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26540, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:435
//		TC	RUFSETUP	# REVERSE ROTSENSE AND INDICATE MAX JETS.
// slot 18332
                        if slot <> 18332 or instruction <> 1994 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1994, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18333 {
// TJET_LAW.agc:436
//		CAE	EDOT		# PICK UP DESIRED RATE CHANGE.
// slot 18333
                        if slot <> 18333 or instruction <> 13079 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 791).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18334 {
// TJET_LAW.agc:437
//
// TJET_LAW.agc:438
//RUFLAW12	EXTEND			# COMPUTE TJET
// slot 18334
                            if slot <> 18334 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// TJET_LAW.agc:439
//		INDEX	ADRSDIF2	#	= (DESIRED RATE CHANGE)/(2-JET ACCEL.)
// slot 18335
                            if slot <> 18335 or instruction <> 21476 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 21476, words[0], readEffective).
                            }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 21476, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1110] to agcAotUnit1110@.

agcAotInstallSourceRope(list(
// TJET_LAW.agc:440
//		MP	1/ANET1 +2
// slot 18336
    18336, 59122
)).

// bank 17, slots 18337-18362
function agcAotUnit1111 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18349 {
        if slot <= 18342 {
            if slot <= 18339 {
                if slot <= 18337 {
// TJET_LAW.agc:441
//		AD	-1/8		# IF TJET, SCALED AT 32 SEC, EXCEEDS
// slot 18337
                    if slot <> 18337 or instruction <> 28641 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 4065), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18338 {
// TJET_LAW.agc:442
//		EXTEND			# 	4 SECONDS, SET TJET TO TJMAX.
// slot 18338
                        if slot <> 18338 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:443
//		BZMF	+2
// slot 18339
                        if slot <> 18339 or instruction <> 26533 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26533, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18340 {
// TJET_LAW.agc:444
//		TCF	FULLTIME
// slot 18340
                    if slot <> 18340 or instruction <> 5941 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5941, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18341 {
// TJET_LAW.agc:445
//		EXTEND
// slot 18341
                        if slot <> 18341 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:446
//		BZF	FULLTIME
// slot 18342
                        if slot <> 18342 or instruction <> 5941 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5941, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 18345 {
                if slot <= 18343 {
// TJET_LAW.agc:447
//		AD	BIT12		# RESTORE COMPUTED TJET TO ACCUMULATOR
// slot 18343
                    if slot <> 18343 or instruction <> 27104 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18344 {
// TJET_LAW.agc:448
//		DAS	A
// slot 18344
                        if slot <> 18344 or instruction <> 8193 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 1) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:449
//		DAS	A
// slot 18345
                        if slot <> 18345 or instruction <> 8193 { return choose false if checkOnly else -1. }
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
                if slot <= 18347 {
                    if slot <= 18346 {
// TJET_LAW.agc:450
//		DAS	A		# RESCALED TJET AT 4 SECONDS.
// slot 18346
                        if slot <> 18346 or instruction <> 8193 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 1) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:451
//		TCF	CHKMINTJ	# RETURN AS FROM FINELAW.
// slot 18347
                        if slot <> 18347 or instruction <> 6035 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6035, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18348 {
// TJET_LAW.agc:452
//
// TJET_LAW.agc:453
//SMALRATE	TC	RUFSETUP +2	# SET NUMBERT AND FIREFCT FOR MAXIMUM JETS
// slot 18348
                        if slot <> 18348 or instruction <> 1996 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1996, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:454
//		CCS	ROTSENSE
// slot 18349
                        if slot <> 18349 or instruction <> 5088 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 992).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 18355 {
            if slot <= 18352 {
                if slot <= 18350 {
// TJET_LAW.agc:455
//		CAF	ONE		# MODIFY INDEXER TO POINT TO 1/ANET
// slot 18350
                    if slot <> 18350 or instruction <> 14827 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18351 {
// TJET_LAW.agc:456
//		TCF	+2		#	CORRESPONDING TO THE PROPER SENSE.
// slot 18351
                        if slot <> 18351 or instruction <> 6065 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6065, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:457
//		CAF	NEGONE
// slot 18352
                        if slot <> 18352 or instruction <> 16359 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 4071), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18353 {
// TJET_LAW.agc:458
//		ADS	ADRSDIF2
// slot 18353
                    if slot <> 18353 or instruction <> 12260 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 996).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18354 {
// TJET_LAW.agc:459
//
// TJET_LAW.agc:460
//		CS	EDOT		# (.144 AT PI/4 - EDOT) = DESIRED RATE CHNG.
// slot 18354
                        if slot <> 18354 or instruction <> 17175 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 791).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:461
//		TCF	RUFLAW12
// slot 18355
                        if slot <> 18355 or instruction <> 6046 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6046, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 18358 {
                if slot <= 18356 {
// TJET_LAW.agc:462
//
// TJET_LAW.agc:463
//RUFLAW2		TC	RUFSETUP	# REVERSE ROTSENSE AND INDICATE MAX JETS.
// slot 18356
                    if slot <> 18356 or instruction <> 1994 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1994, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18357 {
// TJET_LAW.agc:464
//		CAF	RUFRATE
// slot 18357
                        if slot <> 18357 or instruction <> 14307 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2019), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:465
//		AD	EDOT		# (.144 AT PI/4 + EDOT) = DESIRED RATE CHNG.
// slot 18358
                        if slot <> 18358 or instruction <> 25367 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 791).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 18360 {
                    if slot <= 18359 {
// TJET_LAW.agc:466
//		TS	A		# IF OVERFLOW SKIP, FIRE FOR FULL TIME.
// slot 18359
                        if slot <> 18359 or instruction <> 22528 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22528, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:467
//		TCF	RUFLAW12	# OTHERWISE, COMPUTE JET TIME.
// slot 18360
                        if slot <> 18360 or instruction <> 6046 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6046, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18361 {
// TJET_LAW.agc:468
//		TCF	FULLTIME
// slot 18361
                        if slot <> 18361 or instruction <> 5941 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5941, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// TJET_LAW.agc:469
//
// TJET_LAW.agc:470
//# Page 1469
// TJET_LAW.agc:471
//RUFLAW3		TC	RUFSETUP	# EXECUTE COMMON RUFLAW SUBROUTINE.
// slot 18362
                        if slot <> 18362 or instruction <> 1994 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1994, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1111] to agcAotUnit1111@.

// bank 17, slots 18363-18363
function agcAotUnit1112 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// TJET_LAW.agc:472
//		INDEX	ADRSDIF1
// slot 18363
    if slot <> 18363 or instruction <> 21478 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21478, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21478, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1112] to agcAotUnit1112@.

agcAotInstallSourceRope(list(
// TJET_LAW.agc:473
//		CS	FIREDB		# CALCULATE DISTANCE FROM SWITCH CURVE
// slot 18364
    18364, 34562
)).

// bank 17, slots 18365-18372
function agcAotUnit1113 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18368 {
        if slot <= 18366 {
            if slot <= 18365 {
// TJET_LAW.agc:474
//		AD	E		#	1/ANET1*EDOT*EDOT +E - FIREDB = 0
// slot 18365
                if slot <> 18365 or instruction <> 25578 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 1002).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// TJET_LAW.agc:475
//		EXTEND			#		SCALED AT 4 PI RADIANS
// slot 18366
                if slot <> 18366 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18367 {
// TJET_LAW.agc:476
//		MP	BIT11
// slot 18367
                if slot <> 18367 or instruction <> 31201 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 2529, readEffective:call(words, 2529)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// TJET_LAW.agc:477
//		XCH	EDOT
// slot 18368
                if slot <> 18368 or instruction <> 24343 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 791, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 18370 {
            if slot <= 18369 {
// TJET_LAW.agc:478
//		EXTEND
// slot 18369
                if slot <> 18369 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TJET_LAW.agc:479
//		SQUARE
// slot 18370
                if slot <> 18370 or instruction <> 28672 { return choose false if checkOnly else -1. }
                if extended {
                    if agcOverflowDirection(words[0]) <> 0 { return choose false if checkOnly else -1. }
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 0, readEffective:call(words, 0)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18371 {
// TJET_LAW.agc:480
//		EXTEND
// slot 18371
                if slot <> 18371 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// TJET_LAW.agc:481
//		INDEX	ADRSDIF1
// slot 18372
                if slot <> 18372 or instruction <> 21478 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21478, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21478, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1113] to agcAotUnit1113@.

agcAotInstallSourceRope(list(
// TJET_LAW.agc:482
//		MP	1/ANET1 +2
// slot 18373
    18373, 59122
)).

// bank 17, slots 18374-18384
function agcAotUnit1114 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18378 {
        if slot <= 18375 {
            if slot <= 18374 {
// TJET_LAW.agc:483
//		AD	EDOT
// slot 18374
                if slot <> 18374 or instruction <> 25367 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 791).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// TJET_LAW.agc:484
//		EXTEND
// slot 18375
                if slot <> 18375 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18376 {
// TJET_LAW.agc:485
//		BZMF	COASTTJ		# COAST IF BELOW IT.
// slot 18376
                if slot <> 18376 or instruction <> 26386 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26386, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18377 {
// TJET_LAW.agc:486
//		TCF	FULLTIME	# FIRE FOR FULL PERIOD IF ABOVE IT.
// slot 18377
                    if slot <> 18377 or instruction <> 5941 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5941, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TJET_LAW.agc:487
//
// TJET_LAW.agc:488
//# SUBROUTINE USED IN ALL ENTRIES TO ROUGHLAW.
// TJET_LAW.agc:489
//
// TJET_LAW.agc:490
//RUFSETUP	CS	ROTSENSE	# REVERSE ROTSENSE WHEN ENTER HERE.
// slot 18378
                    if slot <> 18378 or instruction <> 17376 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 992).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 18381 {
            if slot <= 18379 {
// TJET_LAW.agc:491
//		TS	ROTSENSE
// slot 18379
                if slot <> 18379 or instruction <> 23520 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23520, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18380 {
// TJET_LAW.agc:492
// +2		CAF	FOUR		# REQUIRE MAXIMUM (2) JETS IN U,V-AXES.
// slot 18380
                    if slot <> 18380 or instruction <> 14825 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TJET_LAW.agc:493
//		TS	NUMBERT
// slot 18381
                    if slot <> 18381 or instruction <> 23523 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23523, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 18382 {
// TJET_LAW.agc:494
//		CAF	NEGMAX		# SUGGEST MAXIMUM (4) JETS IN P-AXIS.
// slot 18382
                if slot <> 18382 or instruction <> 14813 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18383 {
// TJET_LAW.agc:495
//		TS	FIREFCT
// slot 18383
                    if slot <> 18383 or instruction <> 23521 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23521, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// TJET_LAW.agc:496
//		TC	Q
// slot 18384
                    if slot <> 18384 or instruction <> 2 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1114] to agcAotUnit1114@.

agcAotInstallSourceRope(list(
// TJET_LAW.agc:497
//
// TJET_LAW.agc:498
//# CONSTANTS FOR TJETLAW
// TJET_LAW.agc:499
//
// TJET_LAW.agc:500
//		DEC	-16		# AXISDIFF(INDEX) = NUMBER OF REGISTERS
// slot 18385
    18385, 65502,
// TJET_LAW.agc:501
//AXISDIFF	DEC	+0		#	BETWEEN STORED 1/ACCS PARAMETERS FOR
// slot 18386
    18386, 0,
// TJET_LAW.agc:502
//		DEC	16		#	THE INDEXED AXIS AND THE U-AXIS.
// slot 18387
    18387, 32,
// TJET_LAW.agc:503
//SENSOR		OCT	14400		# RATIO OF TJET SCALING WITHIN TJETLAW
// slot 18388
    18388, 12800,
// TJET_LAW.agc:504
//					#	(4 SEC) TO SCALING FOR T6 (10.24 SEC).
// TJET_LAW.agc:505
//-3DEG		DEC	-.06667		# -3.0 DEGREES SCALED AT 45.
// slot 18389
    18389, 63350,
// TJET_LAW.agc:506
//-.0112A8	DEC	-.00141		# -.01125 SEC(2) SCALED AT 8.
// slot 18390
    18390, 65488,
// TJET_LAW.agc:507
//.1AT4		DEC	.025		# 0.1 SECOND SCALED AT 4.
// slot 18391
    18391, 820,
// TJET_LAW.agc:508
//.1AT2		DEC	.05		# .1 SEC SCALED AT 2.
// slot 18392
    18392, 1638,
// TJET_LAW.agc:509
//.0375AT4	DEC	.00938		# .0375 SEC SCALED AT 4.
// slot 18393
    18393, 308,
// TJET_LAW.agc:510
//-.025AT2	DEC	-.0125		# -.025 SEC SCALED AT 2.
// slot 18394
    18394, 65124,
// TJET_LAW.agc:511
//-.025AT4	DEC	-.00625
// slot 18395
    18395, 65330,
// TJET_LAW.agc:512
//-.05AT2		DEC	-.025
// slot 18396
    18396, 64714,
// TJET_LAW.agc:513
//-.15AT2		DEC	-.075
// slot 18397
    18397, 63076,
// TJET_LAW.agc:514
//.00375A8	2DEC	.00375 B-3
// slot 18398 18399
    18398, 14, 18399, 22282,
// TJET_LAW.agc:515
//
// TJET_LAW.agc:516
//-TJMAX		DEC	-.0375		# LARGEST CALCULATED TIME.  .150 SEC AT 4.
// slot 18400
    18400, 64306,
// TJET_LAW.agc:517
//TJMIN		DEC	.005		# SMALLEST ALLOWABLE TIME.  .020 SEC AT 4.
// slot 18401
    18401, 164,
// TJET_LAW.agc:518
//-TJMIN		DEC	-.005
// slot 18402
    18402, 65370,
// TJET_LAW.agc:519
//RUFRATE		DEC	.1444		# CORRESPONDS TO TARGET RATE OF 6.5 DEG/S.
// slot 18403
    18403, 4732
)).

