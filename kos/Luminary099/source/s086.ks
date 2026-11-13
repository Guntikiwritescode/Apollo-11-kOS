// PORT: Original source unit TJET_LAW.agc.
// PORT: Physical bank 17. Shared continuation entries, slots 18090–18092.
function agcAotUnit1093 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18090 {
// PORT: SOURCE TJET_LAW.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE TJET_LAW.agc:2
//# Filename:	TJET_LAW.agc
// PORT: SOURCE TJET_LAW.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE TJET_LAW.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE TJET_LAW.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE TJET_LAW.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE TJET_LAW.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// PORT: SOURCE TJET_LAW.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE TJET_LAW.agc:9
//# Pages:	1460-1469
// PORT: SOURCE TJET_LAW.agc:10
//# Mod history:	2009-05-27 RSB	Adapted from the corresponding
// PORT: SOURCE TJET_LAW.agc:11
//#				Luminary131 file, using page
// PORT: SOURCE TJET_LAW.agc:12
//#				images from Luminary 1A.
// PORT: SOURCE TJET_LAW.agc:13
//#		2009-06-06 RSB	Eliminated a stray instruction that had crept
// PORT: SOURCE TJET_LAW.agc:14
//#				in somehow.
// PORT: SOURCE TJET_LAW.agc:15
//#
// PORT: SOURCE TJET_LAW.agc:16
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE TJET_LAW.agc:17
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE TJET_LAW.agc:18
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE TJET_LAW.agc:19
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE TJET_LAW.agc:20
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE TJET_LAW.agc:21
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE TJET_LAW.agc:22
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE TJET_LAW.agc:23
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE TJET_LAW.agc:24
//# actually created.
// PORT: SOURCE TJET_LAW.agc:25
//#
// PORT: SOURCE TJET_LAW.agc:26
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE TJET_LAW.agc:27
//#
// PORT: SOURCE TJET_LAW.agc:28
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE TJET_LAW.agc:29
//#	16:27 JULY 14, 1969
// PORT: SOURCE TJET_LAW.agc:30
//
// PORT: SOURCE TJET_LAW.agc:31
//# Page 1460
// PORT: SOURCE TJET_LAW.agc:32
//# PROGRAM DESCRIPTION
// PORT: SOURCE TJET_LAW.agc:33
//# DESIGNED BY:	R. D. GOSS AND P. S. WEISSMAN
// PORT: SOURCE TJET_LAW.agc:34
//# CODED BY:  P. S. WEISSMAN, 28 FEBRUARY 1968
// PORT: SOURCE TJET_LAW.agc:35
//#
// PORT: SOURCE TJET_LAW.agc:36
//# TJETLAW IS CALLED AS A SUBROUTINE WHEN THE LEM IS NOT DOCKED AND THE AUTOPILOT IS IN THE AUTOMATIC OR
// PORT: SOURCE TJET_LAW.agc:37
//# ATTITUDE-HOLD MODE TO CALCULATE THE JET-FIRING-TIME (TJET) REQUIRED FOR THE AXIS INDICATED BY AXISCTR:
// PORT: SOURCE TJET_LAW.agc:38
//#	-1	INDICATES THE P-AXIS
// PORT: SOURCE TJET_LAW.agc:39
//#	+0	INDICATES THE U-AXIS
// PORT: SOURCE TJET_LAW.agc:40
//#	+1	INDICATES THE V-AXIS
// PORT: SOURCE TJET_LAW.agc:41
//# THE REGISTERS E AND EDOT CONTAIN THE APPROPRIATE ATTITUDE ERROR AND ERROR RATE AND SENSETYP SHOWS WHETHER
// PORT: SOURCE TJET_LAW.agc:42
//# UNBALANCED COUPLES ARE PREFERRED.  TJETLAW ALSO USES VARIOUS FUNCTIONS OF ACCELERATION AND DEADBAND WHICH ARE
// PORT: SOURCE TJET_LAW.agc:43
//# COMPUTED IN THE 1/ACCONT SECTION OF 1/ACCS AND ARE STORED IN SUCH AN ORDER THAT THEY CAN BE CONVENIENTLY
// PORT: SOURCE TJET_LAW.agc:44
//# ACCESSED BY INDEXING.
// PORT: SOURCE TJET_LAW.agc:45
//#
// PORT: SOURCE TJET_LAW.agc:46
//# THE SIGN OF THE REQUIRED ROTATION IS CARRIED THROUGH TJETLAW AS ROTSENSE AND IS FINALLY APPLIED TO TJET JUST
// PORT: SOURCE TJET_LAW.agc:47
//# PREVIOUS TO ITS STORAGE IN THE LOCATION CORRESPONDING TO THE AXIS (TJP, TJU, OR TJV).  THE NUMBER OF JETS THAT
// PORT: SOURCE TJET_LAW.agc:48
//# TJETLAW ASSUMES WILL BE USED AS INDICATED BY THE SETTING OF NUMBERT FOR THE U- OR V-AXIS.  TWO JETS ARE ALWAYS
// PORT: SOURCE TJET_LAW.agc:49
//# ASSUMED FOR THE P-AXIS ALTHOUGH FOUR JETS WILL BE FIRED WHEN FIREFCT IS MORE NEGATIVE THAN -4.0 DEGREES
// PORT: SOURCE TJET_LAW.agc:50
//# (FIREFCT IS THE DISTANCE TO A SWITCH CURVE IN THE PHASE PLANE) AND A LONG FIRING IS CALLED FOR.
// PORT: SOURCE TJET_LAW.agc:51
//#
// PORT: SOURCE TJET_LAW.agc:52
//# IN ORDER TO AVOID SCALING DIFFICULTIES, SIMPLE ALGORITHMS TAGGED RUFLAW1, -2 AND -3 ARE RESORTED TO WHEN THE
// PORT: SOURCE TJET_LAW.agc:53
//# ERROR AND/OR ERROR RATE ARE LARGE.
// PORT: SOURCE TJET_LAW.agc:54
//#
// PORT: SOURCE TJET_LAW.agc:55
//# CALLING SEQUENCE:
// PORT: SOURCE TJET_LAW.agc:56
//#		TC	TJETLAW		# (MUST BE IN JASK)
// PORT: SOURCE TJET_LAW.agc:57
//#	OR
// PORT: SOURCE TJET_LAW.agc:58
//#		INHINT			# (MUST BE IN JASK)
// PORT: SOURCE TJET_LAW.agc:59
//#		TC	IBNKCALL
// PORT: SOURCE TJET_LAW.agc:60
//#		CADR	TJETLAW
// PORT: SOURCE TJET_LAW.agc:61
//#		RELINT
// PORT: SOURCE TJET_LAW.agc:62
//#
// PORT: SOURCE TJET_LAW.agc:63
//# EXIT:		RETURN TO Q.
// PORT: SOURCE TJET_LAW.agc:64
//#
// PORT: SOURCE TJET_LAW.agc:65
//# INPUT:
// PORT: SOURCE TJET_LAW.agc:66
//#	FROM THE CALLER:  E, EDOT, AXISCTR, SENSETYP, TJP, -U, -V.
// PORT: SOURCE TJET_LAW.agc:67
//#	FROM 1/ACCONT:  48 ERASABLES BEGINNING AT BLOCKTOP (INCLUDING FLAT, ZONE3LIM AND ACCSWU, -V).
// PORT: SOURCE TJET_LAW.agc:68
//#
// PORT: SOURCE TJET_LAW.agc:69
//# OUTPUT:
// PORT: SOURCE TJET_LAW.agc:70
//#	TJP, -U OR -V, NUMBERT (DAPTEMP5), FIREFCT (DAPTEMP3).
// PORT: SOURCE TJET_LAW.agc:71
//#
// PORT: SOURCE TJET_LAW.agc:72
//# DEBRIS:
// PORT: SOURCE TJET_LAW.agc:73
//#	A, L, Q, E, EDOT, DAPTEMP1-6, DAPTEMP1-4.
// PORT: SOURCE TJET_LAW.agc:74
//#
// PORT: SOURCE TJET_LAW.agc:75
//# ALARM:  NONE
// PORT: SOURCE TJET_LAW.agc:76
//
// PORT: SOURCE TJET_LAW.agc:77
//		BANK	17
// PORT: SOURCE TJET_LAW.agc:78
//		SETLOC	DAPS2
// PORT: SOURCE TJET_LAW.agc:79
//		BANK
// PORT: SOURCE TJET_LAW.agc:80
//		EBANK=	TJP
// PORT: SOURCE TJET_LAW.agc:81
//# Page 1461
// PORT: SOURCE TJET_LAW.agc:82
//		COUNT*	$$/DAPTJ
// PORT: SOURCE TJET_LAW.agc:83
//
// PORT: SOURCE TJET_LAW.agc:84
//TJETLAW		EXTEND			# SAVE Q FOR RETURN.
// PORT: Fixed ROM slots 18090.
        if slot <> 18090 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 18091 {
// PORT: SOURCE TJET_LAW.agc:85
//		QXCH	HOLDQ
// PORT: Fixed ROM slots 18091.
            if slot <> 18091 or instruction <> 10213 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 2, 997, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TJET_LAW.agc:86
//
// PORT: SOURCE TJET_LAW.agc:87
//# SET INDEXERS TO CORRESPOND TO THE AXIS AND TO THE SIGN OF EDOT
// PORT: SOURCE TJET_LAW.agc:88
//
// PORT: SOURCE TJET_LAW.agc:89
//		INDEX	AXISCTR		# AXISDIFF(-1)=NO OF LOCATIONS BET P AND U
// PORT: Fixed ROM slots 18092.
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
// PORT: SOURCE TJET_LAW.agc:90
//		CAF	AXISDIFF	# AXISDIFF(0)=0
// PORT: Fixed ROM slots 18093.
    18093, 28580
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18094–18140.
function agcAotUnit1094 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18116 {
        if slot <= 18104 {
            if slot <= 18098 {
                if slot <= 18095 {
                    if slot <= 18094 {
// PORT: SOURCE TJET_LAW.agc:91
//		TS	ADRSDIF1	# AXISDIFF(+1)=NO OF LOCATIONS BET V AND U
// PORT: Fixed ROM slots 18094.
                        if slot <> 18094 or instruction <> 23526 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23526, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:92
//
// PORT: SOURCE TJET_LAW.agc:93
//		CAE	EDOT		# IF EDOT NEGATIVE, PICK UP SET OF VALUES
// PORT: Fixed ROM slots 18095.
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
// PORT: SOURCE TJET_LAW.agc:94
//		EXTEND			#	THAT ALLOW USE OF SAME CODING AS FOR
// PORT: Fixed ROM slots 18096.
                        if slot <> 18096 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18097 {
// PORT: SOURCE TJET_LAW.agc:95
//		BZMF	NEGEDOT		#	POSITIVE EDOT.
// PORT: Fixed ROM slots 18097.
                            if slot <> 18097 or instruction <> 26294 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 26294, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TJET_LAW.agc:96
//		CAE	ADRSDIF1	# SET A SECOND INDEXER WHICH MAY BE
// PORT: Fixed ROM slots 18098.
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
// PORT: SOURCE TJET_LAW.agc:97
//		TS	ADRSDIF2	# 	MODIFIED BY A DECISION FOR MAX JETS.
// PORT: Fixed ROM slots 18099.
                        if slot <> 18099 or instruction <> 23524 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23524, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18100 {
// PORT: SOURCE TJET_LAW.agc:98
//		CAF	SENSOR		# FOR POSITIVE EDOT, ROTSENSE IS
// PORT: Fixed ROM slots 18100.
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
// PORT: SOURCE TJET_LAW.agc:99
//		TCF	SETSENSE	# 	INITIALIZED POSITIVE.
// PORT: Fixed ROM slots 18101.
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
// PORT: SOURCE TJET_LAW.agc:100
//
// PORT: SOURCE TJET_LAW.agc:101
//NEGEDOT		CS	E		# IN ORDER FOR NEG EDOT CASE TO USE CODING
// PORT: Fixed ROM slots 18102.
                        if slot <> 18102 or instruction <> 17386 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 1002).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18103 {
// PORT: SOURCE TJET_LAW.agc:102
//		TS	E		#	OF POS EDOT, MUST MODIFY AS FOLLOWS:
// PORT: Fixed ROM slots 18103.
                            if slot <> 18103 or instruction <> 23530 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23530, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TJET_LAW.agc:103
//		CS	EDOT		#	1. COMPLEMENT E AND EDOT.
// PORT: Fixed ROM slots 18104.
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
// PORT: SOURCE TJET_LAW.agc:104
//		TS	EDOT		#	2. SET SENSE OF ROTATION TO NEGATIVE
// PORT: Fixed ROM slots 18105.
                        if slot <> 18105 or instruction <> 23319 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23319, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18106 {
// PORT: SOURCE TJET_LAW.agc:105
//		CAF	BIT1		#	   (REVERSED LATER IF NECESSARY).
// PORT: Fixed ROM slots 18106.
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
// PORT: SOURCE TJET_LAW.agc:106
//		ADS	ADRSDIF1	#	3. INCREMENT INDEXERS BY ONE SO THAT
// PORT: Fixed ROM slots 18107.
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
// PORT: SOURCE TJET_LAW.agc:107
//		TS	ADRSDIF2	#	   THE PROPER PARAMETERS ARE ACCESSED.
// PORT: Fixed ROM slots 18108.
                        if slot <> 18108 or instruction <> 23524 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23524, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18109 {
// PORT: SOURCE TJET_LAW.agc:108
//		CS	SENSOR
// PORT: Fixed ROM slots 18109.
                            if slot <> 18109 or instruction <> 18388 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2004), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TJET_LAW.agc:109
//SETSENSE	TS	ROTSENSE
// PORT: Fixed ROM slots 18110.
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
// PORT: SOURCE TJET_LAW.agc:110
//
// PORT: SOURCE TJET_LAW.agc:111
//# TEST MAGNITUDE OF E (ATTITUDE ERROR, SINGLE-PRECISION, SCALED AT PI RADIANS):
// PORT: SOURCE TJET_LAW.agc:112
//#	IF GREATER THAN (OR EQUAL TO) PI/16 RADIANS, GO TO THE SIMPLIFIED TJET ROUTINE.
// PORT: SOURCE TJET_LAW.agc:113
//#	IF LESS THAN PI/16 RADIANS, RESCALE TO PI/4
// PORT: SOURCE TJET_LAW.agc:114
//
// PORT: SOURCE TJET_LAW.agc:115
//		CAE	E		# PICK UP ATTITUDE ERROR FOR THIS AXIS
// PORT: Fixed ROM slots 18111.
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
// PORT: SOURCE TJET_LAW.agc:116
//		EXTEND
// PORT: Fixed ROM slots 18112.
                            if slot <> 18112 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TJET_LAW.agc:117
//		MP	BIT5		# SHIFT RIGHT TEN BITS:  IF A-REGISTER IS
// PORT: Fixed ROM slots 18113.
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
// PORT: SOURCE TJET_LAW.agc:118
//		CCS	A		#	ZERO, RESCALE AND TEST EDOT.
// PORT: Fixed ROM slots 18114.
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
// PORT: SOURCE TJET_LAW.agc:119
//		TCF	RUFLAW2
// PORT: Fixed ROM slots 18115.
                            if slot <> 18115 or instruction <> 6068 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6068, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TJET_LAW.agc:120
//		TCF	SCALEE
// PORT: Fixed ROM slots 18116.
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
// PORT: SOURCE TJET_LAW.agc:121
//		TCF	RUFLAW1
// PORT: Fixed ROM slots 18117.
                        if slot <> 18117 or instruction <> 6040 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6040, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18118 {
// PORT: SOURCE TJET_LAW.agc:122
//SCALEE		CAF	BIT13		# ERROR IS IN L SCALED AT PI/16.  RESCALE
// PORT: Fixed ROM slots 18118.
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
// PORT: SOURCE TJET_LAW.agc:123
//		EXTEND			#	IT TO PI/4 AND SAVE IT.
// PORT: Fixed ROM slots 18119.
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
// PORT: SOURCE TJET_LAW.agc:124
//		MP	L
// PORT: Fixed ROM slots 18120.
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
// PORT: SOURCE TJET_LAW.agc:125
//		TS	E
// PORT: Fixed ROM slots 18121.
                            if slot <> 18121 or instruction <> 23530 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23530, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TJET_LAW.agc:126
//
// PORT: SOURCE TJET_LAW.agc:127
//# TEST MAGNITUDE OF EDOT (ERROR RATE SCALED AT PI/4 RADIANS/SECOND)
// PORT: SOURCE TJET_LAW.agc:128
//#	IF GREATER THAN (OR EQUAL TO) PI/32 RADIANS/SECOND, GO TO THE SIMPLIFIED TJET ROUTINE.
// PORT: SOURCE TJET_LAW.agc:129
//#	IF LESS THAN PI/32 RADIANS/SECOND, THEN RESCALE TO PI/32 RADIANS/SECOND.
// PORT: SOURCE TJET_LAW.agc:130
//
// PORT: SOURCE TJET_LAW.agc:131
//		CAE	EDOT		# PICK UP SINGLE-PRECISION ERROR-RATE
// PORT: Fixed ROM slots 18122.
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
// PORT: SOURCE TJET_LAW.agc:132
//# Page 1462
// PORT: SOURCE TJET_LAW.agc:133
//		EXTEND			# FOR THIS AXIS=
// PORT: Fixed ROM slots 18123.
                        if slot <> 18123 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18124 {
// PORT: SOURCE TJET_LAW.agc:134
//		MP	BIT4		# SHIFT RIGHT ELEVEN BITS, IF THE A-REG IS
// PORT: Fixed ROM slots 18124.
                            if slot <> 18124 or instruction <> 31208 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2536, readEffective:call(words, 2536)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TJET_LAW.agc:135
//		EXTEND			# ZERO, THEN RESCALE AND USE FINELAW.
// PORT: Fixed ROM slots 18125.
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
// PORT: SOURCE TJET_LAW.agc:136
//		BZF	SCALEDOT
// PORT: Fixed ROM slots 18126.
                        if slot <> 18126 or instruction <> 5840 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5840, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18127 {
// PORT: SOURCE TJET_LAW.agc:137
//		TCF	RUFLAW3
// PORT: Fixed ROM slots 18127.
                            if slot <> 18127 or instruction <> 6074 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6074, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TJET_LAW.agc:138
//
// PORT: SOURCE TJET_LAW.agc:139
//# *** FINELAW STARTS HERE ***
// PORT: SOURCE TJET_LAW.agc:140
//
// PORT: SOURCE TJET_LAW.agc:141
//SCALEDOT	LXCH	EDOT		# EDOT IS SCALED AT PI/32 RADIANS/SECOND.
// PORT: Fixed ROM slots 18128.
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
// PORT: SOURCE TJET_LAW.agc:142
//
// PORT: SOURCE TJET_LAW.agc:143
//		CAE	EDOT		# COMPUTE (EDOT)(EDOT)
// PORT: Fixed ROM slots 18129.
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
// PORT: SOURCE TJET_LAW.agc:144
//		EXTEND
// PORT: Fixed ROM slots 18130.
                            if slot <> 18130 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TJET_LAW.agc:145
//		SQUARE			# PRODUCT SCALED AT PI(2)/2(10) RAD/SEC.
// PORT: Fixed ROM slots 18131.
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
// PORT: SOURCE TJET_LAW.agc:146
//		EXTEND
// PORT: Fixed ROM slots 18132.
                        if slot <> 18132 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18133 {
// PORT: SOURCE TJET_LAW.agc:147
//		MP	BIT13		# SHIFT RIGHT TWO BITS TO RESCALE TO EDOTSQ
// PORT: Fixed ROM slots 18133.
                            if slot <> 18133 or instruction <> 31199 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 2527, readEffective:call(words, 2527)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TJET_LAW.agc:148
//		TS	EDOTSQ		#	TO PI(2)/2(8) RAD(2)/SEC(2).
// PORT: Fixed ROM slots 18134.
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
// PORT: SOURCE TJET_LAW.agc:149
//
// PORT: SOURCE TJET_LAW.agc:150
//ERRTEST		CCS	E		# DOES BIG ERROR (THREE DEG BEYOND THE
// PORT: Fixed ROM slots 18135.
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
// PORT: SOURCE TJET_LAW.agc:151
//		AD	-3DEG		# DEADBAND) REQUIRE MAXIMUM JETS?
// PORT: Fixed ROM slots 18136.
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
// PORT: SOURCE TJET_LAW.agc:152
//		TCF	+2
// PORT: Fixed ROM slots 18137.
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
// PORT: SOURCE TJET_LAW.agc:153
//		AD	-3DEG
// PORT: Fixed ROM slots 18138.
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
// PORT: SOURCE TJET_LAW.agc:154
//		EXTEND
// PORT: Fixed ROM slots 18139.
                            if slot <> 18139 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TJET_LAW.agc:155
//		INDEX	ADRSDIF1
// PORT: Fixed ROM slots 18140.
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
// PORT: SOURCE TJET_LAW.agc:156
//		SU	FIREDB
// PORT: Fixed ROM slots 18141.
    18141, 50946
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18142–18154.
function agcAotUnit1095 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18147 {
        if slot <= 18144 {
            if slot <= 18142 {
// PORT: SOURCE TJET_LAW.agc:157
//		EXTEND
// PORT: Fixed ROM slots 18142.
                if slot <> 18142 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18143 {
// PORT: SOURCE TJET_LAW.agc:158
//		BZMF	SENSTEST	# IF NOT:  ARE UNBALANCED JETS PREFERRED?
// PORT: Fixed ROM slots 18143.
                    if slot <> 18143 or instruction <> 26340 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26340, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TJET_LAW.agc:159
//MAXJETS		CAF	TWO		# IF YES:  INCREMENT ADDRESS LOCATOR AND
// PORT: Fixed ROM slots 18144.
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
// PORT: SOURCE TJET_LAW.agc:160
//		ADS	ADRSDIF2	#	   SET SWITCH FOR JET SELECT LOGIC TO 4.
// PORT: Fixed ROM slots 18145.
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
// PORT: SOURCE TJET_LAW.agc:161
//		CAF	FOUR		#	   (ALWAYS DO THIS FOR P-AXIS)
// PORT: Fixed ROM slots 18146.
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
// PORT: SOURCE TJET_LAW.agc:162
//		TCF	TJCALC
// PORT: Fixed ROM slots 18147.
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
// PORT: SOURCE TJET_LAW.agc:163
//SENSTEST	CCS	SENSETYP	# DOES TRANSLATION PREFER MIN JETS.
// PORT: Fixed ROM slots 18148.
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
// PORT: SOURCE TJET_LAW.agc:164
//		TCF	TJCALC		# YES.  USE MIN-JET PARAMETERS
// PORT: Fixed ROM slots 18149.
                    if slot <> 18149 or instruction <> 5863 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5863, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TJET_LAW.agc:165
//		TCF	MAXJETS		# NO.  GET THE MAX-JET PARAMETERS.
// PORT: Fixed ROM slots 18150.
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
// PORT: SOURCE TJET_LAW.agc:166
//TJCALC		TS	NUMBERT		# SET TO +0,1,4 FOR (U,V-AXES) JET SELECT.
// PORT: Fixed ROM slots 18151.
                    if slot <> 18151 or instruction <> 23523 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23523, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TJET_LAW.agc:167
//
// PORT: SOURCE TJET_LAW.agc:168
//# BEGINNING OF TJET CALCULATIONS:
// PORT: SOURCE TJET_LAW.agc:169
//
// PORT: SOURCE TJET_LAW.agc:170
//		CS	EDOTSQ		# SCALED AT PI(2)/2(8).
// PORT: Fixed ROM slots 18152.
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
// PORT: SOURCE TJET_LAW.agc:171
//		EXTEND
// PORT: Fixed ROM slots 18153.
                    if slot <> 18153 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TJET_LAW.agc:172
//		INDEX	ADRSDIF2
// PORT: Fixed ROM slots 18154.
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
// PORT: SOURCE TJET_LAW.agc:173
//		MP	1/ANET1		# .5/ACC SCALED AT 2(6)/PI SEC(2)/RADIAN.
// PORT: Fixed ROM slots 18155.
    18155, 59118
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18156–18156.
function agcAotUnit1096 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE TJET_LAW.agc:174
//		INDEX	ADRSDIF1
// PORT: Fixed ROM slots 18156.
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
// PORT: SOURCE TJET_LAW.agc:175
//		AD	FIREDB		# DEADBAND SCALED AT PI/4 RADIAN.
// PORT: Fixed ROM slots 18157.
    18157, 50946
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18158–18163.
function agcAotUnit1097 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18160 {
        if slot <= 18158 {
// PORT: SOURCE TJET_LAW.agc:176
//		EXTEND
// PORT: Fixed ROM slots 18158.
            if slot <> 18158 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18159 {
// PORT: SOURCE TJET_LAW.agc:177
//		SU	E		# ATTITUDE ERROR SCALED AT PI/4 RADIAN.
// PORT: Fixed ROM slots 18159.
                if slot <> 18159 or instruction <> 25578 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreSU(words, 1002).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TJET_LAW.agc:178
//		TS	FIREFCT		# -E-.5(EDOTSQ)/ACC-DB AT PI/4 RADIAN.
// PORT: Fixed ROM slots 18160.
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
// PORT: SOURCE TJET_LAW.agc:179
//		EXTEND
// PORT: Fixed ROM slots 18161.
            if slot <> 18161 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18162 {
// PORT: SOURCE TJET_LAW.agc:180
//		BZMF	ZON1,2,3
// PORT: Fixed ROM slots 18162.
                if slot <> 18162 or instruction <> 26466 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26466, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TJET_LAW.agc:181
//
// PORT: SOURCE TJET_LAW.agc:182
//ZONE4,5		INDEX	ADRSDIF1
// PORT: Fixed ROM slots 18163.
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
// PORT: SOURCE TJET_LAW.agc:183
//		CAE	1/ACOAST	# .5/ACC SCALED AT 2(6)/PI WHERE
// PORT: Fixed ROM slots 18164.
    18164, 26358
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18165–18168.
function agcAotUnit1098 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18166 {
        if slot <= 18165 {
// PORT: SOURCE TJET_LAW.agc:184
//# Page 1463
// PORT: SOURCE TJET_LAW.agc:185
//		EXTEND			# ACC = MAX(AMIN, AOS-).
// PORT: Fixed ROM slots 18165.
            if slot <> 18165 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TJET_LAW.agc:186
//		MP	EDOTSQ		# SCALED AT PI/2(8).
// PORT: Fixed ROM slots 18166.
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
// PORT: SOURCE TJET_LAW.agc:187
//		AD	E		# SCALED AT PI/4
// PORT: Fixed ROM slots 18167.
            if slot <> 18167 or instruction <> 25578 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 1002).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TJET_LAW.agc:188
//		INDEX	ADRSDIF1
// PORT: Fixed ROM slots 18168.
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
// PORT: SOURCE TJET_LAW.agc:189
//		AD	COASTDB		# SCALED AT PI/4 POS. FOR NEG. INTERCEPT.
// PORT: Fixed ROM slots 18169.
    18169, 50950
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18170–18172.
function agcAotUnit1099 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18170 {
// PORT: SOURCE TJET_LAW.agc:190
//		EXTEND			# TEST E+.5(EDOTSQ)/ACC+DB AT PI/4 RADIAN.
// PORT: Fixed ROM slots 18170.
        if slot <> 18170 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 18171 {
// PORT: SOURCE TJET_LAW.agc:191
//		BZMF	ZONE5		# IF FUNCTION NEGATIVE, FIND TJET.
// PORT: Fixed ROM slots 18171.
            if slot <> 18171 or instruction <> 26390 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26390, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TJET_LAW.agc:192
//					# IF FUNCTION POSITIVE, IN ZONE 4.
// PORT: SOURCE TJET_LAW.agc:193
//
// PORT: SOURCE TJET_LAW.agc:194
//# ZONE 4 IS THE COAST REGION.  HOWEVER, IF THE JETS ARE ON AND DRIVING TOWARD
// PORT: SOURCE TJET_LAW.agc:195
//#	A. THE AXIS WITHIN + OR - (DB + FLAT) FOR DRIFTING FLIGHT, OR
// PORT: SOURCE TJET_LAW.agc:196
//#	B. THE USUAL TARGET PARABOLA FOR POWERED FLIGHT
// PORT: SOURCE TJET_LAW.agc:197
//# THEN THE THRUSTERS ARE KEPT ON.
// PORT: SOURCE TJET_LAW.agc:198
//
// PORT: SOURCE TJET_LAW.agc:199
//ZONE4		INDEX	AXISCTR		# IS THE CURRENT VALUE IN TJET NON-ZERO
// PORT: Fixed ROM slots 18172.
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
// PORT: SOURCE TJET_LAW.agc:200
//		CS	TJETU		# 	WITH SENSE OPPOSITE TO EDOT,
// PORT: Fixed ROM slots 18173.
    18173, 34474
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18174–18181.
function agcAotUnit1100 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18177 {
        if slot <= 18175 {
            if slot <= 18174 {
// PORT: SOURCE TJET_LAW.agc:201
//		EXTEND			#	(I.E., ARE JETS ON AND FIRING TOWARD
// PORT: Fixed ROM slots 18174.
                if slot <> 18174 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TJET_LAW.agc:202
//		MP	ROTSENSE	#	THE DESIRABLE STATE).
// PORT: Fixed ROM slots 18175.
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
// PORT: SOURCE TJET_LAW.agc:203
//		EXTEND
// PORT: Fixed ROM slots 18176.
                if slot <> 18176 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TJET_LAW.agc:204
//		BZMF	COASTTJ		# NO.  COAST.
// PORT: Fixed ROM slots 18177.
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
// PORT: SOURCE TJET_LAW.agc:205
//
// PORT: SOURCE TJET_LAW.agc:206
//JETSON		CCS	FLAT		# YES.  IS THIS DRIFTING OR POWERED FLIGHT?
// PORT: Fixed ROM slots 18178.
                if slot <> 18178 or instruction <> 4973 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 877).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TJET_LAW.agc:207
//		TCF	DRIFT/ON	# DRIFTING.  GO MAKE FURTHER TEST.
// PORT: Fixed ROM slots 18179.
                if slot <> 18179 or instruction <> 5900 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5900, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18180 {
// PORT: SOURCE TJET_LAW.agc:208
//
// PORT: SOURCE TJET_LAW.agc:209
//		CS	FIREFCT		# POWERED (OR ULLAGE).  CAN TARGET PARABOLA
// PORT: Fixed ROM slots 18180.
                if slot <> 18180 or instruction <> 17377 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 993).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TJET_LAW.agc:210
//		INDEX	ADRSDIF1	#	BE REACHED FROM THIS POINT IN THE
// PORT: Fixed ROM slots 18181.
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
// PORT: SOURCE TJET_LAW.agc:211
//		AD	AXISDIST	#	PHASE PLANE?
// PORT: Fixed ROM slots 18182.
    18182, 50954
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18183–18188.
function agcAotUnit1101 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18185 {
        if slot <= 18183 {
// PORT: SOURCE TJET_LAW.agc:212
//		EXTEND
// PORT: Fixed ROM slots 18183.
            if slot <> 18183 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 18184 {
// PORT: SOURCE TJET_LAW.agc:213
//		BZMF	COASTTJ		# NO. SET TJET = 0.
// PORT: Fixed ROM slots 18184.
                if slot <> 18184 or instruction <> 26386 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26386, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TJET_LAW.agc:214
//		TC	Z123COMP	# YES.  CALCULATE TJET AS THOUGH IN ZONE 1
// PORT: Fixed ROM slots 18185.
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
// PORT: SOURCE TJET_LAW.agc:215
//		CAE	FIREFCT		#	AFTER COMPUTING THE REQUIRED
// PORT: Fixed ROM slots 18186.
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
// PORT: SOURCE TJET_LAW.agc:216
//		TCF	ZONE1		#	PARAMETERS.
// PORT: Fixed ROM slots 18187.
                if slot <> 18187 or instruction <> 6002 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6002, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TJET_LAW.agc:217
//
// PORT: SOURCE TJET_LAW.agc:218
//DRIFT/ON	INDEX	ADRSDIF1	# CAN TARGET STRIP OF AXIS BE REACHED FROM
// PORT: Fixed ROM slots 18188.
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
// PORT: SOURCE TJET_LAW.agc:219
//		CS	FIREDB		#	THIS POINT IN THE PHASE PLANE?
// PORT: Fixed ROM slots 18189.
    18189, 34562
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18190–18206.
function agcAotUnit1102 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18197 {
        if slot <= 18193 {
            if slot <= 18191 {
                if slot <= 18190 {
// PORT: SOURCE TJET_LAW.agc:220
//		DOUBLE
// PORT: Fixed ROM slots 18190.
                    if slot <> 18190 or instruction <> 24576 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TJET_LAW.agc:221
//		AD	FIREFCT
// PORT: Fixed ROM slots 18191.
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
// PORT: SOURCE TJET_LAW.agc:222
//		EXTEND
// PORT: Fixed ROM slots 18192.
                    if slot <> 18192 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TJET_LAW.agc:223
//		BZMF	+3
// PORT: Fixed ROM slots 18193.
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
// PORT: SOURCE TJET_LAW.agc:224
//COASTTJ		CAF	ZERO		# NO.  SET TJET = 0.
// PORT: Fixed ROM slots 18194.
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
// PORT: SOURCE TJET_LAW.agc:225
//		TCF	RETURNTJ
// PORT: Fixed ROM slots 18195.
                    if slot <> 18195 or instruction <> 5942 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5942, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18196 {
// PORT: SOURCE TJET_LAW.agc:226
//
// PORT: SOURCE TJET_LAW.agc:227
//		TC	Z123COMP	# YES. CALCULATE TJET AS THOUGH IN ZONE 2
// PORT: Fixed ROM slots 18196.
                    if slot <> 18196 or instruction <> 1878 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1878, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TJET_LAW.agc:228
//		TCF	ZONE2,3		#	OR 3 AFTER COMPUTING REQUIRED VALUES.
// PORT: Fixed ROM slots 18197.
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
// PORT: SOURCE TJET_LAW.agc:229
//
// PORT: SOURCE TJET_LAW.agc:230
//ZONE5		TS	L		# TEMPORARILY STORE FUNCTION IN L.
// PORT: Fixed ROM slots 18198.
                    if slot <> 18198 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TJET_LAW.agc:231
//		CCS	ROTSENSE	# MODIFY ADRSDIF2 FOR ACCESSING 1/ANET2
// PORT: Fixed ROM slots 18199.
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
// PORT: SOURCE TJET_LAW.agc:232
//		TCF	+4		# AND ACCFCTZ5, WHICH MUST BE PICKED UP
// PORT: Fixed ROM slots 18200.
                    if slot <> 18200 or instruction <> 5916 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5916, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TJET_LAW.agc:233
//		TC	CCSHOLE		# FROM THE NEXT LOWER REGISTER IF THE
// PORT: Fixed ROM slots 18201.
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
// PORT: SOURCE TJET_LAW.agc:234
//		CS	TWO		# (ACTUAL) ERROR RATE IS NEGATIVE.
// PORT: Fixed ROM slots 18202.
                    if slot <> 18202 or instruction <> 18922 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TJET_LAW.agc:235
//# Page 1464
// PORT: SOURCE TJET_LAW.agc:236
//		ADS	ADRSDIF2
// PORT: Fixed ROM slots 18203.
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
// PORT: SOURCE TJET_LAW.agc:237
//
// PORT: SOURCE TJET_LAW.agc:238
// +4		CAE	L
// PORT: Fixed ROM slots 18204.
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
// PORT: SOURCE TJET_LAW.agc:239
//		EXTEND
// PORT: Fixed ROM slots 18205.
                        if slot <> 18205 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:240
//		INDEX	ADRSDIF2	# TTOAXIS AND HH ARE THE PARAMETERS UPON
// PORT: Fixed ROM slots 18206.
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
// PORT: SOURCE TJET_LAW.agc:241
//		MP	ACCFCTZ5	#	WHICH THE APPROXIMATIONS TO TJET ARE
// PORT: Fixed ROM slots 18207.
    18207, 59132
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18208–18211.
function agcAotUnit1103 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18209 {
        if slot <= 18208 {
// PORT: SOURCE TJET_LAW.agc:242
//		DDOUBL			#	ABASED.
// PORT: Fixed ROM slots 18208.
            if slot <> 18208 or instruction <> 8193 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDas(words, 1) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TJET_LAW.agc:243
//		DDOUBL
// PORT: Fixed ROM slots 18209.
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
// PORT: SOURCE TJET_LAW.agc:244
//		DXCH	HH		# DOUBLE PRECISION H SCALED AT 8 SEC(2).
// PORT: Fixed ROM slots 18210.
            if slot <> 18210 or instruction <> 22504 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 1000, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TJET_LAW.agc:245
//		INDEX	ADRSDIF2
// PORT: Fixed ROM slots 18211.
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
// PORT: SOURCE TJET_LAW.agc:246
//		CAE	1/ANET2		# SCALED AT 2(7)/PI SEC(2)/RAD.
// PORT: Fixed ROM slots 18212.
    18212, 26352
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18213–18228.
function agcAotUnit1104 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18220 {
        if slot <= 18216 {
            if slot <= 18214 {
                if slot <= 18213 {
// PORT: SOURCE TJET_LAW.agc:247
//		EXTEND
// PORT: Fixed ROM slots 18213.
                    if slot <> 18213 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TJET_LAW.agc:248
//		MP	EDOT		# SCALED AT PI/2(5)
// PORT: Fixed ROM slots 18214.
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
// PORT: SOURCE TJET_LAW.agc:249
//		TS	TTOAXIS		# SCALED AT 4 SEC.
// PORT: Fixed ROM slots 18215.
                    if slot <> 18215 or instruction <> 23522 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23522, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TJET_LAW.agc:250
//
// PORT: SOURCE TJET_LAW.agc:251
//# TEST WHETHER TJET GREATER THAN 50 MSEC.
// PORT: SOURCE TJET_LAW.agc:252
//
// PORT: SOURCE TJET_LAW.agc:253
//		EXTEND
// PORT: Fixed ROM slots 18216.
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
// PORT: SOURCE TJET_LAW.agc:254
//		MP	-.05AT2		# H - .05 TTOAXIS - .00125 G.T. ZERO
// PORT: Fixed ROM slots 18217.
                    if slot <> 18217 or instruction <> 30684 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 2012, readEffective:call(words, 2012)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TJET_LAW.agc:255
//		AD	HH		# 	(SCALED AT 8 SEC(2) ).
// PORT: Fixed ROM slots 18218.
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
// PORT: SOURCE TJET_LAW.agc:256
//		AD	NEG2
// PORT: Fixed ROM slots 18219.
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
// PORT: SOURCE TJET_LAW.agc:257
//		EXTEND
// PORT: Fixed ROM slots 18220.
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
// PORT: SOURCE TJET_LAW.agc:258
//		BZMF	FORMULA1
// PORT: Fixed ROM slots 18221.
                    if slot <> 18221 or instruction <> 26435 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26435, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TJET_LAW.agc:259
//
// PORT: SOURCE TJET_LAW.agc:260
//# TEST WHETHER TJET GREATER THAN 150 MSEC.
// PORT: SOURCE TJET_LAW.agc:261
//
// PORT: SOURCE TJET_LAW.agc:262
//		CAE	TTOAXIS
// PORT: Fixed ROM slots 18222.
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
// PORT: SOURCE TJET_LAW.agc:263
//		EXTEND
// PORT: Fixed ROM slots 18223.
                    if slot <> 18223 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TJET_LAW.agc:264
//		MP	-.15AT2		# H - .15 TTOAXIS - .01125 G.T. ZERO
// PORT: Fixed ROM slots 18224.
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
// PORT: SOURCE TJET_LAW.agc:265
//		AD	HH		#	(SCALED AT 8 SEC(2) )
// PORT: Fixed ROM slots 18225.
                    if slot <> 18225 or instruction <> 25575 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 999).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TJET_LAW.agc:266
//		AD	-.0112A8
// PORT: Fixed ROM slots 18226.
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
// PORT: SOURCE TJET_LAW.agc:267
//		EXTEND
// PORT: Fixed ROM slots 18227.
                    if slot <> 18227 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TJET_LAW.agc:268
//		BZMF	FORMULA2
// PORT: Fixed ROM slots 18228.
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

// PORT: Physical bank 17. Shared continuation entries, slots 18229–18232.
function agcAotUnit1105 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18230 {
        if slot <= 18229 {
// PORT: SOURCE TJET_LAW.agc:269
//
// PORT: SOURCE TJET_LAW.agc:270
//# IF TJET GREATER THAN 150 MSEC, ASSIGN IT VALUE OF 250 MSEC, SINCE THIS
// PORT: SOURCE TJET_LAW.agc:271
//# IS ENOUGH TO ASSURE NO SKIP NEXT CSP (100 MSEC).
// PORT: SOURCE TJET_LAW.agc:272
//
// PORT: SOURCE TJET_LAW.agc:273
//FULLTIME	CAF	BIT11		# 250 MSEC SCALED AT 4 SEC.
// PORT: Fixed ROM slots 18229.
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
// PORT: SOURCE TJET_LAW.agc:274
//
// PORT: SOURCE TJET_LAW.agc:275
//# RETURN TO CALLING PROGRAM WITH JET TIME SCALED AS TIME6 AND SIGNED.
// PORT: SOURCE TJET_LAW.agc:276
//
// PORT: SOURCE TJET_LAW.agc:277
//RETURNTJ	EXTEND			# ALL BRANCHES TERMINATE HERE WITH TJET
// PORT: Fixed ROM slots 18230.
            if slot <> 18230 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 18231 {
// PORT: SOURCE TJET_LAW.agc:278
//		MP	ROTSENSE	#	(SCALED AT 4 SEC) IN THE ACCUMULATOR.
// PORT: Fixed ROM slots 18231.
            if slot <> 18231 or instruction <> 29664 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 992, readEffective:call(words, 992)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE TJET_LAW.agc:279
//		INDEX	AXISCTR		# ROTSENSE APPLIES SIGN AND CHANGES SCALE.
// PORT: Fixed ROM slots 18232.
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
// PORT: SOURCE TJET_LAW.agc:280
//		TS	TJETU
// PORT: Fixed ROM slots 18233.
    18233, 46762
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18234–18235.
function agcAotUnit1106 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18234 {
// PORT: SOURCE TJET_LAW.agc:281
//		EXTEND
// PORT: Fixed ROM slots 18234.
        if slot <> 18234 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE TJET_LAW.agc:282
//		INDEX	AXISCTR
// PORT: Fixed ROM slots 18235.
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
// PORT: SOURCE TJET_LAW.agc:283
//		MP	ACCSWU		# SET SWITCH FOR JET SELECT IF ROTATION IS
// PORT: Fixed ROM slots 18236.
    18236, 59086
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18237–18266.
function agcAotUnit1107 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18251 {
        if slot <= 18243 {
            if slot <= 18239 {
                if slot <= 18237 {
// PORT: SOURCE TJET_LAW.agc:284
//		CAE	L
// PORT: Fixed ROM slots 18237.
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
// PORT: SOURCE TJET_LAW.agc:285
//		EXTEND			#	IN A SENSE FOR WHICH 1/ACCS HAS FORCED
// PORT: Fixed ROM slots 18238.
                        if slot <> 18238 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:286
//		BZMF	+3		#	A MAX-JET CALCULATION.
// PORT: Fixed ROM slots 18239.
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
// PORT: SOURCE TJET_LAW.agc:287
//		CAF	FOUR
// PORT: Fixed ROM slots 18240.
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
// PORT: SOURCE TJET_LAW.agc:288
//# Page 1465
// PORT: SOURCE TJET_LAW.agc:289
//		TS	NUMBERT
// PORT: Fixed ROM slots 18241.
                        if slot <> 18241 or instruction <> 23523 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23523, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18242 {
// PORT: SOURCE TJET_LAW.agc:290
//		TC	HOLDQ		# RETURN VIA SAVED Q.
// PORT: Fixed ROM slots 18242.
                        if slot <> 18242 or instruction <> 997 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 997, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:291
//
// PORT: SOURCE TJET_LAW.agc:292
//# TJET = H/(.025 + TTOAXIS) 	FOR TJET LESS THAN 50 MSEC.
// PORT: SOURCE TJET_LAW.agc:293
//
// PORT: SOURCE TJET_LAW.agc:294
//FORMULA1	CS	-.025AT4	# .025 SEC SCALED AT 4.
// PORT: Fixed ROM slots 18243.
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
// PORT: SOURCE TJET_LAW.agc:295
//		AD	TTOAXIS		# SCALED AT 4 SECONDS.
// PORT: Fixed ROM slots 18244.
                        if slot <> 18244 or instruction <> 25570 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 994).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:296
//		DXCH	HH		# STORE DENOMINATOR IN FIRST WORD OF H,
// PORT: Fixed ROM slots 18245.
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
// PORT: SOURCE TJET_LAW.agc:297
//		EXTEND			#	WHICH NEED NOT BE PRESERVED.  PICK UP
// PORT: Fixed ROM slots 18246.
                        if slot <> 18246 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:298
//		DV	HH		#	DP H AND DIVIDE BY DENOMINATOR.
// PORT: Fixed ROM slots 18247.
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
// PORT: SOURCE TJET_LAW.agc:299
//		EXTEND
// PORT: Fixed ROM slots 18248.
                        if slot <> 18248 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:300
//		MP	BIT14		# RESCALE TJET FROM 2 TO USUAL 4 SEC.
// PORT: Fixed ROM slots 18249.
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
// PORT: SOURCE TJET_LAW.agc:301
//		TCF	CHKMINTJ	# CHECK THAT TJET IS NOT LESS THAN MINIMUM
// PORT: Fixed ROM slots 18250.
                        if slot <> 18250 or instruction <> 6035 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6035, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:302
//
// PORT: SOURCE TJET_LAW.agc:303
//# TJET = (H + .00375)/(0.1 + TTOAXIS)	FOR TJET GREATER THAN 50 MSEC.
// PORT: SOURCE TJET_LAW.agc:304
//
// PORT: SOURCE TJET_LAW.agc:305
//FORMULA2	EXTEND
// PORT: Fixed ROM slots 18251.
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
// PORT: SOURCE TJET_LAW.agc:306
//		DCA	.00375A8	# .00375 SEC(2) SCALED AT 8.
// PORT: Fixed ROM slots 18252.
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
// PORT: SOURCE TJET_LAW.agc:307
//		DAS	HH		# STORE NUMERATOR IN DP H, WHICH NEED NOT
// PORT: Fixed ROM slots 18253.
                        if slot <> 18253 or instruction <> 9192 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 1000) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:308
//					#	BE PRESERVED.
// PORT: SOURCE TJET_LAW.agc:309
//		CAE	TTOAXIS		# SCALED AT 4 SEC.
// PORT: Fixed ROM slots 18254.
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
// PORT: SOURCE TJET_LAW.agc:310
//		AD	.1AT4		# 0.1 SEC SCALED AT 4.
// PORT: Fixed ROM slots 18255.
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
// PORT: SOURCE TJET_LAW.agc:311
//		DXCH	HH		# STORE DENOMINATOR IN FIRST WORD OF H,
// PORT: Fixed ROM slots 18256.
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
// PORT: SOURCE TJET_LAW.agc:312
//		EXTEND			#	WHICH NEED NOT BE PRESERVED.  PICK UP
// PORT: Fixed ROM slots 18257.
                        if slot <> 18257 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:313
//		DV	HH		#	DP NUMERATOR AND DIVIDE BY DENOMINATOR
// PORT: Fixed ROM slots 18258.
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
// PORT: SOURCE TJET_LAW.agc:314
//		EXTEND
// PORT: Fixed ROM slots 18259.
                        if slot <> 18259 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:315
//		MP	BIT14		# RESCALE TJET FROM 2 TO USUAL 4 SEC.
// PORT: Fixed ROM slots 18260.
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
// PORT: SOURCE TJET_LAW.agc:316
//		TCF	RETURNTJ	# END SUBROUTINE.
// PORT: Fixed ROM slots 18261.
                        if slot <> 18261 or instruction <> 5942 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5942, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:317
//
// PORT: SOURCE TJET_LAW.agc:318
//# SUBROUTINIZED COMPUTATIONS REQUIRED FOR ALL ENTRIES INTO CODING FOR ZONES 1, 2, AND 3.
// PORT: SOURCE TJET_LAW.agc:319
//# REACHED BY TC FROM 3 POINTS IN TJETLAW.
// PORT: SOURCE TJET_LAW.agc:320
//
// PORT: SOURCE TJET_LAW.agc:321
//Z123COMP	CS	ROTSENSE	# USED IN RETURNTJ SECTION TO RESCALE TJET
// PORT: Fixed ROM slots 18262.
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
// PORT: SOURCE TJET_LAW.agc:322
//		TS	ROTSENSE	# 	AS TIME6 AND GIVE IT PROPER SIGN.
// PORT: Fixed ROM slots 18263.
                        if slot <> 18263 or instruction <> 23520 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23520, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:323
//		CAE	EDOT		# SCALED AT PI/2(5) RAD/SEC.
// PORT: Fixed ROM slots 18264.
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
// PORT: SOURCE TJET_LAW.agc:324
//		EXTEND
// PORT: Fixed ROM slots 18265.
                        if slot <> 18265 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:325
//		INDEX	ADRSDIF2
// PORT: Fixed ROM slots 18266.
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
// PORT: SOURCE TJET_LAW.agc:326
//		MP	1/ANET1		# SCALED AT 2(7)/PI SEC(2)/RAD.
// PORT: Fixed ROM slots 18267.
    18267, 59118
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18268–18291.
function agcAotUnit1108 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18279 {
        if slot <= 18273 {
            if slot <= 18270 {
                if slot <= 18268 {
// PORT: SOURCE TJET_LAW.agc:327
//		TS	TTOAXIS		# STORE TIME-TO-AXIS SCALED AT 4 SECONDS.
// PORT: Fixed ROM slots 18268.
                    if slot <> 18268 or instruction <> 23522 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23522, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18269 {
// PORT: SOURCE TJET_LAW.agc:328
//		AD	-TJMAX
// PORT: Fixed ROM slots 18269.
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
// PORT: SOURCE TJET_LAW.agc:329
//		EXTEND			# IS TIME TO AXIS LESS THAN 150 MSEC.
// PORT: Fixed ROM slots 18270.
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
// PORT: SOURCE TJET_LAW.agc:330
//		BZMF	+2
// PORT: Fixed ROM slots 18271.
                    if slot <> 18271 or instruction <> 26465 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 26465, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18272 {
// PORT: SOURCE TJET_LAW.agc:331
//		TCF	FULLTIME	# NO. FIRE JETS, DO NOT CALCULATE TJET.
// PORT: Fixed ROM slots 18272.
                        if slot <> 18272 or instruction <> 5941 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5941, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:332
//		RETURN			# YES.  GO ON TO FIND TJET
// PORT: Fixed ROM slots 18273.
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
// PORT: SOURCE TJET_LAW.agc:333
//
// PORT: SOURCE TJET_LAW.agc:334
//ZON1,2,3	TC	Z123COMP	# SUBROUTINIZED PREPARATION FOR ZONE1,2,3.
// PORT: Fixed ROM slots 18274.
                    if slot <> 18274 or instruction <> 1878 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1878, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18275 {
// PORT: SOURCE TJET_LAW.agc:335
//
// PORT: SOURCE TJET_LAW.agc:336
//# IF THE (NEG) DISTANCE BEYOND PARABOLA IS LESS THAN FLAT, USE SPECIAL
// PORT: SOURCE TJET_LAW.agc:337
//# LOGIC TO ACQUIRE MINIMUM IMPULSE LIMIT CYCLE.  DURING POWERED FLIGHT
// PORT: SOURCE TJET_LAW.agc:338
//# Page 1466
// PORT: SOURCE TJET_LAW.agc:339
//# OR ULLAGE, FLAT = 0
// PORT: SOURCE TJET_LAW.agc:340
//
// PORT: SOURCE TJET_LAW.agc:341
//		CAE	FIREFCT		# SCALED AT PI/4 RAD.
// PORT: Fixed ROM slots 18275.
                        if slot <> 18275 or instruction <> 13281 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 993).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:342
//		AD	FLAT
// PORT: Fixed ROM slots 18276.
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
// PORT: SOURCE TJET_LAW.agc:343
//		EXTEND
// PORT: Fixed ROM slots 18277.
                    if slot <> 18277 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18278 {
// PORT: SOURCE TJET_LAW.agc:344
//		BZMF	ZONE1		# NOT IN SPECIAL ZONES.
// PORT: Fixed ROM slots 18278.
                        if slot <> 18278 or instruction <> 26482 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26482, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:345
//
// PORT: SOURCE TJET_LAW.agc:346
//# FIRE FOR AXIS OR, IF CLOSE, FIRE MINIMUM IMPULSE.  IF ON AXIS, COAST.
// PORT: SOURCE TJET_LAW.agc:347
//
// PORT: SOURCE TJET_LAW.agc:348
//ZONE2,3		CS	ZONE3LIM	# HEIGHT OF MIN-IMPULSE ZONE SET BY 1/ACCS
// PORT: Fixed ROM slots 18279.
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
// PORT: SOURCE TJET_LAW.agc:349
//		AD	TTOAXIS		#	35 MSEC IN DRIFTING FLIGHT
// PORT: Fixed ROM slots 18280.
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
// PORT: SOURCE TJET_LAW.agc:350
//		EXTEND			#	ZERO WHEN TRYING TO ENTER GTS CONTROL.
// PORT: Fixed ROM slots 18281.
                        if slot <> 18281 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:351
//		BZMF	ZONE3
// PORT: Fixed ROM slots 18282.
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
// PORT: SOURCE TJET_LAW.agc:352
//ZONE2		CAE	TTOAXIS		# FIRE TO AXIS.
// PORT: Fixed ROM slots 18283.
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
// PORT: SOURCE TJET_LAW.agc:353
//		TCF	RETURNTJ
// PORT: Fixed ROM slots 18284.
                        if slot <> 18284 or instruction <> 5942 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5942, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:354
//ZONE3		CCS	EDOT		# CHECK IF EDOT IS ZERO.
// PORT: Fixed ROM slots 18285.
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
// PORT: SOURCE TJET_LAW.agc:355
//		CAF	BIT6		# FIRE A ONE-JET MINIMUM IMPULSE.
// PORT: Fixed ROM slots 18286.
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
// PORT: SOURCE TJET_LAW.agc:356
//		TCF	RETURNTJ	# TJET = +0.
// PORT: Fixed ROM slots 18287.
                        if slot <> 18287 or instruction <> 5942 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5942, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:357
//		TC	CCSHOLE		# CANNOT BE BECAUSE NEG EDOT COMPLEMENTED.
// PORT: Fixed ROM slots 18288.
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
// PORT: SOURCE TJET_LAW.agc:358
//		TCF	RETURNTJ	# TJET = +0.
// PORT: Fixed ROM slots 18289.
                    if slot <> 18289 or instruction <> 5942 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5942, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18290 {
// PORT: SOURCE TJET_LAW.agc:359
//
// PORT: SOURCE TJET_LAW.agc:360
//ZONE1		EXTEND
// PORT: Fixed ROM slots 18290.
                        if slot <> 18290 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:361
//		INDEX	ADRSDIF1
// PORT: Fixed ROM slots 18291.
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
// PORT: SOURCE TJET_LAW.agc:362
//		SU	AXISDIST	# SCALED AT PI/4 RAD.
// PORT: Fixed ROM slots 18292.
    18292, 50954
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18293–18294.
function agcAotUnit1109 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18293 {
// PORT: SOURCE TJET_LAW.agc:363
//		EXTEND
// PORT: Fixed ROM slots 18293.
        if slot <> 18293 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE TJET_LAW.agc:364
//		INDEX	ADRSDIF2
// PORT: Fixed ROM slots 18294.
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
// PORT: SOURCE TJET_LAW.agc:365
//		MP	ACCFCTZ1	# SCALED AT 2(7)/PI SEC(2)/RAD.
// PORT: Fixed ROM slots 18295.
    18295, 59130
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18296–18335.
function agcAotUnit1110 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18315 {
        if slot <= 18305 {
            if slot <= 18300 {
                if slot <= 18297 {
                    if slot <= 18296 {
// PORT: SOURCE TJET_LAW.agc:366
//		DDOUBL
// PORT: Fixed ROM slots 18296.
                        if slot <> 18296 or instruction <> 8193 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 1) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:367
//		DDOUBL
// PORT: Fixed ROM slots 18297.
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
// PORT: SOURCE TJET_LAW.agc:368
//		DXCH	HH		# DOUBLE PRECISION H SCALED AT 8 SEC(2).
// PORT: Fixed ROM slots 18298.
                        if slot <> 18298 or instruction <> 22504 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 1000, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18299 {
// PORT: SOURCE TJET_LAW.agc:369
//
// PORT: SOURCE TJET_LAW.agc:370
//# TEST WHETHER TOTAL TIME REQUIRED GREATER THAN 150 MSEC:
// PORT: SOURCE TJET_LAW.agc:371
//#	                     2                                   2
// PORT: SOURCE TJET_LAW.agc:372
//# 	IS .5(.150 - TTOAXIS)  - H  NEGATIVE (SCALED AT 8 SECONDS )
// PORT: SOURCE TJET_LAW.agc:373
//
// PORT: SOURCE TJET_LAW.agc:374
//		CAE	TTOAXIS		# TTOAXIS SCALED AT 4 SECONDS.
// PORT: Fixed ROM slots 18299.
                            if slot <> 18299 or instruction <> 13282 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 994).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TJET_LAW.agc:375
//		AD	-TJMAX		# -.150 SECOND SCALED AT 4.
// PORT: Fixed ROM slots 18300.
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
// PORT: SOURCE TJET_LAW.agc:376
//		EXTEND
// PORT: Fixed ROM slots 18301.
                        if slot <> 18301 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:377
//		SQUARE
// PORT: Fixed ROM slots 18302.
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
// PORT: SOURCE TJET_LAW.agc:378
//		EXTEND
// PORT: Fixed ROM slots 18303.
                        if slot <> 18303 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18304 {
// PORT: SOURCE TJET_LAW.agc:379
//		SU	HH		# HIGH WORD OF H SCALED AT 8 SEC(2).
// PORT: Fixed ROM slots 18304.
                            if slot <> 18304 or instruction <> 25575 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreSU(words, 999).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TJET_LAW.agc:380
//		EXTEND
// PORT: Fixed ROM slots 18305.
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
// PORT: SOURCE TJET_LAW.agc:381
//		BZMF	FULLTIME	# YES.  NEED NOT CALCULATE TJET.
// PORT: Fixed ROM slots 18306.
                        if slot <> 18306 or instruction <> 26421 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26421, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:382
//
// PORT: SOURCE TJET_LAW.agc:383
//# TEST WHETHER TIME BEYOND AXIS GREATER THAN 50 MSEC TO DETERMINE WHICH APPROXIMATION TO USE.
// PORT: SOURCE TJET_LAW.agc:384
//
// PORT: SOURCE TJET_LAW.agc:385
//		CAE	HH
// PORT: Fixed ROM slots 18307.
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
// PORT: SOURCE TJET_LAW.agc:386
//		AD	NEG2
// PORT: Fixed ROM slots 18308.
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
// PORT: SOURCE TJET_LAW.agc:387
//		EXTEND
// PORT: Fixed ROM slots 18309.
                            if slot <> 18309 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TJET_LAW.agc:388
//		BZMF	FORMULA3
// PORT: Fixed ROM slots 18310.
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
// PORT: SOURCE TJET_LAW.agc:389
//
// PORT: SOURCE TJET_LAW.agc:390
//# Page 1467
// PORT: SOURCE TJET_LAW.agc:391
//# TJET = H/0.1 + TTOAXIS + .0375	FOR APPROXIMATION OVER MORE THAN 50 MSEC.
// PORT: SOURCE TJET_LAW.agc:392
//
// PORT: SOURCE TJET_LAW.agc:393
//		CAF	.1AT2		# STORE .1 SEC SCALED AT 2 FOR DIVISION.
// PORT: Fixed ROM slots 18311.
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
// PORT: SOURCE TJET_LAW.agc:394
//		DXCH	HH		# DP H SCALED AT 8 SEC(2) NEED NOT BE
// PORT: Fixed ROM slots 18312.
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
// PORT: SOURCE TJET_LAW.agc:395
//		EXTEND			#	PRESERVED.
// PORT: Fixed ROM slots 18313.
                        if slot <> 18313 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18314 {
// PORT: SOURCE TJET_LAW.agc:396
//		DV	HH		# QUOTIENT SCALED AT 4 SECONDS.
// PORT: Fixed ROM slots 18314.
                            if slot <> 18314 or instruction <> 5095 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreDv(words, 999, readEffective:call(words, 999)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TJET_LAW.agc:397
//		AD	TTOAXIS		# SCALED AT 4 SEC.
// PORT: Fixed ROM slots 18315.
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
// PORT: SOURCE TJET_LAW.agc:398
//		AD	.0375AT4	# .0375 SEC SCALED AT 4.
// PORT: Fixed ROM slots 18316.
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
// PORT: SOURCE TJET_LAW.agc:399
//		TCF	RETURNTJ	# END COMPUTATION.
// PORT: Fixed ROM slots 18317.
                        if slot <> 18317 or instruction <> 5942 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5942, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18318 {
// PORT: SOURCE TJET_LAW.agc:400
//
// PORT: SOURCE TJET_LAW.agc:401
//# TJET - H/.O25 + TTOAXIS 	FOR APPROXIMATION OVER LESS THAN 50 MSEC.
// PORT: SOURCE TJET_LAW.agc:402
//
// PORT: SOURCE TJET_LAW.agc:403
//FORMULA3	CS	-.025AT2	# STORE +.25 SEC SCALED AT 2 FOR DIVISION
// PORT: Fixed ROM slots 18318.
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
// PORT: SOURCE TJET_LAW.agc:404
//		DXCH	HH		# PICK UP DP H AT 8, WHICH NEED NOT BE
// PORT: Fixed ROM slots 18319.
                            if slot <> 18319 or instruction <> 22504 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 1000, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TJET_LAW.agc:405
//		EXTEND			# 	PRESERVED.
// PORT: Fixed ROM slots 18320.
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
// PORT: SOURCE TJET_LAW.agc:406
//		DV	HH		# QUOTIENT SCALED AT 4 SECONDS.
// PORT: Fixed ROM slots 18321.
                        if slot <> 18321 or instruction <> 5095 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreDv(words, 999, readEffective:call(words, 999)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:407
//		AD	TTOAXIS		# SCALED AT 4 SEC.
// PORT: Fixed ROM slots 18322.
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
// PORT: SOURCE TJET_LAW.agc:408
//
// PORT: SOURCE TJET_LAW.agc:409
//# IF COMPUTED JET TIME IS LESS THAN TJMIN, TJET IS SET TO ZERO.
// PORT: SOURCE TJET_LAW.agc:410
//# MINIMUM IMPULSES REQUIRED IN ZONE 3 ARE NOT SUBJECT TO THIS CONSTRAINT, NATURALLY.
// PORT: SOURCE TJET_LAW.agc:411
//
// PORT: SOURCE TJET_LAW.agc:412
//CHKMINTJ	AD	-TJMIN		# IS COMPUTED TIME LESS THAN THE MINIMUM.
// PORT: Fixed ROM slots 18323.
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
// PORT: SOURCE TJET_LAW.agc:413
//		EXTEND
// PORT: Fixed ROM slots 18324.
                            if slot <> 18324 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TJET_LAW.agc:414
//		BZMF	COASTTJ		# YES, SET TIME TO ZERO.
// PORT: Fixed ROM slots 18325.
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
// PORT: SOURCE TJET_LAW.agc:415
//		AD	TJMIN		# NO, RESTORE COMPUTED TIME.
// PORT: Fixed ROM slots 18326.
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
// PORT: SOURCE TJET_LAW.agc:416
//		TCF	RETURNTJ	# END COMPUTATION.
// PORT: Fixed ROM slots 18327.
                        if slot <> 18327 or instruction <> 5942 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5942, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18328 {
// PORT: SOURCE TJET_LAW.agc:417
//
// PORT: SOURCE TJET_LAW.agc:418
//# Page 1468
// PORT: SOURCE TJET_LAW.agc:419
//# *** ROUGHLAW ***
// PORT: SOURCE TJET_LAW.agc:420
//#
// PORT: SOURCE TJET_LAW.agc:421
//# BEFORE ENTRY TO RUFLAW:
// PORT: SOURCE TJET_LAW.agc:422
//#	1. INDEXERS ADRSDIF1 AND ADRSDIF2 ARE SET ON BASIS OF AXIS, AND SIGN OF EDOT.
// PORT: SOURCE TJET_LAW.agc:423
//#	2. IF EDOT WAS NEGATIVE, E AND EDOT ARE ROTATED INTO UPPER HALF-PLANE AND ROTSENSE IS MADE NEGATIVE.
// PORT: SOURCE TJET_LAW.agc:424
//#	3. E IS SCALED AT PI RADIANS AND EDOT AT PI/4 RAD/SEC.
// PORT: SOURCE TJET_LAW.agc:425
//#	   (EXCEPT THE RUFLAW3 ENTRY WHEN E IS AT PI/4)
// PORT: SOURCE TJET_LAW.agc:426
//#
// PORT: SOURCE TJET_LAW.agc:427
//# RUFLAW1:	ERROR MORE NEGATIVE THAN PI/16 RAD.  FIRE TO A RATE OF 6.5 DEG/SEC (IF JET TIME EXCEEDS 20 MSEC.).
// PORT: SOURCE TJET_LAW.agc:428
//# RUFLAW2:	ERROR MORE POSITIVE THAN PI/16 RAD.  FIRE TO AN OPPOSING RATE OF 6.5 DEG/SEC.
// PORT: SOURCE TJET_LAW.agc:429
//# RUFLAW3:	ERROR RATE GREATER THAN PI/32 RAD/SEC AND ERROR WITHIN BOUNDS.  COAST IF BELOW FIREFCT, FIRE IF ABOVE
// PORT: SOURCE TJET_LAW.agc:430
//
// PORT: SOURCE TJET_LAW.agc:431
//RUFLAW1		CS	RUFRATE		# DECREMENT EDOT BY .1444 RAD/SEC AT PI/4
// PORT: Fixed ROM slots 18328.
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
// PORT: SOURCE TJET_LAW.agc:432
//		ADS	EDOT		#	WHICH IS THE TARGET RATE
// PORT: Fixed ROM slots 18329.
                            if slot <> 18329 or instruction <> 12055 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 791).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TJET_LAW.agc:433
//		EXTEND
// PORT: Fixed ROM slots 18330.
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
// PORT: SOURCE TJET_LAW.agc:434
//		BZMF	SMALRATE	# BRANCH IF RATE LESS THAN TARGET.
// PORT: Fixed ROM slots 18331.
                        if slot <> 18331 or instruction <> 26540 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 26540, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:435
//		TC	RUFSETUP	# REVERSE ROTSENSE AND INDICATE MAX JETS.
// PORT: Fixed ROM slots 18332.
                        if slot <> 18332 or instruction <> 1994 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1994, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18333 {
// PORT: SOURCE TJET_LAW.agc:436
//		CAE	EDOT		# PICK UP DESIRED RATE CHANGE.
// PORT: Fixed ROM slots 18333.
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
// PORT: SOURCE TJET_LAW.agc:437
//
// PORT: SOURCE TJET_LAW.agc:438
//RUFLAW12	EXTEND			# COMPUTE TJET
// PORT: Fixed ROM slots 18334.
                            if slot <> 18334 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE TJET_LAW.agc:439
//		INDEX	ADRSDIF2	#	= (DESIRED RATE CHANGE)/(2-JET ACCEL.)
// PORT: Fixed ROM slots 18335.
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
// PORT: SOURCE TJET_LAW.agc:440
//		MP	1/ANET1 +2
// PORT: Fixed ROM slots 18336.
    18336, 59122
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18337–18362.
function agcAotUnit1111 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18349 {
        if slot <= 18342 {
            if slot <= 18339 {
                if slot <= 18337 {
// PORT: SOURCE TJET_LAW.agc:441
//		AD	-1/8		# IF TJET, SCALED AT 32 SEC, EXCEEDS
// PORT: Fixed ROM slots 18337.
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
// PORT: SOURCE TJET_LAW.agc:442
//		EXTEND			# 	4 SECONDS, SET TJET TO TJMAX.
// PORT: Fixed ROM slots 18338.
                        if slot <> 18338 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:443
//		BZMF	+2
// PORT: Fixed ROM slots 18339.
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
// PORT: SOURCE TJET_LAW.agc:444
//		TCF	FULLTIME
// PORT: Fixed ROM slots 18340.
                    if slot <> 18340 or instruction <> 5941 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5941, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18341 {
// PORT: SOURCE TJET_LAW.agc:445
//		EXTEND
// PORT: Fixed ROM slots 18341.
                        if slot <> 18341 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:446
//		BZF	FULLTIME
// PORT: Fixed ROM slots 18342.
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
// PORT: SOURCE TJET_LAW.agc:447
//		AD	BIT12		# RESTORE COMPUTED TJET TO ACCUMULATOR
// PORT: Fixed ROM slots 18343.
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
// PORT: SOURCE TJET_LAW.agc:448
//		DAS	A
// PORT: Fixed ROM slots 18344.
                        if slot <> 18344 or instruction <> 8193 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 1) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:449
//		DAS	A
// PORT: Fixed ROM slots 18345.
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
// PORT: SOURCE TJET_LAW.agc:450
//		DAS	A		# RESCALED TJET AT 4 SECONDS.
// PORT: Fixed ROM slots 18346.
                        if slot <> 18346 or instruction <> 8193 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 1) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:451
//		TCF	CHKMINTJ	# RETURN AS FROM FINELAW.
// PORT: Fixed ROM slots 18347.
                        if slot <> 18347 or instruction <> 6035 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6035, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18348 {
// PORT: SOURCE TJET_LAW.agc:452
//
// PORT: SOURCE TJET_LAW.agc:453
//SMALRATE	TC	RUFSETUP +2	# SET NUMBERT AND FIREFCT FOR MAXIMUM JETS
// PORT: Fixed ROM slots 18348.
                        if slot <> 18348 or instruction <> 1996 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1996, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:454
//		CCS	ROTSENSE
// PORT: Fixed ROM slots 18349.
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
// PORT: SOURCE TJET_LAW.agc:455
//		CAF	ONE		# MODIFY INDEXER TO POINT TO 1/ANET
// PORT: Fixed ROM slots 18350.
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
// PORT: SOURCE TJET_LAW.agc:456
//		TCF	+2		#	CORRESPONDING TO THE PROPER SENSE.
// PORT: Fixed ROM slots 18351.
                        if slot <> 18351 or instruction <> 6065 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6065, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:457
//		CAF	NEGONE
// PORT: Fixed ROM slots 18352.
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
// PORT: SOURCE TJET_LAW.agc:458
//		ADS	ADRSDIF2
// PORT: Fixed ROM slots 18353.
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
// PORT: SOURCE TJET_LAW.agc:459
//
// PORT: SOURCE TJET_LAW.agc:460
//		CS	EDOT		# (.144 AT PI/4 - EDOT) = DESIRED RATE CHNG.
// PORT: Fixed ROM slots 18354.
                        if slot <> 18354 or instruction <> 17175 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 791).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:461
//		TCF	RUFLAW12
// PORT: Fixed ROM slots 18355.
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
// PORT: SOURCE TJET_LAW.agc:462
//
// PORT: SOURCE TJET_LAW.agc:463
//RUFLAW2		TC	RUFSETUP	# REVERSE ROTSENSE AND INDICATE MAX JETS.
// PORT: Fixed ROM slots 18356.
                    if slot <> 18356 or instruction <> 1994 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1994, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18357 {
// PORT: SOURCE TJET_LAW.agc:464
//		CAF	RUFRATE
// PORT: Fixed ROM slots 18357.
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
// PORT: SOURCE TJET_LAW.agc:465
//		AD	EDOT		# (.144 AT PI/4 + EDOT) = DESIRED RATE CHNG.
// PORT: Fixed ROM slots 18358.
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
// PORT: SOURCE TJET_LAW.agc:466
//		TS	A		# IF OVERFLOW SKIP, FIRE FOR FULL TIME.
// PORT: Fixed ROM slots 18359.
                        if slot <> 18359 or instruction <> 22528 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22528, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:467
//		TCF	RUFLAW12	# OTHERWISE, COMPUTE JET TIME.
// PORT: Fixed ROM slots 18360.
                        if slot <> 18360 or instruction <> 6046 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6046, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 18361 {
// PORT: SOURCE TJET_LAW.agc:468
//		TCF	FULLTIME
// PORT: Fixed ROM slots 18361.
                        if slot <> 18361 or instruction <> 5941 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5941, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE TJET_LAW.agc:469
//
// PORT: SOURCE TJET_LAW.agc:470
//# Page 1469
// PORT: SOURCE TJET_LAW.agc:471
//RUFLAW3		TC	RUFSETUP	# EXECUTE COMMON RUFLAW SUBROUTINE.
// PORT: Fixed ROM slots 18362.
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

// PORT: Physical bank 17. Shared continuation entries, slots 18363–18363.
function agcAotUnit1112 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE TJET_LAW.agc:472
//		INDEX	ADRSDIF1
// PORT: Fixed ROM slots 18363.
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
// PORT: SOURCE TJET_LAW.agc:473
//		CS	FIREDB		# CALCULATE DISTANCE FROM SWITCH CURVE
// PORT: Fixed ROM slots 18364.
    18364, 34562
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18365–18372.
function agcAotUnit1113 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18368 {
        if slot <= 18366 {
            if slot <= 18365 {
// PORT: SOURCE TJET_LAW.agc:474
//		AD	E		#	1/ANET1*EDOT*EDOT +E - FIREDB = 0
// PORT: Fixed ROM slots 18365.
                if slot <> 18365 or instruction <> 25578 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 1002).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TJET_LAW.agc:475
//		EXTEND			#		SCALED AT 4 PI RADIANS
// PORT: Fixed ROM slots 18366.
                if slot <> 18366 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18367 {
// PORT: SOURCE TJET_LAW.agc:476
//		MP	BIT11
// PORT: Fixed ROM slots 18367.
                if slot <> 18367 or instruction <> 31201 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMp(words, 2529, readEffective:call(words, 2529)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TJET_LAW.agc:477
//		XCH	EDOT
// PORT: Fixed ROM slots 18368.
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
// PORT: SOURCE TJET_LAW.agc:478
//		EXTEND
// PORT: Fixed ROM slots 18369.
                if slot <> 18369 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TJET_LAW.agc:479
//		SQUARE
// PORT: Fixed ROM slots 18370.
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
// PORT: SOURCE TJET_LAW.agc:480
//		EXTEND
// PORT: Fixed ROM slots 18371.
                if slot <> 18371 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TJET_LAW.agc:481
//		INDEX	ADRSDIF1
// PORT: Fixed ROM slots 18372.
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
// PORT: SOURCE TJET_LAW.agc:482
//		MP	1/ANET1 +2
// PORT: Fixed ROM slots 18373.
    18373, 59122
)).

// PORT: Physical bank 17. Shared continuation entries, slots 18374–18384.
function agcAotUnit1114 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18378 {
        if slot <= 18375 {
            if slot <= 18374 {
// PORT: SOURCE TJET_LAW.agc:483
//		AD	EDOT
// PORT: Fixed ROM slots 18374.
                if slot <> 18374 or instruction <> 25367 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 791).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE TJET_LAW.agc:484
//		EXTEND
// PORT: Fixed ROM slots 18375.
                if slot <> 18375 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 18376 {
// PORT: SOURCE TJET_LAW.agc:485
//		BZMF	COASTTJ		# COAST IF BELOW IT.
// PORT: Fixed ROM slots 18376.
                if slot <> 18376 or instruction <> 26386 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26386, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18377 {
// PORT: SOURCE TJET_LAW.agc:486
//		TCF	FULLTIME	# FIRE FOR FULL PERIOD IF ABOVE IT.
// PORT: Fixed ROM slots 18377.
                    if slot <> 18377 or instruction <> 5941 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5941, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TJET_LAW.agc:487
//
// PORT: SOURCE TJET_LAW.agc:488
//# SUBROUTINE USED IN ALL ENTRIES TO ROUGHLAW.
// PORT: SOURCE TJET_LAW.agc:489
//
// PORT: SOURCE TJET_LAW.agc:490
//RUFSETUP	CS	ROTSENSE	# REVERSE ROTSENSE WHEN ENTER HERE.
// PORT: Fixed ROM slots 18378.
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
// PORT: SOURCE TJET_LAW.agc:491
//		TS	ROTSENSE
// PORT: Fixed ROM slots 18379.
                if slot <> 18379 or instruction <> 23520 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23520, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 18380 {
// PORT: SOURCE TJET_LAW.agc:492
// +2		CAF	FOUR		# REQUIRE MAXIMUM (2) JETS IN U,V-AXES.
// PORT: Fixed ROM slots 18380.
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
// PORT: SOURCE TJET_LAW.agc:493
//		TS	NUMBERT
// PORT: Fixed ROM slots 18381.
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
// PORT: SOURCE TJET_LAW.agc:494
//		CAF	NEGMAX		# SUGGEST MAXIMUM (4) JETS IN P-AXIS.
// PORT: Fixed ROM slots 18382.
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
// PORT: SOURCE TJET_LAW.agc:495
//		TS	FIREFCT
// PORT: Fixed ROM slots 18383.
                    if slot <> 18383 or instruction <> 23521 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23521, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE TJET_LAW.agc:496
//		TC	Q
// PORT: Fixed ROM slots 18384.
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
// PORT: SOURCE TJET_LAW.agc:497
//
// PORT: SOURCE TJET_LAW.agc:498
//# CONSTANTS FOR TJETLAW
// PORT: SOURCE TJET_LAW.agc:499
//
// PORT: SOURCE TJET_LAW.agc:500
//		DEC	-16		# AXISDIFF(INDEX) = NUMBER OF REGISTERS
// PORT: Fixed ROM slots 18385.
    18385, 65502,
// PORT: SOURCE TJET_LAW.agc:501
//AXISDIFF	DEC	+0		#	BETWEEN STORED 1/ACCS PARAMETERS FOR
// PORT: Fixed ROM slots 18386.
    18386, 0,
// PORT: SOURCE TJET_LAW.agc:502
//		DEC	16		#	THE INDEXED AXIS AND THE U-AXIS.
// PORT: Fixed ROM slots 18387.
    18387, 32,
// PORT: SOURCE TJET_LAW.agc:503
//SENSOR		OCT	14400		# RATIO OF TJET SCALING WITHIN TJETLAW
// PORT: Fixed ROM slots 18388.
    18388, 12800,
// PORT: SOURCE TJET_LAW.agc:504
//					#	(4 SEC) TO SCALING FOR T6 (10.24 SEC).
// PORT: SOURCE TJET_LAW.agc:505
//-3DEG		DEC	-.06667		# -3.0 DEGREES SCALED AT 45.
// PORT: Fixed ROM slots 18389.
    18389, 63350,
// PORT: SOURCE TJET_LAW.agc:506
//-.0112A8	DEC	-.00141		# -.01125 SEC(2) SCALED AT 8.
// PORT: Fixed ROM slots 18390.
    18390, 65488,
// PORT: SOURCE TJET_LAW.agc:507
//.1AT4		DEC	.025		# 0.1 SECOND SCALED AT 4.
// PORT: Fixed ROM slots 18391.
    18391, 820,
// PORT: SOURCE TJET_LAW.agc:508
//.1AT2		DEC	.05		# .1 SEC SCALED AT 2.
// PORT: Fixed ROM slots 18392.
    18392, 1638,
// PORT: SOURCE TJET_LAW.agc:509
//.0375AT4	DEC	.00938		# .0375 SEC SCALED AT 4.
// PORT: Fixed ROM slots 18393.
    18393, 308,
// PORT: SOURCE TJET_LAW.agc:510
//-.025AT2	DEC	-.0125		# -.025 SEC SCALED AT 2.
// PORT: Fixed ROM slots 18394.
    18394, 65124,
// PORT: SOURCE TJET_LAW.agc:511
//-.025AT4	DEC	-.00625
// PORT: Fixed ROM slots 18395.
    18395, 65330,
// PORT: SOURCE TJET_LAW.agc:512
//-.05AT2		DEC	-.025
// PORT: Fixed ROM slots 18396.
    18396, 64714,
// PORT: SOURCE TJET_LAW.agc:513
//-.15AT2		DEC	-.075
// PORT: Fixed ROM slots 18397.
    18397, 63076,
// PORT: SOURCE TJET_LAW.agc:514
//.00375A8	2DEC	.00375 B-3
// PORT: Fixed ROM slots 18398 18399.
    18398, 14, 18399, 22282,
// PORT: SOURCE TJET_LAW.agc:515
//
// PORT: SOURCE TJET_LAW.agc:516
//-TJMAX		DEC	-.0375		# LARGEST CALCULATED TIME.  .150 SEC AT 4.
// PORT: Fixed ROM slots 18400.
    18400, 64306,
// PORT: SOURCE TJET_LAW.agc:517
//TJMIN		DEC	.005		# SMALLEST ALLOWABLE TIME.  .020 SEC AT 4.
// PORT: Fixed ROM slots 18401.
    18401, 164,
// PORT: SOURCE TJET_LAW.agc:518
//-TJMIN		DEC	-.005
// PORT: Fixed ROM slots 18402.
    18402, 65370,
// PORT: SOURCE TJET_LAW.agc:519
//RUFRATE		DEC	.1444		# CORRESPONDS TO TARGET RATE OF 6.5 DEG/S.
// PORT: Fixed ROM slots 18403.
    18403, 4732
)).

