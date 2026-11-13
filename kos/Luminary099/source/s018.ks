// EXTENDED_VERBS.agc
// bank 43, slots 37888-37888
function agcAotUnit2535 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:1
//# Copyright:	Public domain.
// EXTENDED_VERBS.agc:2
//# Filename:	EXTENDED_VERBS.agc
// EXTENDED_VERBS.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// EXTENDED_VERBS.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// EXTENDED_VERBS.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// EXTENDED_VERBS.agc:6
//# Assembler:	yaYUL
// EXTENDED_VERBS.agc:7
//# Contact:	Ron Burkey <info@sandroid.org>.
// EXTENDED_VERBS.agc:8
//# Website:	www.ibiblio.org/apollo.
// EXTENDED_VERBS.agc:9
//# Pages:	262-300
// EXTENDED_VERBS.agc:10
//# Mod history:  2009-05-10 SN   (Sergio Navarro).  Started adapting
// EXTENDED_VERBS.agc:11
//#				from the Luminary131/ file of the same
// EXTENDED_VERBS.agc:12
//#				name, using Luminary099 page images.
// EXTENDED_VERBS.agc:13
//#		2009-06-05 RSB	Corrected 5 typos.
// EXTENDED_VERBS.agc:14
//#		2009-06-06 RSB	Eliminated an extraneous 3-instruction block
// EXTENDED_VERBS.agc:15
//#				and added a missing instruction.
// EXTENDED_VERBS.agc:16
//#		2009-06-07 RSB	Added a couple of "SBANK=" for compatibility
// EXTENDED_VERBS.agc:17
//#				with yaYUL. Corrected a typo.
// EXTENDED_VERBS.agc:18
//#		2010-12-31 JL	Fixed page number comments.
// EXTENDED_VERBS.agc:19
//#		2011-01-06 JL	Added missing comment characters.
// EXTENDED_VERBS.agc:20
//#		2011-05-08 JL	Flagged SBANK= workarounds for future removal.
// EXTENDED_VERBS.agc:21
//
// EXTENDED_VERBS.agc:22
//# This source code has been transcribed or otherwise adapted from
// EXTENDED_VERBS.agc:23
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// EXTENDED_VERBS.agc:24
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// EXTENDED_VERBS.agc:25
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// EXTENDED_VERBS.agc:26
//# in storage size and consequent reduction in image quality as well) are
// EXTENDED_VERBS.agc:27
//# available online at www.ibiblio.org/apollo.  If for some reason you
// EXTENDED_VERBS.agc:28
//# find that the images are illegible, contact me at info@sandroid.org
// EXTENDED_VERBS.agc:29
//# about getting access to the (much) higher-quality images which Paul
// EXTENDED_VERBS.agc:30
//# actually created.
// EXTENDED_VERBS.agc:31
//#
// EXTENDED_VERBS.agc:32
//# Notations on the hardcopy document read, in part:
// EXTENDED_VERBS.agc:33
//#
// EXTENDED_VERBS.agc:34
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// EXTENDED_VERBS.agc:35
//#	16:27 JULY 14, 1969
// EXTENDED_VERBS.agc:36
//
// EXTENDED_VERBS.agc:37
//# Page 262
// EXTENDED_VERBS.agc:38
//		BANK	7
// EXTENDED_VERBS.agc:39
//		SETLOC	EXTVERBS
// EXTENDED_VERBS.agc:40
//		BANK
// EXTENDED_VERBS.agc:41
//
// EXTENDED_VERBS.agc:42
//		EBANK=	OGC
// EXTENDED_VERBS.agc:43
//
// EXTENDED_VERBS.agc:44
//		COUNT*	$$/EXTVB
// EXTENDED_VERBS.agc:45
//
// EXTENDED_VERBS.agc:46
//# FAN-OUT
// EXTENDED_VERBS.agc:47
//
// EXTENDED_VERBS.agc:48
//GOEXTVB		INDEX	MPAC		# VERB-40 IS IN MPAC
// slot 37888
    if slot <> 37888 or instruction <> 20588 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2535] to agcAotUnit2535@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:49
//		TC	LST2FAN		# FAN AS BEFORE.
// slot 37889
    37889, 2052
)).

// bank 43, slots 37890-37969
function agcAotUnit2536 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 37929 {
        if slot <= 37909 {
            if slot <= 37899 {
                if slot <= 37894 {
                    if slot <= 37891 {
                        if slot <= 37890 {
// EXTENDED_VERBS.agc:50
//
// EXTENDED_VERBS.agc:51
//LST2FAN		TC	VBZERO		# VB40 ZERO (USED WITH NOUN 20 OR 72 ONLY)
// slot 37890
                            if slot <> 37890 or instruction <> 1112 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1112, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:52
//		TC	VBCOARK		# VB41 COARSE ALIGN (USED WITH NOUN 20 OR
// slot 37891
                            if slot <> 37891 or instruction <> 1145 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1145, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37892 {
// EXTENDED_VERBS.agc:53
//					#				72 ONLY)
// EXTENDED_VERBS.agc:54
//		TC	IMUFINEK	# VB42 FINE ALIGN IMU
// slot 37892
                            if slot <> 37892 or instruction <> 1240 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1240, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37893 {
// EXTENDED_VERBS.agc:55
//		TC	IMUATTCK	# VB43 LOAD IMU ATTITUDE ERROR METERS.
// slot 37893
                                if slot <> 37893 or instruction <> 1479 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1479, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// EXTENDED_VERBS.agc:56
//		TC	RRDESEND	# VB44 TERMINATE CONTINUOUS DESIGNATE
// slot 37894
                                if slot <> 37894 or instruction <> 1218 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1218, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 37896 {
                        if slot <= 37895 {
// EXTENDED_VERBS.agc:57
//		TC	ALM/END		# VB45 SPARE
// slot 37895
                            if slot <> 37895 or instruction <> 1104 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1104, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:58
//		TC	ALM/END		# VB46 SPARE
// slot 37896
                            if slot <> 37896 or instruction <> 1104 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1104, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37897 {
// EXTENDED_VERBS.agc:59
//		TC	V47TXACT	# VB47 AGS INITIALIZATION
// slot 37897
                            if slot <> 37897 or instruction <> 1271 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1271, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37898 {
// EXTENDED_VERBS.agc:60
//		TC	DAPDISP		# VB48 LOAD A/P DATA
// slot 37898
                                if slot <> 37898 or instruction <> 1629 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1629, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// EXTENDED_VERBS.agc:61
//		TCF	CREWMANU	# VB49 START AUTOMATIC ATTITUDE MANEUVER
// slot 37899
                                if slot <> 37899 or instruction <> 5645 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5645, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 37904 {
                    if slot <= 37901 {
                        if slot <= 37900 {
// EXTENDED_VERBS.agc:62
//		TC	GOLOADLV	# VB50 PLEASE PERFORM
// slot 37900
                            if slot <> 37900 or instruction <> 1265 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1265, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:63
//		TC	ALM/END		# VB51 SPARE
// slot 37901
                            if slot <> 37901 or instruction <> 1104 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1104, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37902 {
// EXTENDED_VERBS.agc:64
//		TC	GOLOADLV	# VB52 PLEASE MARK X -- RETICLE.
// slot 37902
                            if slot <> 37902 or instruction <> 1265 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1265, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37903 {
// EXTENDED_VERBS.agc:65
//		TC	GOLOADLV	# VB53 PLEASE MARK Y -- RETICLE.
// slot 37903
                                if slot <> 37903 or instruction <> 1265 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1265, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// EXTENDED_VERBS.agc:66
//		TC	GOLOADLV	# VB54 PLEASE MARK X OR Y RETICLE
// slot 37904
                                if slot <> 37904 or instruction <> 1265 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1265, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 37906 {
                        if slot <= 37905 {
// EXTENDED_VERBS.agc:67
//		TC	ALINTIME	# VB55 ALIGN TIME
// slot 37905
                            if slot <> 37905 or instruction <> 1281 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1281, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:68
//		TC	TRMTRACK	# VB56 TERMINATE TRACKING -- P20 + P25
// slot 37906
                            if slot <> 37906 or instruction <> 1556 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1556, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37907 {
// EXTENDED_VERBS.agc:69
//		TC	LRON		# VB57 PERMIT LANDING RADAR UPDATES
// slot 37907
                            if slot <> 37907 or instruction <> 1234 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1234, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37908 {
// EXTENDED_VERBS.agc:70
//		TC	LROFF		# VB58 INHIBIT LANDING RADAR UPDATES
// slot 37908
                                if slot <> 37908 or instruction <> 1237 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1237, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// EXTENDED_VERBS.agc:71
//		TC	ALM/END		# VB59 SPARE
// slot 37909
                                if slot <> 37909 or instruction <> 1104 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1104, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 37919 {
                if slot <= 37914 {
                    if slot <= 37911 {
                        if slot <= 37910 {
// EXTENDED_VERBS.agc:72
//		TC	LRPOS2K		# VB60 COMMAND LR TO POSITION 2.
// slot 37910
                            if slot <> 37910 or instruction <> 1129 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1129, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:73
//		TC	DAPATTER	# VB61 DISPLAY DAP ATTITUDE ERROR
// slot 37911
                            if slot <> 37911 or instruction <> 1139 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1139, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37912 {
// EXTENDED_VERBS.agc:74
//		TC	TOTATTER	# VB62 DISPLAY TOTAL ATTITUDE ERROR
// slot 37912
                            if slot <> 37912 or instruction <> 1142 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1142, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37913 {
// EXTENDED_VERBS.agc:75
//		TC	R04		# VB63 SAMPLE RADAR ONCE PER SECOND
// slot 37913
                                if slot <> 37913 or instruction <> 1292 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1292, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// EXTENDED_VERBS.agc:76
//		TC	VB64		# VB64 CALCULATE, DISPLAY S-BAND ANT ANGLES
// slot 37914
                                if slot <> 37914 or instruction <> 1472 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1472, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 37916 {
                        if slot <= 37915 {
// EXTENDED_VERBS.agc:77
//		TC	SNUFFOUT	# VB65 DISABLE U,V JETS DURING DPS BURNS.
// slot 37915
                            if slot <> 37915 or instruction <> 1681 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1681, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:78
//		TC	ATTACHED	# VB66 ATTACHED	  MOVE THIS TO OTHER STATE
// slot 37916
                            if slot <> 37916 or instruction <> 1634 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1634, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37917 {
// EXTENDED_VERBS.agc:79
//		TC	V67		# VB67 W MATRIX MONITOR
// slot 37917
                            if slot <> 37917 or instruction <> 1675 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1675, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37918 {
// EXTENDED_VERBS.agc:80
//		TC	ALM/END		# VB68 SPARE
// slot 37918
                                if slot <> 37918 or instruction <> 1104 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1104, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// EXTENDED_VERBS.agc:81
//VERB69		TC	VERB69		# VB69 FORCE A HARDWARE RESTART
// slot 37919
                                if slot <> 37919 or instruction <> 1055 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1055, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 37924 {
                    if slot <= 37921 {
                        if slot <= 37920 {
// EXTENDED_VERBS.agc:82
//		TC	V70UPDAT	# VB70 UPDATE LIFTOFF TIME.
// slot 37920
                            if slot <> 37920 or instruction <> 2004 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2004, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:83
//		TC	V71UPDAT	# VB71 UNIVERSAL UPDATE -- BLOCK ADDRESS.
// slot 37921
                            if slot <> 37921 or instruction <> 2006 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2006, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37922 {
// EXTENDED_VERBS.agc:84
//		TC	V72UPDAT	# VB72 UNIVERSAL UPDATE -- SINGLE ADDRESS.
// slot 37922
                            if slot <> 37922 or instruction <> 2008 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2008, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37923 {
// EXTENDED_VERBS.agc:85
//		TC	V73UPDAT	# VB73 UPDATE AGC TIME (OCTAL).
// slot 37923
                                if slot <> 37923 or instruction <> 2010 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 2010, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// EXTENDED_VERBS.agc:86
//		TC	DNEDUMP		# VB74 INITIALIZE DOWN-TELEMETRY PROGRAM
// slot 37924
                                if slot <> 37924 or instruction <> 1573 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1573, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 37926 {
                        if slot <= 37925 {
// EXTENDED_VERBS.agc:87
//					#	FOR ERASABLE DUMP.
// EXTENDED_VERBS.agc:88
//		TC	OUTSNUFF	# VB75 ENABLE U,V JETS DURING DPS BURNS.
// slot 37925
                            if slot <> 37925 or instruction <> 1684 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1684, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:89
//# Page 263
// EXTENDED_VERBS.agc:90
//		TC	MINIMP		# VB76 MINIMUM IMPULSE MODE
// slot 37926
                            if slot <> 37926 or instruction <> 1537 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1537, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37927 {
// EXTENDED_VERBS.agc:91
//		TC	NOMINIMP	# VB77 RATE COMMAND MODE
// slot 37927
                            if slot <> 37927 or instruction <> 1542 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1542, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37928 {
// EXTENDED_VERBS.agc:92
//		TC	R77		# VB78 START LR SPURIOUS RETURN TEST
// slot 37928
                                if slot <> 37928 or instruction <> 1284 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1284, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// EXTENDED_VERBS.agc:93
//		TC	R77END		# VB79 TERMINATE LR SPURIOUS RETURN TEST
// slot 37929
                                if slot <> 37929 or instruction <> 1423 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1423, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 37949 {
            if slot <= 37939 {
                if slot <= 37934 {
                    if slot <= 37931 {
                        if slot <= 37930 {
// EXTENDED_VERBS.agc:94
//		TC	LEMVEC		# VB80 UPDATE LEM STATE VECTOR
// slot 37930
                            if slot <> 37930 or instruction <> 1577 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1577, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:95
//		TC	CSMVEC		# VB81 UPDATE CSM STATE VECTOR
// slot 37931
                            if slot <> 37931 or instruction <> 1580 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1580, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37932 {
// EXTENDED_VERBS.agc:96
//		TC	V82PERF		# VB82 REQUEST ORBIT PARAM DISPLAY (R30)
// slot 37932
                            if slot <> 37932 or instruction <> 1510 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1510, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37933 {
// EXTENDED_VERBS.agc:97
//		TC	V83PERF		# VB83 REQUEST REND PARAM DISPLAY (R31)
// slot 37933
                                if slot <> 37933 or instruction <> 1518 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1518, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// EXTENDED_VERBS.agc:98
//		TC	ALM/END		# VB84 SPARE
// slot 37934
                                if slot <> 37934 or instruction <> 1104 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1104, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 37936 {
                        if slot <= 37935 {
// EXTENDED_VERBS.agc:99
//		TC	VERB85		# VB85 DISPLAY RR LOS AZ AND ELEV
// slot 37935
                            if slot <> 37935 or instruction <> 1687 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1687, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:100
//		TC	ALM/END		# VB86 SPARE
// slot 37936
                            if slot <> 37936 or instruction <> 1104 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1104, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37937 {
// EXTENDED_VERBS.agc:101
//		TC	ALM/END		# VB87 SPARE
// slot 37937
                            if slot <> 37937 or instruction <> 1104 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1104, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37938 {
// EXTENDED_VERBS.agc:102
//		TC	ALM/END		# VB88 SPARE
// slot 37938
                                if slot <> 37938 or instruction <> 1104 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1104, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// EXTENDED_VERBS.agc:103
//		TC	V89PERF		# VB89 ALIGN XORZ LEM AXIS ALONG LOS (R63)
// slot 37939
                                if slot <> 37939 or instruction <> 1524 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1524, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 37944 {
                    if slot <= 37941 {
                        if slot <= 37940 {
// EXTENDED_VERBS.agc:104
//		TC	V90PERF		# VB90 OUT OF PLANE RENDEZVOUS DISPLAY
// slot 37940
                            if slot <> 37940 or instruction <> 1531 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1531, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:105
//		TC	GOSHOSUM	# VB91 DISPLAY BANK SUM.
// slot 37941
                            if slot <> 37941 or instruction <> 1600 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1600, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37942 {
// EXTENDED_VERBS.agc:106
//		TC	SYSTEST		# VB92 OPERAT IMU PERFORMANCE TEST.
// slot 37942
                            if slot <> 37942 or instruction <> 1588 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1588, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37943 {
// EXTENDED_VERBS.agc:107
//		TC	WMATRXNG	# VB93 CLEAR RENDWFLG
// slot 37943
                                if slot <> 37943 or instruction <> 1595 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1595, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// EXTENDED_VERBS.agc:108
//		TC	ALM/END		# VB94 SPARE
// slot 37944
                                if slot <> 37944 or instruction <> 1104 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1104, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 37946 {
                        if slot <= 37945 {
// EXTENDED_VERBS.agc:109
//		TC	UPDATOFF	# VB95 NO STATE VECTOR UPDATE ALLOWED
// slot 37945
                            if slot <> 37945 or instruction <> 1585 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1585, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:110
//		TC	VERB96		# VB96 INTERRUPT INTEGRATION AND GO TO P00
// slot 37946
                            if slot <> 37946 or instruction <> 1670 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1670, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37947 {
// EXTENDED_VERBS.agc:111
//		TC	GOLOADLV	# VB97 PLEASE VERIFY ENGINE FAILURE
// slot 37947
                            if slot <> 37947 or instruction <> 1265 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1265, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37948 {
// EXTENDED_VERBS.agc:112
//		TC	ALM/END		# VB98 SPARE
// slot 37948
                                if slot <> 37948 or instruction <> 1104 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1104, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// EXTENDED_VERBS.agc:113
//		TC	GOLOADLV	# VB99 PLEASE ENABLE ENGINE
// slot 37949
                                if slot <> 37949 or instruction <> 1265 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1265, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 37959 {
                if slot <= 37954 {
                    if slot <= 37951 {
                        if slot <= 37950 {
// EXTENDED_VERBS.agc:114
//
// EXTENDED_VERBS.agc:115
//# END OF EXTENDED VERB FAN
// EXTENDED_VERBS.agc:116
//
// EXTENDED_VERBS.agc:117
//TESTXACT	CCS	EXTVBACT	# ARE EXTENDED VERBS BUSY
// slot 37950
                            if slot <> 37950 or instruction <> 4644 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 548).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:118
//		TC	ALM/END		# YES, TURN ON OPERATOR LIGHT
// slot 37951
                            if slot <> 37951 or instruction <> 1104 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1104, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37952 {
// EXTENDED_VERBS.agc:119
//		CA	FLAGWRD4	# ARE PRIORITY DISPLAYS USING DSKY
// slot 37952
                            if slot <> 37952 or instruction <> 12352 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 64).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37953 {
// EXTENDED_VERBS.agc:120
//		MASK	OC24100
// slot 37953
                                if slot <> 37953 or instruction <> 29783 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    set words[0] to agcOverflowCorrected(words[0]).
                                    local fixedOperand is mod(readEffective:call(words, 1111), 32768).
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// EXTENDED_VERBS.agc:121
//		CCS	A
// slot 37954
                                if slot <> 37954 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                    if slot <= 37956 {
                        if slot <= 37955 {
// EXTENDED_VERBS.agc:122
//		TC	ALM/END		# YES
// slot 37955
                            if slot <> 37955 or instruction <> 1104 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1104, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:123
//		CAF	OCT24		# SET BITS 3 AND 5
// slot 37956
                            if slot <> 37956 or instruction <> 15367 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 3079), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37957 {
// EXTENDED_VERBS.agc:124
//SETXTACT	TS	EXTVBACT	# NO.  SET FLAG TO SHOW EXT VERB DISPLAY
// slot 37957
                            if slot <> 37957 or instruction <> 23076 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23076, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37958 {
// EXTENDED_VERBS.agc:125
//					# SYSTEM BUSY
// EXTENDED_VERBS.agc:126
//
// EXTENDED_VERBS.agc:127
//		CA	Q
// slot 37958
                                if slot <> 37958 or instruction <> 12290 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 2).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// EXTENDED_VERBS.agc:128
//		TS	MPAC +1
// slot 37959
                                if slot <> 37959 or instruction <> 22637 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22637, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 37964 {
                    if slot <= 37961 {
                        if slot <= 37960 {
// EXTENDED_VERBS.agc:129
//
// EXTENDED_VERBS.agc:130
//		CS	TWO		# BLANK EVERYTHING EXCEPT MM AND VERB
// slot 37960
                            if slot <> 37960 or instruction <> 18922 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:131
//		TC	NVSUB
// slot 37961
                            if slot <> 37961 or instruction <> 2156 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2156, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37962 {
// EXTENDED_VERBS.agc:132
//		TC	+1
// slot 37962
                            if slot <> 37962 or instruction <> 1099 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1099, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37963 {
// EXTENDED_VERBS.agc:133
//		TC	MPAC +1
// slot 37963
                                if slot <> 37963 or instruction <> 109 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 109, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// EXTENDED_VERBS.agc:134
//
// EXTENDED_VERBS.agc:135
//XACTALM		TC	FALTON		# TURN ON OPERATOR ERROR LIGHT.
// slot 37964
                                if slot <> 37964 or instruction <> 2292 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 2292, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 37966 {
                        if slot <= 37965 {
// EXTENDED_VERBS.agc:136
//		TC	ENDEXT		# RELEASE MARK AND EXT. VERB DISPLAY SYS.
// slot 37965
                            if slot <> 37965 or instruction <> 2874 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2874, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:137
//
// EXTENDED_VERBS.agc:138
//TERMEXTV 	EQUALS 	ENDEXT
// EXTENDED_VERBS.agc:139
//# Page 264
// EXTENDED_VERBS.agc:140
//ENDEXTVB	EQUALS	ENDEXT
// EXTENDED_VERBS.agc:141
//
// EXTENDED_VERBS.agc:142
//XACT0		CAF	ZERO		# RELEASE MARK AND EXT. VERB DISPLAY SYS.
// slot 37966
                            if slot <> 37966 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
                        if slot <= 37967 {
// EXTENDED_VERBS.agc:143
//		TC	SETXTACT
// slot 37967
                            if slot <> 37967 or instruction <> 1093 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1093, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37968 {
// EXTENDED_VERBS.agc:144
//
// EXTENDED_VERBS.agc:145
//ALM/END		TC	FALTON		# TURN ON OPERATOR ERROR LIGHT
// slot 37968
                                if slot <> 37968 or instruction <> 2292 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 2292, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// EXTENDED_VERBS.agc:146
//GOPIN		TC	POSTJUMP
// slot 37969
                                if slot <> 37969 or instruction <> 2461 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 2461, words[0], readEffective).
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
set agcAotRoutes[2536] to agcAotUnit2536@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:147
//		CADR	PINBRNCH
// slot 37970
    37970, 17488
)).

// bank 43, slots 37971-37974
function agcAotUnit2537 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 37972 {
        if slot <= 37971 {
// EXTENDED_VERBS.agc:148
//
// EXTENDED_VERBS.agc:149
//CHKPOOH		CA	MODREG		# CHECK FOR P00 OR P00-.
// slot 37971
            if slot <> 37971 or instruction <> 12809 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 521).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:150
//		EXTEND
// slot 37972
            if slot <> 37972 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 37973 {
// EXTENDED_VERBS.agc:151
//		BZF	TCQ
// slot 37973
            if slot <> 37973 or instruction <> 7650 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7650, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:152
//		TC	ALM/END
// slot 37974
            if slot <> 37974 or instruction <> 1104 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1104, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2537] to agcAotUnit2537@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:153
//
// EXTENDED_VERBS.agc:154
//OC24100		OCT	24100
// slot 37975
    37975, 20608
)).

// bank 43, slots 37976-37980
function agcAotUnit2538 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 37977 {
        if slot <= 37976 {
// EXTENDED_VERBS.agc:155
//
// EXTENDED_VERBS.agc:156
//# Page 265
// EXTENDED_VERBS.agc:157
//# VBZERO	VERB 40		DESCRIPTION
// EXTENDED_VERBS.agc:158
//#
// EXTENDED_VERBS.agc:159
//#	1. 	REQUIRE NOUN 20 (ICDU ANGLES) OR NOUN 72 (RCDU ANGLES).
// EXTENDED_VERBS.agc:160
//#	2.	FOR N20, CHECK IMUCADR IN AN EFFORT TO AVOID A 1210 RESTART.
// EXTENDED_VERBS.agc:161
//#		FOR N72, CHECK IF EITHER RADAR IS IN USE.
// EXTENDED_VERBS.agc:162
//#	3.	EXECUTE THE CDU ZERO.
// EXTENDED_VERBS.agc:163
//#	4.	STALL UNTILL THE ZERO IS DONE.
// EXTENDED_VERBS.agc:164
//#	5.	DON'T DIFFERENTIATE BETWEEN A BAD OR GOOD RETURN.
// EXTENDED_VERBS.agc:165
//#	6.	EXIT, RE-ESTABLISHING THE INTERRUPTED DISPLAY (IF ANY).
// EXTENDED_VERBS.agc:166
//
// EXTENDED_VERBS.agc:167
//VBZERO		TC	OP/INERT
// slot 37976
            if slot <> 37976 or instruction <> 1148 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1148, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:168
//		TC	IMUZEROK	# RETURN HERE IF NOUN = ICDU(20)
// slot 37977
            if slot <> 37977 or instruction <> 1115 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1115, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 37978 {
// EXTENDED_VERBS.agc:169
//		TC	RRZEROK		# RETURN HERE IF NOUN = RCDU(72)
// slot 37978
            if slot <> 37978 or instruction <> 1122 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1122, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 37979 {
// EXTENDED_VERBS.agc:170
//IMUZEROK	TC	CKMODCAD
// slot 37979
                if slot <> 37979 or instruction <> 1277 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1277, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:171
//		TC	BANKCALL	# KEYBOARD REQ FOR ISS CDUZERO
// slot 37980
                if slot <> 37980 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2538] to agcAotUnit2538@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:172
//		CADR	IMUZERO
// slot 37981
    37981, 15256
)).

// bank 43, slots 37982-37982
function agcAotUnit2539 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:173
//
// EXTENDED_VERBS.agc:174
//		TC	BANKCALL	# STALL
// slot 37982
    if slot <> 37982 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2539] to agcAotUnit2539@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:175
//		CADR	IMUSTALL
// slot 37983
    37983, 16284
)).

// bank 43, slots 37984-37987
function agcAotUnit2540 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 37985 {
        if slot <= 37984 {
// EXTENDED_VERBS.agc:176
//		TC	+1
// slot 37984
            if slot <> 37984 or instruction <> 1121 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1121, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:177
//
// EXTENDED_VERBS.agc:178
//		TC	GOPIN		# IMUZERO
// slot 37985
            if slot <> 37985 or instruction <> 1105 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1105, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 37986 {
// EXTENDED_VERBS.agc:179
//
// EXTENDED_VERBS.agc:180
//RRZEROK		TC	RDRUSECK
// slot 37986
            if slot <> 37986 or instruction <> 1442 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1442, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:181
//		TC	BANKCALL
// slot 37987
            if slot <> 37987 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2540] to agcAotUnit2540@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:182
//		CADR	RRZERO
// slot 37988
    37988, 43462
)).

// bank 43, slots 37989-37989
function agcAotUnit2541 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:183
//
// EXTENDED_VERBS.agc:184
//RWAITK		TC	BANKCALL
// slot 37989
    if slot <> 37989 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2541] to agcAotUnit2541@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:185
//		CADR	RADSTALL
// slot 37990
    37990, 16280
)).

// bank 43, slots 37991-37994
function agcAotUnit2542 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 37992 {
        if slot <= 37991 {
// EXTENDED_VERBS.agc:186
//		TCF	+1
// slot 37991
            if slot <> 37991 or instruction <> 5224 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5224, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:187
//		TC	GOPIN		# RRZERO
// slot 37992
            if slot <> 37992 or instruction <> 1105 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1105, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 37993 {
// EXTENDED_VERBS.agc:188
//
// EXTENDED_VERBS.agc:189
//# LRPOS2K	VERB 60			DESCRIPTION
// EXTENDED_VERBS.agc:190
//#	COMMAND LANDING RADAR TO POSITION 2
// EXTENDED_VERBS.agc:191
//#
// EXTENDED_VERBS.agc:192
//#	1.	EXIT WITH OP ERROR IF SOMEONE IS USING EITHER RADAR.
// EXTENDED_VERBS.agc:193
//#	2.	ALARM WITH CODE 523 IF POS 2 IS NOT INDICATED WITHIN
// EXTENDED_VERBS.agc:194
//#		THE PRESCRIBED TIME.
// EXTENDED_VERBS.agc:195
//#	3.	RE-ESTABLISH THE DISPLAYS.
// EXTENDED_VERBS.agc:196
//
// EXTENDED_VERBS.agc:197
//LRPOS2K		TC	RDRUSECK
// slot 37993
            if slot <> 37993 or instruction <> 1442 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1442, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:198
//		TC	BANKCALL	# COMMAND LR TO POSITION 2
// slot 37994
            if slot <> 37994 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2542] to agcAotUnit2542@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:199
//		CADR	LRPOS2
// slot 37995
    37995, 44658
)).

// bank 43, slots 37996-37996
function agcAotUnit2543 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:200
//		TC	BANKCALL
// slot 37996
    if slot <> 37996 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2543] to agcAotUnit2543@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:201
//		CADR	RADSTALL
// slot 37997
    37997, 16280
)).

// bank 43, slots 37998-38000
function agcAotUnit2544 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 37998 {
// EXTENDED_VERBS.agc:202
//		TC	LRP2ALM
// slot 37998
        if slot <> 37998 or instruction <> 1136 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1136, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 37999 {
// EXTENDED_VERBS.agc:203
//		TC	GOPIN
// slot 37999
            if slot <> 37999 or instruction <> 1105 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1105, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:204
//
// EXTENDED_VERBS.agc:205
//LRP2ALM		TC	ALARM
// slot 38000
            if slot <> 38000 or instruction <> 2935 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2935, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2544] to agcAotUnit2544@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:206
//		OCT	523
// slot 38001
    38001, 678
)).

// bank 43, slots 38002-38003
function agcAotUnit2545 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38002 {
// EXTENDED_VERBS.agc:207
//		TC	GOPIN
// slot 38002
        if slot <> 38002 or instruction <> 1105 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1105, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// EXTENDED_VERBS.agc:208
//# Page 266
// EXTENDED_VERBS.agc:209
//
// EXTENDED_VERBS.agc:210
//# V61	VERB 61, DISPLAY DAP ATTITUDE ERRORS ON FDAI ATTITUDE ERROR NEEDLES.
// EXTENDED_VERBS.agc:211
//
// EXTENDED_VERBS.agc:212
//DAPATTER	TC	DOWNFLAG
// slot 38003
        if slot <> 38003 or instruction <> 2894 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2894, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2545] to agcAotUnit2545@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:213
//		ADRES	NEEDLFLG
// slot 38004
    38004, 22
)).

// bank 43, slots 38005-38006
function agcAotUnit2546 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38005 {
// EXTENDED_VERBS.agc:214
//		TC	GOPIN
// slot 38005
        if slot <> 38005 or instruction <> 1105 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1105, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// EXTENDED_VERBS.agc:215
//
// EXTENDED_VERBS.agc:216
//# V62	VERB 62, DISPLAY TOTAL ATTITUDE ERRORS ON FDAI ATTITUDE ERROR NEEDLES.
// EXTENDED_VERBS.agc:217
//
// EXTENDED_VERBS.agc:218
//TOTATTER	TC	UPFLAG
// slot 38006
        if slot <> 38006 or instruction <> 2884 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2884, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2546] to agcAotUnit2546@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:219
//		ADRES	NEEDLFLG
// slot 38007
    38007, 22
)).

// bank 43, slots 38008-38019
function agcAotUnit2547 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38013 {
        if slot <= 38010 {
            if slot <= 38008 {
// EXTENDED_VERBS.agc:220
//		TC	GOPIN
// slot 38008
                if slot <> 38008 or instruction <> 1105 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1105, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38009 {
// EXTENDED_VERBS.agc:221
//
// EXTENDED_VERBS.agc:222
//# Page 267
// EXTENDED_VERBS.agc:223
//# VBCOARK	VERB 41		DESCRIPTION
// EXTENDED_VERBS.agc:224
//#	COARSE ALIGN IMU OR RADAR
// EXTENDED_VERBS.agc:225
//#
// EXTENDED_VERBS.agc:226
//#	1.	REQUIRE NOUN 20 OR NOUN 72 OR TURN ON OPERATOR ERROR.
// EXTENDED_VERBS.agc:227
//#	2.	REQUIRE EXT VERB DISPLAY SYS AVAILABLE OR TURN ON OPERATOR ERROR LIGHT AND GO TO PINBRNCH.
// EXTENDED_VERBS.agc:228
//#				CASE 1, NOUN 20 (ICDU ANGLES)
// EXTENDED_VERBS.agc:229
//#	3.	SET EXT VERB DISPLAY ACTIVE FLAG.
// EXTENDED_VERBS.agc:230
//#	4.	DISPLAY FLASHING V25,N22 (LOAD NEW ICDU ANGLES).
// EXTENDED_VERBS.agc:231
//#		RESPONSES
// EXTENDED_VERBS.agc:232
//#		A.	TERMINATE
// EXTENDED_VERBS.agc:233
//#			1.	RELEASE EXT VERB DISPLAY SYSTEM
// EXTENDED_VERBS.agc:234
//#		B.	PROCEED
// EXTENDED_VERBS.agc:235
//#			1.	COARSE ALIGN TO THE EXISTING THETAD'S (ICORK2).
// EXTENDED_VERBS.agc:236
//#		C.	ENTER
// EXTENDED_VERBS.agc:237
//#			1.	COARSE ALIGN TO THE LOADED THETAD'S (ICORK2).
// EXTENDED_VERBS.agc:238
//# ICORK2
// EXTENDED_VERBS.agc:239
//#	1.	RE-DISPLAY VERB 41.
// EXTENDED_VERBS.agc:240
//#	2.	EXECUTE IMUCCARS (IMU COARSE ALIGN).
// EXTENDED_VERBS.agc:241
//#	3.	EXECUTE IMUSTALL (ALLOW TIME FOR DATA TRANSFER).
// EXTENDED_VERBS.agc:242
//#	4.	RELEASE EXT VERB DISPLAY SYSTEM.
// EXTENDED_VERBS.agc:243
//#				CASE 2 NOUN 72 (RCDU ANGLES)
// EXTENDED_VERBS.agc:244
//#		EXIT WITH OP ERROR IF SOMEONE IS USING EITHER RADAD.
// EXTENDED_VERBS.agc:245
//#	5.	DISPLAY FLASHING V24,N73 (LOAD NEW RR TRUNION ANGLE AND NEW SHAFT ANGLE).
// EXTENDED_VERBS.agc:246
//#		RESPONSES
// EXTENDED_VERBS.agc:247
//#		A.	TERMINATE
// EXTENDED_VERBS.agc:248
//#			1.	RELEASE EXT VERB DISPLAY SYS.
// EXTENDED_VERBS.agc:249
//#		B.	PROCEED OR ENTER
// EXTENDED_VERBS.agc:250
//#			1.	EXECUTE AURLOKON (ASK OPERATOR FOR LOCK-ON REQUIREMENTS).
// EXTENDED_VERBS.agc:251
//#			2.	RE-DISPLAY VERB 41.
// EXTENDED_VERBS.agc:252
//#			3.	SCHEDULE RRDESK2 WITH PRIORITY 20.
// EXTENDED_VERBS.agc:253
//#			4.	RELEASE EXT VERB DISPLAY SYS.
// EXTENDED_VERBS.agc:254
//# AURLOKON
// EXTENDED_VERBS.agc:255
//#	1.	FLASH V04 N12 R1 = 00006 R2 = 00002
// EXTENDED_VERBS.agc:256
//#		RESPONSES
// EXTENDED_VERBS.agc:257
//#		A.	TERMINATE
// EXTENDED_VERBS.agc:258
//#		B.	PROCEED
// EXTENDED_VERBS.agc:259
//#			1.	RESET LOCK-ON SWITCH
// EXTENDED_VERBS.agc:260
//#			2.	SET CONTINUOUS DESIGNATE FLAG
// EXTENDED_VERBS.agc:261
//#			3.	DISABLE R25
// EXTENDED_VERBS.agc:262
//#		C.	V22 E 1 E, R1 = 00001, PROCEED
// EXTENDED_VERBS.agc:263
//#			1.	SET LOCK-ON SWITCH
// EXTENDED_VERBS.agc:264
//
// EXTENDED_VERBS.agc:265
//VBCOARK		TC	OP/INERT
// slot 38009
                    if slot <> 38009 or instruction <> 1148 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1148, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:266
//		TC	IMUCOARK		# RETURN HERE IF NOUN = ICDU (20)
// slot 38010
                    if slot <> 38010 or instruction <> 1157 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1157, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 38011 {
// EXTENDED_VERBS.agc:267
//		TC	RRDESNBK		# RETURN HERE IF NOUN = RCDU (72)
// slot 38011
                if slot <> 38011 or instruction <> 1175 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1175, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38012 {
// EXTENDED_VERBS.agc:268
//
// EXTENDED_VERBS.agc:269
//# RETURNS TO L+1 IF IMU OR L+2 IF RR.
// EXTENDED_VERBS.agc:270
//
// EXTENDED_VERBS.agc:271
//OP/INERT	CS	OCT24
// slot 38012
                    if slot <> 38012 or instruction <> 19463 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 3079), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:272
//		AD	NOUNREG
// slot 38013
                    if slot <> 38013 or instruction <> 25090 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 514).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 38016 {
            if slot <= 38014 {
// EXTENDED_VERBS.agc:273
//		EXTEND
// slot 38014
                if slot <> 38014 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38015 {
// EXTENDED_VERBS.agc:274
//# Page 268
// EXTENDED_VERBS.agc:275
//		BZF	TCQ			# IF = 20.
// slot 38015
                    if slot <> 38015 or instruction <> 7650 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 7650, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:276
//
// EXTENDED_VERBS.agc:277
//		AD	RRIMUDIF		# -52
// slot 38016
                    if slot <> 38016 or instruction <> 25732 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 1156), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 38017 {
// EXTENDED_VERBS.agc:278
//		EXTEND
// slot 38017
                if slot <> 38017 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38018 {
// EXTENDED_VERBS.agc:279
//		BZF	Q+1
// slot 38018
                    if slot <> 38018 or instruction <> 7647 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 7647, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:280
//
// EXTENDED_VERBS.agc:281
//		TC	ALM/END			# ILLEGAL.
// slot 38019
                    if slot <> 38019 or instruction <> 1104 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1104, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2547] to agcAotUnit2547@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:282
//
// EXTENDED_VERBS.agc:283
//RRIMUDIF	DEC	-52			# THE IMU
// slot 38020
    38020, 65430
)).

// bank 43, slots 38021-38024
function agcAotUnit2548 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38022 {
        if slot <= 38021 {
// EXTENDED_VERBS.agc:284
//IMUCOARK	TC	CKMODCAD
// slot 38021
            if slot <> 38021 or instruction <> 1277 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1277, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:285
//		TC	TESTXACT		# COARSE ALIGN FROM KEYBOARD.
// slot 38022
            if slot <> 38022 or instruction <> 1086 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1086, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38023 {
// EXTENDED_VERBS.agc:286
//		CAF	VNLODCDU		# CALL FOR THETAD LOAD
// slot 38023
            if slot <> 38023 or instruction <> 13461 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1173), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:287
//		TC	BANKCALL
// slot 38024
            if slot <> 38024 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2548] to agcAotUnit2548@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:288
//		CADR	GOXDSPF
// slot 38025
    38025, 16824
)).

// bank 43, slots 38026-38029
function agcAotUnit2549 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38027 {
        if slot <= 38026 {
// EXTENDED_VERBS.agc:289
//		TC	TERMEXTV
// slot 38026
            if slot <> 38026 or instruction <> 2874 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2874, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:290
//		TCF	+1
// slot 38027
            if slot <> 38027 or instruction <> 5260 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5260, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38028 {
// EXTENDED_VERBS.agc:291
//
// EXTENDED_VERBS.agc:292
//ICORK2		CAF	IMUCOARV		# RE-DISPLAY COARSE ALIGN VERB.
// slot 38028
            if slot <> 38028 or instruction <> 13462 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1174), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:293
//		TC	BANKCALL
// slot 38029
            if slot <> 38029 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2549] to agcAotUnit2549@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:294
//		CADR	EXDSPRET
// slot 38030
    38030, 17184
)).

// bank 43, slots 38031-38031
function agcAotUnit2550 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:295
//
// EXTENDED_VERBS.agc:296
//		TC	BANKCALL		# CALL MODE SWITCHING PROG
// slot 38031
    if slot <> 38031 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2550] to agcAotUnit2550@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:297
//		CADR	IMUCOARS
// slot 38032
    38032, 15360
)).

// bank 43, slots 38033-38033
function agcAotUnit2551 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:298
//
// EXTENDED_VERBS.agc:299
//		TC	BANKCALL		# STALL
// slot 38033
    if slot <> 38033 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2551] to agcAotUnit2551@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:300
//		CADR	IMUSTALL
// slot 38034
    38034, 16284
)).

// bank 43, slots 38035-38036
function agcAotUnit2552 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38035 {
// EXTENDED_VERBS.agc:301
//		TC	ENDEXTVB
// slot 38035
        if slot <> 38035 or instruction <> 2874 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2874, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// EXTENDED_VERBS.agc:302
//		TC	ENDEXTVB
// slot 38036
        if slot <> 38036 or instruction <> 2874 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2874, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2552] to agcAotUnit2552@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:303
//
// EXTENDED_VERBS.agc:304
//VNLODCDU	VN	2522
// slot 38037
    38037, 6444,
// EXTENDED_VERBS.agc:305
//IMUCOARV	VN	4100
// slot 38038
    38038, 10496
)).

// bank 43, slots 38039-38050
function agcAotUnit2553 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38044 {
        if slot <= 38041 {
            if slot <= 38039 {
// EXTENDED_VERBS.agc:306
//
// EXTENDED_VERBS.agc:307
//# Page 269
// EXTENDED_VERBS.agc:308
//# DESIGNATE TO DESIRED GIMBAL ANGLES.
// EXTENDED_VERBS.agc:309
//
// EXTENDED_VERBS.agc:310
//RRDESNBK	TC	RDRUSECK
// slot 38039
                if slot <> 38039 or instruction <> 1442 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1442, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38040 {
// EXTENDED_VERBS.agc:311
//		TC	TESTXACT
// slot 38040
                    if slot <> 38040 or instruction <> 1086 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1086, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:312
//		CA	RNDVZBIT		# IS P20 RUNNING?
// slot 38041
                    if slot <> 38041 or instruction <> 14821 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 38042 {
// EXTENDED_VERBS.agc:313
//		MASK	FLAGWRD0
// slot 38042
                if slot <> 38042 or instruction <> 28732 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 60).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38043 {
// EXTENDED_VERBS.agc:314
//		CCS	A
// slot 38043
                    if slot <> 38043 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:315
//		TCF	XACTALM			# OPERADOR ERROR IF IN P20
// slot 38044
                    if slot <> 38044 or instruction <> 5196 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5196, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 38047 {
            if slot <= 38045 {
// EXTENDED_VERBS.agc:316
//		CS	OCT41000		# TERMINATE PRESENT DESIGNATION
// slot 38045
                if slot <> 38045 or instruction <> 17617 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 1233), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38046 {
// EXTENDED_VERBS.agc:317
//		INHINT				# RELINT DONE IN GOXDSPF
// slot 38046
                    if slot <> 38046 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:318
//		MASK	RADMODES
// slot 38047
                    if slot <> 38047 or instruction <> 28744 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 72).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 38048 {
// EXTENDED_VERBS.agc:319
//		TS	RADMODES
// slot 38048
                if slot <> 38048 or instruction <> 22600 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22600, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38049 {
// EXTENDED_VERBS.agc:320
//
// EXTENDED_VERBS.agc:321
//		CAF	VNLDRCDU		# ASK FOR GIMBAL ANGLES.
// slot 38049
                    if slot <> 38049 or instruction <> 13488 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1200), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:322
//		TC	BANKCALL
// slot 38050
                    if slot <> 38050 or instruction <> 2446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2446, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2553] to agcAotUnit2553@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:323
//		CADR	GOXDSPF
// slot 38051
    38051, 16824
)).

// bank 43, slots 38052-38054
function agcAotUnit2554 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38052 {
// EXTENDED_VERBS.agc:324
//		TC	TERMEXTV
// slot 38052
        if slot <> 38052 or instruction <> 2874 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2874, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 38053 {
// EXTENDED_VERBS.agc:325
//		TCF	-4			# V33
// slot 38053
            if slot <> 38053 or instruction <> 5281 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5281, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:326
//
// EXTENDED_VERBS.agc:327
//		TC	BANKCALL		# ASK OP FOR LOCK ON REQUIREMENTS.
// slot 38054
            if slot <> 38054 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2554] to agcAotUnit2554@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:328
//		CADR	AURLOKON
// slot 38055
    38055, 38912
)).

// bank 43, slots 38056-38057
function agcAotUnit2555 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38056 {
// EXTENDED_VERBS.agc:329
//
// EXTENDED_VERBS.agc:330
//		CAF	OPTCOARV		# RE-DISPLAY OUR OWN VERB
// slot 38056
        if slot <> 38056 or instruction <> 13462 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1174), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// EXTENDED_VERBS.agc:331
//		TC	BANKCALL
// slot 38057
        if slot <> 38057 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2555] to agcAotUnit2555@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:332
//		CADR	EXDSPRET
// slot 38058
    38058, 17184
)).

// bank 43, slots 38059-38060
function agcAotUnit2556 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38059 {
// EXTENDED_VERBS.agc:333
//
// EXTENDED_VERBS.agc:334
//		CAF	PRIO20
// slot 38059
        if slot <> 38059 or instruction <> 14814 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2526), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// EXTENDED_VERBS.agc:335
//		TC	FINDVAC
// slot 38060
        if slot <> 38060 or instruction <> 2629 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2629, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2556] to agcAotUnit2556@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:336
//		EBANK=	LOSCOUNT
// EXTENDED_VERBS.agc:337
//		2CADR	RRDESK2
// slot 38061 38062
    38061, 2402, 38062, 55438
)).

// bank 43, slots 38063-38063
function agcAotUnit2557 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:338
//
// EXTENDED_VERBS.agc:339
//		TCF	TERMEXTV		# FREES DISPLAY
// slot 38063
    if slot <> 38063 or instruction <> 6970 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6970, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2557] to agcAotUnit2557@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:340
//
// EXTENDED_VERBS.agc:341
//VNLDRCDU	VN	2473
// slot 38064
    38064, 6290
)).

// bank 43, slots 38065-38065
function agcAotUnit2558 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:342
//OPTCOARV	EQUALS	IMUCOARV		# DIFFERENT NOUNS.
// EXTENDED_VERBS.agc:343
//
// EXTENDED_VERBS.agc:344
//RRDESK2		TC	BANKCALL
// slot 38065
    if slot <> 38065 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2558] to agcAotUnit2558@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:345
//		CADR	RRDESNB
// slot 38066
    38066, 43642
)).

// bank 43, slots 38067-38071
function agcAotUnit2559 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38068 {
        if slot <= 38067 {
// EXTENDED_VERBS.agc:346
//
// EXTENDED_VERBS.agc:347
//		TC	+1			# DUMMY NEEDED SINCE DESRETRN DOES INCR
// slot 38067
            if slot <> 38067 or instruction <> 1204 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1204, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:348
//		CA	PRIORITY
// slot 38068
            if slot <> 38068 or instruction <> 12407 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 119).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38069 {
// EXTENDED_VERBS.agc:349
//		MASK	LOW9
// slot 38069
            if slot <> 38069 or instruction <> 31236 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                set words[0] to agcOverflowCorrected(words[0]).
                local fixedOperand is mod(readEffective:call(words, 2564), 32768).
                if fixedOperand = 511 {
                    set words[0] to agcSignExtend(mod(floor(words[0] / 1), 512) * 1).
                } else {
                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38070 {
// EXTENDED_VERBS.agc:350
//		CCS	A
// slot 38070
                if slot <> 38070 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:351
//		INDEX	A
// slot 38071
                if slot <> 38071 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2559] to agcAotUnit2559@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:352
//		TS	A			# RELEASE THIS JOBS VAC AREA.
// slot 38072
    38072, 45056
)).

// bank 43, slots 38073-38075
function agcAotUnit2560 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38073 {
// EXTENDED_VERBS.agc:353
//		COM				# INSURE ENDOFJOB DOES A NOVAC END (BZMF).
// slot 38073
        if slot <> 38073 or instruction <> 16384 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            agcCoreCS(words, 0).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 38074 {
// EXTENDED_VERBS.agc:354
//		ADS	PRIORITY
// slot 38074
            if slot <> 38074 or instruction <> 11383 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreADS(words, 119).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:355
//		TC	BANKCALL		# WAIT FOR COMPLETION OF DESIGNATE
// slot 38075
            if slot <> 38075 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2560] to agcAotUnit2560@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:356
//		CADR	RADSTALL
// slot 38076
    38076, 16280
)).

// bank 43, slots 38077-38079
function agcAotUnit2561 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38077 {
// EXTENDED_VERBS.agc:357
//# Page 270
// EXTENDED_VERBS.agc:358
//		TC	+2			# BADEND-NO LOCKON OR OUT OF LIMITS
// slot 38077
        if slot <> 38077 or instruction <> 1215 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1215, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 38078 {
// EXTENDED_VERBS.agc:359
//		TC	ENDOFJOB		# GOODEND-LOCKON ACHIEVED
// slot 38078
            if slot <> 38078 or instruction <> 2669 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2669, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:360
//		TC	ALARM
// slot 38079
            if slot <> 38079 or instruction <> 2935 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2935, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2561] to agcAotUnit2561@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:361
//		OCT	503			# TURN ON ALARM LIGHT -503 DESIGNATE FAIL
// slot 38080
    38080, 646
)).

// bank 43, slots 38081-38092
function agcAotUnit2562 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38086 {
        if slot <= 38083 {
            if slot <= 38081 {
// EXTENDED_VERBS.agc:362
//
// EXTENDED_VERBS.agc:363
//		TC	ENDOFJOB
// slot 38081
                if slot <> 38081 or instruction <> 2669 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2669, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38082 {
// EXTENDED_VERBS.agc:364
//
// EXTENDED_VERBS.agc:365
//RRDESEND	CCS	RADMODES		# TERMINATE CONTINOUS DESIGNATE ONLY
// slot 38082
                    if slot <> 38082 or instruction <> 4168 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 72).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:366
//		TCF	GOPIN
// slot 38083
                    if slot <> 38083 or instruction <> 5201 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5201, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 38084 {
// EXTENDED_VERBS.agc:367
//		TCF	GOPIN
// slot 38084
                if slot <> 38084 or instruction <> 5201 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5201, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38085 {
// EXTENDED_VERBS.agc:368
//		TCF	+1
// slot 38085
                    if slot <> 38085 or instruction <> 5318 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5318, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:369
//		CS	OCT41000		# BEGDES GOES TO ENDRADAR
// slot 38086
                    if slot <> 38086 or instruction <> 17617 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 1233), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 38089 {
            if slot <= 38087 {
// EXTENDED_VERBS.agc:370
//		INHINT				# RELINT DONE IN DOWNFLAG
// slot 38087
                if slot <> 38087 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38088 {
// EXTENDED_VERBS.agc:371
//		MASK	RADMODES
// slot 38088
                    if slot <> 38088 or instruction <> 28744 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 72).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:372
//		TS	RADMODES
// slot 38089
                    if slot <> 38089 or instruction <> 22600 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22600, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 38090 {
// EXTENDED_VERBS.agc:373
//		TC	CLRADMOD
// slot 38090
                if slot <> 38090 or instruction <> 3081 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3081, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38091 {
// EXTENDED_VERBS.agc:374
//		CAF	1SEC
// slot 38091
                    if slot <> 38091 or instruction <> 14847 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:375
//		TC	BANKCALL
// slot 38092
                    if slot <> 38092 or instruction <> 2446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2446, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2562] to agcAotUnit2562@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:376
//		CADR	DELAYJOB
// slot 38093
    38093, 1978
)).

// bank 43, slots 38094-38094
function agcAotUnit2563 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:377
//		TC	DOWNFLAG		# ENABLE R25 GIMBAL MONITOR
// slot 38094
    if slot <> 38094 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2563] to agcAotUnit2563@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:378
//		ADRES	NORRMON
// slot 38095
    38095, 172
)).

// bank 43, slots 38096-38096
function agcAotUnit2564 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:379
//		TCF	GOPIN
// slot 38096
    if slot <> 38096 or instruction <> 5201 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5201, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2564] to agcAotUnit2564@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:380
//OCT41000	OCT	41000			# CONTINUOUS DESIGNATE - DESIGNATE
// slot 38097
    38097, 33792
)).

// bank 23, slots 21504-21511
function agcAotUnit1329 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21507 {
        if slot <= 21505 {
            if slot <= 21504 {
// EXTENDED_VERBS.agc:381
//
// EXTENDED_VERBS.agc:382
//# Page 271
// EXTENDED_VERBS.agc:383
//		BANK	23
// EXTENDED_VERBS.agc:384
//		SETLOC	EXTVB1
// EXTENDED_VERBS.agc:385
//		BANK
// EXTENDED_VERBS.agc:386
//		COUNT*	$$/EXTVB
// EXTENDED_VERBS.agc:387
//
// EXTENDED_VERBS.agc:388
//AURLOKON	TC	MAKECADR
// slot 21504
                if slot <> 21504 or instruction <> 2469 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2469, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:389
//		TS	DESRET
// slot 21505
                if slot <> 21505 or instruction <> 23115 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23115, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21506 {
// EXTENDED_VERBS.agc:390
//		CAF	TWO
// slot 21506
                if slot <> 21506 or instruction <> 14826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:391
//		TS	OPTIONX +1
// slot 21507
                if slot <> 21507 or instruction <> 23082 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23082, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 21509 {
            if slot <= 21508 {
// EXTENDED_VERBS.agc:392
//		CAF	SIX			# OPTION CODE FOR V04N12
// slot 21508
                if slot <> 21508 or instruction <> 15522 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 3234), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:393
//		TS	OPTIONX
// slot 21509
                if slot <> 21509 or instruction <> 23081 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23081, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21510 {
// EXTENDED_VERBS.agc:394
//
// EXTENDED_VERBS.agc:395
// -5		CAF	V04N1272
// slot 21510
                if slot <> 21510 or instruction <> 13343 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1055), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:396
//		TC	BANKCALL		# R2	00001	LOCK-ON
// slot 21511
                if slot <> 21511 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1329] to agcAotUnit1329@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:397
//		CADR	GOMARKFR
// slot 21512
    21512, 16854
)).

// bank 23, slots 21513-21523
function agcAotUnit1330 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21517 {
        if slot <= 21514 {
            if slot <= 21513 {
// EXTENDED_VERBS.agc:398
//		TCF	ENDEXT			# V34
// slot 21513
                if slot <> 21513 or instruction <> 6970 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6970, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:399
//		TCF	+5			# V33
// slot 21514
                if slot <> 21514 or instruction <> 5135 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5135, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 21515 {
// EXTENDED_VERBS.agc:400
//		TCF	-5			# V32
// slot 21515
                if slot <> 21515 or instruction <> 5126 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5126, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21516 {
// EXTENDED_VERBS.agc:401
//		CAF	BIT3
// slot 21516
                    if slot <> 21516 or instruction <> 14825 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:402
//		TC	BLANKET
// slot 21517
                    if slot <> 21517 or instruction <> 2868 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2868, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 21520 {
            if slot <= 21518 {
// EXTENDED_VERBS.agc:403
//		TC	ENDOFJOB
// slot 21518
                if slot <> 21518 or instruction <> 2669 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2669, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21519 {
// EXTENDED_VERBS.agc:404
//
// EXTENDED_VERBS.agc:405
// +5		CA	OPTIONX +1
// slot 21519
                    if slot <> 21519 or instruction <> 12842 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 554).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:406
//		MASK	BIT2
// slot 21520
                    if slot <> 21520 or instruction <> 31210 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        if fixedOperand = 2 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 2), 2) * 2).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 21521 {
// EXTENDED_VERBS.agc:407
//		CCS	A
// slot 21521
                if slot <> 21521 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 21522 {
// EXTENDED_VERBS.agc:408
//		TCF	NOLOKON
// slot 21522
                    if slot <> 21522 or instruction <> 5142 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5142, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:409
//		TC	UPFLAG
// slot 21523
                    if slot <> 21523 or instruction <> 2884 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2884, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1330] to agcAotUnit1330@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:410
//		ADRES	LOKONSW
// slot 21524
    21524, 20
)).

// bank 23, slots 21525-21526
function agcAotUnit1331 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21525 {
// EXTENDED_VERBS.agc:411
//		TCF	AURLKON1
// slot 21525
        if slot <> 21525 or instruction <> 5148 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5148, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// EXTENDED_VERBS.agc:412
//
// EXTENDED_VERBS.agc:413
//NOLOKON		TC	DOWNFLAG		# IF NO LOCK-ON, SET BIT15 OF RADMADES TO
// slot 21526
        if slot <> 21526 or instruction <> 2894 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2894, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1331] to agcAotUnit1331@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:414
//		ADRES	LOKONSW			# INDICATE THAT CONTINUOUS DESIGNATION IS
// slot 21527
    21527, 20
)).

// bank 23, slots 21528-21528
function agcAotUnit1332 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:415
//		TC	UPFLAG			# WANTED (TO BE TERMINATED BY V44.)
// slot 21528
    if slot <> 21528 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1332] to agcAotUnit1332@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:416
//		ADRES	CDESFLAG
// slot 21529
    21529, 360
)).

// bank 23, slots 21530-21530
function agcAotUnit1333 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:417
//		TC	UPFLAG			# SET NO RR ANGLE MONITOR FLAG.
// slot 21530
    if slot <> 21530 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1333] to agcAotUnit1333@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:418
//		ADRES	NORRMON			# DISABLE R25 RR GIMBAL MONITOR IN T4RUPT
// slot 21531
    21531, 172
)).

// bank 23, slots 21532-21534
function agcAotUnit1334 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 21532 {
// EXTENDED_VERBS.agc:419
//AURLKON1	RELINT
// slot 21532
        if slot <> 21532 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 21533 {
// EXTENDED_VERBS.agc:420
//		CA	DESRET
// slot 21533
            if slot <> 21533 or instruction <> 12875 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 587).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:421
//		TCF	BANKJUMP
// slot 21534
            if slot <> 21534 or instruction <> 6560 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6560, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1334] to agcAotUnit1334@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:422
//
// EXTENDED_VERBS.agc:423
//V04N1272	VN	412
// slot 21535
    21535, 1048,
// EXTENDED_VERBS.agc:424
//-LOKONFG	OCT	-20
// slot 21536
    21536, 65502
)).

// bank 43, slots 38098-38098
function agcAotUnit2565 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:425
//
// EXTENDED_VERBS.agc:426
//		BANK	43
// EXTENDED_VERBS.agc:427
//		SETLOC	EXTVERBS
// EXTENDED_VERBS.agc:428
//		BANK
// EXTENDED_VERBS.agc:429
//		COUNT*	$$/EXTVB
// EXTENDED_VERBS.agc:430
//
// EXTENDED_VERBS.agc:431
//LRON		TC	UPFLAG		# PERMIT INCORPORATION OF LR DATA      V57
// slot 38098
    if slot <> 38098 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2565] to agcAotUnit2565@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:432
//
// EXTENDED_VERBS.agc:433
//# Page 272
// EXTENDED_VERBS.agc:434
//		ADRES	LRINH
// slot 38099
    38099, 344
)).

// bank 43, slots 38100-38101
function agcAotUnit2566 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38100 {
// EXTENDED_VERBS.agc:435
//		TCF	GOPIN
// slot 38100
        if slot <> 38100 or instruction <> 5201 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5201, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// EXTENDED_VERBS.agc:436
//
// EXTENDED_VERBS.agc:437
//LROFF		TC	DOWNFLAG		# INHIBIT INCORPORATION OF LR DATA	V58
// slot 38101
        if slot <> 38101 or instruction <> 2894 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2894, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2566] to agcAotUnit2566@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:438
//		ADRES	LRINH
// slot 38102
    38102, 344
)).

// bank 43, slots 38103-38107
function agcAotUnit2567 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38104 {
        if slot <= 38103 {
// EXTENDED_VERBS.agc:439
//		TCF	GOPIN
// slot 38103
            if slot <> 38103 or instruction <> 5201 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5201, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:440
//
// EXTENDED_VERBS.agc:441
//		EBANK=	OGC
// EXTENDED_VERBS.agc:442
//
// EXTENDED_VERBS.agc:443
//# Page 273
// EXTENDED_VERBS.agc:444
//
// EXTENDED_VERBS.agc:445
//# IMUFINEK	VERB 42		DESCRIPTION
// EXTENDED_VERBS.agc:446
//#	FINE ALIGN IMU
// EXTENDED_VERBS.agc:447
//#
// EXTENDED_VERBS.agc:448
//#	1.	REQUIRE EXT VERB DISPLAY AVAILABLE AND SET BUSY FLAG OR TURN ON OPER ERROR AND GO TO PINBRNCH.
// EXTENDED_VERBS.agc:449
//#	2.	DISPLAY FLASHING V25,N93....LOAD DELTA GYRO ANGLES....
// EXTENDED_VERBS.agc:450
//#		RESPONSES
// EXTENDED_VERBS.agc:451
//#		A.	TERMINATE
// EXTENDED_VERBS.agc:452
//#			1.	RELEASE EXT VERB DISPLAY SYSTEM.
// EXTENDED_VERBS.agc:453
//#		B.	PROCEED OR ENTER
// EXTENDED_VERBS.agc:454
//#			1.	RE-DISPLAY VERB 42
// EXTENDED_VERBS.agc:455
//#			2.	EXECUTE IMUFINE (IMU FIVE ALIGN MODE SWITCHING).
// EXTENDED_VERBS.agc:456
//#			3.	EXECUTE IMUSTALL (ALLOW FOR DATA TRANSFER)
// EXTENDED_VERBS.agc:457
//#				A.	FAILED
// EXTENDED_VERBS.agc:458
//#					1. 	RELEASE EXT VERB DISPLAY SYSTEM.
// EXTENDED_VERBS.agc:459
//#				B.	GOOD
// EXTENDED_VERBS.agc:460
//#					1.	EXECUTE IMUPULSE (TORQUE IRIGS).
// EXTENDED_VERBS.agc:461
//#					2.	EXECUTE IMUSTALL AND RELEASE EXT VERB DISPLAY SYSTEM.
// EXTENDED_VERBS.agc:462
//
// EXTENDED_VERBS.agc:463
//IMUFINEK	TC	CKMODCAD
// slot 38104
            if slot <> 38104 or instruction <> 1277 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1277, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38105 {
// EXTENDED_VERBS.agc:464
//		TC	TESTXACT		# FINE ALIGN WITH GYRO TORQUING.
// slot 38105
            if slot <> 38105 or instruction <> 1086 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1086, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38106 {
// EXTENDED_VERBS.agc:465
//		CAF	VNLODGYR		# CALL FOR LOAD OF GYRO COMMANDS
// slot 38106
                if slot <> 38106 or instruction <> 13551 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1263), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:466
//		TC	BANKCALL
// slot 38107
                if slot <> 38107 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2567] to agcAotUnit2567@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:467
//		CADR	GOXDSPF
// slot 38108
    38108, 16824
)).

// bank 43, slots 38109-38112
function agcAotUnit2568 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38110 {
        if slot <= 38109 {
// EXTENDED_VERBS.agc:468
//		TC	TERMEXTV
// slot 38109
            if slot <> 38109 or instruction <> 2874 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2874, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:469
//		TC	+1			# PROCEED WITHOUT A LOAD
// slot 38110
            if slot <> 38110 or instruction <> 1247 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1247, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38111 {
// EXTENDED_VERBS.agc:470
//
// EXTENDED_VERBS.agc:471
//		CAF	IMUFINEV		# RE-DISPLAY OUR OWN VERB
// slot 38111
            if slot <> 38111 or instruction <> 13552 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1264), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:472
//		TC	BANKCALL
// slot 38112
            if slot <> 38112 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2568] to agcAotUnit2568@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:473
//		CADR	EXDSPRET
// slot 38113
    38113, 17184
)).

// bank 43, slots 38114-38114
function agcAotUnit2569 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:474
//
// EXTENDED_VERBS.agc:475
//		TC	BANKCALL		# CALL MODE SWITCH PROG
// slot 38114
    if slot <> 38114 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2569] to agcAotUnit2569@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:476
//		CADR	IMUFINE
// slot 38115
    38115, 15632
)).

// bank 43, slots 38116-38116
function agcAotUnit2570 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:477
//
// EXTENDED_VERBS.agc:478
//		TC	BANKCALL		# HIBERNATION
// slot 38116
    if slot <> 38116 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2570] to agcAotUnit2570@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:479
//		CADR	IMUSTALL
// slot 38117
    38117, 16284
)).

// bank 43, slots 38118-38120
function agcAotUnit2571 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38118 {
// EXTENDED_VERBS.agc:480
//		TC	ENDEXTVB
// slot 38118
        if slot <> 38118 or instruction <> 2874 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2874, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 38119 {
// EXTENDED_VERBS.agc:481
//
// EXTENDED_VERBS.agc:482
//FINEK2		CAF	LGYROBIN		# PINBALL LEFT COMMANDS IN OGC REGISTERS
// slot 38119
            if slot <> 38119 or instruction <> 13550 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1262), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:483
//		TC	BANKCALL
// slot 38120
            if slot <> 38120 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2571] to agcAotUnit2571@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:484
//		CADR	IMUPULSE
// slot 38121
    38121, 15782
)).

// bank 43, slots 38122-38122
function agcAotUnit2572 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:485
//
// EXTENDED_VERBS.agc:486
//		TC	BANKCALL		# WAIT FOR PULSES TO GET OUT.
// slot 38122
    if slot <> 38122 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2572] to agcAotUnit2572@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:487
//		CADR	IMUSTALL
// slot 38123
    38123, 16284
)).

// bank 43, slots 38124-38125
function agcAotUnit2573 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38124 {
// EXTENDED_VERBS.agc:488
//		TC	ENDEXTVB
// slot 38124
        if slot <> 38124 or instruction <> 2874 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2874, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// EXTENDED_VERBS.agc:489
//		TC	ENDEXTVB
// slot 38125
        if slot <> 38125 or instruction <> 2874 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2874, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2573] to agcAotUnit2573@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:490
//
// EXTENDED_VERBS.agc:491
//LGYROBIN	ECADR	OGC
// slot 38126
    38126, 3006,
// EXTENDED_VERBS.agc:492
//VNLODGYR	VN	2593
// slot 38127
    38127, 6586,
// EXTENDED_VERBS.agc:493
//IMUFINEV	VN	4200
// slot 38128
    38128, 10752
)).

// bank 43, slots 38129-38133
function agcAotUnit2574 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38130 {
        if slot <= 38129 {
// EXTENDED_VERBS.agc:494
//
// EXTENDED_VERBS.agc:495
//# GOLOADLV	VERB 50		DESCRIPTION
// EXTENDED_VERBS.agc:496
//#	AND OTHER PLEASE
// EXTENDED_VERBS.agc:497
//# Page 274
// EXTENDED_VERBS.agc:498
//#	DO SOMETHING VERBS
// EXTENDED_VERBS.agc:499
//#
// EXTENDED_VERBS.agc:500
//# PLEASE PERFORM, MARK, CALIBRATE, ETC.
// EXTENDED_VERBS.agc:501
//#
// EXTENDED_VERBS.agc:502
//#	1.	PRESSING ENTER ON DSKY INDICATES REQUESTED ACTION HAS BEEN PERFORMED, AND THE PROGRAM DOES THE
// EXTENDED_VERBS.agc:503
//#		SAME RECALL AS A COMPLETED LOAD.
// EXTENDED_VERBS.agc:504
//#	2.	THE EXECUTION OF A VERB 33 (PROCEED WITHOUT DATA) INDICATES THE REQUESTED ACTION IS NOT DESIRED.
// EXTENDED_VERBS.agc:505
//
// EXTENDED_VERBS.agc:506
//		SBANK=	PINSUPER	# FOR LOADLV1 AND SHOWSUM CADR'S
// EXTENDED_VERBS.agc:507
//
// EXTENDED_VERBS.agc:508
//GOLOADLV	TC	FLASHOFF
// slot 38129
            if slot <> 38129 or instruction <> 2331 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2331, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:509
//
// EXTENDED_VERBS.agc:510
//		CAF	PINSUPBT
// slot 38130
            if slot <> 38130 or instruction <> 14465 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2177), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38131 {
// EXTENDED_VERBS.agc:511
//		EXTEND
// slot 38131
            if slot <> 38131 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38132 {
// EXTENDED_VERBS.agc:512
//		WRITE	SUPERBNK
// slot 38132
                if slot <> 38132 or instruction <> 519 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 1, 7, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:513
//		TC	POSTJUMP
// slot 38133
                if slot <> 38133 or instruction <> 2461 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2461, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2574] to agcAotUnit2574@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:514
//		CADR	LOADLV1
// slot 38134
    38134, 51202
)).

// bank 43, slots 38135-38137
function agcAotUnit2575 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38135 {
// EXTENDED_VERBS.agc:515
//
// EXTENDED_VERBS.agc:516
//# VERB 47 -- AGS INITIALIZATION -- R47.
// EXTENDED_VERBS.agc:517
//#
// EXTENDED_VERBS.agc:518
//# SEE LOG SECTION AGS INITIALIZATION FOR OTHER PERTINENT REMARKS.
// EXTENDED_VERBS.agc:519
//
// EXTENDED_VERBS.agc:520
//V47TXACT	TC	TESTXACT	# NO OTHER EXTVERB.
// slot 38135
        if slot <> 38135 or instruction <> 1086 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1086, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 38136 {
// EXTENDED_VERBS.agc:521
//		CAF	PRIO4
// slot 38136
            if slot <> 38136 or instruction <> 14816 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:522
//		TC	FINDVAC
// slot 38137
            if slot <> 38137 or instruction <> 2629 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2629, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2575] to agcAotUnit2575@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:523
//## [WORKAROUND] RSB 2009
// EXTENDED_VERBS.agc:524
//		SBANK=	LOWSUPER
// EXTENDED_VERBS.agc:525
//## [WORKAROUND]
// EXTENDED_VERBS.agc:526
//		EBANK=	AGSBUFF
// EXTENDED_VERBS.agc:527
//		2CADR	AGSINIT
// slot 38138 38139
    38138, 2058, 38139, 53352
)).

// bank 43, slots 38140-38146
function agcAotUnit2576 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38142 {
        if slot <= 38140 {
// EXTENDED_VERBS.agc:528
//
// EXTENDED_VERBS.agc:529
//		TC	ENDOFJOB
// slot 38140
            if slot <> 38140 or instruction <> 2669 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2669, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38141 {
// EXTENDED_VERBS.agc:530
//
// EXTENDED_VERBS.agc:531
//CKMODCAD	CA 	MODECADR
// slot 38141
                if slot <> 38141 or instruction <> 12996 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 708).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:532
//		EXTEND
// slot 38142
                if slot <> 38142 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38144 {
            if slot <= 38143 {
// EXTENDED_VERBS.agc:533
//		BZF	TCQ
// slot 38143
                if slot <> 38143 or instruction <> 7650 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7650, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:534
//		TC	ALM/END		# SOMEBODY IS USING MODECADR SO EXIT
// slot 38144
                if slot <> 38144 or instruction <> 1104 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1104, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38145 {
// EXTENDED_VERBS.agc:535
//
// EXTENDED_VERBS.agc:536
//# Page 275
// EXTENDED_VERBS.agc:537
//# ALINTIME	VERB 55		DESCRIPTION
// EXTENDED_VERBS.agc:538
//#	REQUIRE P00 OR P00-.
// EXTENDED_VERBS.agc:539
//#
// EXTENDED_VERBS.agc:540
//#	1.	SET EXT VERB DISPLAY BUSY FLAG.
// EXTENDED_VERBS.agc:541
//#	2.	DISPLAY FLASHING V25,N24 (LOAD DELTA TIME FOR AGC CLOCK.
// EXTENDED_VERBS.agc:542
//#	3.	REQUIRE EXECUTION OF VERB 23.
// EXTENDED_VERBS.agc:543
//#	4.	ADD DELTA TIME, RECEIVED FROM INPUT REGISTER, TO THE COMPUTER TIME.
// EXTENDED_VERBS.agc:544
//#	5.	RELEASE EXT VERB DISPLAY SYSTEM
// EXTENDED_VERBS.agc:545
//
// EXTENDED_VERBS.agc:546
//ALINTIME	TC	TESTXACT
// slot 38145
                if slot <> 38145 or instruction <> 1086 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1086, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:547
//		TC	POSTJUMP	# NO ROOM IN 43
// slot 38146
                if slot <> 38146 or instruction <> 2461 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2461, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2576] to agcAotUnit2576@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:548
//		CADR	R33
// slot 38147
    38147, 53252
)).

// bank 42, slots 36866-36869
function agcAotUnit2486 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36867 {
        if slot <= 36866 {
// EXTENDED_VERBS.agc:549
//
// EXTENDED_VERBS.agc:550
//		BANK	42
// EXTENDED_VERBS.agc:551
//		SETLOC	SBAND
// EXTENDED_VERBS.agc:552
//		BANK
// EXTENDED_VERBS.agc:553
//		COUNT*	$$/R33
// EXTENDED_VERBS.agc:554
//
// EXTENDED_VERBS.agc:555
//R33		CAF	PRIO7
// slot 36866
            if slot <> 36866 or instruction <> 14865 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:556
//		TC	PRIOCHNG
// slot 36867
            if slot <> 36867 or instruction <> 2662 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2662, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 36868 {
// EXTENDED_VERBS.agc:557
//		CAF	VNLODDT
// slot 36868
            if slot <> 36868 or instruction <> 13340 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1052), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:558
//		TC	BANKCALL
// slot 36869
            if slot <> 36869 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2486] to agcAotUnit2486@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:559
//		CADR	GOXDSPF
// slot 36870
    36870, 16824
)).

// bank 42, slots 36871-36890
function agcAotUnit2487 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36880 {
        if slot <= 36875 {
            if slot <= 36872 {
                if slot <= 36871 {
// EXTENDED_VERBS.agc:560
//		TC	ENDEXT		# TERMINATE
// slot 36871
                    if slot <> 36871 or instruction <> 2874 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2874, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:561
//		TC	ENDEXT		# PROCEED
// slot 36872
                    if slot <> 36872 or instruction <> 2874 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2874, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 36873 {
// EXTENDED_VERBS.agc:562
//		CS	DEC23		# DATA IN OR RESEQUENCE (UNLIKELY)
// slot 36873
                    if slot <> 36873 or instruction <> 17435 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 1051), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 36874 {
// EXTENDED_VERBS.agc:563
//		AD	MPAC		# RECALL LEFT VERB IN MPAC
// slot 36874
                        if slot <> 36874 or instruction <> 24684 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 108).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:564
//		EXTEND
// slot 36875
                        if slot <> 36875 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 36877 {
                if slot <= 36876 {
// EXTENDED_VERBS.agc:565
//		BZF	UPDATIME	# GO AHEAD WITH UPDATE ONLY IF RECALL
// slot 36876
                    if slot <> 36876 or instruction <> 5134 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5134, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:566
//		TC	ENDEXT		#	WITH V23 (DATA IN).
// slot 36877
                    if slot <> 36877 or instruction <> 2874 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2874, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 36878 {
// EXTENDED_VERBS.agc:567
//
// EXTENDED_VERBS.agc:568
//UPDATIME	INHINT			# DELTA TIME IS IN DSPTEM1, +1.
// slot 36878
                    if slot <> 36878 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 36879 {
// EXTENDED_VERBS.agc:569
//		CAF	ZERO
// slot 36879
                        if slot <> 36879 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:570
//		TS	MPAC +2		# NEEDED FOR TP AGREE
// slot 36880
                        if slot <> 36880 or instruction <> 22638 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22638, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 36885 {
            if slot <= 36882 {
                if slot <= 36881 {
// EXTENDED_VERBS.agc:571
//		TS	L		# ZERO T1 + 2 WHILE ALIGNING.
// slot 36881
                    if slot <> 36881 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:572
//		DXCH	TIME2
// slot 36882
                    if slot <> 36882 or instruction <> 21525 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 21, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 36883 {
// EXTENDED_VERBS.agc:573
//		DXCH	MPAC
// slot 36883
                    if slot <> 36883 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 36884 {
// EXTENDED_VERBS.agc:574
//		DXCH	DSPTEM2 +1	# INCREMENT
// slot 36884
                        if slot <> 36884 or instruction <> 22058 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 554, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:575
//		DAS	MPAC
// slot 36885
                        if slot <> 36885 or instruction <> 8301 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 109) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 36887 {
                if slot <= 36886 {
// EXTENDED_VERBS.agc:576
//
// EXTENDED_VERBS.agc:577
//		TC	TPAGREE		# FORCE SIGN AGREEMENT.
// slot 36886
                    if slot <> 36886 or instruction <> 3759 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3759, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:578
//		DXCH	MPAC		# NEW CLOCK.
// slot 36887
                    if slot <> 36887 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 36888 {
// EXTENDED_VERBS.agc:579
//		DAS	TIME2
// slot 36888
                    if slot <> 36888 or instruction <> 8213 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 21) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 36889 {
// EXTENDED_VERBS.agc:580
//		RELINT
// slot 36889
                        if slot <> 36889 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:581
//UPDTMEND	TC	ENDEXT
// slot 36890
                        if slot <> 36890 or instruction <> 2874 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2874, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[2487] to agcAotUnit2487@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:582
//
// EXTENDED_VERBS.agc:583
//DEC23		DEC	23		# V 23
// slot 36891
    36891, 46,
// EXTENDED_VERBS.agc:584
//
// EXTENDED_VERBS.agc:585
//VNLODDT		VN	2524		# V25N24 FOR LOAD DELTA TIME
// slot 36892
    36892, 6448
)).

// bank 43, slots 38148-38153
function agcAotUnit2577 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38150 {
        if slot <= 38148 {
// EXTENDED_VERBS.agc:586
//
// EXTENDED_VERBS.agc:587
//# Page 276
// EXTENDED_VERBS.agc:588
//# SET UP FOR RADAR SAMPLING.
// EXTENDED_VERBS.agc:589
//
// EXTENDED_VERBS.agc:590
//		BANK	42
// EXTENDED_VERBS.agc:591
//		SETLOC	EXTVERBS
// EXTENDED_VERBS.agc:592
//		BANK
// EXTENDED_VERBS.agc:593
//
// EXTENDED_VERBS.agc:594
//		EBANK=	RSTACK
// EXTENDED_VERBS.agc:595
//
// EXTENDED_VERBS.agc:596
//		COUNT*	$$/R0477
// EXTENDED_VERBS.agc:597
//
// EXTENDED_VERBS.agc:598
//R77		TC	RDRUSECK	# TRY TO AVOID THE 1210.
// slot 38148
            if slot <> 38148 or instruction <> 1442 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1442, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38149 {
// EXTENDED_VERBS.agc:599
//		CA	FLAGWRD3	# IS R04 RUNNING?
// slot 38149
                if slot <> 38149 or instruction <> 12351 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 63).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:600
//		MASK	R04FLBIT
// slot 38150
                if slot <> 38150 or instruction <> 31203 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                    if fixedOperand = 256 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 256), 2) * 256).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38151 {
// EXTENDED_VERBS.agc:601
//		CCS	A
// slot 38151
            if slot <> 38151 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38152 {
// EXTENDED_VERBS.agc:602
//		TC	ALM/END		# YES.
// slot 38152
                if slot <> 38152 or instruction <> 1104 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1104, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:603
//		TC	UPFLAG
// slot 38153
                if slot <> 38153 or instruction <> 2884 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2884, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2577] to agcAotUnit2577@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:604
//		ADRES	R77FLAG
// slot 38154
    38154, 158
)).

// bank 43, slots 38155-38158
function agcAotUnit2578 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38156 {
        if slot <= 38155 {
// EXTENDED_VERBS.agc:605
//		TCF	R04Z
// slot 38155
            if slot <> 38155 or instruction <> 5392 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5392, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:606
//
// EXTENDED_VERBS.agc:607
//R04		TC	RDRUSECK	# TRY TO AVOID THE 1210.
// slot 38156
            if slot <> 38156 or instruction <> 1442 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1442, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38157 {
// EXTENDED_VERBS.agc:608
//		TC	TESTXACT
// slot 38157
            if slot <> 38157 or instruction <> 1086 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1086, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:609
//		TC	UPFLAG
// slot 38158
            if slot <> 38158 or instruction <> 2884 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2884, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2578] to agcAotUnit2578@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:610
//		ADRES	R04FLAG		# SET R04FLAG FOR ALARMS
// slot 38159
    38159, 102
)).

// bank 43, slots 38160-38185
function agcAotUnit2579 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38172 {
        if slot <= 38165 {
            if slot <= 38162 {
                if slot <= 38160 {
// EXTENDED_VERBS.agc:611
//
// EXTENDED_VERBS.agc:612
//R04Z		CAF	EBANK4
// slot 38160
                    if slot <> 38160 or instruction <> 14817 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38161 {
// EXTENDED_VERBS.agc:613
//		TS	EBANK
// slot 38161
                        if slot <> 38161 or instruction <> 22531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22531, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:614
//		CAF	1SEC+1		# SAMPLE ONCE PER SECOND
// slot 38162
                        if slot <> 38162 or instruction <> 13728 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1440), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38163 {
// EXTENDED_VERBS.agc:615
//		TS	RSAMPDT
// slot 38163
                    if slot <> 38163 or instruction <> 23533 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23533, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38164 {
// EXTENDED_VERBS.agc:616
//		CAF	ZERO
// slot 38164
                        if slot <> 38164 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:617
//		TS	RTSTLOC
// slot 38165
                        if slot <> 38165 or instruction <> 23532 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23532, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 38168 {
                if slot <= 38166 {
// EXTENDED_VERBS.agc:618
//		TS	RFAILCNT	# ZERO BAD SAMPLE COUNTER
// slot 38166
                    if slot <> 38166 or instruction <> 23534 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23534, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38167 {
// EXTENDED_VERBS.agc:619
//
// EXTENDED_VERBS.agc:620
//		INHINT
// slot 38167
                        if slot <> 38167 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:621
//		CS	LRPOSCAL	# INITIALIZE
// slot 38168
                        if slot <> 38168 or instruction <> 17825 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 1441), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38170 {
                    if slot <= 38169 {
// EXTENDED_VERBS.agc:622
//		MASK	RADMODES	#	BIT 9	LR RANGE LOW SCALE =0
// slot 38169
                        if slot <> 38169 or instruction <> 28744 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 72).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:623
//		TS	RADMODES	#	BIT 6	LR POS 1 =0
// slot 38170
                        if slot <> 38170 or instruction <> 22600 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22600, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38171 {
// EXTENDED_VERBS.agc:624
//		CAF	LRPOSCAL	#	BIT 3	RR RANGE LOW SCALE =0
// slot 38171
                        if slot <> 38171 or instruction <> 13729 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1441), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:625
//		EXTEND
// slot 38172
                        if slot <> 38172 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 38178 {
            if slot <= 38175 {
                if slot <= 38173 {
// EXTENDED_VERBS.agc:626
//		RAND	CHAN33
// slot 38173
                    if slot <> 38173 or instruction <> 1051 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 27, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38174 {
// EXTENDED_VERBS.agc:627
//		ADS	RADMODES
// slot 38174
                        if slot <> 38174 or instruction <> 11336 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 72).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:628
//		RELINT
// slot 38175
                        if slot <> 38175 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38176 {
// EXTENDED_VERBS.agc:629
//
// EXTENDED_VERBS.agc:630
//		CS	FLAGWRD3	# CHECK R04FLAG		R04 =1		R77 =0
// slot 38176
                    if slot <> 38176 or instruction <> 16447 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 63).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38177 {
// EXTENDED_VERBS.agc:631
//		MASK	R04FLBIT
// slot 38177
                        if slot <> 38177 or instruction <> 31203 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                            if fixedOperand = 256 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 256), 2) * 256).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:632
//		CCS	A
// slot 38178
                        if slot <> 38178 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
            if slot <= 38181 {
                if slot <= 38179 {
// EXTENDED_VERBS.agc:633
//		TCF	R04K
// slot 38179
                    if slot <> 38179 or instruction <> 5501 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5501, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38180 {
// EXTENDED_VERBS.agc:634
//
// EXTENDED_VERBS.agc:635
//		CAF	ONE		# INDICATES RENDEZVOUS DESIRED
// slot 38180
                        if slot <> 38180 or instruction <> 14827 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:636
//		TS	OPTIONX +1
// slot 38181
                        if slot <> 38181 or instruction <> 23082 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23082, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38183 {
                    if slot <= 38182 {
// EXTENDED_VERBS.agc:637
//R04A		CAF	BIT3		# OPTION CODE FOR V04N12
// slot 38182
                        if slot <> 38182 or instruction <> 14825 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:638
//
// EXTENDED_VERBS.agc:639
//# Page 277
// EXTENDED_VERBS.agc:640
//		TS	OPTIONX
// slot 38183
                        if slot <> 38183 or instruction <> 23081 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23081, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38184 {
// EXTENDED_VERBS.agc:641
//		CAF	V04N12X
// slot 38184
                        if slot <> 38184 or instruction <> 13725 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1437), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:642
//		TC	BANKCALL	#	R2	00001	RENDEZVOUS RADAR
// slot 38185
                        if slot <> 38185 or instruction <> 2446 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2446, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[2579] to agcAotUnit2579@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:643
//		CADR	GOMARKFR	#		00002	LANDING RADAR
// slot 38186
    38186, 16854
)).

// bank 43, slots 38187-38193
function agcAotUnit2580 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38189 {
        if slot <= 38187 {
// EXTENDED_VERBS.agc:644
//		TCF	R04END		# V34
// slot 38187
            if slot <> 38187 or instruction <> 5507 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5507, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38188 {
// EXTENDED_VERBS.agc:645
//		TCF	+5		# V33
// slot 38188
                if slot <> 38188 or instruction <> 5425 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5425, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:646
//		TCF	R04A 	+2	# R2
// slot 38189
                if slot <> 38189 or instruction <> 5416 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5416, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38191 {
            if slot <= 38190 {
// EXTENDED_VERBS.agc:647
//		CAF	BIT3
// slot 38190
                if slot <> 38190 or instruction <> 14825 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:648
//		TC	BLANKET
// slot 38191
                if slot <> 38191 or instruction <> 2868 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2868, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38192 {
// EXTENDED_VERBS.agc:649
//		TC	ENDOFJOB
// slot 38192
                if slot <> 38192 or instruction <> 2669 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2669, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:650
//
// EXTENDED_VERBS.agc:651
//		CA	OPTIONX	+1	# SAVE DESIRED OPTION	RR =1	LR =2
// slot 38193
                if slot <> 38193 or instruction <> 12842 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 554).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2580] to agcAotUnit2580@.

// bank 43, slots 38194-38208
function agcAotUnit2581 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38200 {
        if slot <= 38196 {
            if slot <= 38194 {
// EXTENDED_VERBS.agc:652
//		TS	RTSTDEX
// slot 38194
                if slot <> 38194 or instruction <> 23529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38195 {
// EXTENDED_VERBS.agc:653
//
// EXTENDED_VERBS.agc:654
//R04X		CAF	SIX		# RR OR LR DESIRED
// slot 38195
                    if slot <> 38195 or instruction <> 15522 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 3234), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:655
//		MASK	RTSTDEX
// slot 38196
                    if slot <> 38196 or instruction <> 29673 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 1001).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 38198 {
                if slot <= 38197 {
// EXTENDED_VERBS.agc:656
//		CCS	A
// slot 38197
                    if slot <> 38197 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:657
//		TCF	R04L		# LANDING RADAR
// slot 38198
                    if slot <> 38198 or instruction <> 5503 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5503, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38199 {
// EXTENDED_VERBS.agc:658
//		TS	RTSTBASE	# FOR RR	BASE =0, MAX =1
// slot 38199
                    if slot <> 38199 or instruction <> 23531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:659
//
// EXTENDED_VERBS.agc:660
//R04B		CAF	BIT2		# IS RR AUTO MODE DISCRETE PRESENT
// slot 38200
                    if slot <> 38200 or instruction <> 14826 { return choose false if checkOnly else -1. }
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
        }
    } else {
        if slot <= 38204 {
            if slot <= 38202 {
                if slot <= 38201 {
// EXTENDED_VERBS.agc:661
//		EXTEND
// slot 38201
                    if slot <> 38201 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:662
//		RAND	CHAN33
// slot 38202
                    if slot <> 38202 or instruction <> 1051 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 27, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38203 {
// EXTENDED_VERBS.agc:663
//		EXTEND
// slot 38203
                    if slot <> 38203 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:664
//		BZF	R04C		# YES
// slot 38204
                    if slot <> 38204 or instruction <> 5445 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5445, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 38206 {
                if slot <= 38205 {
// EXTENDED_VERBS.agc:665
//
// EXTENDED_VERBS.agc:666
//		CAF	201R04		# REQUEST SELECTION OF RR AUTO MODE
// slot 38205
                    if slot <> 38205 or instruction <> 13727 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1439), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:667
//		TS	DSPTEM1
// slot 38206
                    if slot <> 38206 or instruction <> 23077 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23077, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38207 {
// EXTENDED_VERBS.agc:668
//		CAF	V50N25X
// slot 38207
                    if slot <> 38207 or instruction <> 13726 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1438), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:669
//		TC	BANKCALL
// slot 38208
                    if slot <> 38208 or instruction <> 2446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2446, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2581] to agcAotUnit2581@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:670
//		CADR	GOMARK4
// slot 38209
    38209, 16842
)).

// bank 43, slots 38210-38218
function agcAotUnit2582 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38213 {
        if slot <= 38211 {
            if slot <= 38210 {
// EXTENDED_VERBS.agc:671
//		TCF	R04END		# V34
// slot 38210
                if slot <> 38210 or instruction <> 5507 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5507, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:672
//		TCF	R04B		# V33
// slot 38211
                if slot <> 38211 or instruction <> 5432 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5432, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38212 {
// EXTENDED_VERBS.agc:673
//		TCF	-7		# E
// slot 38212
                if slot <> 38212 or instruction <> 5437 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5437, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:674
//
// EXTENDED_VERBS.agc:675
//R04C		CAF	BIT14		# ENABLE RR AUTO TRACKER
// slot 38213
                if slot <> 38213 or instruction <> 14814 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38215 {
            if slot <= 38214 {
// EXTENDED_VERBS.agc:676
//		EXTEND
// slot 38214
                if slot <> 38214 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:677
//		WOR	CHAN12
// slot 38215
                if slot <> 38215 or instruction <> 2570 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38216 {
// EXTENDED_VERBS.agc:678
//
// EXTENDED_VERBS.agc:679
//		CAF	TWO
// slot 38216
                if slot <> 38216 or instruction <> 14826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38217 {
// EXTENDED_VERBS.agc:680
//		TS	RTSTMAX		# FOR SEQUENTIAL STORAGE
// slot 38217
                    if slot <> 38217 or instruction <> 23530 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23530, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:681
//
// EXTENDED_VERBS.agc:682
//		TC	WAITLIST
// slot 38218
                    if slot <> 38218 or instruction <> 2691 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2691, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2582] to agcAotUnit2582@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:683
//## [WORKAROUND] RSB 2009
// EXTENDED_VERBS.agc:684
//		SBANK=	PINSUPER
// EXTENDED_VERBS.agc:685
//## [WORKAROUND]
// EXTENDED_VERBS.agc:686
//		EBANK=	RSTACK
// EXTENDED_VERBS.agc:687
//		2CADR	RADSAMP
// slot 38219 38220
    38219, 2054, 38220, 43144
)).

// bank 43, slots 38221-38231
function agcAotUnit2583 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38225 {
        if slot <= 38222 {
            if slot <= 38221 {
// EXTENDED_VERBS.agc:688
//
// EXTENDED_VERBS.agc:689
//		RELINT
// slot 38221
                if slot <> 38221 or instruction <> 3 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:690
//
// EXTENDED_VERBS.agc:691
//		CS	FLAGWRD3	# CHECK R04FLAG		R04 =1		R77 =0
// slot 38222
                if slot <> 38222 or instruction <> 16447 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 63).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38223 {
// EXTENDED_VERBS.agc:692
//		MASK	R04FLBIT
// slot 38223
                if slot <> 38223 or instruction <> 31203 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2531), 32768).
                    if fixedOperand = 256 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 256), 2) * 256).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38224 {
// EXTENDED_VERBS.agc:693
//# Page 278
// EXTENDED_VERBS.agc:694
//		CCS	A
// slot 38224
                    if slot <> 38224 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:695
//		TCF	GOPIN		# R77
// slot 38225
                    if slot <> 38225 or instruction <> 5201 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5201, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 38228 {
            if slot <= 38226 {
// EXTENDED_VERBS.agc:696
//
// EXTENDED_VERBS.agc:697
//		CAF	SIX		# RR OR LR
// slot 38226
                if slot <> 38226 or instruction <> 15522 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 3234), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38227 {
// EXTENDED_VERBS.agc:698
//		MASK	RTSTDEX
// slot 38227
                    if slot <> 38227 or instruction <> 29673 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 1001).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:699
//		CCS	A
// slot 38228
                    if slot <> 38228 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
            if slot <= 38229 {
// EXTENDED_VERBS.agc:700
//		TCF	R04LR		# LR
// slot 38229
                if slot <> 38229 or instruction <> 5474 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5474, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38230 {
// EXTENDED_VERBS.agc:701
//
// EXTENDED_VERBS.agc:702
//R04RR		CAF	V16N72		# DISPLAY RR CDU ANGLES (1/SEC)
// slot 38230
                    if slot <> 38230 or instruction <> 13721 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1433), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:703
//		TC	BANKCALL	#	R1 + XXX.XX DEG		TRUNNION
// slot 38231
                    if slot <> 38231 or instruction <> 2446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2446, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2583] to agcAotUnit2583@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:704
//		CADR	GOMARKF		#	R2 + XXX.XX DEG		SHAFT
// slot 38232
    38232, 16824
)).

// bank 43, slots 38233-38237
function agcAotUnit2584 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38234 {
        if slot <= 38233 {
// EXTENDED_VERBS.agc:705
//		TCF	R04END		# V34	R3   BLANK
// slot 38233
            if slot <> 38233 or instruction <> 5507 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5507, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:706
//		TCF	+2		# V33
// slot 38234
            if slot <> 38234 or instruction <> 5468 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5468, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38235 {
// EXTENDED_VERBS.agc:707
//		TCF	R04RR		# V32
// slot 38235
            if slot <> 38235 or instruction <> 5462 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5462, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38236 {
// EXTENDED_VERBS.agc:708
//
// EXTENDED_VERBS.agc:709
//		CAF	V16N78		# DISPLAY RR RANGE AND RANGE RATE (1/SEC)
// slot 38236
                if slot <> 38236 or instruction <> 13722 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1434), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:710
//		TC	BANKCALL	#	R1 +- XXX.XX NM		RANGE
// slot 38237
                if slot <> 38237 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2584] to agcAotUnit2584@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:711
//		CADR	GOMARKF		#	R2 +- XXXXX. FPS	RANGE RATE
// slot 38238
    38238, 16824
)).

// bank 43, slots 38239-38243
function agcAotUnit2585 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38240 {
        if slot <= 38239 {
// EXTENDED_VERBS.agc:712
//		TCF	R04END		# V34	R3    BLANK
// slot 38239
            if slot <> 38239 or instruction <> 5507 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5507, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:713
//		TCF	R04Y		# V33
// slot 38240
            if slot <> 38240 or instruction <> 5486 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5486, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38241 {
// EXTENDED_VERBS.agc:714
//		TCF	R04RR		# V32
// slot 38241
            if slot <> 38241 or instruction <> 5462 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5462, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38242 {
// EXTENDED_VERBS.agc:715
//
// EXTENDED_VERBS.agc:716
//R04LR		CAF	V16N66		# DISPLAY LR RANGE AND POSITON (1/SEC)
// slot 38242
                if slot <> 38242 or instruction <> 13723 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1435), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:717
//		TC	BANKCALL	#	R1 +- XXXXX, FT		LR RANGE
// slot 38243
                if slot <> 38243 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2585] to agcAotUnit2585@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:718
//		CADR	GOMARKF		#	R2 +  0000X. 		POS. NO.
// slot 38244
    38244, 16824
)).

// bank 43, slots 38245-38249
function agcAotUnit2586 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38246 {
        if slot <= 38245 {
// EXTENDED_VERBS.agc:719
//		TCF	R04END		# V34	R3    BLANK
// slot 38245
            if slot <> 38245 or instruction <> 5507 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5507, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:720
//		TCF	+2		# V33
// slot 38246
            if slot <> 38246 or instruction <> 5480 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5480, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38247 {
// EXTENDED_VERBS.agc:721
//		TCF	R04LR		# V32
// slot 38247
            if slot <> 38247 or instruction <> 5474 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5474, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38248 {
// EXTENDED_VERBS.agc:722
//
// EXTENDED_VERBS.agc:723
//		CAF	V16N67		# DISPLAY LR VELX, VELY, VELZ (1/SEC)
// slot 38248
                if slot <> 38248 or instruction <> 13724 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1436), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:724
//		TC	BANKCALL	#	R1 +- XXXXX. FPS	LR V(X)
// slot 38249
                if slot <> 38249 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2586] to agcAotUnit2586@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:725
//		CADR	GOMARKF		#	R2 +- XXXXX. FPS	LR V(Y)
// slot 38250
    38250, 16824
)).

// bank 43, slots 38251-38257
function agcAotUnit2587 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38253 {
        if slot <= 38251 {
// EXTENDED_VERBS.agc:726
//		TCF	R04END		# V34	R3 +- XXXXX. FPS 	LR V(Z)
// slot 38251
            if slot <> 38251 or instruction <> 5507 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5507, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38252 {
// EXTENDED_VERBS.agc:727
//		TCF	R04Y		# V33
// slot 38252
                if slot <> 38252 or instruction <> 5486 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5486, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:728
//		TCF	R04LR		# V32
// slot 38253
                if slot <> 38253 or instruction <> 5474 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5474, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38255 {
            if slot <= 38254 {
// EXTENDED_VERBS.agc:729
//
// EXTENDED_VERBS.agc:730
//R04Y		CAF	ZERO		# TO TERMINATE SAMPLING.
// slot 38254
                if slot <> 38254 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:731
//		TS	RSAMPDT
// slot 38255
                if slot <> 38255 or instruction <> 23533 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23533, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38256 {
// EXTENDED_VERBS.agc:732
//		CAF	2SECS		# WAIT FOR LAST RADARUP
// slot 38256
                if slot <> 38256 or instruction <> 14848 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2560), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:733
//		TC	BANKCALL
// slot 38257
                if slot <> 38257 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2587] to agcAotUnit2587@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:734
//		CADR	DELAYJOB
// slot 38258
    38258, 1978
)).

// bank 43, slots 38259-38278
function agcAotUnit2588 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38268 {
        if slot <= 38263 {
            if slot <= 38260 {
                if slot <= 38259 {
// EXTENDED_VERBS.agc:735
//		CAF	1SEC+1		# SAMPLE ONCE PER SECOND
// slot 38259
                    if slot <> 38259 or instruction <> 13728 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1440), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:736
//		TS	RSAMPDT
// slot 38260
                    if slot <> 38260 or instruction <> 23533 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23533, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38261 {
// EXTENDED_VERBS.agc:737
//		CAF	ZERO		# FOR STORING RESULTS
// slot 38261
                    if slot <> 38261 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38262 {
// EXTENDED_VERBS.agc:738
//		TS	RTSTLOC
// slot 38262
                        if slot <> 38262 or instruction <> 23532 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23532, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:739
//		CAF	SIX
// slot 38263
                        if slot <> 38263 or instruction <> 15522 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 3234), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 38265 {
                if slot <= 38264 {
// EXTENDED_VERBS.agc:740
//		MASK	RTSTDEX
// slot 38264
                    if slot <> 38264 or instruction <> 29673 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 1001).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:741
//		CCS	A
// slot 38265
                    if slot <> 38265 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38266 {
// EXTENDED_VERBS.agc:742
//		CS	ONE		# WAS LR
// slot 38266
                    if slot <> 38266 or instruction <> 18923 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38267 {
// EXTENDED_VERBS.agc:743
//		AD	TWO		# WAS RR
// slot 38267
                        if slot <> 38267 or instruction <> 27114 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:744
//# Page 279
// EXTENDED_VERBS.agc:745
//
// EXTENDED_VERBS.agc:746
//		TCF	R04X -1
// slot 38268
                        if slot <> 38268 or instruction <> 5426 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5426, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 38273 {
            if slot <= 38270 {
                if slot <= 38269 {
// EXTENDED_VERBS.agc:747
//
// EXTENDED_VERBS.agc:748
//R04K		CAF	250MS+1		# SAMPLE 4 LR COMPONENTS PER SECOND.
// slot 38269
                    if slot <> 38269 or instruction <> 14838 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2550), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:749
//		TS	RSAMPDT
// slot 38270
                    if slot <> 38270 or instruction <> 23533 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23533, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38271 {
// EXTENDED_VERBS.agc:750
//
// EXTENDED_VERBS.agc:751
//R04L		CAF	TWO
// slot 38271
                    if slot <> 38271 or instruction <> 14826 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38272 {
// EXTENDED_VERBS.agc:752
//		TS	RTSTBASE	# FOR LR	BASE =2, MAX =3
// slot 38272
                        if slot <> 38272 or instruction <> 23531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23531, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:753
//		CAF	SIX
// slot 38273
                        if slot <> 38273 or instruction <> 15522 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 3234), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 38275 {
                if slot <= 38274 {
// EXTENDED_VERBS.agc:754
//		TCF	R04C +4
// slot 38274
                    if slot <> 38274 or instruction <> 5449 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5449, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:755
//R04END		CAF	ZERO		# ZERO RSAMPDT
// slot 38275
                    if slot <> 38275 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
                if slot <= 38276 {
// EXTENDED_VERBS.agc:756
//		TS	RSAMPDT		# TO TERMINATE SAMPLING
// slot 38276
                    if slot <> 38276 or instruction <> 23533 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23533, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38277 {
// EXTENDED_VERBS.agc:757
//		CAF	BIT8		# WAIT 1.28 SECONDS FOR POSSIBLE
// slot 38277
                        if slot <> 38277 or instruction <> 14820 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:758
//		TC	BANKCALL	# PENDING RUPT.
// slot 38278
                        if slot <> 38278 or instruction <> 2446 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2446, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[2588] to agcAotUnit2588@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:759
//		CADR	DELAYJOB
// slot 38279
    38279, 1978
)).

// bank 43, slots 38280-38284
function agcAotUnit2589 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38281 {
        if slot <= 38280 {
// EXTENDED_VERBS.agc:760
//
// EXTENDED_VERBS.agc:761
//		INHINT
// slot 38280
            if slot <> 38280 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:762
//		CS	BIT14		# DISABLE RR AUTO TRACKER.
// slot 38281
            if slot <> 38281 or instruction <> 18910 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38282 {
// EXTENDED_VERBS.agc:763
//		EXTEND
// slot 38282
            if slot <> 38282 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38283 {
// EXTENDED_VERBS.agc:764
//		WAND	CHAN12
// slot 38283
                if slot <> 38283 or instruction <> 1546 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:765
//
// EXTENDED_VERBS.agc:766
//		TC	DOWNFLAG
// slot 38284
                if slot <> 38284 or instruction <> 2894 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2894, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2589] to agcAotUnit2589@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:767
//		ADRES	R04FLAG		# SIGNAL END OF R04.
// slot 38285
    38285, 102
)).

// bank 43, slots 38286-38292
function agcAotUnit2590 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38288 {
        if slot <= 38286 {
// EXTENDED_VERBS.agc:768
//
// EXTENDED_VERBS.agc:769
//		TC	ENDEXT
// slot 38286
            if slot <> 38286 or instruction <> 2874 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2874, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38287 {
// EXTENDED_VERBS.agc:770
//
// EXTENDED_VERBS.agc:771
//R77END		CAF	EBANK4		# TO TERMINATE SAMPLING
// slot 38287
                if slot <> 38287 or instruction <> 14817 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:772
//		TS	EBANK
// slot 38288
                if slot <> 38288 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38290 {
            if slot <= 38289 {
// EXTENDED_VERBS.agc:773
//		CAF	ZERO
// slot 38289
                if slot <> 38289 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:774
//		TS	RSAMPDT
// slot 38290
                if slot <> 38290 or instruction <> 23533 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23533, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38291 {
// EXTENDED_VERBS.agc:775
//		CAF	BIT6		# WAIT 320 MS FOR POSSIBLE
// slot 38291
                if slot <> 38291 or instruction <> 14822 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:776
//		TC	BANKCALL	# PENDING RUPT.
// slot 38292
                if slot <> 38292 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2590] to agcAotUnit2590@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:777
//		CADR	DELAYJOB
// slot 38293
    38293, 1978
)).

// bank 43, slots 38294-38294
function agcAotUnit2591 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:778
//
// EXTENDED_VERBS.agc:779
//		TC	DOWNFLAG
// slot 38294
    if slot <> 38294 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2591] to agcAotUnit2591@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:780
//		ADRES	R77FLAG
// slot 38295
    38295, 158
)).

// bank 43, slots 38296-38296
function agcAotUnit2592 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:781
//		TCF	GOPIN
// slot 38296
    if slot <> 38296 or instruction <> 5201 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5201, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2592] to agcAotUnit2592@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:782
//
// EXTENDED_VERBS.agc:783
//V16N72		VN	1672
// slot 38297
    38297, 4240,
// EXTENDED_VERBS.agc:784
//V16N78		VN	1678
// slot 38298
    38298, 4252,
// EXTENDED_VERBS.agc:785
//V16N66		VN	1666
// slot 38299
    38299, 4228,
// EXTENDED_VERBS.agc:786
//V16N67		VN	1667
// slot 38300
    38300, 4230,
// EXTENDED_VERBS.agc:787
//V04N12X		VN	412
// slot 38301
    38301, 1048,
// EXTENDED_VERBS.agc:788
//V50N25X		VN	5025
// slot 38302
    38302, 12850,
// EXTENDED_VERBS.agc:789
//201R04		OCT	00201
// slot 38303
    38303, 258,
// EXTENDED_VERBS.agc:790
//1SEC+1		DEC	101
// slot 38304
    38304, 202,
// EXTENDED_VERBS.agc:791
//250MS+1		EQUALS	CALLCODE
// EXTENDED_VERBS.agc:792
//LRPOSCAL	OCT	444
// slot 38305
    38305, 584
)).

// bank 43, slots 38306-38334
function agcAotUnit2593 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38319 {
        if slot <= 38312 {
            if slot <= 38308 {
                if slot <= 38306 {
// EXTENDED_VERBS.agc:793
//
// EXTENDED_VERBS.agc:794
//# Page 280
// EXTENDED_VERBS.agc:795
//RDRUSECK	CS	FLAGWRD3	# IS R29 ON?
// slot 38306
                    if slot <> 38306 or instruction <> 16447 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 63).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38307 {
// EXTENDED_VERBS.agc:796
//		MASK	NR29FBIT
// slot 38307
                        if slot <> 38307 or instruction <> 31201 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                            if fixedOperand = 1024 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 1024), 2) * 1024).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:797
//		CCS	A
// slot 38308
                        if slot <> 38308 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
                if slot <= 38310 {
                    if slot <= 38309 {
// EXTENDED_VERBS.agc:798
//		TC	ALM/END		# YES
// slot 38309
                        if slot <> 38309 or instruction <> 1104 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1104, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:799
//		CA	FLAGWRD5	# IS R77 RUNNING?
// slot 38310
                        if slot <> 38310 or instruction <> 12353 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 65).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38311 {
// EXTENDED_VERBS.agc:800
//		MASK	R77FLBIT
// slot 38311
                        if slot <> 38311 or instruction <> 31201 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                            if fixedOperand = 1024 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 1024), 2) * 1024).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:801
//		CCS	A
// slot 38312
                        if slot <> 38312 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
            if slot <= 38315 {
                if slot <= 38313 {
// EXTENDED_VERBS.agc:802
//		TC	ALM/END		# YES.
// slot 38313
                    if slot <> 38313 or instruction <> 1104 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1104, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38314 {
// EXTENDED_VERBS.agc:803
//		CS	FLAGWRD7	# IS SERVICER RUNNING AND HENCE POSSIBLY
// slot 38314
                        if slot <> 38314 or instruction <> 16451 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 67).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:804
//		MASK	V37FLBIT	# R12 USING THE LR?
// slot 38315
                        if slot <> 38315 or instruction <> 31206 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2534), 32768).
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
            } else {
                if slot <= 38317 {
                    if slot <= 38316 {
// EXTENDED_VERBS.agc:805
//		CCS	A
// slot 38316
                        if slot <> 38316 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:806
//		TCF	CHECKRR		# NO
// slot 38317
                        if slot <> 38317 or instruction <> 5554 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5554, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38318 {
// EXTENDED_VERBS.agc:807
//		CS	FLGWRD11	# YES, IS R12 ON?
// slot 38318
                        if slot <> 38318 or instruction <> 16455 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 71).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:808
//		MASK	LRBYBIT
// slot 38319
                        if slot <> 38319 or instruction <> 31197 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                            if fixedOperand = 16384 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 16384), 2) * 16384).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 38326 {
            if slot <= 38322 {
                if slot <= 38320 {
// EXTENDED_VERBS.agc:809
//		CCS	A
// slot 38320
                    if slot <> 38320 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38321 {
// EXTENDED_VERBS.agc:810
//		TC	ALM/END		# YES
// slot 38321
                        if slot <> 38321 or instruction <> 1104 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1104, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:811
//CHECKRR		CS	FLAGWRD1	# IS THE TRACK FLAG SET AND HENCE POSSIBLY
// slot 38322
                        if slot <> 38322 or instruction <> 16445 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 61).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38324 {
                    if slot <= 38323 {
// EXTENDED_VERBS.agc:812
//		MASK	TRACKBIT	# P20 USING THE RR?
// slot 38323
                        if slot <> 38323 or instruction <> 31207 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                            if fixedOperand = 16 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 16), 2) * 16).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:813
//		CCS	A
// slot 38324
                        if slot <> 38324 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38325 {
// EXTENDED_VERBS.agc:814
//		TCF	CHECKP22	# NO, CHECK FOR P22.
// slot 38325
                        if slot <> 38325 or instruction <> 5562 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5562, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:815
//
// EXTENDED_VERBS.agc:816
//CKRNDBIT	CA	FLAGWRD0	# YES, BUT IS IT P25?
// slot 38326
                        if slot <> 38326 or instruction <> 12348 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 60).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 38330 {
                if slot <= 38328 {
                    if slot <= 38327 {
// EXTENDED_VERBS.agc:817
//		MASK	RNDVZBIT
// slot 38327
                        if slot <> 38327 or instruction <> 31205 { return choose false if checkOnly else -1. }
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
// EXTENDED_VERBS.agc:818
//		CCS	A
// slot 38328
                        if slot <> 38328 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38329 {
// EXTENDED_VERBS.agc:819
//		TC	ALM/END
// slot 38329
                        if slot <> 38329 or instruction <> 1104 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1104, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:820
//CHECKP22	CS	MODREG
// slot 38330
                        if slot <> 38330 or instruction <> 16905 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 521).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38332 {
                    if slot <= 38331 {
// EXTENDED_VERBS.agc:821
//		AD	DEC22
// slot 38331
                        if slot <> 38331 or instruction <> 26047 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1471), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:822
//		EXTEND
// slot 38332
                        if slot <> 38332 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 38333 {
// EXTENDED_VERBS.agc:823
//		BZF	ALM/END
// slot 38333
                        if slot <> 38333 or instruction <> 5200 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5200, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:824
//		TC	Q
// slot 38334
                        if slot <> 38334 or instruction <> 2 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2593] to agcAotUnit2593@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:825
//
// EXTENDED_VERBS.agc:826
//DEC22		DEC	22
// slot 38335
    38335, 44
)).

// bank 43, slots 38336-38339
function agcAotUnit2594 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38337 {
        if slot <= 38336 {
// EXTENDED_VERBS.agc:827
//
// EXTENDED_VERBS.agc:828
//		COUNT* 	$$/EXTVB
// EXTENDED_VERBS.agc:829
//
// EXTENDED_VERBS.agc:830
//VB64		TC	CHKPOOH		# DEMAND PROGRAM 00.
// slot 38336
            if slot <> 38336 or instruction <> 1107 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1107, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:831
//		TC	TESTXACT	# IF DISPLAY SYS. NOT BUSY MAKE IT BUSY.
// slot 38337
            if slot <> 38337 or instruction <> 1086 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1086, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38338 {
// EXTENDED_VERBS.agc:832
//		CAF	PRIO4
// slot 38338
            if slot <> 38338 or instruction <> 14816 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:833
//		TC	FINDVAC
// slot 38339
            if slot <> 38339 or instruction <> 2629 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2629, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2594] to agcAotUnit2594@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:834
//		EBANK=	ALPHASB
// EXTENDED_VERBS.agc:835
//		2CADR	SBANDANT	# CALC., DISPLAY S-BAND ANTENNA ANGLES.
// slot 38340 38341
    38340, 3852, 38341, 53384
)).

// bank 43, slots 38342-38345
function agcAotUnit2595 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38343 {
        if slot <= 38342 {
// EXTENDED_VERBS.agc:836
//
// EXTENDED_VERBS.agc:837
//		TC	ENDOFJOB
// slot 38342
            if slot <> 38342 or instruction <> 2669 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2669, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:838
//
// EXTENDED_VERBS.agc:839
//# Page 281
// EXTENDED_VERBS.agc:840
//# IMUATTCK	VERB 43		DESCRIPTION
// EXTENDED_VERBS.agc:841
//#	LOAD IMU ATTITUDE ERROR METERS
// EXTENDED_VERBS.agc:842
//#
// EXTENDED_VERBS.agc:843
//#	1.	REQUIRE P00 OR FRESH START.
// EXTENDED_VERBS.agc:844
//#	2.	REQUIRE COARSE ALIGN ENABLE AND ZERO ICDU BITS OFF.
// EXTENDED_VERBS.agc:845
//#	3.	REQUIRE THAT NEEDLES BE OFF.
// EXTENDED_VERBS.agc:846
//#	4.	REQUEST LOAD OF N22 (VALUES TO BE DISPLAYED).
// EXTENDED_VERBS.agc:847
//#	5.	ON PROCEED OR ENTER RE-DISPLAY V43 AND SEND PULSES.
// EXTENDED_VERBS.agc:848
//
// EXTENDED_VERBS.agc:849
//IMUATTCK	TC	CHKPOOH		# VB 76 -- LOAD IMU ATT. ERROR METERS
// slot 38343
            if slot <> 38343 or instruction <> 1107 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1107, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38344 {
// EXTENDED_VERBS.agc:850
//
// EXTENDED_VERBS.agc:851
//		CAF	BITS4&5		# SEE IF COARSE ALIGN ENABLE AND ZERO IMU
// slot 38344
            if slot <> 38344 or instruction <> 14835 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2547), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:852
//		EXTEND			# CDUS BITS ARE ON
// slot 38345
            if slot <> 38345 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2595] to agcAotUnit2595@.

// bank 43, slots 38346-38358
function agcAotUnit2596 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38351 {
        if slot <= 38348 {
            if slot <= 38346 {
// EXTENDED_VERBS.agc:853
//		RAND	CHAN12
// slot 38346
                if slot <> 38346 or instruction <> 1034 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 2, 10, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38347 {
// EXTENDED_VERBS.agc:854
//		CCS	A
// slot 38347
                    if slot <> 38347 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:855
//		TCF	ALM/END		# NOT ALLOWED IF IMU COARSE OR IMU ZERO ON
// slot 38348
                    if slot <> 38348 or instruction <> 5200 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5200, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 38349 {
// EXTENDED_VERBS.agc:856
//
// EXTENDED_VERBS.agc:857
//		CAF	BIT13-14	# BOTH BITS 13 AND 14 MUST BE 1
// slot 38349
                if slot <> 38349 or instruction <> 14573 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2285), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38350 {
// EXTENDED_VERBS.agc:858
//		EXTEND			# INDICATING THE MODE SELECTED IS OFF.
// slot 38350
                    if slot <> 38350 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:859
//		RXOR	CHAN31
// slot 38351
                    if slot <> 38351 or instruction <> 3097 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 6, 25, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 38354 {
            if slot <= 38352 {
// EXTENDED_VERBS.agc:860
//		MASK	BIT13-14
// slot 38352
                if slot <> 38352 or instruction <> 30957 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2285), 32768).
                    if fixedOperand = 12288 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 4096), 4) * 4096).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38353 {
// EXTENDED_VERBS.agc:861
//		EXTEND
// slot 38353
                    if slot <> 38353 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:862
//		BZF	+2		# NEEDLES IS OFF.
// slot 38354
                    if slot <> 38354 or instruction <> 5588 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5588, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 38356 {
                if slot <= 38355 {
// EXTENDED_VERBS.agc:863
//		TCF	ALM/END		# EXIT.  NEEDLES IS ON.
// slot 38355
                    if slot <> 38355 or instruction <> 5200 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5200, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:864
//
// EXTENDED_VERBS.agc:865
//		TC	TESTXACT
// slot 38356
                    if slot <> 38356 or instruction <> 1086 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1086, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38357 {
// EXTENDED_VERBS.agc:866
//
// EXTENDED_VERBS.agc:867
//		CAF	VNLODCDU
// slot 38357
                    if slot <> 38357 or instruction <> 13461 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1173), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:868
//		TC	BANKCALL
// slot 38358
                    if slot <> 38358 or instruction <> 2446 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2446, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2596] to agcAotUnit2596@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:869
//		CADR	GOXDSPF
// slot 38359
    38359, 16824
)).

// bank 43, slots 38360-38363
function agcAotUnit2597 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38361 {
        if slot <= 38360 {
// EXTENDED_VERBS.agc:870
//		TC	ENDEXT		# V34
// slot 38360
            if slot <> 38360 or instruction <> 2874 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2874, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:871
//		TC	+1
// slot 38361
            if slot <> 38361 or instruction <> 1498 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1498, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38362 {
// EXTENDED_VERBS.agc:872
//		CAF	V43K		# REDISPLAY OUR VERB.
// slot 38362
            if slot <> 38362 or instruction <> 13797 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1509), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:873
//		TC	BANKCALL
// slot 38363
            if slot <> 38363 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2597] to agcAotUnit2597@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:874
//		CADR	EXDSPRET
// slot 38364
    38364, 17184
)).

// bank 43, slots 38365-38369
function agcAotUnit2598 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38366 {
        if slot <= 38365 {
// EXTENDED_VERBS.agc:875
//		CAF	BIT6
// slot 38365
            if slot <> 38365 or instruction <> 14822 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:876
//		EXTEND
// slot 38366
            if slot <> 38366 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38367 {
// EXTENDED_VERBS.agc:877
//		WOR	CHAN12		# ENABLE ERROR COUNTERS.
// slot 38367
            if slot <> 38367 or instruction <> 2570 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38368 {
// EXTENDED_VERBS.agc:878
//		CAF	TWO
// slot 38368
                if slot <> 38368 or instruction <> 14826 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:879
//		TC	WAITLIST	# PUT OUT COMMANDS IN .32 SECONDS.
// slot 38369
                if slot <> 38369 or instruction <> 2691 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2691, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2598] to agcAotUnit2598@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:880
//		EBANK=	THETAD
// EXTENDED_VERBS.agc:881
//		2CADR	ATTCK2
// slot 38370 38371
    38370, 2106, 38371, 53376
)).

// bank 43, slots 38372-38372
function agcAotUnit2599 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:882
//
// EXTENDED_VERBS.agc:883
//		TCF	ENDEXT
// slot 38372
    if slot <> 38372 or instruction <> 6970 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6970, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2599] to agcAotUnit2599@.

// bank 42, slots 36893-36895
function agcAotUnit2488 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36893 {
// EXTENDED_VERBS.agc:884
//
// EXTENDED_VERBS.agc:885
//		BANK	42
// EXTENDED_VERBS.agc:886
//		SETLOC	PINBALL3	# SOMETHING IN B42.
// EXTENDED_VERBS.agc:887
//		BANK
// EXTENDED_VERBS.agc:888
//
// EXTENDED_VERBS.agc:889
//		COUNT*	$$/EXTVB
// EXTENDED_VERBS.agc:890
//# Page 282
// EXTENDED_VERBS.agc:891
//ATTCK2		CAF	TWO		# PUT OUT COMMANDS.
// slot 36893
        if slot <> 36893 or instruction <> 14826 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2538), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 36894 {
// EXTENDED_VERBS.agc:892
// +1		TS	Q		# CDU WILL LIMIT EXCESS DATA.
// slot 36894
            if slot <> 36894 or instruction <> 22530 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22530, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:893
//		INDEX	A
// slot 36895
            if slot <> 36895 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2488] to agcAotUnit2488@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:894
//		CA	THETAD
// slot 36896
    36896, 24994
)).

// bank 42, slots 36897-36899
function agcAotUnit2489 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36897 {
// EXTENDED_VERBS.agc:895
//		EXTEND
// slot 36897
        if slot <> 36897 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 36898 {
// EXTENDED_VERBS.agc:896
//		MP	ATTSCALE
// slot 36898
            if slot <> 36898 or instruction <> 29739 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMp(words, 1067, readEffective:call(words, 1067)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:897
//		INDEX	Q
// slot 36899
            if slot <> 36899 or instruction <> 20482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20482, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2489] to agcAotUnit2489@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:898
//		XCH	CDUXCMD
// slot 36900
    36900, 47184
)).

// bank 42, slots 36901-36906
function agcAotUnit2490 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36903 {
        if slot <= 36901 {
// EXTENDED_VERBS.agc:899
//		CCS	Q
// slot 36901
            if slot <> 36901 or instruction <> 4098 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 36902 {
// EXTENDED_VERBS.agc:900
//		TCF	ATTCK2 +1
// slot 36902
                if slot <> 36902 or instruction <> 5150 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5150, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:901
//
// EXTENDED_VERBS.agc:902
//		CAF	13,14,15
// slot 36903
                if slot <> 36903 or instruction <> 16352 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4064), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 36904 {
// EXTENDED_VERBS.agc:903
//		EXTEND
// slot 36904
            if slot <> 36904 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 36905 {
// EXTENDED_VERBS.agc:904
//		WOR	CHAN14
// slot 36905
                if slot <> 36905 or instruction <> 2572 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 5, 12, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:905
//		TCF	TASKOVER	# LEAVE ERROR COUNTERS ENABLED.
// slot 36906
                if slot <> 36906 or instruction <> 6833 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6833, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2490] to agcAotUnit2490@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:906
//
// EXTENDED_VERBS.agc:907
//ATTSCALE	DEC	0.1
// slot 36907
    36907, 3276,
// EXTENDED_VERBS.agc:908
//
// EXTENDED_VERBS.agc:909
//		BANK	7
// EXTENDED_VERBS.agc:910
//		SETLOC	EXTVERBS
// EXTENDED_VERBS.agc:911
//		BANK
// EXTENDED_VERBS.agc:912
//
// EXTENDED_VERBS.agc:913
//		COUNT*	$$/EXTVB
// EXTENDED_VERBS.agc:914
//
// EXTENDED_VERBS.agc:915
//V43K		VN	4300
// slot 38373
    38373, 11008
)).

// bank 43, slots 38374-38379
function agcAotUnit2600 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38376 {
        if slot <= 38374 {
// EXTENDED_VERBS.agc:916
//
// EXTENDED_VERBS.agc:917
//# V82PERF	VERB82		DESCRIPTION
// EXTENDED_VERBS.agc:918
//#	REQUEST ORBIT PARAMETERS DISPLAY (R30)
// EXTENDED_VERBS.agc:919
//#
// EXTENDED_VERBS.agc:920
//#	1.	IF AVERAGE G IS OFF:
// EXTENDED_VERBS.agc:921
//#			FLASH DISPLAY V04N06.  R2 INDICATES WHICH SHIP'S STATE VECTOR IS
// EXTENDED_VERBS.agc:922
//#			TO BE UPDATED.  INITIAL CHOICE IS THIS SHIP (R2=1).  ASTRONAUT
// EXTENDED_VERBS.agc:923
//#			CAN CHANGE TO OTHER SHIP BY V22EXE, WHERE X NOT EQ I.
// EXTENDED_VERBS.agc:924
//#			SELECTED STATE VECTOR UPDATED BY THISPREC (OTHPREC).
// EXTENDED_VERBS.agc:925
//#			CALLS SR30.1 (WHICH CALLS TFFCONMU + TFFRP/RA) TO CALCULATE
// EXTENDED_VERBS.agc:926
//#			RPER (PERIGEE RADIUS), RAP0 (APOGEE RADIUS), HPER (PERIGEE
// EXTENDED_VERBS.agc:927
//#			HEIGHT ABOVE LAUNCH PAD OR LUNAR LANDING SITE), HAPO (APOGEE
// EXTENDED_VERBS.agc:928
//#			HEIGHT AS ABOVE), TPER (TIME TO PERIGEE), TFF (TIME TO
// EXTENDED_VERBS.agc:929
//#			INTERSECT 300 KFT ABOVE PAD OR 35KFT ABOVE LANDING SITE).
// EXTENDED_VERBS.agc:930
//#			FLASH MONITOR V16N44 (HAPO, HPER, TFF).  TFF IS -59M59S IF IT WAS
// EXTENDED_VERBS.agc:931
//#			NOT COMPUTABLE, OTHERWISE IT INCREMENTS ONCE PER SECOND.
// EXTENDED_VERBS.agc:932
//#			ASTRONAUT HAS OPTION TO MONITOR TPER BY KEYING IN N 32 E.
// EXTENDED_VERBS.agc:933
//#			DISPLAY IS IN HMS, IS NEGATIVE (AS WAS TFF), AND INCREMENTS
// EXTENDED_VERBS.agc:934
//#			ONCE PER SECOND ONLY IF TFF DISPLAY WAS -59M59S.
// EXTENDED_VERBS.agc:935
//#
// EXTENDED_VERBS.agc:936
//#	2.	IF AVERAGE G IS ON:
// EXTENDED_VERBS.agc:937
//#			CALLS SR30.1 APPROX EVERY TWO SECS.  STATE VECTOR IS ALWAYS
// EXTENDED_VERBS.agc:938
//#			FOR THIS VEHICLE.  V82 DOES NOT DISTURB STATE VECTOR.  RESULTS
// EXTENDED_VERBS.agc:939
//#			OF SR30.1 ARE RAPO, RPER, HAPO, HPER, TPER, TFF.
// EXTENDED_VERBS.agc:940
//#			FLASH MONITOR V16N44 (HAPO, HPER, TFF).
// EXTENDED_VERBS.agc:941
//#			IF MODE IS P11, THEN CALL DELRSPL SO ASTRONAUT CAN MONITOR
// EXTENDED_VERBS.agc:942
//#			RESULTS BY N50E.  SPLASH COMPUTATION DONE ONCE PER TWO SECS.
// EXTENDED_VERBS.agc:943
//
// EXTENDED_VERBS.agc:944
//# Page 283
// EXTENDED_VERBS.agc:945
//V82PERF		TC	TESTXACT
// slot 38374
            if slot <> 38374 or instruction <> 1086 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1086, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38375 {
// EXTENDED_VERBS.agc:946
//
// EXTENDED_VERBS.agc:947
//		CAF	PRIO7		# LESS THAN LAMBERT.  R30,V82
// slot 38375
                if slot <> 38375 or instruction <> 14865 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:948
//		TC	PRIOCHNG
// slot 38376
                if slot <> 38376 or instruction <> 2662 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2662, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38377 {
// EXTENDED_VERBS.agc:949
//		EXTEND
// slot 38377
            if slot <> 38377 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38378 {
// EXTENDED_VERBS.agc:950
//		DCA	V82CON
// slot 38378
                if slot <> 38378 or instruction <> 13805 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 1517, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:951
//		TC	SUPDXCHZ	# V82CALL IN DIFF SUPERBANK FROM V82PERF
// slot 38379
                if slot <> 38379 or instruction <> 2677 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2677, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2600] to agcAotUnit2600@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:952
//
// EXTENDED_VERBS.agc:953
//		EBANK=	HAPO
// EXTENDED_VERBS.agc:954
//V82CON		2CADR	V82CALL
// slot 38380 38381
    38380, 3396, 38381, 37000
)).

// bank 43, slots 38382-38384
function agcAotUnit2601 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38382 {
// EXTENDED_VERBS.agc:955
//
// EXTENDED_VERBS.agc:956
//# VB83PERF	VERB 83		DESCRIPTION
// EXTENDED_VERBS.agc:957
//#	REQUEST RENDEZVOUS PARAMETER DISPLAY (R31)
// EXTENDED_VERBS.agc:958
//#
// EXTENDED_VERBS.agc:959
//#	1.	SET EXT VERB DISPLAY BUSY FLAG.
// EXTENDED_VERBS.agc:960
//#	2.	SCHEDULE R31CALL WITH PRIORITY 5.
// EXTENDED_VERBS.agc:961
//#		A.	DISPLAY
// EXTENDED_VERBS.agc:962
//#			R1	RANGE
// EXTENDED_VERBS.agc:963
//#			R2	RANGE RATE
// EXTENDED_VERBS.agc:964
//#			R3	THETA
// EXTENDED_VERBS.agc:965
//
// EXTENDED_VERBS.agc:966
//V83PERF		TC	TESTXACT
// slot 38382
        if slot <> 38382 or instruction <> 1086 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1086, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 38383 {
// EXTENDED_VERBS.agc:967
//
// EXTENDED_VERBS.agc:968
//		CAF	BIT2
// slot 38383
            if slot <> 38383 or instruction <> 14826 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:969
//		TC	WAITLIST
// slot 38384
            if slot <> 38384 or instruction <> 2691 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2691, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2601] to agcAotUnit2601@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:970
//		EBANK=	TSTRT
// EXTENDED_VERBS.agc:971
//		2CADR	R31CALL
// slot 38385 38386
    38385, 3960, 38386, 49294
)).

// bank 43, slots 38387-38391
function agcAotUnit2602 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38388 {
        if slot <= 38387 {
// EXTENDED_VERBS.agc:972
//
// EXTENDED_VERBS.agc:973
//		TC	ENDOFJOB
// slot 38387
            if slot <> 38387 or instruction <> 2669 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2669, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:974
//
// EXTENDED_VERBS.agc:975
//# VERB 89	DESCRIPTION	RENDEZVOUS FINAL ATTITUDE ROUTINE (R63)
// EXTENDED_VERBS.agc:976
//#
// EXTENDED_VERBS.agc:977
//# CALLED BY VERB 89 ENTER DURING P00.  PRIO 10 IS USED.  CALCULATES AND
// EXTENDED_VERBS.agc:978
//# DISPLAYS FINAL FDAI BALL ANGLES TO POINT LM +X OR +Z AXIS AT CSM.
// EXTENDED_VERBS.agc:979
//#
// EXTENDED_VERBS.agc:980
//# 1. KEY IN V 89 E ONLY IF IN PROG 00.  IF NOT IN P00, OPERATOR ERROR AND
// EXTENDED_VERBS.agc:981
//# EXIT R63, OTHERWISE CONTINUE.
// EXTENDED_VERBS.agc:982
//#
// EXTENDED_VERBS.agc:983
//# 2. IF IN P00, DO IMU STATUS CHECK ROUTINE (R02BOTH).  IF IMU ON AND ITS
// EXTENDED_VERBS.agc:984
//# ORIENTATION KNOWN TO LGC,CONTINUE.
// EXTENDED_VERBS.agc:985
//#
// EXTENDED_VERBS.agc:986
//# 3. FLASH DISPLAY V 04 N 06.  R2 INDICATES WHICH SPACECRAFT AXIS IS TO
// EXTENDED_VERBS.agc:987
//# BE POINTED AT CSM.  INITIAL CHOICE IS PREFERRED (+Z) AXIS (R2=1).
// EXTENDED_VERBS.agc:988
//# ASTRONAUT CAN CHANGE TO (+X) AXIS (R2 NOT = 1) BY V 22 E 2 E.  CONTINUE
// EXTENDED_VERBS.agc:989
//# AFTER KEYING IN PROCEED.
// EXTENDED_VERBS.agc:990
//#
// EXTENDED_VERBS.agc:991
//# 4. BOTH VEHICLE STATE VECTORS UPDATED BY CONIC EQS.
// EXTENDED_VERBS.agc:992
//#
// EXTENDED_VERBS.agc:993
//# 5. HALF MAGNITUDE UNIT LOS VECTOR (IN STABLE MEMBER COORDINATES) AND
// EXTENDED_VERBS.agc:994
//# Page 284
// EXTENDED_VERBS.agc:995
//# HALF MAGNITUDE UNIT SPACECRAFT AXIS VECTOR (IN BODY COORDINATES)
// EXTENDED_VERBS.agc:996
//# PREPARED FOR VECPOINT.
// EXTENDED_VERBS.agc:997
//#
// EXTENDED_VERBS.agc:998
//# 6. GIMBAL ANGLES FROM VECPOINT TRANSFORMED INTO FDAI BALL ANGLES BY
// EXTENDED_VERBS.agc:999
//# BALLANGS.  FLASH DISPLAY V 06 N 18 AND AWAIT RESPONSE.
// EXTENDED_VERBS.agc:1000
//#
// EXTENDED_VERBS.agc:1001
//# 7. 	RECYCLE -- RETURN TO STEP 4.
// EXTENDED_VERBS.agc:1002
//#    	TERMINATE -- EXIT R63.
// EXTENDED_VERBS.agc:1003
//#	PROCEED -- RESET 3AXISFLG AND CALL R60LEM FOR ATTITUDE MANEUVER.
// EXTENDED_VERBS.agc:1004
//
// EXTENDED_VERBS.agc:1005
//V89PERF		TC	CHKPOOH
// slot 38388
            if slot <> 38388 or instruction <> 1107 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1107, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38389 {
// EXTENDED_VERBS.agc:1006
//		TC	TESTXACT
// slot 38389
            if slot <> 38389 or instruction <> 1086 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1086, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38390 {
// EXTENDED_VERBS.agc:1007
//		CAF	PRIO10
// slot 38390
                if slot <> 38390 or instruction <> 14815 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1008
//		TC	FINDVAC
// slot 38391
                if slot <> 38391 or instruction <> 2629 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2629, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2602] to agcAotUnit2602@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1009
//		EBANK=	RONE
// EXTENDED_VERBS.agc:1010
//		2CADR	V89CALL
// slot 38392 38393
    38392, 2084, 38393, 45192
)).

// bank 43, slots 38394-38397
function agcAotUnit2603 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38395 {
        if slot <= 38394 {
// EXTENDED_VERBS.agc:1011
//
// EXTENDED_VERBS.agc:1012
//		TC	ENDOFJOB
// slot 38394
            if slot <> 38394 or instruction <> 2669 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2669, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:1013
//
// EXTENDED_VERBS.agc:1014
//# V90PERF	VERB 90		DESCRIPTION
// EXTENDED_VERBS.agc:1015
//#	REQUEST RENDEZVOUS OUT-OF-PLANE DISPLAY (R36)
// EXTENDED_VERBS.agc:1016
//#
// EXTENDED_VERBS.agc:1017
//#	1.	SET EXT VERB DISPLAY BUSY FLAG.
// EXTENDED_VERBS.agc:1018
//#	2.	SCHEDULE R36 CALL WITH PRIORITY 10
// EXTENDED_VERBS.agc:1019
//#		A.	DISPLAY
// EXTENDED_VERBS.agc:1020
//#			TIME OF EVENT -- HOURS, MINUTES, SECONDS
// EXTENDED_VERBS.agc:1021
//#			Y 	OUT-OF-PLANE POSITION -- NAUTICAL MILES
// EXTENDED_VERBS.agc:1022
//#			YDOT	OUT-OF-PLANE VELOCITY -- FEET/SECOND
// EXTENDED_VERBS.agc:1023
//#			PSI	ANGLE BTW LINE OF SIGHT AND FORWARD
// EXTENDED_VERBS.agc:1024
//#				DIRECTION VECTOR IN HORIZONTAL PLANE -- DEGREES
// EXTENDED_VERBS.agc:1025
//
// EXTENDED_VERBS.agc:1026
//V90PERF		TC	TESTXACT
// slot 38395
            if slot <> 38395 or instruction <> 1086 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1086, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38396 {
// EXTENDED_VERBS.agc:1027
//		CAF	PRIO7		# R36,V90
// slot 38396
            if slot <> 38396 or instruction <> 14865 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:1028
//		TC	FINDVAC
// slot 38397
            if slot <> 38397 or instruction <> 2629 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2629, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2603] to agcAotUnit2603@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1029
//		EBANK=	RPASS36
// EXTENDED_VERBS.agc:1030
//		2CADR	R36
// slot 38398 38399
    38398, 2908, 38399, 8328
)).

// bank 43, slots 38400-38410
function agcAotUnit2604 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38404 {
        if slot <= 38401 {
            if slot <= 38400 {
// EXTENDED_VERBS.agc:1031
//
// EXTENDED_VERBS.agc:1032
//		TCF	ENDOFJOB
// slot 38400
                if slot <> 38400 or instruction <> 6765 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6765, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1033
//
// EXTENDED_VERBS.agc:1034
//# MINIMP	VERB 76		DESCRIPTION
// EXTENDED_VERBS.agc:1035
//#	MINIMUM IMPULSE MODE
// EXTENDED_VERBS.agc:1036
//#
// EXTENDED_VERBS.agc:1037
//#	1.	SET MINIMUM IMPULSE RHO MODE FLAG TO 1.
// EXTENDED_VERBS.agc:1038
//
// EXTENDED_VERBS.agc:1039
//MINIMP		INHINT
// slot 38401
                if slot <> 38401 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38402 {
// EXTENDED_VERBS.agc:1040
//		CS	DAPBOOLS
// slot 38402
                if slot <> 38402 or instruction <> 16457 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 73).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38403 {
// EXTENDED_VERBS.agc:1041
//		MASK	PULSES		# PULSES = 1 INDICATES MIN IMP MODE
// slot 38403
                    if slot <> 38403 or instruction <> 31197 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                        if fixedOperand = 16384 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 16384), 2) * 16384).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:1042
//		ADS	DAPBOOLS
// slot 38404
                    if slot <> 38404 or instruction <> 11337 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 73).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 38407 {
            if slot <= 38405 {
// EXTENDED_VERBS.agc:1043
//		TCF	GOPIN		# RETURN VIA PINBRNCH
// slot 38405
                if slot <> 38405 or instruction <> 5201 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5201, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38406 {
// EXTENDED_VERBS.agc:1044
//
// EXTENDED_VERBS.agc:1045
//# NOMINIMP	VERB 77		DESCRIPTION
// EXTENDED_VERBS.agc:1046
//#	RATE COMMAND MODE
// EXTENDED_VERBS.agc:1047
//
// EXTENDED_VERBS.agc:1048
//# Page 285
// EXTENDED_VERBS.agc:1049
//
// EXTENDED_VERBS.agc:1050
//#
// EXTENDED_VERBS.agc:1051
//#	1.	SET MINIMUM IMPULSE RHO MODE FLAG TO 0.  (ZERO INDICATES NOT MINIMUM IMPULSE MODE.).
// EXTENDED_VERBS.agc:1052
//#	2.	MOVE CDUX, CDUY, CDUZ INTO CDUXD, CDUYD, CDUZD.
// EXTENDED_VERBS.agc:1053
//
// EXTENDED_VERBS.agc:1054
//
// EXTENDED_VERBS.agc:1055
//NOMINIMP	INHINT
// slot 38406
                    if slot <> 38406 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:1056
//		CS	PULSES
// slot 38407
                    if slot <> 38407 or instruction <> 18909 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 38408 {
// EXTENDED_VERBS.agc:1057
//		MASK	DAPBOOLS
// slot 38408
                if slot <> 38408 or instruction <> 28745 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 73).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38409 {
// EXTENDED_VERBS.agc:1058
//		TS	DAPBOOLS	# PULSES = NOT IN MINIMUM UMPULSE MODE
// slot 38409
                    if slot <> 38409 or instruction <> 22601 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22601, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:1059
//		TC	IBNKCALL
// slot 38410
                    if slot <> 38410 or instruction <> 2492 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2492, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2604] to agcAotUnit2604@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1060
//		CADR	ZATTEROR
// slot 38411
    38411, 32982
)).

// bank 43, slots 38412-38416
function agcAotUnit2605 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38413 {
        if slot <= 38412 {
// EXTENDED_VERBS.agc:1061
//		TC	GOPIN
// slot 38412
            if slot <> 38412 or instruction <> 1105 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1105, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:1062
//
// EXTENDED_VERBS.agc:1063
//# Page 286
// EXTENDED_VERBS.agc:1064
//# CREMANU	VERB 49		DESCRIPTION
// EXTENDED_VERBS.agc:1065
//#	START AUTOMATIC ATTITUDE MANEUVER
// EXTENDED_VERBS.agc:1066
//#
// EXTENDED_VERBS.agc:1067
//#	1.	REQUIRE PROGRAM 00 ACTIVE.
// EXTENDED_VERBS.agc:1068
//#	2.	SET EXT VERB DISPLAY BUSY FLAG.
// EXTENDED_VERBS.agc:1069
//#	3.	SCHEDULE R62DISP WITH PRIORITY 10.
// EXTENDED_VERBS.agc:1070
//#	4.	RELEASE EXT VERB DISPLAY.
// EXTENDED_VERBS.agc:1071
//#
// EXTENDED_VERBS.agc:1072
//#	R62DISP
// EXTENDED_VERBS.agc:1073
//#	1.	DISPLAY FLASHING V06,N22.
// EXTENDED_VERBS.agc:1074
//#		RESPONSES
// EXTENDED_VERBS.agc:1075
//#		A.	TERMINATE
// EXTENDED_VERBS.agc:1076
//#			1.	GOTOPOOH
// EXTENDED_VERBS.agc:1077
//#		B.	PROCEED
// EXTENDED_VERBS.agc:1078
//#			1.	SET 3AXISFLG TO INDICATE MANEUVER IS SPECIFIED BY 3 AXIS.
// EXTENDED_VERBS.agc:1079
//#			2.	EXECUTE R60LEM (ATTITUDE MANEUVER).
// EXTENDED_VERBS.agc:1080
//#		C.	ENTER
// EXTENDED_VERBS.agc:1081
//#			1.	REPEAT FLASHING V06,N22.
// EXTENDED_VERBS.agc:1082
//
// EXTENDED_VERBS.agc:1083
//CREWMANU	TC	CHKPOOH		# DEMAND P00
// slot 38413
            if slot <> 38413 or instruction <> 1107 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1107, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38414 {
// EXTENDED_VERBS.agc:1084
//
// EXTENDED_VERBS.agc:1085
//		TC	TESTXACT
// slot 38414
            if slot <> 38414 or instruction <> 1086 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1086, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38415 {
// EXTENDED_VERBS.agc:1086
//
// EXTENDED_VERBS.agc:1087
//		CAF	PRIO10
// slot 38415
                if slot <> 38415 or instruction <> 14815 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1088
//		TC	FINDVAC
// slot 38416
                if slot <> 38416 or instruction <> 2629 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2629, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2605] to agcAotUnit2605@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1089
//		EBANK=	BCDU
// EXTENDED_VERBS.agc:1090
//		2CADR	R62DISP
// slot 38417 38418
    38417, 2182, 38418, 39052
)).

// bank 43, slots 38419-38424
function agcAotUnit2606 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38421 {
        if slot <= 38419 {
// EXTENDED_VERBS.agc:1091
//
// EXTENDED_VERBS.agc:1092
//		TC	ENDOFJOB
// slot 38419
            if slot <> 38419 or instruction <> 2669 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2669, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38420 {
// EXTENDED_VERBS.agc:1093
//
// EXTENDED_VERBS.agc:1094
//# Page 287
// EXTENDED_VERBS.agc:1095
//# TRMTRACK	VERB 56		DESCRIPTION
// EXTENDED_VERBS.agc:1096
//#	TERMINATE TRACKING (P20 AND P25).
// EXTENDED_VERBS.agc:1097
//#
// EXTENDED_VERBS.agc:1098
//#	1.	KNOCK DOWN RENDEZVOUS, TRACK, AND UPDATE FLAGS.
// EXTENDED_VERBS.agc:1099
//#	2.	REQUIRE P20 OR P25 NOT RUNNING ALONE OR GO TO GOGOPOOH (REQUEST PROGRAM 00).
// EXTENDED_VERBS.agc:1100
//#	3.	SCHEDULE V56TOVAC WITH PRIORITY 30.
// EXTENDED_VERBS.agc:1101
//#
// EXTENDED_VERBS.agc:1102
//#	V56TOVAC
// EXTENDED_VERBS.agc:1103
//#	1.	EXECUTE INTSTALL (IF INTEGRATION IS RUNNING, STALL UNTIL IT IS FINISHED.).
// EXTENDED_VERBS.agc:1104
//#	2.	ZERO GROUP 2 TO HALT P20.
// EXTENDED_VERBS.agc:1105
//#	3.	TRANSFER CONTROL TO GOPROG2 (SOFTWARE RESTART).
// EXTENDED_VERBS.agc:1106
//
// EXTENDED_VERBS.agc:1107
//TRMTRACK	CA	BITS9+7		# IS REND OR P25 FLAG ON
// slot 38420
                if slot <> 38420 or instruction <> 13860 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1572), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1108
//		MASK	FLAGWRD0
// slot 38421
                if slot <> 38421 or instruction <> 28732 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 60).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38422 {
// EXTENDED_VERBS.agc:1109
//		EXTEND
// slot 38422
            if slot <> 38422 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38423 {
// EXTENDED_VERBS.agc:1110
//		BZF	GOPIN		# NO
// slot 38423
                if slot <> 38423 or instruction <> 5201 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5201, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1111
//
// EXTENDED_VERBS.agc:1112
//		TC	DOWNFLAG
// slot 38424
                if slot <> 38424 or instruction <> 2894 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2894, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2606] to agcAotUnit2606@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1113
//		ADRES	RNDVZFLG
// slot 38425
    38425, 16
)).

// bank 43, slots 38426-38426
function agcAotUnit2607 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:1114
//
// EXTENDED_VERBS.agc:1115
//		TC	DOWNFLAG
// slot 38426
    if slot <> 38426 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2607] to agcAotUnit2607@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1116
//		ADRES	P25FLAG
// slot 38427
    38427, 12
)).

// bank 43, slots 38428-38428
function agcAotUnit2608 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:1117
//
// EXTENDED_VERBS.agc:1118
//		TC	DOWNFLAG	# ENSURE SEARCH FLAG IS OFF
// slot 38428
    if slot <> 38428 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2608] to agcAotUnit2608@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1119
//		ADRES	SRCHOPTN
// slot 38429
    38429, 62
)).

// bank 43, slots 38430-38434
function agcAotUnit2609 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38431 {
        if slot <= 38430 {
// EXTENDED_VERBS.agc:1120
//
// EXTENDED_VERBS.agc:1121
//		CA	TRACKBIT	# IS TRACK FLAG ON?
// slot 38430
            if slot <> 38430 or instruction <> 14823 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:1122
//		MASK	FLAGWRD1
// slot 38431
            if slot <> 38431 or instruction <> 28733 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 61).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38432 {
// EXTENDED_VERBS.agc:1123
//		EXTEND
// slot 38432
            if slot <> 38432 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38433 {
// EXTENDED_VERBS.agc:1124
//		BZF	GOPIN
// slot 38433
                if slot <> 38433 or instruction <> 5201 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5201, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1125
//
// EXTENDED_VERBS.agc:1126
//		TC	POSTJUMP
// slot 38434
                if slot <> 38434 or instruction <> 2461 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2461, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2609] to agcAotUnit2609@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1127
//		CADR	TRMTRAK1
// slot 38435
    38435, 53336,
// EXTENDED_VERBS.agc:1128
//
// EXTENDED_VERBS.agc:1129
//BITS9+7		OCT	500
// slot 38436
    38436, 640
)).

// bank 42, slots 36908-36908
function agcAotUnit2491 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:1130
//
// EXTENDED_VERBS.agc:1131
//		SETLOC	SBAND		# BANK 42
// EXTENDED_VERBS.agc:1132
//		BANK
// EXTENDED_VERBS.agc:1133
//
// EXTENDED_VERBS.agc:1134
//		COUNT*	$$/EXTVB
// EXTENDED_VERBS.agc:1135
//
// EXTENDED_VERBS.agc:1136
//TRMTRAK1	TC	DOWNFLAG
// slot 36908
    if slot <> 36908 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2491] to agcAotUnit2491@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1137
//		ADRES	UPDATFLG	# UPDATE FLAG DOWN
// slot 36909
    36909, 46
)).

// bank 42, slots 36910-36910
function agcAotUnit2492 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:1138
//		TC	DOWNFLAG
// slot 36910
    if slot <> 36910 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2492] to agcAotUnit2492@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1139
//		ADRES	TRACKFLG	# TRACK FLAG DOWN
// slot 36911
    36911, 50
)).

// bank 42, slots 36912-36912
function agcAotUnit2493 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:1140
//		TC	DOWNFLAG
// slot 36912
    if slot <> 36912 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2493] to agcAotUnit2493@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1141
//		ADRES	IMUSE
// slot 36913
    36913, 14
)).

// bank 42, slots 36914-36914
function agcAotUnit2494 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:1142
//
// EXTENDED_VERBS.agc:1143
//		TC	INTPRET
// slot 36914
    if slot <> 36914 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2494] to agcAotUnit2494@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1144
//		CALL
// slot 36915
    36915, 65320,
// EXTENDED_VERBS.agc:1145
//			INTSTALL	# DON'T INTERRUPT INTEGRATION
// slot 36916
    36916, 24088,
// EXTENDED_VERBS.agc:1146
//# Page 288
// EXTENDED_VERBS.agc:1147
//		EXIT
// slot 36917
    36917, 65532
)).

// bank 42, slots 36918-36918
function agcAotUnit2495 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:1148
//
// EXTENDED_VERBS.agc:1149
//		TC	PHASCHNG
// slot 36918
    if slot <> 36918 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2495] to agcAotUnit2495@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1150
//		OCT	2		# KILL GROUP 2 TO HALT P20 ACTIVITY
// slot 36919
    36919, 4
)).

// bank 42, slots 36920-36921
function agcAotUnit2496 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36920 {
// EXTENDED_VERBS.agc:1151
//
// EXTENDED_VERBS.agc:1152
//		INHINT
// slot 36920
        if slot <> 36920 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// EXTENDED_VERBS.agc:1153
//		TC	IBNKCALL	# ZERO THE COMMANDED RATES TO STOP
// slot 36921
        if slot <> 36921 or instruction <> 2492 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2492, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2496] to agcAotUnit2496@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1154
//		CADR	STOPRATE	# MANEUVER
// slot 36922
    36922, 33002
)).

// bank 42, slots 36923-36923
function agcAotUnit2497 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:1155
//
// EXTENDED_VERBS.agc:1156
//		TC	IBNKCALL
// slot 36923
    if slot <> 36923 or instruction <> 2492 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2492, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2497] to agcAotUnit2497@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1157
//		CADR	RESTORDB
// slot 36924
    36924, 32934
)).

// bank 42, slots 36925-36929
function agcAotUnit2498 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36926 {
        if slot <= 36925 {
// EXTENDED_VERBS.agc:1158
//
// EXTENDED_VERBS.agc:1159
//		TC	CLRADMOD	# CLEAR BITS 10 + 15 OF RADMODES.
// slot 36925
            if slot <> 36925 or instruction <> 3081 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3081, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:1160
//
// EXTENDED_VERBS.agc:1161
//		CS	BIT14		# DISABLE LOCKON
// slot 36926
            if slot <> 36926 or instruction <> 18910 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 36927 {
// EXTENDED_VERBS.agc:1162
//		EXTEND
// slot 36927
            if slot <> 36927 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 36928 {
// EXTENDED_VERBS.agc:1163
//		WAND	CHAN12
// slot 36928
                if slot <> 36928 or instruction <> 1546 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1164
//		TC	POSTJUMP
// slot 36929
                if slot <> 36929 or instruction <> 2461 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2461, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2498] to agcAotUnit2498@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1165
//		CADR	GOPROG2		# CAUSE RESTART.
// slot 36930
    36930, 11248
)).

// bank 43, slots 38437-38439
function agcAotUnit2610 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38437 {
// EXTENDED_VERBS.agc:1166
//
// EXTENDED_VERBS.agc:1167
//# DNEDUMP	VERB 74		DESCRIPTION
// EXTENDED_VERBS.agc:1168
//#	INITIALZE DOWN-TELEMETRY PROGRAM FOR ERASABLE MEMORY DUMP.
// EXTENDED_VERBS.agc:1169
//#
// EXTENDED_VERBS.agc:1170
//#	1.	SET EXT VERB DISPLAY BUSY FLAG.
// EXTENDED_VERBS.agc:1171
//#	2.	REPLACE CURRENT DOWNLIST WITH ERASABLE MEMORY.
// EXTENDED_VERBS.agc:1172
//#	3.	RELEASE EXT VERB DISPLAY.
// EXTENDED_VERBS.agc:1173
//
// EXTENDED_VERBS.agc:1174
//		SETLOC	EXTVERBS
// EXTENDED_VERBS.agc:1175
//		BANK
// EXTENDED_VERBS.agc:1176
//
// EXTENDED_VERBS.agc:1177
//		COUNT*	$$/EXTVB
// EXTENDED_VERBS.agc:1178
//
// EXTENDED_VERBS.agc:1179
//		EBANK=	400
// EXTENDED_VERBS.agc:1180
//DNEDUMP		CAF	LDNDUMPI
// slot 38437
        if slot <> 38437 or instruction <> 13864 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1576), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 38438 {
// EXTENDED_VERBS.agc:1181
//		TS	DNTMGOTO
// slot 38438
            if slot <> 38438 or instruction <> 22749 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22749, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:1182
//		TC	GOPIN
// slot 38439
            if slot <> 38439 or instruction <> 1105 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1105, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2610] to agcAotUnit2610@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1183
//
// EXTENDED_VERBS.agc:1184
//V74		EQUALS	DNEDUMP
// EXTENDED_VERBS.agc:1185
//LDNDUMPI	REMADR	DNDUMPI
// slot 38440
    38440, 3982
)).

// bank 43, slots 38441-38441
function agcAotUnit2611 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:1186
//
// EXTENDED_VERBS.agc:1187
//# LEMVEC	VERB 80		DESCRIPTION
// EXTENDED_VERBS.agc:1188
//#	UPDATE LEM STATE VECTOR
// EXTENDED_VERBS.agc:1189
//#		RESET VHUPFLG TC 0
// EXTENDED_VERBS.agc:1190
//
// EXTENDED_VERBS.agc:1191
//LEMVEC		TC	DOWNFLAG
// slot 38441
    if slot <> 38441 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2611] to agcAotUnit2611@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1192
//		ADRES	VEHUPFLG	# VB 80 -- VEHUPFLG DOWN INDICATES LEM
// slot 38442
    38442, 44
)).

// bank 43, slots 38443-38444
function agcAotUnit2612 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38443 {
// EXTENDED_VERBS.agc:1193
//
// EXTENDED_VERBS.agc:1194
//		TC	NOUPDOWN
// slot 38443
        if slot <> 38443 or instruction <> 1582 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1582, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// EXTENDED_VERBS.agc:1195
//
// EXTENDED_VERBS.agc:1196
//# CSMVEC	VERB 81		DESCRIPTION
// EXTENDED_VERBS.agc:1197
//#	UPDATE CSM STATE VECTOR
// EXTENDED_VERBS.agc:1198
//# Page 289
// EXTENDED_VERBS.agc:1199
//#		SET VEHUPFLG TO 1
// EXTENDED_VERBS.agc:1200
//
// EXTENDED_VERBS.agc:1201
//CSMVEC		TC	UPFLAG
// slot 38444
        if slot <> 38444 or instruction <> 2884 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2884, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2612] to agcAotUnit2612@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1202
//		ADRES	VEHUPFLG	# VB 81 -- VEHUPFLG UP INDICATES CSM
// slot 38445
    38445, 44
)).

// bank 43, slots 38446-38446
function agcAotUnit2613 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:1203
//
// EXTENDED_VERBS.agc:1204
//NOUPDOWN	TC	DOWNFLAG
// slot 38446
    if slot <> 38446 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2613] to agcAotUnit2613@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1205
//		ADRES	NOUPFLAG
// slot 38447
    38447, 48
)).

// bank 43, slots 38448-38449
function agcAotUnit2614 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38448 {
// EXTENDED_VERBS.agc:1206
//
// EXTENDED_VERBS.agc:1207
//		TCF	GOPIN
// slot 38448
        if slot <> 38448 or instruction <> 5201 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5201, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// EXTENDED_VERBS.agc:1208
//
// EXTENDED_VERBS.agc:1209
//# UPDATOFF	VERB 95		DESCRIPTION
// EXTENDED_VERBS.agc:1210
//#	INHIBIT STATE VECTOR UPDATES BY INCORP
// EXTENDED_VERBS.agc:1211
//#		SET NOUPFLAG TO 1
// EXTENDED_VERBS.agc:1212
//
// EXTENDED_VERBS.agc:1213
//UPDATOFF	TC	UPFLAG		# VB 95 SET NOUPFLAG
// slot 38449
        if slot <> 38449 or instruction <> 2884 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2884, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2614] to agcAotUnit2614@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1214
//		ADRES	NOUPFLAG
// slot 38450
    38450, 48
)).

// bank 43, slots 38451-38455
function agcAotUnit2615 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38452 {
        if slot <= 38451 {
// EXTENDED_VERBS.agc:1215
//
// EXTENDED_VERBS.agc:1216
//		TC	GOPIN
// slot 38451
            if slot <> 38451 or instruction <> 1105 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1105, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:1217
//# Page 290
// EXTENDED_VERBS.agc:1218
//# SYSTEST	VERB 92		DESCRIPTION
// EXTENDED_VERBS.agc:1219
//#	OPERATE IMU PERFORMANCE TEST.
// EXTENDED_VERBS.agc:1220
//#
// EXTENDED_VERBS.agc:1221
//#	1.	REQUIRE PROGRAM 00 OR TURN ON OPERATOR ERROR.
// EXTENDED_VERBS.agc:1222
//#	2.	SET EXT VERB BUSY FLAG.
// EXTENDED_VERBS.agc:1223
//
// EXTENDED_VERBS.agc:1224
//		EBANK=	QPLACE
// EXTENDED_VERBS.agc:1225
//
// EXTENDED_VERBS.agc:1226
//SYSTEST		TC	CHKPOOH		# DEMAND P00
// slot 38452
            if slot <> 38452 or instruction <> 1107 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1107, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38453 {
// EXTENDED_VERBS.agc:1227
//
// EXTENDED_VERBS.agc:1228
//		TC	TESTXACT
// slot 38453
            if slot <> 38453 or instruction <> 1086 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1086, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38454 {
// EXTENDED_VERBS.agc:1229
//
// EXTENDED_VERBS.agc:1230
//		CAF	PRIO22
// slot 38454
                if slot <> 38454 or instruction <> 16328 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4040), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1231
//		TC	FINDVAC
// slot 38455
                if slot <> 38455 or instruction <> 2629 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2629, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2615] to agcAotUnit2615@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1232
//		EBANK=	QPLACE
// EXTENDED_VERBS.agc:1233
//		SBANK=	IMUSUPER
// EXTENDED_VERBS.agc:1234
//		2CADR	REDO
// slot 38456 38457
    38456, 2052, 38457, 63594
)).

// bank 43, slots 38458-38480
function agcAotUnit2616 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38468 {
        if slot <= 38462 {
            if slot <= 38459 {
                if slot <= 38458 {
// EXTENDED_VERBS.agc:1235
//
// EXTENDED_VERBS.agc:1236
//		TC	ENDOFJOB
// slot 38458
                    if slot <> 38458 or instruction <> 2669 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2669, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:1237
//
// EXTENDED_VERBS.agc:1238
//# VERB 93	CLEAR RENDWFLG, CAUSES W-MATRIX TO BE RE-INITIALIZED.
// EXTENDED_VERBS.agc:1239
//
// EXTENDED_VERBS.agc:1240
//WMATRXNG	INHINT
// slot 38459
                    if slot <> 38459 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38460 {
// EXTENDED_VERBS.agc:1241
//		CS	RENDWBIT
// slot 38460
                    if slot <> 38460 or instruction <> 18923 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38461 {
// EXTENDED_VERBS.agc:1242
//		MASK	FLAGWRD5
// slot 38461
                        if slot <> 38461 or instruction <> 28737 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 65).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:1243
//		TS	FLAGWRD5
// slot 38462
                        if slot <> 38462 or instruction <> 22593 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22593, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 38465 {
                if slot <= 38463 {
// EXTENDED_VERBS.agc:1244
//
// EXTENDED_VERBS.agc:1245
//		TC	GOPIN
// slot 38463
                    if slot <> 38463 or instruction <> 1105 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1105, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38464 {
// EXTENDED_VERBS.agc:1246
//
// EXTENDED_VERBS.agc:1247
//GOSHOSUM	EQUALS	SHOWSUM
// EXTENDED_VERBS.agc:1248
//
// EXTENDED_VERBS.agc:1249
//SHOWSUM		TC	CHKPOOH		# *
// slot 38464
                        if slot <> 38464 or instruction <> 1107 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1107, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:1250
//		TC	TESTXACT	# *
// slot 38465
                        if slot <> 38465 or instruction <> 1086 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1086, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38466 {
// EXTENDED_VERBS.agc:1251
//		CAF	PRIO7		# * ALLOW OTHER CHARINS.
// slot 38466
                    if slot <> 38466 or instruction <> 14865 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38467 {
// EXTENDED_VERBS.agc:1252
//		TC	PRIOCHNG	# *
// slot 38467
                        if slot <> 38467 or instruction <> 2662 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2662, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:1253
//		CAF	S+1		# *
// slot 38468
                        if slot <> 38468 or instruction <> 14827 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 38474 {
            if slot <= 38471 {
                if slot <= 38469 {
// EXTENDED_VERBS.agc:1254
//		TS	SKEEP6		# * SHOWSUM OPTION
// slot 38469
                    if slot <> 38469 or instruction <> 23294 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23294, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38470 {
// EXTENDED_VERBS.agc:1255
//		CAF	S+ZERO		# *
// slot 38470
                        if slot <> 38470 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:1256
//		TS	SMODE		# * TURN OFF SELF-CHECK
// slot 38471
                        if slot <> 38471 or instruction <> 23282 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23282, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38472 {
// EXTENDED_VERBS.agc:1257
//		CA	SELFADRS	# *
// slot 38472
                    if slot <> 38472 or instruction <> 13989 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1701), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38473 {
// EXTENDED_VERBS.agc:1258
//		TS	SELFRET		# *
// slot 38473
                        if slot <> 38473 or instruction <> 23281 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23281, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:1259
//		TC	STSHOSUM	# * ENTER ROPECHK
// slot 38474
                        if slot <> 38474 or instruction <> 1874 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 1874, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 38477 {
                if slot <= 38475 {
// EXTENDED_VERBS.agc:1260
//
// EXTENDED_VERBS.agc:1261
//SDISPLAY	LXCH	SKEEP2		# * BANK # FOR DISPLAY
// slot 38475
                    if slot <> 38475 or instruction <> 9978 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 762, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38476 {
// EXTENDED_VERBS.agc:1262
//		LXCH	SKEEP3		# * BUGGER WORD FOR DISPLAY
// slot 38476
                        if slot <> 38476 or instruction <> 9979 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 763, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:1263
//NOKILL		CA	ADRS1		# *
// slot 38477
                        if slot <> 38477 or instruction <> 13988 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1700), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 38478 {
// EXTENDED_VERBS.agc:1264
//		TS	MPAC +2		# *
// slot 38478
                    if slot <> 38478 or instruction <> 22638 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22638, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38479 {
// EXTENDED_VERBS.agc:1265
//		CA	VNCON		# * 0501
// slot 38479
                        if slot <> 38479 or instruction <> 13912 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1624), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:1266
//		TC	BANKCALL	# *
// slot 38480
                        if slot <> 38480 or instruction <> 2446 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2446, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[2616] to agcAotUnit2616@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1267
//		CADR	GOXDSPF		# *
// slot 38481
    38481, 16824
)).

// bank 43, slots 38482-38487
function agcAotUnit2617 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38484 {
        if slot <= 38482 {
// EXTENDED_VERBS.agc:1268
//		TC	+3		# *
// slot 38482
            if slot <> 38482 or instruction <> 1621 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1621, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38483 {
// EXTENDED_VERBS.agc:1269
//		TC	NXTBNK		# *
// slot 38483
                if slot <> 38483 or instruction <> 1947 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1947, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1270
//# Page 291
// EXTENDED_VERBS.agc:1271
//		TC	NOKILL		# *
// slot 38484
                if slot <> 38484 or instruction <> 1613 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1613, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38485 {
// EXTENDED_VERBS.agc:1272
//		CA	SELFADRS
// slot 38485
            if slot <> 38485 or instruction <> 13989 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1701), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38486 {
// EXTENDED_VERBS.agc:1273
//		TS	SKEEP1
// slot 38486
                if slot <> 38486 or instruction <> 23289 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23289, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1274
//
// EXTENDED_VERBS.agc:1275
//		TC	ENDEXT		# *
// slot 38487
                if slot <> 38487 or instruction <> 2874 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2874, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2617] to agcAotUnit2617@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1276
//VNCON		VN	501		# *
// slot 38488
    38488, 1282
)).

// bank 43, slots 38489-38496
function agcAotUnit2618 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38492 {
        if slot <= 38490 {
            if slot <= 38489 {
// EXTENDED_VERBS.agc:1277
//ENDSUMS		CA	SKEEP6		# *
// slot 38489
                if slot <> 38489 or instruction <> 13054 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 766).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1278
//		EXTEND			# *
// slot 38490
                if slot <> 38490 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38491 {
// EXTENDED_VERBS.agc:1279
//		BZF	SELFCHK		# * ROPECHK, START SELFCHK AGAIN.
// slot 38491
                if slot <> 38491 or instruction <> 5854 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5854, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1280
//		TC	STSHOSUM	# * START SHOWSUM AGAIN.
// slot 38492
                if slot <> 38492 or instruction <> 1874 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1874, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38494 {
            if slot <= 38493 {
// EXTENDED_VERBS.agc:1281
//
// EXTENDED_VERBS.agc:1282
//# Page 292
// EXTENDED_VERBS.agc:1283
//# DAPDISP	VERB 48		DESCRIPTION
// EXTENDED_VERBS.agc:1284
//#	LOAD AUTO PILOT DATA
// EXTENDED_VERBS.agc:1285
//#
// EXTENDED_VERBS.agc:1286
//#	1.	REQUIRE EXT VERB DISPLAY AVAILABLE AND SET BUSY FLAG.
// EXTENDED_VERBS.agc:1287
//#	2.	EXECUTE DAPDATA1, DAPDATA2, AND DAPDATA3.
// EXTENDED_VERBS.agc:1288
//#	3.	RELEASE EXT VERB DISPLAY SYSTEM.
// EXTENDED_VERBS.agc:1289
//
// EXTENDED_VERBS.agc:1290
//DAPDISP		TC	TESTXACT
// slot 38493
                if slot <> 38493 or instruction <> 1086 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1086, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1291
//		CAF	PRIO7		# R03
// slot 38494
                if slot <> 38494 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
            if slot <= 38495 {
// EXTENDED_VERBS.agc:1292
//		TC	PRIOCHNG
// slot 38495
                if slot <> 38495 or instruction <> 2662 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2662, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1293
//		TC	POSTJUMP
// slot 38496
                if slot <> 38496 or instruction <> 2461 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2461, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2618] to agcAotUnit2618@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1294
//		CADR	DAPDATA1
// slot 38497
    38497, 32776
)).

// bank 20, slots 18436-18452
function agcAotUnit1115 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18443 {
        if slot <= 18439 {
            if slot <= 18437 {
                if slot <= 18436 {
// EXTENDED_VERBS.agc:1295
//
// EXTENDED_VERBS.agc:1296
//		BANK	34
// EXTENDED_VERBS.agc:1297
//		SETLOC	LOADDAP
// EXTENDED_VERBS.agc:1298
//		BANK
// EXTENDED_VERBS.agc:1299
//
// EXTENDED_VERBS.agc:1300
//		COUNT*	$$/R03
// EXTENDED_VERBS.agc:1301
//
// EXTENDED_VERBS.agc:1302
//		SBANK=	LOWSUPER	# FOR SUBSEQUENT LOW 2CADR'S
// EXTENDED_VERBS.agc:1303
//
// EXTENDED_VERBS.agc:1304
//DAPDATA1	CAF	BOOLSMSK	# SET DISPLAY ACCORDING TO DAPBOOLS BITS.
// slot 18436
                    if slot <> 18436 or instruction <> 13388 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1100), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:1305
//		MASK	DAPBOOLS	# LM
// slot 18437
                    if slot <> 18437 or instruction <> 28745 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 73).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18438 {
// EXTENDED_VERBS.agc:1306
//		TS	DAPDATR1	# LM
// slot 18438
                    if slot <> 18438 or instruction <> 23267 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23267, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:1307
//		CS	FLGWRD10	# SET BIT 14 TO BE COMPLEMENT OF APSFLAG.
// slot 18439
                    if slot <> 18439 or instruction <> 16454 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 70).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 18441 {
                if slot <= 18440 {
// EXTENDED_VERBS.agc:1308
//		MASK	APSFLBIT
// slot 18440
                    if slot <> 18440 or instruction <> 31199 { return choose false if checkOnly else -1. }
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
// EXTENDED_VERBS.agc:1309
//		CCS	A
// slot 18441
                    if slot <> 18441 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18442 {
// EXTENDED_VERBS.agc:1310
//		CAF	BIT14
// slot 18442
                    if slot <> 18442 or instruction <> 14814 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:1311
//		ADS	DAPDATR1
// slot 18443
                    if slot <> 18443 or instruction <> 12003 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 739).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 18447 {
            if slot <= 18445 {
                if slot <= 18444 {
// EXTENDED_VERBS.agc:1312
//CHKDATA1	CAE	DAPDATR1	# IF BITS 13 AND 14 ARE BOTH ZERO, FORCE
// slot 18444
                    if slot <> 18444 or instruction <> 13027 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 739).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:1313
//		MASK	BIT13-14	#	A ONE INTO BIT 13.
// slot 18445
                    if slot <> 18445 or instruction <> 30957 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2285), 32768).
                        if fixedOperand = 12288 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 4096), 4) * 4096).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18446 {
// EXTENDED_VERBS.agc:1314
//		EXTEND
// slot 18446
                    if slot <> 18446 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:1315
//		BZF	FORCEONE
// slot 18447
                    if slot <> 18447 or instruction <> 5148 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5148, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 18449 {
                if slot <= 18448 {
// EXTENDED_VERBS.agc:1316
//		CAE	DAPDATR1	# ENSURE THAT NO ILLEGAL BITS SET BY CREW.
// slot 18448
                    if slot <> 18448 or instruction <> 13027 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 739).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:1317
//MSKDATR1	MASK	DSPLYMSK
// slot 18449
                    if slot <> 18449 or instruction <> 29771 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 1099), 32768).
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 18450 {
// EXTENDED_VERBS.agc:1318
//		TS	DAPDATR1
// slot 18450
                    if slot <> 18450 or instruction <> 23267 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23267, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 18451 {
// EXTENDED_VERBS.agc:1319
//		CAF	V01N46		# LM
// slot 18451
                        if slot <> 18451 or instruction <> 13386 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1098), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:1320
//		TC	BANKCALL
// slot 18452
                        if slot <> 18452 or instruction <> 2446 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2446, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1115] to agcAotUnit1115@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1321
//		CADR	GOXDSPFR
// slot 18453
    18453, 16854
)).

// bank 20, slots 18454-18504
function agcAotUnit1116 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 18478 {
        if slot <= 18465 {
            if slot <= 18459 {
                if slot <= 18456 {
                    if slot <= 18454 {
// EXTENDED_VERBS.agc:1322
//		TCF	ENDEXT		# V34E TERMINATE
// slot 18454
                        if slot <> 18454 or instruction <> 6970 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6970, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18455 {
// EXTENDED_VERBS.agc:1323
//		TCF	DPDAT1		# V33E PROCEED
// slot 18455
                            if slot <> 18455 or instruction <> 5151 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5151, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:1324
//		TCF	CHKDATA1	# E	NEW DATA	CHECK AND REDISPLAY
// slot 18456
                            if slot <> 18456 or instruction <> 5132 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5132, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18457 {
// EXTENDED_VERBS.agc:1325
//		CAF	REVCNT		# BITS 2 & 3:  BLANKS R2 & R3.
// slot 18457
                        if slot <> 18457 or instruction <> 15522 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 3234), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18458 {
// EXTENDED_VERBS.agc:1326
//		TC	BLANKET
// slot 18458
                            if slot <> 18458 or instruction <> 2868 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2868, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:1327
//		TCF	ENDOFJOB
// slot 18459
                            if slot <> 18459 or instruction <> 6765 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6765, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18462 {
                    if slot <= 18460 {
// EXTENDED_VERBS.agc:1328
//FORCEONE	CAF	BIT13
// slot 18460
                        if slot <> 18460 or instruction <> 14815 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18461 {
// EXTENDED_VERBS.agc:1329
//		ADS	DAPDATR1
// slot 18461
                            if slot <> 18461 or instruction <> 12003 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 739).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:1330
//		TCF	MSKDATR1
// slot 18462
                            if slot <> 18462 or instruction <> 5137 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5137, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18463 {
// EXTENDED_VERBS.agc:1331
//
// EXTENDED_VERBS.agc:1332
//DPDAT1		INHINT			# INHINT FOR SETTING OF FLAG BITS AND MASS
// slot 18463
                        if slot <> 18463 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18464 {
// EXTENDED_VERBS.agc:1333
//		CS	APSFLBIT	# 	ON BASIS OF DISPLAYED DAPDATR1.
// slot 18464
                            if slot <> 18464 or instruction <> 18911 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:1334
//		MASK	FLGWRD10
// slot 18465
                            if slot <> 18465 or instruction <> 28742 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 70).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 18471 {
                if slot <= 18468 {
                    if slot <= 18466 {
// EXTENDED_VERBS.agc:1335
//		TS	L		# SET APSFLAG TO BE COMPLEMENT OF BIT 14.
// slot 18466
                        if slot <> 18466 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18467 {
// EXTENDED_VERBS.agc:1336
//# Page 293
// EXTENDED_VERBS.agc:1337
//		CS	DAPDATR1
// slot 18467
                            if slot <> 18467 or instruction <> 17123 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 739).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:1338
//		MASK	BIT14
// slot 18468
                            if slot <> 18468 or instruction <> 31198 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2526), 32768).
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
                    if slot <= 18469 {
// EXTENDED_VERBS.agc:1339
//		CCS	A
// slot 18469
                        if slot <> 18469 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18470 {
// EXTENDED_VERBS.agc:1340
//		CAF	APSFLBIT
// slot 18470
                            if slot <> 18470 or instruction <> 14815 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:1341
//		AD	L
// slot 18471
                            if slot <> 18471 or instruction <> 24577 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 1).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18474 {
                    if slot <= 18472 {
// EXTENDED_VERBS.agc:1342
//		TS	FLGWRD10
// slot 18472
                        if slot <> 18472 or instruction <> 22598 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22598, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18473 {
// EXTENDED_VERBS.agc:1343
//		CS	DAPDATR1	# SET BITS OF DAPBOOLS ON BASIS OF DISPLAY
// slot 18473
                            if slot <> 18473 or instruction <> 17123 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 739).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:1344
//		MASK	BIT13-14	#	MASK OUT CSMDOCKD (BIT 13) UNLESS BOTH
// slot 18474
                            if slot <> 18474 or instruction <> 30957 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2285), 32768).
                                if fixedOperand = 12288 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 4096), 4) * 4096).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18476 {
                        if slot <= 18475 {
// EXTENDED_VERBS.agc:1345
//		CCS	A		# 	13 AND 14 ARE SET.
// slot 18475
                            if slot <> 18475 or instruction <> 4096 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:1346
//		CS	CSMDOCKD
// slot 18476
                            if slot <> 18476 or instruction <> 18911 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18477 {
// EXTENDED_VERBS.agc:1347
//		AD	BOOLSMSK
// slot 18477
                            if slot <> 18477 or instruction <> 25676 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 1100), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:1348
//		MASK	DAPDATR1
// slot 18478
                            if slot <> 18478 or instruction <> 29411 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 739).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 18491 {
            if slot <= 18484 {
                if slot <= 18481 {
                    if slot <= 18479 {
// EXTENDED_VERBS.agc:1349
//		TS	L
// slot 18479
                        if slot <> 18479 or instruction <> 22529 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22529, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18480 {
// EXTENDED_VERBS.agc:1350
//		CS	BOOLSMSK
// slot 18480
                            if slot <> 18480 or instruction <> 17484 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 1100), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:1351
//		MASK	DAPBOOLS
// slot 18481
                            if slot <> 18481 or instruction <> 28745 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 73).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18482 {
// EXTENDED_VERBS.agc:1352
//		AD	L
// slot 18482
                        if slot <> 18482 or instruction <> 24577 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 1).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18483 {
// EXTENDED_VERBS.agc:1353
//		TS	DAPBOOLS
// slot 18483
                            if slot <> 18483 or instruction <> 22601 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22601, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:1354
//		MASK	CSMDOCKD	# LOAD MASS IN ACCORDANCE WITH CSMDOCKD.
// slot 18484
                            if slot <> 18484 or instruction <> 31199 { return choose false if checkOnly else -1. }
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
                        }
                    }
                }
            } else {
                if slot <= 18487 {
                    if slot <= 18485 {
// EXTENDED_VERBS.agc:1355
//		CCS	A		#	MASS IS USUALLY OKAY, SO DO
// slot 18485
                        if slot <> 18485 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18486 {
// EXTENDED_VERBS.agc:1356
//		CAE	CSMMASS		# 	NOT TOUCH ITS LOW-ORDER PART.
// slot 18486
                            if slot <> 18486 or instruction <> 13018 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 730).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:1357
//		AD	LEMMASS
// slot 18487
                            if slot <> 18487 or instruction <> 25305 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 729).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18489 {
                        if slot <= 18488 {
// EXTENDED_VERBS.agc:1358
//		TS	MASS
// slot 18488
                            if slot <> 18488 or instruction <> 23204 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23204, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:1359
//		CAE	DAPBOOLS
// slot 18489
                            if slot <> 18489 or instruction <> 12361 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCA(words, 73).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18490 {
// EXTENDED_VERBS.agc:1360
//		MASK	ACC4OR2X	# 2 OR 4 JET X-TRANSLATION
// slot 18490
                            if slot <> 18490 or instruction <> 31201 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                                if fixedOperand = 1024 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 1024), 2) * 1024).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:1361
//		EXTEND			# (BIT ACC4OR2X = 1 FOR 4 JETS)
// slot 18491
                            if slot <> 18491 or instruction <> 6 { return choose false if checkOnly else -1. }
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
            if slot <= 18497 {
                if slot <= 18494 {
                    if slot <= 18492 {
// EXTENDED_VERBS.agc:1362
//		BZF	+5
// slot 18492
                        if slot <> 18492 or instruction <> 5185 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5185, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18493 {
// EXTENDED_VERBS.agc:1363
//		CS	BIT15
// slot 18493
                            if slot <> 18493 or instruction <> 18909 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:1364
//		MASK	FLAGWRD1	# CLEAR NJTSFLAG TO 0 FOR 4 JETS
// slot 18494
                            if slot <> 18494 or instruction <> 28733 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 61).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 18495 {
// EXTENDED_VERBS.agc:1365
//		TS	FLAGWRD1
// slot 18495
                        if slot <> 18495 or instruction <> 22589 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22589, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18496 {
// EXTENDED_VERBS.agc:1366
//		TCF	+4
// slot 18496
                            if slot <> 18496 or instruction <> 5188 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5188, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:1367
//		CS	FLAGWRD1	# SET NJTSFLAG TO 1 FOR 2 JETS
// slot 18497
                            if slot <> 18497 or instruction <> 16445 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 61).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 18500 {
                    if slot <= 18498 {
// EXTENDED_VERBS.agc:1368
//		MASK	BIT15
// slot 18498
                        if slot <> 18498 or instruction <> 31197 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                            if fixedOperand = 16384 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 16384), 2) * 16384).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 18499 {
// EXTENDED_VERBS.agc:1369
//		ADS	FLAGWRD1
// slot 18499
                            if slot <> 18499 or instruction <> 11325 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 61).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:1370
//		CA	DAPBOOLS	# SELECT DESIRED KALCMANU AUTOMATIC
// slot 18500
                            if slot <> 18500 or instruction <> 12361 { return choose false if checkOnly else -1. }
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
                    if slot <= 18502 {
                        if slot <= 18501 {
// EXTENDED_VERBS.agc:1371
//		MASK	THREE		# MANEUVER RATE
// slot 18501
                            if slot <> 18501 or instruction <> 31909 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                set words[0] to agcOverflowCorrected(words[0]).
                                local fixedOperand is mod(readEffective:call(words, 3237), 32768).
                                if fixedOperand = 3 {
                                    set words[0] to agcSignExtend(mod(floor(words[0] / 1), 4) * 1).
                                } else {
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:1372
//		DOUBLE			# RATEINDX HAS TO BE 0,2,4,6 SINCE RATES
// slot 18502
                            if slot <> 18502 or instruction <> 24576 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 0).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 18503 {
// EXTENDED_VERBS.agc:1373
//		TS	RATEINDX	# ARE DP
// slot 18503
                            if slot <> 18503 or instruction <> 23253 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23253, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// EXTENDED_VERBS.agc:1374
//		TC	POSTJUMP
// slot 18504
                            if slot <> 18504 or instruction <> 2461 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2461, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1116] to agcAotUnit1116@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1375
//		CADR	STIKLOAD
// slot 18505
    18505, 2316,
// EXTENDED_VERBS.agc:1376
//
// EXTENDED_VERBS.agc:1377
//V01N46		VN	0146
// slot 18506
    18506, 348,
// EXTENDED_VERBS.agc:1378
//DSPLYMSK	OCT	33113
// slot 18507
    18507, 27798,
// EXTENDED_VERBS.agc:1379
//BOOLSMSK	OCT	13113
// slot 18508
    18508, 11414
)).

// bank 01, slots 3206-3228
function agcAotUnit51 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3216 {
        if slot <= 3210 {
            if slot <= 3207 {
                if slot <= 3206 {
// EXTENDED_VERBS.agc:1380
//
// EXTENDED_VERBS.agc:1381
//		BANK	01
// EXTENDED_VERBS.agc:1382
//		SETLOC	LOADDAP1
// EXTENDED_VERBS.agc:1383
//		BANK
// EXTENDED_VERBS.agc:1384
//
// EXTENDED_VERBS.agc:1385
//		COUNT*	$$/R03
// EXTENDED_VERBS.agc:1386
//
// EXTENDED_VERBS.agc:1387
//STIKLOAD	CAF	EBANK6
// slot 3206
                    if slot <> 3206 or instruction <> 14861 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:1388
//# Page 294
// EXTENDED_VERBS.agc:1389
//		TS	EBANK
// slot 3207
                    if slot <> 3207 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3208 {
// EXTENDED_VERBS.agc:1390
//		EBANK=	STIKSENS
// EXTENDED_VERBS.agc:1391
//		CA	RHCSCALE	# SET STICK SENSITIVITY TO CORRESPOND TO A
// slot 3208
                    if slot <> 3208 or instruction <> 14821 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3209 {
// EXTENDED_VERBS.agc:1392
//		MASK	DAPBOOLS	# MAXIMUM COMMANDED RATE (AT 42 COUNTS) OF
// slot 3209
                        if slot <> 3209 or instruction <> 28745 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 73).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:1393
//		CCS	A		# 20 D/S (NORMAL) OR 4 D/S (FINE), SCALED
// slot 3210
                        if slot <> 3210 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
            if slot <= 3213 {
                if slot <= 3211 {
// EXTENDED_VERBS.agc:1394
//		CA	NORMAL		# AT 45 D/S.
// slot 3211
                    if slot <> 3211 or instruction <> 13535 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1247), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3212 {
// EXTENDED_VERBS.agc:1395
//		AD	FINE
// slot 3212
                        if slot <> 3212 or instruction <> 25824 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 1248), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:1396
//		TS	STIKSENS
// slot 3213
                        if slot <> 3213 or instruction <> 23332 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23332, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3214 {
// EXTENDED_VERBS.agc:1397
//		CA	-0.6D/S
// slot 3214
                    if slot <> 3214 or instruction <> 13538 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1250), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3215 {
// EXTENDED_VERBS.agc:1398
//		TS	-RATEDB		# LM-ONLY BREAKOUT LEVEL IS .6 D/S.
// slot 3215
                        if slot <> 3215 or instruction <> 23358 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23358, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:1399
//		CA	CSMDOCKD	# IF CSM-DOCKED, DIVIDE STICK SENSITIVITY
// slot 3216
                        if slot <> 3216 or instruction <> 14815 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 3222 {
            if slot <= 3219 {
                if slot <= 3217 {
// EXTENDED_VERBS.agc:1400
//		MASK	DAPBOOLS	# BY 10.  NORMAL SCALING IS THEN 2 D/S AND
// slot 3217
                    if slot <> 3217 or instruction <> 28745 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 73).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3218 {
// EXTENDED_VERBS.agc:1401
//		EXTEND			# FINE SCALING IS 0.4 D/S
// slot 3218
                        if slot <> 3218 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:1402
//		BZF	+7		# BRANCH IF CSM IS NOT DOCKED.
// slot 3219
                        if slot <> 3219 or instruction <> 5274 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5274, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3220 {
// EXTENDED_VERBS.agc:1403
//		CA	STIKSENS
// slot 3220
                    if slot <> 3220 or instruction <> 13092 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 804).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3221 {
// EXTENDED_VERBS.agc:1404
//		EXTEND
// slot 3221
                        if slot <> 3221 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:1405
//		MP	1/10
// slot 3222
                        if slot <> 3222 or instruction <> 29921 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 1249, readEffective:call(words, 1249)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 3225 {
                if slot <= 3223 {
// EXTENDED_VERBS.agc:1406
//		TS	STIKSENS
// slot 3223
                    if slot <> 3223 or instruction <> 23332 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23332, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3224 {
// EXTENDED_VERBS.agc:1407
//		CA	-0.3D/S		# CSM-DOCKED BREAKOUT LEVEL IS .3 D/S.
// slot 3224
                        if slot <> 3224 or instruction <> 13539 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1251), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:1408
//		TS	-RATEDB
// slot 3225
                        if slot <> 3225 or instruction <> 23358 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23358, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3226 {
// EXTENDED_VERBS.agc:1409
//		RELINT			# PROCEED TO NOUN 47, MASS LOAD.
// slot 3226
                    if slot <> 3226 or instruction <> 3 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3227 {
// EXTENDED_VERBS.agc:1410
//
// EXTENDED_VERBS.agc:1411
//DAPDATA2	CAF	V0647
// slot 3227
                        if slot <> 3227 or instruction <> 13532 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1244), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:1412
//		TC	BANKCALL
// slot 3228
                        if slot <> 3228 or instruction <> 2446 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2446, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[51] to agcAotUnit51@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1413
//		CADR	GOXDSPFR
// slot 3229
    3229, 16854
)).

// bank 01, slots 3230-3237
function agcAotUnit52 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3233 {
        if slot <= 3231 {
            if slot <= 3230 {
// EXTENDED_VERBS.agc:1414
//		TCF	ENDR03		# V34E	TERMINATE. FIRST SET DB.  DO 1/ACCS
// slot 3230
                if slot <> 3230 or instruction <> 5284 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5284, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1415
//		TCF	DAPDAT2		# V33E	PROCEED
// slot 3231
                if slot <> 3231 or instruction <> 5288 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5288, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3232 {
// EXTENDED_VERBS.agc:1416
//		TCF	DAPDATA2	# 	LOAD NEW DATA AND RECYCLE
// slot 3232
                if slot <> 3232 or instruction <> 5275 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5275, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1417
//		CAF	BIT3		# BLANKS R3
// slot 3233
                if slot <> 3233 or instruction <> 14825 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 3235 {
            if slot <= 3234 {
// EXTENDED_VERBS.agc:1418
//		TC	BLANKET		#		LM
// slot 3234
                if slot <> 3234 or instruction <> 2868 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2868, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1419
//		TCF	ENDOFJOB
// slot 3235
                if slot <> 3235 or instruction <> 6765 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6765, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3236 {
// EXTENDED_VERBS.agc:1420
//ENDR03		INHINT
// slot 3236
                if slot <> 3236 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1421
//		TC	IBNKCALL
// slot 3237
                if slot <> 3237 or instruction <> 2492 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2492, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[52] to agcAotUnit52@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1422
//		CADR	RESTORDB
// slot 3238
    3238, 32934
)).

// bank 01, slots 3239-3261
function agcAotUnit53 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3249 {
        if slot <= 3243 {
            if slot <= 3240 {
                if slot <= 3239 {
// EXTENDED_VERBS.agc:1423
//		TCF	ENDEXT		# DOES RELINT
// slot 3239
                    if slot <> 3239 or instruction <> 6970 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6970, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:1424
//
// EXTENDED_VERBS.agc:1425
//DAPDAT2		CS	FLGWRD10	# DETERMINE STAGE FROM APSFLAG
// slot 3240
                    if slot <> 3240 or instruction <> 16454 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 70).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 3241 {
// EXTENDED_VERBS.agc:1426
//		MASK	APSFLBIT
// slot 3241
                    if slot <> 3241 or instruction <> 31199 { return choose false if checkOnly else -1. }
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
                    if slot <= 3242 {
// EXTENDED_VERBS.agc:1427
//		CCS	A
// slot 3242
                        if slot <> 3242 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:1428
//		CA	MINLMD
// slot 3243
                        if slot <> 3243 or instruction <> 13312 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1024), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 3246 {
                if slot <= 3244 {
// EXTENDED_VERBS.agc:1429
//		AD	MINMINLM
// slot 3244
                    if slot <> 3244 or instruction <> 25601 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 1025), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3245 {
// EXTENDED_VERBS.agc:1430
//		AD	LEMMASS		# LEMMASS MUST BE GREATER THAN EMPTY LEM
// slot 3245
                        if slot <> 3245 or instruction <> 25305 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 729).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:1431
//		EXTEND
// slot 3246
                        if slot <> 3246 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3247 {
// EXTENDED_VERBS.agc:1432
//		BZMF	DAPDATA2	# ASK FOR NEW MASSES
// slot 3247
                    if slot <> 3247 or instruction <> 25755 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25755, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3248 {
// EXTENDED_VERBS.agc:1433
//		CAE	DAPBOOLS
// slot 3248
                        if slot <> 3248 or instruction <> 12361 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 73).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:1434
//		MASK	CSMDOCKD
// slot 3249
                        if slot <> 3249 or instruction <> 31199 { return choose false if checkOnly else -1. }
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
                    }
                }
            }
        }
    } else {
        if slot <= 3255 {
            if slot <= 3252 {
                if slot <= 3250 {
// EXTENDED_VERBS.agc:1435
//		EXTEND
// slot 3250
                    if slot <> 3250 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3251 {
// EXTENDED_VERBS.agc:1436
//		BZF	LEMALONE	# SKIP TEST ON CSMMASS IF NOT DOCKED.
// slot 3251
                        if slot <> 3251 or instruction <> 5305 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5305, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:1437
//		CS	MINCSM		# TEST CSM MASS
// slot 3252
                        if slot <> 3252 or instruction <> 18913 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3253 {
// EXTENDED_VERBS.agc:1438
//		AD	CSMMASS		# CSMMASS MUST BE GREATER THAN EMPTY CSM
// slot 3253
                    if slot <> 3253 or instruction <> 25306 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 730).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3254 {
// EXTENDED_VERBS.agc:1439
//# Page 295
// EXTENDED_VERBS.agc:1440
//		EXTEND
// slot 3254
                        if slot <> 3254 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:1441
//		BZMF	DAPDATA2	# ASK FOR NEW MASSES
// slot 3255
                        if slot <> 3255 or instruction <> 25755 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 25755, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 3258 {
                if slot <= 3256 {
// EXTENDED_VERBS.agc:1442
//		CAE	CSMMASS		# DOCKED:  MASS = CSMMASS + LEMMASS
// slot 3256
                    if slot <> 3256 or instruction <> 13018 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 730).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3257 {
// EXTENDED_VERBS.agc:1443
//LEMALONE	AD	LEMMASS		# LEM ALONE:  MASS = LEMMASS
// slot 3257
                        if slot <> 3257 or instruction <> 25305 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 729).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:1444
//		ZL
// slot 3258
                        if slot <> 3258 or instruction <> 9223 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreExchange(words, 1, 7, readPhysical).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 3259 {
// EXTENDED_VERBS.agc:1445
//		DXCH	MASS
// slot 3259
                    if slot <> 3259 or instruction <> 22181 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 677, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 3260 {
// EXTENDED_VERBS.agc:1446
//		INHINT
// slot 3260
                        if slot <> 3260 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// EXTENDED_VERBS.agc:1447
//		TC	IBNKCALL	# SET DEADBANK AND COMPUTE MOMENTS OF
// slot 3261
                        if slot <> 3261 or instruction <> 2492 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2492, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[53] to agcAotUnit53@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1448
//		CADR	RESTORDB	#	INERTIA.
// slot 3262
    3262, 32934
)).

// bank 01, slots 3263-3269
function agcAotUnit54 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3265 {
        if slot <= 3263 {
// EXTENDED_VERBS.agc:1449
//		RELINT			# PROCEED TO NOUN 48 (OR END).
// slot 3263
            if slot <> 3263 or instruction <> 3 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3264 {
// EXTENDED_VERBS.agc:1450
//
// EXTENDED_VERBS.agc:1451
//DAPDATA3	CS	FLGWRD10
// slot 3264
                if slot <> 3264 or instruction <> 16454 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 70).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1452
//		MASK	APSFLBIT
// slot 3265
                if slot <> 3265 or instruction <> 31199 { return choose false if checkOnly else -1. }
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
            }
        }
    } else {
        if slot <= 3267 {
            if slot <= 3266 {
// EXTENDED_VERBS.agc:1453
//		EXTEND			# END ROUTINE IF LEM HAS STAGED.
// slot 3266
                if slot <> 3266 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1454
//		BZF	ENDEXT
// slot 3267
                if slot <> 3267 or instruction <> 6970 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6970, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3268 {
// EXTENDED_VERBS.agc:1455
//		CAF	V06N48		# DISPLAY TRIM ANGLES AND REQUEST RESPONSE
// slot 3268
                if slot <> 3268 or instruction <> 13533 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1245), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1456
//		TC	BANKCALL
// slot 3269
                if slot <> 3269 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[54] to agcAotUnit54@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1457
//		CADR	GOXDSPFR
// slot 3270
    3270, 16854
)).

// bank 01, slots 3271-3279
function agcAotUnit55 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3274 {
        if slot <= 3272 {
            if slot <= 3271 {
// EXTENDED_VERBS.agc:1458
//		TC	ENDEXT
// slot 3271
                if slot <> 3271 or instruction <> 2874 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2874, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1459
//		TCF	DPDAT3		# V33E GO DO TRIM (WAITLIST TO TRIMGIMB)
// slot 3272
                if slot <> 3272 or instruction <> 5325 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5325, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3273 {
// EXTENDED_VERBS.agc:1460
//		TCF	-5		# LOAD NEW DATA AND RECYCLE
// slot 3273
                if slot <> 3273 or instruction <> 5316 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5316, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1461
//		CAF	BIT3
// slot 3274
                if slot <> 3274 or instruction <> 14825 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 3276 {
            if slot <= 3275 {
// EXTENDED_VERBS.agc:1462
//		TC	BLANKET		# BLANK R3
// slot 3275
                if slot <> 3275 or instruction <> 2868 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2868, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1463
//		TCF	ENDOFJOB
// slot 3276
                if slot <> 3276 or instruction <> 6765 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6765, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 3277 {
// EXTENDED_VERBS.agc:1464
//DPDAT3		CAF	BIT1		# GO TO TRIMGIMB VIA WAITLIST SO IT
// slot 3277
                if slot <> 3277 or instruction <> 14827 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 3278 {
// EXTENDED_VERBS.agc:1465
//		INHINT			# CAN USE FIXDELAY AND VARDELAY
// slot 3278
                    if slot <> 3278 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:1466
//		TC	WAITLIST
// slot 3279
                    if slot <> 3279 or instruction <> 2691 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2691, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[55] to agcAotUnit55@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1467
//		EBANK=	ROLLTIME
// EXTENDED_VERBS.agc:1468
//		2CADR	TRIMGIMB
// slot 3280 3281
    3280, 3358, 3281, 47212
)).

// bank 01, slots 3282-3284
function agcAotUnit56 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3282 {
// EXTENDED_VERBS.agc:1469
//
// EXTENDED_VERBS.agc:1470
//		TCF	ENDOFJOB	# DOES A RELINT
// slot 3282
        if slot <> 3282 or instruction <> 6765 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6765, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 3283 {
// EXTENDED_VERBS.agc:1471
//TRIMDONE	CAF	V50N48
// slot 3283
            if slot <> 3283 or instruction <> 13534 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1246), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:1472
//		TC	BANKCALL	# TRIM IS FINISHED; PLEASE TERMINATE R03
// slot 3284
            if slot <> 3284 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[56] to agcAotUnit56@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1473
//		CADR	GOMARK3R
// slot 3285
    3285, 16866
)).

// bank 01, slots 3286-3291
function agcAotUnit57 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 3288 {
        if slot <= 3286 {
// EXTENDED_VERBS.agc:1474
//		TC	ENDEXT		# V34E TERMINATE
// slot 3286
            if slot <> 3286 or instruction <> 2874 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2874, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3287 {
// EXTENDED_VERBS.agc:1475
//		TC	ENDEXT
// slot 3287
                if slot <> 3287 or instruction <> 2874 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2874, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1476
//		TC	ENDEXT
// slot 3288
                if slot <> 3288 or instruction <> 2874 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2874, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 3289 {
// EXTENDED_VERBS.agc:1477
//		CAF	OCT24		# BIT5 TO CHANGE TO PERFORM, 3 TO BLANK 43
// slot 3289
            if slot <> 3289 or instruction <> 15367 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 3079), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 3290 {
// EXTENDED_VERBS.agc:1478
//		TC	BLANKET
// slot 3290
                if slot <> 3290 or instruction <> 2868 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2868, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1479
//		TCF	ENDOFJOB
// slot 3291
                if slot <> 3291 or instruction <> 6765 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6765, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[57] to agcAotUnit57@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1480
//
// EXTENDED_VERBS.agc:1481
//V0647		VN	0647
// slot 3292
    3292, 1630,
// EXTENDED_VERBS.agc:1482
//V06N48		VN	0648
// slot 3293
    3293, 1632,
// EXTENDED_VERBS.agc:1483
//
// EXTENDED_VERBS.agc:1484
//V50N48		VN	5048
// slot 3294
    3294, 12896,
// EXTENDED_VERBS.agc:1485
//NORMAL		DEC	.660214
// slot 3295
    3295, 21634,
// EXTENDED_VERBS.agc:1486
//					# NORMAL SCALING IS 20 D/S
// EXTENDED_VERBS.agc:1487
//FINE		DEC	.165054		# FINE STICK SCALING (4 D/S).
// slot 3296
    3296, 5408,
// EXTENDED_VERBS.agc:1488
//1/10		DEC	.1		# FACTOR FOR CSM-DOCKED SCALING
// slot 3297
    3297, 3276,
// EXTENDED_VERBS.agc:1489
//-0.6D/S		DEC	-218
// slot 3298
    3298, 65098,
// EXTENDED_VERBS.agc:1490
//
// EXTENDED_VERBS.agc:1491
//# Page 296
// EXTENDED_VERBS.agc:1492
//
// EXTENDED_VERBS.agc:1493
//-0.3D/S		DEC	-109
// slot 3299
    3299, 65316
)).

// bank 43, slots 38498-38499
function agcAotUnit2619 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38498 {
// EXTENDED_VERBS.agc:1494
//
// EXTENDED_VERBS.agc:1495
//# Page 297
// EXTENDED_VERBS.agc:1496
//# VERB 66	VEHICLES ARE ATTACHED. MOVE THIS VEHICLE STATE VECTOR TO
// EXTENDED_VERBS.agc:1497
//#		OTHER VEHICLE STATE VECTOR.
// EXTENDED_VERBS.agc:1498
//#
// EXTENDED_VERBS.agc:1499
//# USE SUBROUTINE GENTRAN.
// EXTENDED_VERBS.agc:1500
//
// EXTENDED_VERBS.agc:1501
//		BANK	7
// EXTENDED_VERBS.agc:1502
//		SETLOC	EXTVERBS
// EXTENDED_VERBS.agc:1503
//		BANK
// EXTENDED_VERBS.agc:1504
//
// EXTENDED_VERBS.agc:1505
//		COUNT*	$$/EXTVB
// EXTENDED_VERBS.agc:1506
//
// EXTENDED_VERBS.agc:1507
//		EBANK=	RRECTHIS
// EXTENDED_VERBS.agc:1508
//
// EXTENDED_VERBS.agc:1509
//ATTACHED	CAF	PRIO10
// slot 38498
        if slot <> 38498 or instruction <> 14815 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2527), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// EXTENDED_VERBS.agc:1510
//		TC	FINDVAC
// slot 38499
        if slot <> 38499 or instruction <> 2629 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2629, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2619] to agcAotUnit2619@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1511
//		EBANK=	RRECTHIS
// EXTENDED_VERBS.agc:1512
//
// EXTENDED_VERBS.agc:1513
//		2CADR	ATTACHIT
// slot 38500 38501
    38500, 3278, 38501, 55430
)).

// bank 43, slots 38502-38503
function agcAotUnit2620 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38502 {
// EXTENDED_VERBS.agc:1514
//
// EXTENDED_VERBS.agc:1515
//		TC	ENDOFJOB
// slot 38502
        if slot <> 38502 or instruction <> 2669 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2669, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// EXTENDED_VERBS.agc:1516
//
// EXTENDED_VERBS.agc:1517
//ATTACHIT	TC	INTPRET
// slot 38503
        if slot <> 38503 or instruction <> 3103 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3103, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2620] to agcAotUnit2620@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1518
//		CALL
// slot 38504
    38504, 65320,
// EXTENDED_VERBS.agc:1519
//			INTSTALL
// slot 38505
    38505, 24088,
// EXTENDED_VERBS.agc:1520
//		SET	BON
// slot 38506
    38506, 35864,
// EXTENDED_VERBS.agc:1521
//			MOONOTH
// slot 38507
    38507, 4198,
// EXTENDED_VERBS.agc:1522
//			MOONTHIS
// slot 38508
    38508, 4488,
// EXTENDED_VERBS.agc:1523
//			+3
// slot 38509
    38509, 56544,
// EXTENDED_VERBS.agc:1524
//		CLEAR
// slot 38510
    38510, 65304,
// EXTENDED_VERBS.agc:1525
//			MOONOTH
// slot 38511
    38511, 4454,
// EXTENDED_VERBS.agc:1526
//		EXIT
// slot 38512
    38512, 65532
)).

// bank 43, slots 38513-38514
function agcAotUnit2621 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38513 {
// EXTENDED_VERBS.agc:1527
//		CAF	OCT51
// slot 38513
        if slot <> 38513 or instruction <> 13956 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1668), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// EXTENDED_VERBS.agc:1528
//		TC	GENTRAN
// slot 38514
        if slot <> 38514 or instruction <> 2916 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2916, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2621] to agcAotUnit2621@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1529
//		ADRES	RRECTHIS	# OUR STATE VECTOR INTO OTHER VIA GENTRAN
// slot 38515
    38515, 1836,
// EXTENDED_VERBS.agc:1530
//		ADRES	RRECTOTH
// slot 38516
    38516, 1752
)).

// bank 43, slots 38517-38517
function agcAotUnit2622 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:1531
//
// EXTENDED_VERBS.agc:1532
//		RELINT
// slot 38517
    if slot <> 38517 or instruction <> 3 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2622] to agcAotUnit2622@.

// bank 43, slots 38518-38518
function agcAotUnit2623 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:1533
//		TC	INTPRET
// slot 38518
    if slot <> 38518 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2623] to agcAotUnit2623@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1534
//		CALL			# UPDATE R-OTHER, V-OTHER
// slot 38519
    38519, 65320,
// EXTENDED_VERBS.agc:1535
//			PTOALEM
// slot 38520
    38520, 23520,
// EXTENDED_VERBS.agc:1536
//		LXA,2	CALL
// slot 38521
    38521, 38104,
// EXTENDED_VERBS.agc:1537
//			PBODY
// slot 38522
    38522, 2096,
// EXTENDED_VERBS.agc:1538
//			SVDWN1
// slot 38523
    38523, 22680,
// EXTENDED_VERBS.agc:1539
//		EXIT
// slot 38524
    38524, 65532
)).

// bank 43, slots 38525-38526
function agcAotUnit2624 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38525 {
// EXTENDED_VERBS.agc:1540
//
// EXTENDED_VERBS.agc:1541
//		CAF	TCPINAD
// slot 38525
        if slot <> 38525 or instruction <> 13957 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1669), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// EXTENDED_VERBS.agc:1542
//		INDEX	FIXLOC
// slot 38526
        if slot <> 38526 or instruction <> 20560 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2624] to agcAotUnit2624@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1543
//		TS	QPRET
// slot 38527
    38527, 45140
)).

// bank 43, slots 38528-38528
function agcAotUnit2625 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:1544
//		TC	POSTJUMP
// slot 38528
    if slot <> 38528 or instruction <> 2461 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2461, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2625] to agcAotUnit2625@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1545
//		CADR	INTWAKE		# FREE INTEGRATION AND EXIT.
// slot 38529
    38529, 24106,
// EXTENDED_VERBS.agc:1546
//
// EXTENDED_VERBS.agc:1547
//# Page 298
// EXTENDED_VERBS.agc:1548
//
// EXTENDED_VERBS.agc:1549
//TCPIN		RTB
// slot 38530
    38530, 65336,
// EXTENDED_VERBS.agc:1550
//			PINBRNCH
// slot 38531
    38531, 17488,
// EXTENDED_VERBS.agc:1551
//
// EXTENDED_VERBS.agc:1552
//OCT51		OCT	51
// slot 38532
    38532, 82,
// EXTENDED_VERBS.agc:1553
//TCPINAD		CADR	TCPIN
// slot 38533
    38533, 56580
)).

// bank 43, slots 38534-38534
function agcAotUnit2626 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// EXTENDED_VERBS.agc:1554
//
// EXTENDED_VERBS.agc:1555
//# VERB 96	SET QUITFLAT TO STOP INTEGRATION.
// EXTENDED_VERBS.agc:1556
//#
// EXTENDED_VERBS.agc:1557
//#	GO TO V37 WITH ZERO TO CAUSE P00.
// EXTENDED_VERBS.agc:1558
//#		STATEINT WILL CHECK QUITFLAG AND SKIP 1ST PASS,
// EXTENDED_VERBS.agc:1559
//#			THUS ALLOWING A 10 MINUT PERIOD WITHOUT INTEGRATION.
// EXTENDED_VERBS.agc:1560
//
// EXTENDED_VERBS.agc:1561
//VERB96		TC	UPFLAG		# QUITFLAG WILL CAUSE INTEGRATION TO EXIT
// slot 38534
    if slot <> 38534 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2626] to agcAotUnit2626@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1562
//		ADRES	QUITFLAG	#	AT NEXT TIMESTEP
// slot 38535
    38535, 290
)).

// bank 43, slots 38536-38537
function agcAotUnit2627 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38536 {
// EXTENDED_VERBS.agc:1563
//
// EXTENDED_VERBS.agc:1564
//		CAF	ZERO
// slot 38536
        if slot <> 38536 or instruction <> 14829 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// EXTENDED_VERBS.agc:1565
//		TC	POSTJUMP
// slot 38537
        if slot <> 38537 or instruction <> 2461 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2461, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2627] to agcAotUnit2627@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1566
//		CADR	V37		# GO TO P00
// slot 38538
    38538, 8256
)).

// bank 43, slots 38539-38541
function agcAotUnit2628 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38539 {
// EXTENDED_VERBS.agc:1567
//
// EXTENDED_VERBS.agc:1568
//# VERB 67:	DISPLAY OF W MATRIX
// EXTENDED_VERBS.agc:1569
//
// EXTENDED_VERBS.agc:1570
//V67		TC	TESTXACT
// slot 38539
        if slot <> 38539 or instruction <> 1086 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1086, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 38540 {
// EXTENDED_VERBS.agc:1571
//		CAF	PRIO5
// slot 38540
            if slot <> 38540 or instruction <> 14863 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:1572
//		TC	FINDVAC
// slot 38541
            if slot <> 38541 or instruction <> 2629 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2629, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2628] to agcAotUnit2628@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1573
//		EBANK=	WWPOS
// EXTENDED_VERBS.agc:1574
//		2CADR	V67CALL
// slot 38542 38543
    38542, 2062, 38543, 51304
)).

// bank 43, slots 38544-38545
function agcAotUnit2629 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38544 {
// EXTENDED_VERBS.agc:1575
//
// EXTENDED_VERBS.agc:1576
//		TC	ENDOFJOB
// slot 38544
        if slot <> 38544 or instruction <> 2669 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2669, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// EXTENDED_VERBS.agc:1577
//
// EXTENDED_VERBS.agc:1578
//# VERB 65	DISABLE U,V JETS DURING DPS BURNS
// EXTENDED_VERBS.agc:1579
//
// EXTENDED_VERBS.agc:1580
//SNUFFOUT	TC	UPFLAG
// slot 38545
        if slot <> 38545 or instruction <> 2884 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2884, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2629] to agcAotUnit2629@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1581
//		ADRES	SNUFFER
// slot 38546
    38546, 154
)).

// bank 43, slots 38547-38548
function agcAotUnit2630 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38547 {
// EXTENDED_VERBS.agc:1582
//		TC	GOPIN
// slot 38547
        if slot <> 38547 or instruction <> 1105 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1105, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// EXTENDED_VERBS.agc:1583
//
// EXTENDED_VERBS.agc:1584
//# VERB 75	ENABLE U,V JETS DURING DPS BURNS
// EXTENDED_VERBS.agc:1585
//
// EXTENDED_VERBS.agc:1586
//OUTSNUFF	TC	DOWNFLAG
// slot 38548
        if slot <> 38548 or instruction <> 2894 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2894, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2630] to agcAotUnit2630@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1587
//		ADRES	SNUFFER
// slot 38549
    38549, 154
)).

// bank 43, slots 38550-38552
function agcAotUnit2631 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38550 {
// EXTENDED_VERBS.agc:1588
//		TC	GOPIN
// slot 38550
        if slot <> 38550 or instruction <> 1105 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1105, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 38551 {
// EXTENDED_VERBS.agc:1589
//
// EXTENDED_VERBS.agc:1590
//# VERB 85	DISPLAY RR LOS AZIMUTH AND ELEVATION.
// EXTENDED_VERBS.agc:1591
//#
// EXTENDED_VERBS.agc:1592
//# AZIMUTH IS THE ANGLE BETWEEN THE LOS AND THE X-Z NB PLANE, 0-90 DEG IN THE +Y HEMISPHERE,
// EXTENDED_VERBS.agc:1593
//# 360-270 DEG IN THE -Y HEMISPHERE.
// EXTENDED_VERBS.agc:1594
//#
// EXTENDED_VERBS.agc:1595
//# ELEVATION IS THE ANGLE BETWEEN +ZNB AND THE PROJECTION OF THE LOS INTO THE X-Z PLANE, 0-360 ABOUT +Y.
// EXTENDED_VERBS.agc:1596
//
// EXTENDED_VERBS.agc:1597
//		EBANK=	RR-AZ
// EXTENDED_VERBS.agc:1598
//VERB85		TC	TESTXACT
// slot 38551
            if slot <> 38551 or instruction <> 1086 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1086, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:1599
//
// EXTENDED_VERBS.agc:1600
//# Page 299
// EXTENDED_VERBS.agc:1601
//
// EXTENDED_VERBS.agc:1602
//		TC	POSTJUMP
// slot 38552
            if slot <> 38552 or instruction <> 2461 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2461, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2631] to agcAotUnit2631@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1603
//		CADR	DSPRRLOS
// slot 38553
    38553, 49152
)).

// bank 40, slots 34816-34817
function agcAotUnit2296 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34816 {
// EXTENDED_VERBS.agc:1604
//
// EXTENDED_VERBS.agc:1605
//		SETLOC	PINBALL1
// EXTENDED_VERBS.agc:1606
//		BANK
// EXTENDED_VERBS.agc:1607
//
// EXTENDED_VERBS.agc:1608
//		COUNT*	$$/EXTVB
// EXTENDED_VERBS.agc:1609
//
// EXTENDED_VERBS.agc:1610
//DSPRRLOS	CAF	PRIO5
// slot 34816
        if slot <> 34816 or instruction <> 14863 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2575), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// EXTENDED_VERBS.agc:1611
//		TC	FINDVAC
// slot 34817
        if slot <> 34817 or instruction <> 2629 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2629, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2296] to agcAotUnit2296@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1612
//		EBANK=	RR-AZ
// EXTENDED_VERBS.agc:1613
//		2CADR	RRLOSDSP
// slot 34818 34819
    34818, 2078, 34819, 49288
)).

// bank 40, slots 34820-34823
function agcAotUnit2297 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34821 {
        if slot <= 34820 {
// EXTENDED_VERBS.agc:1614
//
// EXTENDED_VERBS.agc:1615
//		CAF	PRIO4
// slot 34820
            if slot <> 34820 or instruction <> 14816 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:1616
//		TC	PRIOCHNG
// slot 34821
            if slot <> 34821 or instruction <> 2662 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2662, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 34822 {
// EXTENDED_VERBS.agc:1617
//		CAF	V16N56
// slot 34822
            if slot <> 34822 or instruction <> 13374 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1086), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:1618
//		TC	BANKCALL
// slot 34823
            if slot <> 34823 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2297] to agcAotUnit2297@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1619
//		CADR	GOMARKFR
// slot 34824
    34824, 16854
)).

// bank 40, slots 34825-34834
function agcAotUnit2298 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34829 {
        if slot <= 34826 {
            if slot <= 34825 {
// EXTENDED_VERBS.agc:1620
//		TC	B5OFF
// slot 34825
                if slot <> 34825 or instruction <> 2931 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2931, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1621
//		TC	B5OFF
// slot 34826
                if slot <> 34826 or instruction <> 2931 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2931, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34827 {
// EXTENDED_VERBS.agc:1622
//		TC	B5OFF
// slot 34827
                if slot <> 34827 or instruction <> 2931 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2931, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34828 {
// EXTENDED_VERBS.agc:1623
//
// EXTENDED_VERBS.agc:1624
//		CAF	BIT3
// slot 34828
                    if slot <> 34828 or instruction <> 14825 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:1625
//		TC	BLANKET
// slot 34829
                    if slot <> 34829 or instruction <> 2868 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2868, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 34831 {
            if slot <= 34830 {
// EXTENDED_VERBS.agc:1626
//		TC	ENDOFJOB
// slot 34830
                if slot <> 34830 or instruction <> 2669 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2669, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1627
//
// EXTENDED_VERBS.agc:1628
//RRLOSDSP	EXTEND
// slot 34831
                if slot <> 34831 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 34832 {
// EXTENDED_VERBS.agc:1629
//		DCA	CDUT
// slot 34832
                if slot <> 34832 or instruction <> 12318 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 30, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 34833 {
// EXTENDED_VERBS.agc:1630
//		DXCH	MPAC
// slot 34833
                    if slot <> 34833 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// EXTENDED_VERBS.agc:1631
//		TC	INTPRET
// slot 34834
                    if slot <> 34834 or instruction <> 3103 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2298] to agcAotUnit2298@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1632
//		CALL
// slot 34835
    34835, 65320,
// EXTENDED_VERBS.agc:1633
//			RRNBMPAC	# GET RR LOS IN BODY AXIS.
// slot 34836
    34836, 39018,
// EXTENDED_VERBS.agc:1634
//		STORE	0D		# UNIT LOS
// slot 34837
    34837, 2,
// EXTENDED_VERBS.agc:1635
//		STODL	6D
// slot 34838
    34838, 12302,
// EXTENDED_VERBS.agc:1636
//			HI6ZEROS
// slot 34839
    34839, 6820,
// EXTENDED_VERBS.agc:1637
//		STOVL	8D
// slot 34840
    34840, 20498,
// EXTENDED_VERBS.agc:1638
//			6D
// slot 34841
    34841, 14,
// EXTENDED_VERBS.agc:1639
//		UNIT
// slot 34842
    34842, 65372,
// EXTENDED_VERBS.agc:1640
//		STORE	6D		# UNIT OF LOS PROJ IN X-Z PLANE
// slot 34843
    34843, 14,
// EXTENDED_VERBS.agc:1641
//		DOT
// slot 34844
    34844, 65346,
// EXTENDED_VERBS.agc:1642
//			UNITZ
// slot 34845
    34845, 6808,
// EXTENDED_VERBS.agc:1643
//		STOVL	COSTH		# 16D
// slot 34846
    34846, 20514,
// EXTENDED_VERBS.agc:1644
//			UNITX
// slot 34847
    34847, 6816,
// EXTENDED_VERBS.agc:1645
//		DOT
// slot 34848
    34848, 65346,
// EXTENDED_VERBS.agc:1646
//			6D
// slot 34849
    34849, 14,
// EXTENDED_VERBS.agc:1647
//		STCALL	SINTH		# 18D
// slot 34850
    34850, 28710,
// EXTENDED_VERBS.agc:1648
//			ARCTRIG
// slot 34851
    34851, 40352,
// EXTENDED_VERBS.agc:1649
//		BPL	DAD		# INSURE DISPLAY OF 0-360 DEG.
// slot 34852
    34852, 36168,
// EXTENDED_VERBS.agc:1650
//			+2
// slot 34853
    34853, 49230,
// EXTENDED_VERBS.agc:1651
//			DPPOSMAX	# INTRODUCES AND ERROR OF B-28 REVS.
// slot 34854
    34854, 6832,
// EXTENDED_VERBS.agc:1652
//
// EXTENDED_VERBS.agc:1653
//# Page 300
// EXTENDED_VERBS.agc:1654
//
// EXTENDED_VERBS.agc:1655
//		STOVL	RR-ELEV
// slot 34855
    34855, 22790,
// EXTENDED_VERBS.agc:1656
//			0D
// slot 34856
    34856, 2,
// EXTENDED_VERBS.agc:1657
//		DOT
// slot 34857
    34857, 65346,
// EXTENDED_VERBS.agc:1658
//			UNITY
// slot 34858
    34858, 6812,
// EXTENDED_VERBS.agc:1659
//		STOVL	SINTH
// slot 34859
    34859, 20518,
// EXTENDED_VERBS.agc:1660
//			0D
// slot 34860
    34860, 2,
// EXTENDED_VERBS.agc:1661
//		DOT
// slot 34861
    34861, 65346,
// EXTENDED_VERBS.agc:1662
//			6D
// slot 34862
    34862, 14,
// EXTENDED_VERBS.agc:1663
//		STCALL	COSTH
// slot 34863
    34863, 28706,
// EXTENDED_VERBS.agc:1664
//			ARCTRIG
// slot 34864
    34864, 40352,
// EXTENDED_VERBS.agc:1665
//		BPL	DAD		# INSURE DISPLAY OF 0-360 DEG.
// slot 34865
    34865, 36168,
// EXTENDED_VERBS.agc:1666
//			+2
// slot 34866
    34866, 49256,
// EXTENDED_VERBS.agc:1667
//			DPPOSMAX	# INTRODUCES AN ERROR OF B-28 REVS.
// slot 34867
    34867, 6832,
// EXTENDED_VERBS.agc:1668
//		STORE	RR-AZ
// slot 34868
    34868, 2306,
// EXTENDED_VERBS.agc:1669
//		EXIT
// slot 34869
    34869, 65532
)).

// bank 40, slots 34870-34871
function agcAotUnit2299 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34870 {
// EXTENDED_VERBS.agc:1670
//		CA	1SEC
// slot 34870
        if slot <> 34870 or instruction <> 14847 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2559), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// EXTENDED_VERBS.agc:1671
//		TC	BANKCALL
// slot 34871
        if slot <> 34871 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2299] to agcAotUnit2299@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1672
//		CADR	DELAYJOB
// slot 34872
    34872, 1978
)).

// bank 40, slots 34873-34877
function agcAotUnit2300 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 34874 {
        if slot <= 34873 {
// EXTENDED_VERBS.agc:1673
//
// EXTENDED_VERBS.agc:1674
//		CA	BIT5
// slot 34873
            if slot <> 34873 or instruction <> 14823 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// EXTENDED_VERBS.agc:1675
//		MASK	EXTVBACT
// slot 34874
            if slot <> 34874 or instruction <> 29220 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 548).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 34875 {
// EXTENDED_VERBS.agc:1676
//		CCS	A
// slot 34875
            if slot <> 34875 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 34876 {
// EXTENDED_VERBS.agc:1677
//		TC	RRLOSDSP
// slot 34876
                if slot <> 34876 or instruction <> 1039 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1039, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// EXTENDED_VERBS.agc:1678
//		TC	ENDEXT
// slot 34877
                if slot <> 34877 or instruction <> 2874 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2874, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2300] to agcAotUnit2300@.

agcAotInstallSourceRope(list(
// EXTENDED_VERBS.agc:1679
//
// EXTENDED_VERBS.agc:1680
//V16N56		VN	1656
// slot 34878
    34878, 4208
)).

// no code for the lines below
// EXTENDED_VERBS.agc:1681
//
