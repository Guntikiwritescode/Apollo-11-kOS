// PORT: Original source unit EXTENDED_VERBS.agc.
// PORT: Physical bank 43. Shared continuation entries, slots 37888–37888.
function agcAotUnit2209 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXTENDED_VERBS.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE EXTENDED_VERBS.agc:2
//# Filename:	EXTENDED_VERBS.agc
// PORT: SOURCE EXTENDED_VERBS.agc:3
//# Purpose:	Part of the source code for Comanche, build 055. It
// PORT: SOURCE EXTENDED_VERBS.agc:4
//#		is part of the source code for the Command Module's
// PORT: SOURCE EXTENDED_VERBS.agc:5
//#		(CM) Apollo Guidance Computer (AGC), Apollo 11.
// PORT: SOURCE EXTENDED_VERBS.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE EXTENDED_VERBS.agc:7
//# Reference:	pp. 236-267
// PORT: SOURCE EXTENDED_VERBS.agc:8
//# Contact:	Ron Burkey <info@sandroid.org>,
// PORT: SOURCE EXTENDED_VERBS.agc:9
//#  		Fabrizio Bernardini <fabrizio@spacecraft.it>
// PORT: SOURCE EXTENDED_VERBS.agc:10
//# Website:	http://www.ibiblio.org/apollo.
// PORT: SOURCE EXTENDED_VERBS.agc:11
//# Mod history:	2009-05-18 FB	Transcription Batch 3 Assignment.
// PORT: SOURCE EXTENDED_VERBS.agc:12
//#		2009-05-20 RSB	Corrections:  POODOO -> P00DOO,
// PORT: SOURCE EXTENDED_VERBS.agc:13
//#				GOTOPOOH -> GOTOPOOH, added a couple of
// PORT: SOURCE EXTENDED_VERBS.agc:14
//#				missing instructions in Verb 96.
// PORT: SOURCE EXTENDED_VERBS.agc:15
//#		2009-05-23 RSB	In SYSTEST, corrected TC FLAGWRD1 to
// PORT: SOURCE EXTENDED_VERBS.agc:16
//#				CA FLAGWRD1.  Added a variety of SBANK=
// PORT: SOURCE EXTENDED_VERBS.agc:17
//#				statements prior to 2CADRs.  One day I'll
// PORT: SOURCE EXTENDED_VERBS.agc:18
//#				have to figure out what yaYUL is doing
// PORT: SOURCE EXTENDED_VERBS.agc:19
//#				wrong with those ....
// PORT: SOURCE EXTENDED_VERBS.agc:20
//#
// PORT: SOURCE EXTENDED_VERBS.agc:21
//# The contents of the "Comanche055" files, in general, are transcribed
// PORT: SOURCE EXTENDED_VERBS.agc:22
//# from scanned documents.
// PORT: SOURCE EXTENDED_VERBS.agc:23
//#
// PORT: SOURCE EXTENDED_VERBS.agc:24
//#	Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE EXTENDED_VERBS.agc:25
//#	2021113-051.  April 1, 1969.
// PORT: SOURCE EXTENDED_VERBS.agc:26
//#
// PORT: SOURCE EXTENDED_VERBS.agc:27
//#	This AGC program shall also be referred to as Colossus 2A
// PORT: SOURCE EXTENDED_VERBS.agc:28
//#
// PORT: SOURCE EXTENDED_VERBS.agc:29
//#	Prepared by
// PORT: SOURCE EXTENDED_VERBS.agc:30
//#			Massachusetts Institute of Technology
// PORT: SOURCE EXTENDED_VERBS.agc:31
//#			75 Cambridge Parkway
// PORT: SOURCE EXTENDED_VERBS.agc:32
//#			Cambridge, Massachusetts
// PORT: SOURCE EXTENDED_VERBS.agc:33
//#
// PORT: SOURCE EXTENDED_VERBS.agc:34
//#	under NASA contract NAS 9-4065.
// PORT: SOURCE EXTENDED_VERBS.agc:35
//#
// PORT: SOURCE EXTENDED_VERBS.agc:36
//# Refer directly to the online document mentioned above for further
// PORT: SOURCE EXTENDED_VERBS.agc:37
//# information.  Please report any errors to info@sandroid.org.
// PORT: SOURCE EXTENDED_VERBS.agc:38
//
// PORT: SOURCE EXTENDED_VERBS.agc:39
//# Page 236
// PORT: SOURCE EXTENDED_VERBS.agc:40
//		BANK	7
// PORT: SOURCE EXTENDED_VERBS.agc:41
//		SETLOC	EXTVERBS
// PORT: SOURCE EXTENDED_VERBS.agc:42
//		BANK
// PORT: SOURCE EXTENDED_VERBS.agc:43
//
// PORT: SOURCE EXTENDED_VERBS.agc:44
//		EBANK=	OGC
// PORT: SOURCE EXTENDED_VERBS.agc:45
//
// PORT: SOURCE EXTENDED_VERBS.agc:46
//		COUNT*	$$/EXTVB
// PORT: SOURCE EXTENDED_VERBS.agc:47
//
// PORT: SOURCE EXTENDED_VERBS.agc:48
//# FAN-OUT
// PORT: SOURCE EXTENDED_VERBS.agc:49
//
// PORT: SOURCE EXTENDED_VERBS.agc:50
//GOEXTVB		INDEX	MPAC		# VERB-40 IS IN MPAC
// PORT: Fixed ROM slots 37888.
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
set agcAotRoutes[2209] to agcAotUnit2209@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:51
//		TC	LST2FAN		# FAN AS BEFORE.
// PORT: Fixed ROM slots 37889.
    37889, 2052
)).

// PORT: Physical bank 43. Shared continuation entries, slots 37890–37969.
function agcAotUnit2210 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 37929 {
        if slot <= 37909 {
            if slot <= 37899 {
                if slot <= 37894 {
                    if slot <= 37891 {
                        if slot <= 37890 {
// PORT: SOURCE EXTENDED_VERBS.agc:52
//
// PORT: SOURCE EXTENDED_VERBS.agc:53
//LST2FAN		TC	VBZERO		# VB40 ZERO (USED WITH NOUN 20 ONLY).
// PORT: Fixed ROM slots 37890.
                            if slot <> 37890 or instruction <> 1108 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1108, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:54
//		TC	VBCOARK		# VB41 COARSE ALIGN (USED WITH NOUN 20 OR
// PORT: Fixed ROM slots 37891.
                            if slot <> 37891 or instruction <> 1128 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1128, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37892 {
// PORT: SOURCE EXTENDED_VERBS.agc:55
//					#				91 ONLY)
// PORT: SOURCE EXTENDED_VERBS.agc:56
//		TC	IMUFINEK	# VB42 FINE ALIGN IMU
// PORT: Fixed ROM slots 37892.
                            if slot <> 37892 or instruction <> 1184 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1184, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37893 {
// PORT: SOURCE EXTENDED_VERBS.agc:57
//		TC	IMUATTCK	# VB43 LOAD IMU ATTITUDE ERROR METERS.
// PORT: Fixed ROM slots 37893.
                                if slot <> 37893 or instruction <> 1296 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1296, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:58
//		TC	SETSURF		# VB44 SET SURFACE FLAG
// PORT: Fixed ROM slots 37894.
                                if slot <> 37894 or instruction <> 1671 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1671, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 37896 {
                        if slot <= 37895 {
// PORT: SOURCE EXTENDED_VERBS.agc:59
//		TC	RESTSRF		# VB45 RESET SURFACE FLAG
// PORT: Fixed ROM slots 37895.
                            if slot <> 37895 or instruction <> 1674 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1674, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:60
//		TC	STABLISH	# VB46 ESTABLISH G+C CONTROL.
// PORT: Fixed ROM slots 37896.
                            if slot <> 37896 or instruction <> 1364 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1364, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37897 {
// PORT: SOURCE EXTENDED_VERBS.agc:61
//		TC	LMTOCMSV	# VB47 MOVE LM STATE VECTOR INTO CM
// PORT: Fixed ROM slots 37897.
                            if slot <> 37897 or instruction <> 1602 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1602, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37898 {
// PORT: SOURCE EXTENDED_VERBS.agc:62
//		TC	DAPDISP		# VB48 LOAD A/P DATA.
// PORT: Fixed ROM slots 37898.
                                if slot <> 37898 or instruction <> 1386 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1386, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:63
//		TCF	CREWMANU	# VB 49 START AUTOMATIC ATTITUDE MANEUVER
// PORT: Fixed ROM slots 37899.
                                if slot <> 37899 or instruction <> 5475 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5475, words[0], readEffective).
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
// PORT: SOURCE EXTENDED_VERBS.agc:64
//		TC	GOLOADLV	# VB50 PLEASE PERFORM
// PORT: Fixed ROM slots 37900.
                            if slot <> 37900 or instruction <> 1213 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1213, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:65
//		TC	GOLOADLV	# VB51 PLEASE MARK
// PORT: Fixed ROM slots 37901.
                            if slot <> 37901 or instruction <> 1213 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1213, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37902 {
// PORT: SOURCE EXTENDED_VERBS.agc:66
//		TC	V52		# VB52 SET OFFSET NO. FOR P22
// PORT: Fixed ROM slots 37902.
                            if slot <> 37902 or instruction <> 1647 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1647, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37903 {
// PORT: SOURCE EXTENDED_VERBS.agc:67
//		TC	GOLOADLV	# VB 53 PLEASE PERFORM COAS MARK
// PORT: Fixed ROM slots 37903.
                                if slot <> 37903 or instruction <> 1213 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1213, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:68
//		TC	GOTOR23		# VB54 PLEASE MARK (R-21-BACKUP)
// PORT: Fixed ROM slots 37904.
                                if slot <> 37904 or instruction <> 1418 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1418, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 37906 {
                        if slot <= 37905 {
// PORT: SOURCE EXTENDED_VERBS.agc:69
//		TC	ALINTIME	# VB55 ALIGN TIME
// PORT: Fixed ROM slots 37905.
                            if slot <> 37905 or instruction <> 1238 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1238, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:70
//		TC	TRACKTRM	# VB56 TERMINATE TRACKING (P20 +P25)
// PORT: Fixed ROM slots 37906.
                            if slot <> 37906 or instruction <> 1451 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1451, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37907 {
// PORT: SOURCE EXTENDED_VERBS.agc:71
//		TC	GOTOR21		# V57 START R21 REND TRACK SIGHT MARK ROUT
// PORT: Fixed ROM slots 37907.
                            if slot <> 37907 or instruction <> 1415 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1415, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37908 {
// PORT: SOURCE EXTENDED_VERBS.agc:72
//		TC	ENATMA		# VB58 ENABLE AUTOMATIC ATTITUDE MANEUVER
// PORT: Fixed ROM slots 37908.
                                if slot <> 37908 or instruction <> 1352 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1352, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:73
//		TC	GOLOADLV	# VB59 PLEASE CALIBRATE
// PORT: Fixed ROM slots 37909.
                                if slot <> 37909 or instruction <> 1213 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1213, words[0], readEffective).
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
// PORT: SOURCE EXTENDED_VERBS.agc:74
//		TC	V60		# VB60 SET CPHIX (N17) EQUAL TO CDU
// PORT: Fixed ROM slots 37910.
                            if slot <> 37910 or instruction <> 1219 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1219, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:75
//		TC	V61		# VB61 SELECT MODE I
// PORT: Fixed ROM slots 37911.
                            if slot <> 37911 or instruction <> 1225 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1225, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37912 {
// PORT: SOURCE EXTENDED_VERBS.agc:76
//		TC	V62		# VB62 SELECT MODE II, ERROR WRT N22
// PORT: Fixed ROM slots 37912.
                            if slot <> 37912 or instruction <> 1228 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1228, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37913 {
// PORT: SOURCE EXTENDED_VERBS.agc:77
//		TC	V63		# VB63 SELECT MODE III, ERROR WRT N17
// PORT: Fixed ROM slots 37913.
                                if slot <> 37913 or instruction <> 1233 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1233, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:78
//		TC	VB64		# VB64 CALCULATE,DISPLAY S-BAND ANT ANGLES
// PORT: Fixed ROM slots 37914.
                                if slot <> 37914 or instruction <> 1344 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1344, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 37916 {
                        if slot <= 37915 {
// PORT: SOURCE EXTENDED_VERBS.agc:79
//		TC	CKOPTVB		# V 65 E OPTICAL VERIFICATION FOR PRELAUNC
// PORT: Fixed ROM slots 37915.
                            if slot <> 37915 or instruction <> 1277 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1277, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:80
//		TC	ATTACHED	# VB 66 ATTACHED. MOVE THIS TO OTHER STATE
// PORT: Fixed ROM slots 37916.
                            if slot <> 37916 or instruction <> 1564 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1564, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37917 {
// PORT: SOURCE EXTENDED_VERBS.agc:81
//		TC	V67		# VB67 WMATRIX MONITOR
// PORT: Fixed ROM slots 37917.
                            if slot <> 37917 or instruction <> 1665 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1665, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37918 {
// PORT: SOURCE EXTENDED_VERBS.agc:82
//		TC	STROKON		# VB68 CSM STROKE TEST ON.
// PORT: Fixed ROM slots 37918.
                                if slot <> 37918 or instruction <> 1355 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1355, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:83
//VERB69		TC	VERB69		# VB 69 CAUSE RESTART
// PORT: Fixed ROM slots 37919.
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
// PORT: SOURCE EXTENDED_VERBS.agc:84
//		TC	V70UPDAT	# VB70 UPDATE LIFTOFF TIME.
// PORT: Fixed ROM slots 37920.
                            if slot <> 37920 or instruction <> 2006 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2006, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:85
//		TC	V71UPDAT	# VB71 UNIVERSAL UPDATE - BLOCK ADDRESS.
// PORT: Fixed ROM slots 37921.
                            if slot <> 37921 or instruction <> 2008 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2008, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37922 {
// PORT: SOURCE EXTENDED_VERBS.agc:86
//		TC	V72UPDAT	# VB72 UNIVERSAL UPDATE - SINGLE ADDRESS.
// PORT: Fixed ROM slots 37922.
                            if slot <> 37922 or instruction <> 2010 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2010, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37923 {
// PORT: SOURCE EXTENDED_VERBS.agc:87
//		TC	V73UPDAT	# VB73 UPDATE AGC TIME (OCTAL).
// PORT: Fixed ROM slots 37923.
                                if slot <> 37923 or instruction <> 2012 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 2012, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:88
//		TC	DNEDUMP		# VB74 INITIALIZE DOWN-TELEMETRY PROGRAM
// PORT: Fixed ROM slots 37924.
                                if slot <> 37924 or instruction <> 1489 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1489, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 37926 {
                        if slot <= 37925 {
// PORT: SOURCE EXTENDED_VERBS.agc:89
//					#	FOR ERASABLE DUMP.
// PORT: SOURCE EXTENDED_VERBS.agc:90
//		TC	LFTFLGON	# VB75 SET LIFTOFF FLAG.
// PORT: Fixed ROM slots 37925.
                            if slot <> 37925 or instruction <> 1493 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1493, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:91
//# Page 237
// PORT: SOURCE EXTENDED_VERBS.agc:92
//		TC	SETPRFLG	# VB76 SET PREFERRED ATTITUDE FLAG
// PORT: Fixed ROM slots 37926.
                            if slot <> 37926 or instruction <> 1549 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1549, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37927 {
// PORT: SOURCE EXTENDED_VERBS.agc:93
//		TC	RESETPRF	# VB77 RESET PREFERRED ATT. FLAG
// PORT: Fixed ROM slots 37927.
                            if slot <> 37927 or instruction <> 1552 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1552, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37928 {
// PORT: SOURCE EXTENDED_VERBS.agc:94
//		TC	CHAZFOGC	# CHANGE GYROCOMPASS LAUNCH AZIMUTH V78
// PORT: Fixed ROM slots 37928.
                                if slot <> 37928 or instruction <> 1286 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1286, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:95
//		TC	ALM/END		# V79 SPARE
// PORT: Fixed ROM slots 37929.
                                if slot <> 37929 or instruction <> 1104 { return choose false if checkOnly else -1. }
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
        }
    } else {
        if slot <= 37949 {
            if slot <= 37939 {
                if slot <= 37934 {
                    if slot <= 37931 {
                        if slot <= 37930 {
// PORT: SOURCE EXTENDED_VERBS.agc:96
//		TC	LEMVEC		# VB80 UPDATE LEM STATE VECTOR
// PORT: Fixed ROM slots 37930.
                            if slot <> 37930 or instruction <> 1483 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1483, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:97
//		TC	CSMVEC		# VB81 UPDATE CSM STATE VECTOR
// PORT: Fixed ROM slots 37931.
                            if slot <> 37931 or instruction <> 1486 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1486, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37932 {
// PORT: SOURCE EXTENDED_VERBS.agc:98
//		TC	V82PERF		# VB82 REQUEST ORBIT PARAM DISPLAY (R30)
// PORT: Fixed ROM slots 37932.
                            if slot <> 37932 or instruction <> 1394 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1394, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37933 {
// PORT: SOURCE EXTENDED_VERBS.agc:99
//		TC	V83PERF		# VB83 RANGE, RANGE RATE, +X AXIS  (R31)
// PORT: Fixed ROM slots 37933.
                                if slot <> 37933 or instruction <> 1399 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1399, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:100
//		TC	ALM/END		# V84  SPARE
// PORT: Fixed ROM slots 37934.
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
// PORT: SOURCE EXTENDED_VERBS.agc:101
//		TC	V85PERF		# VB85 RANGE, RANGE RATE, SLOS	   (R32)
// PORT: Fixed ROM slots 37935.
                            if slot <> 37935 or instruction <> 1409 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1409, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:102
//		TC	V86PERF		# VB86 BACKUP MARK REJECT
// PORT: Fixed ROM slots 37936.
                            if slot <> 37936 or instruction <> 1446 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1446, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37937 {
// PORT: SOURCE EXTENDED_VERBS.agc:103
//		TC	SETVHFLG	# VB87 SET VHF RANGE FLAG
// PORT: Fixed ROM slots 37937.
                            if slot <> 37937 or instruction <> 1555 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1555, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37938 {
// PORT: SOURCE EXTENDED_VERBS.agc:104
//		TC	RESETVHF	# VB88 RESET VHF RANGE FLAG
// PORT: Fixed ROM slots 37938.
                                if slot <> 37938 or instruction <> 1559 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1559, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:105
//		TC	V89PERF		# V89-ALIGN X OR PRF CSM AXIS TO LOS (R63)
// PORT: Fixed ROM slots 37939.
                                if slot <> 37939 or instruction <> 1509 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1509, words[0], readEffective).
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
// PORT: SOURCE EXTENDED_VERBS.agc:106
//		TC	V90PERF		# VB90-OUT OF PLAN PARAMETERS %R36"
// PORT: Fixed ROM slots 37940.
                            if slot <> 37940 or instruction <> 1634 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1634, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:107
//		TC	GOSHOSUM	# VB91 TEMP FOR HYBRID AND STG.
// PORT: Fixed ROM slots 37941.
                            if slot <> 37941 or instruction <> 1522 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1522, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37942 {
// PORT: SOURCE EXTENDED_VERBS.agc:108
//		TC	SYSTEST		# VB92 OPERATE IMU PERFORMANCE TEST
// PORT: Fixed ROM slots 37942.
                            if slot <> 37942 or instruction <> 1264 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1264, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37943 {
// PORT: SOURCE EXTENDED_VERBS.agc:109
//		TC	WMATRXNG	# VB93 CLEAR RENDWFLG
// PORT: Fixed ROM slots 37943.
                                if slot <> 37943 or instruction <> 1517 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1517, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:110
//		TC	VERB94		# VB94 DO R64
// PORT: Fixed ROM slots 37944.
                                if slot <> 37944 or instruction <> 1622 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1622, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 37946 {
                        if slot <= 37945 {
// PORT: SOURCE EXTENDED_VERBS.agc:111
//		TC	ALM/END		# VB95 SPARE
// PORT: Fixed ROM slots 37945.
                            if slot <> 37945 or instruction <> 1104 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1104, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:112
//		TCF	VERB96		# VB96 SET QUITFLAG TO STOP INTEGRATION
// PORT: Fixed ROM slots 37946.
                            if slot <> 37946 or instruction <> 5736 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5736, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37947 {
// PORT: SOURCE EXTENDED_VERBS.agc:113
//		TC	GOLOADLV	# VB97 PLEASE PERFORM ENGINE-FAIL (R41)
// PORT: Fixed ROM slots 37947.
                            if slot <> 37947 or instruction <> 1213 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1213, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37948 {
// PORT: SOURCE EXTENDED_VERBS.agc:114
//		TC	ALM/END		# VB98 SPARE
// PORT: Fixed ROM slots 37948.
                                if slot <> 37948 or instruction <> 1104 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1104, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:115
//		TC	GOLOADLV	# VB99 PLEASE ENABLE ENGINE
// PORT: Fixed ROM slots 37949.
                                if slot <> 37949 or instruction <> 1213 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1213, words[0], readEffective).
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
// PORT: SOURCE EXTENDED_VERBS.agc:116
//
// PORT: SOURCE EXTENDED_VERBS.agc:117
//# END OF EXTENDED VERB FAN
// PORT: SOURCE EXTENDED_VERBS.agc:118
//
// PORT: SOURCE EXTENDED_VERBS.agc:119
//
// PORT: SOURCE EXTENDED_VERBS.agc:120
//TESTXACT	CCS	EXTVBACT
// PORT: Fixed ROM slots 37950.
                            if slot <> 37950 or instruction <> 4644 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreCCS(words, 548).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:121
//		TC	ALM/END		# YES, TURN ON OPERATOR ERROR LIGHT
// PORT: Fixed ROM slots 37951.
                            if slot <> 37951 or instruction <> 1104 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1104, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37952 {
// PORT: SOURCE EXTENDED_VERBS.agc:122
//		CA	FLAGWRD4	# ARE PRIOS USING DSKY
// PORT: Fixed ROM slots 37952.
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
// PORT: SOURCE EXTENDED_VERBS.agc:123
//		MASK	OC24100
// PORT: Fixed ROM slots 37953.
                                if slot <> 37953 or instruction <> 29779 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    set words[0] to agcOverflowCorrected(words[0]).
                                    local fixedOperand is mod(readEffective:call(words, 1107), 32768).
                                    set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:124
//		CCS	A
// PORT: Fixed ROM slots 37954.
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
// PORT: SOURCE EXTENDED_VERBS.agc:125
//		TC	ALM/END
// PORT: Fixed ROM slots 37955.
                            if slot <> 37955 or instruction <> 1104 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1104, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:126
//
// PORT: SOURCE EXTENDED_VERBS.agc:127
//		CAF	OCT24		# SET BITS 3 AND 5
// PORT: Fixed ROM slots 37956.
                            if slot <> 37956 or instruction <> 14410 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2122), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37957 {
// PORT: SOURCE EXTENDED_VERBS.agc:128
//SETXTACT	TS	EXTVBACT	# NO. SET FLAG TO SHOW EXT VERB DISPLAY
// PORT: Fixed ROM slots 37957.
                            if slot <> 37957 or instruction <> 23076 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23076, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37958 {
// PORT: SOURCE EXTENDED_VERBS.agc:129
//					# SYSTEM BUSY
// PORT: SOURCE EXTENDED_VERBS.agc:130
//
// PORT: SOURCE EXTENDED_VERBS.agc:131
//		CA	Q
// PORT: Fixed ROM slots 37958.
                                if slot <> 37958 or instruction <> 12290 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 2).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:132
//		TS	MPAC +1
// PORT: Fixed ROM slots 37959.
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
// PORT: SOURCE EXTENDED_VERBS.agc:133
//
// PORT: SOURCE EXTENDED_VERBS.agc:134
//		CS	TWO		# BLANK EVERYTHING EXCEPT MM AND VERB
// PORT: Fixed ROM slots 37960.
                            if slot <> 37960 or instruction <> 18958 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:135
//		TC	NVSUB
// PORT: Fixed ROM slots 37961.
                            if slot <> 37961 or instruction <> 2168 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2168, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    } else {
                        if slot <= 37962 {
// PORT: SOURCE EXTENDED_VERBS.agc:136
//		TC	+1
// PORT: Fixed ROM slots 37962.
                            if slot <> 37962 or instruction <> 1099 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1099, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37963 {
// PORT: SOURCE EXTENDED_VERBS.agc:137
//		TC	MPAC +1
// PORT: Fixed ROM slots 37963.
                                if slot <> 37963 or instruction <> 109 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 109, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:138
//
// PORT: SOURCE EXTENDED_VERBS.agc:139
//XACTALM		TC	FALTON		# TURN ON OPERATOR ERROR LIGHT.
// PORT: Fixed ROM slots 37964.
                                if slot <> 37964 or instruction <> 2304 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 2304, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 37966 {
                        if slot <= 37965 {
// PORT: SOURCE EXTENDED_VERBS.agc:140
//		TC	ENDEXT		# RELEASE MARK AND EXT. VERB DISPLAY SYS.
// PORT: Fixed ROM slots 37965.
                            if slot <> 37965 or instruction <> 2908 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2908, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:141
//# Page 238
// PORT: SOURCE EXTENDED_VERBS.agc:142
//TERMEXTV 	EQUALS 	ENDEXT
// PORT: SOURCE EXTENDED_VERBS.agc:143
//ENDEXTVB	EQUALS	ENDEXT
// PORT: SOURCE EXTENDED_VERBS.agc:144
//
// PORT: SOURCE EXTENDED_VERBS.agc:145
//XACT0		CAF	ZERO		# RELEASE MARK AND EXT. VERB DISPLAY SYS.
// PORT: Fixed ROM slots 37966.
                            if slot <> 37966 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
                        if slot <= 37967 {
// PORT: SOURCE EXTENDED_VERBS.agc:146
//		TC	SETXTACT
// PORT: Fixed ROM slots 37967.
                            if slot <> 37967 or instruction <> 1093 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 1093, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 37968 {
// PORT: SOURCE EXTENDED_VERBS.agc:147
//
// PORT: SOURCE EXTENDED_VERBS.agc:148
//ALM/END		TC	FALTON		# TURN ON OPERATOR ERROR LIGHT
// PORT: Fixed ROM slots 37968.
                                if slot <> 37968 or instruction <> 2304 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 2304, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:149
//GOPIN		TC	POSTJUMP
// PORT: Fixed ROM slots 37969.
                                if slot <> 37969 or instruction <> 2497 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 2497, words[0], readEffective).
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
set agcAotRoutes[2210] to agcAotUnit2210@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:150
//		CADR	PINBRNCH
// PORT: Fixed ROM slots 37970.
    37970, 17780,
// PORT: SOURCE EXTENDED_VERBS.agc:151
//
// PORT: SOURCE EXTENDED_VERBS.agc:152
//OC24100		OCT	24100
// PORT: Fixed ROM slots 37971.
    37971, 20608
)).

// PORT: Physical bank 43. Shared continuation entries, slots 37972–37976.
function agcAotUnit2211 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 37973 {
        if slot <= 37972 {
// PORT: SOURCE EXTENDED_VERBS.agc:153
//
// PORT: SOURCE EXTENDED_VERBS.agc:154
//# Page 239
// PORT: SOURCE EXTENDED_VERBS.agc:155
//# VBZERO	VERB 40		DESCRIPTION
// PORT: SOURCE EXTENDED_VERBS.agc:156
//#	ZERO
// PORT: SOURCE EXTENDED_VERBS.agc:157
//#	1. REQUIRE NOUN 20 (ICDU ANGLES)
// PORT: SOURCE EXTENDED_VERBS.agc:158
//#	2. REQUIRE AVAILABILITY OF EXT VERB DISPLAY SYSTEM
// PORT: SOURCE EXTENDED_VERBS.agc:159
//#	3. IF EITHER OF ABOVE CONDITIONS NOT PRESENT, TURN ON OPERATOR ERROR LIGHT AND GO TO PINBRNCH.
// PORT: SOURCE EXTENDED_VERBS.agc:160
//#	4. SET EXT VERB DISPLAY ACTIVE FLAG.
// PORT: SOURCE EXTENDED_VERBS.agc:161
//#	5. EXECUTE IMUZERO (ZERO IMU CDU ANGLES).
// PORT: SOURCE EXTENDED_VERBS.agc:162
//#	6. EXECUTE IMUSTALL (ALLOW TIME FOR DATA TRANSFER).
// PORT: SOURCE EXTENDED_VERBS.agc:163
//#	7. RELEASE EXT. VERB DISPLAY SYSTEM.
// PORT: SOURCE EXTENDED_VERBS.agc:164
//
// PORT: SOURCE EXTENDED_VERBS.agc:165
//VBZERO		TC	OP/INERT
// PORT: Fixed ROM slots 37972.
            if slot <> 37972 or instruction <> 1118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:166
//		TC	IMUZEROK	# RETURN HERE IF NOUN = ICDU(20)
// PORT: Fixed ROM slots 37973.
            if slot <> 37973 or instruction <> 1111 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1111, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 37974 {
// PORT: SOURCE EXTENDED_VERBS.agc:167
//		TC	ALM/END		# RETURN HERE IF NOUN = OCDU(91)
// PORT: Fixed ROM slots 37974.
            if slot <> 37974 or instruction <> 1104 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1104, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 37975 {
// PORT: SOURCE EXTENDED_VERBS.agc:168
//					#	(NOT IN USE YET)
// PORT: SOURCE EXTENDED_VERBS.agc:169
//
// PORT: SOURCE EXTENDED_VERBS.agc:170
//IMUZEROK	TC	CKMODCAD	# KEYBOARD REQUEST FOR ISS CDUZERO
// PORT: Fixed ROM slots 37975.
                if slot <> 37975 or instruction <> 1209 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1209, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:171
//		TC	BANKCALL
// PORT: Fixed ROM slots 37976.
                if slot <> 37976 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2211] to agcAotUnit2211@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:172
//		CADR	IMUZERO
// PORT: Fixed ROM slots 37977.
    37977, 15102
)).

// PORT: Physical bank 43. Shared continuation entries, slots 37978–37978.
function agcAotUnit2212 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXTENDED_VERBS.agc:173
//
// PORT: SOURCE EXTENDED_VERBS.agc:174
//		TC	BANKCALL	# STALL
// PORT: Fixed ROM slots 37978.
    if slot <> 37978 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2212] to agcAotUnit2212@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:175
//		CADR	IMUSTALL
// PORT: Fixed ROM slots 37979.
    37979, 16126
)).

// PORT: Physical bank 43. Shared continuation entries, slots 37980–37990.
function agcAotUnit2213 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 37984 {
        if slot <= 37981 {
            if slot <= 37980 {
// PORT: SOURCE EXTENDED_VERBS.agc:176
//		TC	+1
// PORT: Fixed ROM slots 37980.
                if slot <> 37980 or instruction <> 1117 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1117, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:177
//
// PORT: SOURCE EXTENDED_VERBS.agc:178
//		TC	GOPIN
// PORT: Fixed ROM slots 37981.
                if slot <> 37981 or instruction <> 1105 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1105, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 37982 {
// PORT: SOURCE EXTENDED_VERBS.agc:179
//
// PORT: SOURCE EXTENDED_VERBS.agc:180
//OP/INERT	CS	OCT24
// PORT: Fixed ROM slots 37982.
                if slot <> 37982 or instruction <> 18506 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2122), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 37983 {
// PORT: SOURCE EXTENDED_VERBS.agc:181
//		AD	NOUNREG
// PORT: Fixed ROM slots 37983.
                    if slot <> 37983 or instruction <> 25090 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 514).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:182
//		EXTEND
// PORT: Fixed ROM slots 37984.
                    if slot <> 37984 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 37987 {
            if slot <= 37985 {
// PORT: SOURCE EXTENDED_VERBS.agc:183
//		BZF	XACT0Q		# IF = 20.
// PORT: Fixed ROM slots 37985.
                if slot <> 37985 or instruction <> 5438 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5438, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 37986 {
// PORT: SOURCE EXTENDED_VERBS.agc:184
//
// PORT: SOURCE EXTENDED_VERBS.agc:185
//		INCR	Q
// PORT: Fixed ROM slots 37986.
                    if slot <> 37986 or instruction <> 10242 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 2).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:186
//		AD	OPIMDIFF	# -71
// PORT: Fixed ROM slots 37987.
                    if slot <> 37987 or instruction <> 25703 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 1127), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 37988 {
// PORT: SOURCE EXTENDED_VERBS.agc:187
//		EXTEND
// PORT: Fixed ROM slots 37988.
                if slot <> 37988 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 37989 {
// PORT: SOURCE EXTENDED_VERBS.agc:188
//		BZF	XACT0Q
// PORT: Fixed ROM slots 37989.
                    if slot <> 37989 or instruction <> 5438 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5438, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:189
//
// PORT: SOURCE EXTENDED_VERBS.agc:190
//		TC	ALM/END		# ILLEGAL.
// PORT: Fixed ROM slots 37990.
                    if slot <> 37990 or instruction <> 1104 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2213] to agcAotUnit2213@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:191
//
// PORT: SOURCE EXTENDED_VERBS.agc:192
//OPIMDIFF	DEC	-71
// PORT: Fixed ROM slots 37991.
    37991, 65392
)).

// PORT: Physical bank 43. Shared continuation entries, slots 37992–37998.
function agcAotUnit2214 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 37994 {
        if slot <= 37992 {
// PORT: SOURCE EXTENDED_VERBS.agc:193
//
// PORT: SOURCE EXTENDED_VERBS.agc:194
//# Page 240
// PORT: SOURCE EXTENDED_VERBS.agc:195
//# VBCOARK	VERB 41		DESCRIPTION
// PORT: SOURCE EXTENDED_VERBS.agc:196
//#	COARSE ALIGN IMU OR RADAR
// PORT: SOURCE EXTENDED_VERBS.agc:197
//#	1. REQUIRE NOUN 20 OR NOUN 91 OR TURN ON OPERATOR ERROR
// PORT: SOURCE EXTENDED_VERBS.agc:198
//#	2. REQUIRE EXT VERB DISPLAY SYS AVAILABLE OR TURN ON OPERATOR ERROR LIGHT AND GO TO PINBRNCH.
// PORT: SOURCE EXTENDED_VERBS.agc:199
//#	CASE 1	NOUN 20	(ICDU ANGLES)
// PORT: SOURCE EXTENDED_VERBS.agc:200
//#	3. SET EXT VERB DISPLAY ACTIVE FLAG.
// PORT: SOURCE EXTENDED_VERBS.agc:201
//#	4. DISPLAY FLASHING V25,N22 (LOAD NEW ICDU ANGLES).
// PORT: SOURCE EXTENDED_VERBS.agc:202
//#	   RESPONSES
// PORT: SOURCE EXTENDED_VERBS.agc:203
//#		A. TERMINATE
// PORT: SOURCE EXTENDED_VERBS.agc:204
//#		   1. RELEASE EXT VERB DISPLAY SYSTEM
// PORT: SOURCE EXTENDED_VERBS.agc:205
//#		B. PROCEED
// PORT: SOURCE EXTENDED_VERBS.agc:206
//#		   1. DISPLAY FLASHING V25,N23 (LOAD DELTA ICDU ANGLES).
// PORT: SOURCE EXTENDED_VERBS.agc:207
//#			RESPONSES
// PORT: SOURCE EXTENDED_VERBS.agc:208
//#				A. TERMINATE
// PORT: SOURCE EXTENDED_VERBS.agc:209
//#				   1. RELEASE EXT VERB DISPLAY SYSTEM.
// PORT: SOURCE EXTENDED_VERBS.agc:210
//#				B. PROCEED
// PORT: SOURCE EXTENDED_VERBS.agc:211
//#				   1. EXECUTE ICORK2.
// PORT: SOURCE EXTENDED_VERBS.agc:212
//#				C. ENTER
// PORT: SOURCE EXTENDED_VERBS.agc:213
//#				   1. INCREMENT CDU ANGLES
// PORT: SOURCE EXTENDED_VERBS.agc:214
//#				   2. EXECUTE ICORK2.
// PORT: SOURCE EXTENDED_VERBS.agc:215
//#		C. ENTER
// PORT: SOURCE EXTENDED_VERBS.agc:216
//#		   1. EXECUTE ICORK2.
// PORT: SOURCE EXTENDED_VERBS.agc:217
//# 	ICORK2
// PORT: SOURCE EXTENDED_VERBS.agc:218
//#		1. RE-DISPLAY VERB 41.
// PORT: SOURCE EXTENDED_VERBS.agc:219
//#		2. EXECUTE IMUCCARS (IMU COARSE ALIGN).
// PORT: SOURCE EXTENDED_VERBS.agc:220
//#		3. EXECUTE IMUSTALL (ALLOW TIME FOR DATA TRANSFER).
// PORT: SOURCE EXTENDED_VERBS.agc:221
//#		4. RELEASE EXT VERB DISPLAY SYSTEM.
// PORT: SOURCE EXTENDED_VERBS.agc:222
//#	CASE 2	NOUN 91	(OCDU ANGLES)
// PORT: SOURCE EXTENDED_VERBS.agc:223
//#	5. (REQUIRE OPTICS SWITCH TO BE AT COMPUTER OR TURN ON OPERATOR ERROR AND ALARM 115) AND (REQUIRE
// PORT: SOURCE EXTENDED_VERBS.agc:224
//#	   OPTICS AVAILABLE AND DISPLAY FLASHING V24,N92....LOAD NEW OPTICS ANGLES....OR TURN ON ALARM 117
// PORT: SOURCE EXTENDED_VERBS.agc:225
//#	   AND RELEASE EXT VERB DISPLAY SYSTEM).
// PORT: SOURCE EXTENDED_VERBS.agc:226
//#	6. RESPONSES TO V29,N92.
// PORT: SOURCE EXTENDED_VERBS.agc:227
//#	   A. TERMINATE
// PORT: SOURCE EXTENDED_VERBS.agc:228
//#	      RELEASE EXT VERB DISPLAY SYSTEM
// PORT: SOURCE EXTENDED_VERBS.agc:229
//#	   B. PROCEED OR ENTER
// PORT: SOURCE EXTENDED_VERBS.agc:230
//#	      RE-DISPLAY V41,	SET SWITCH TO INDICATE COURSE ALIGN OPTICS WORKING.
// PORT: SOURCE EXTENDED_VERBS.agc:231
//#	      RELEASE EXT VERB DISPLAY SYSTEM.
// PORT: SOURCE EXTENDED_VERBS.agc:232
//
// PORT: SOURCE EXTENDED_VERBS.agc:233
//VBCOARK		TC	OP/INERT
// PORT: Fixed ROM slots 37992.
            if slot <> 37992 or instruction <> 1118 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1118, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 37993 {
// PORT: SOURCE EXTENDED_VERBS.agc:234
//		TC	IMUCOARK		# RETURN HERE IF NOUN = ICDU(20)
// PORT: Fixed ROM slots 37993.
                if slot <> 37993 or instruction <> 1131 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1131, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:235
//		TC	OPTCOARK		# RETURN HERE IF NOUN = OCDU(91)
// PORT: Fixed ROM slots 37994.
                if slot <> 37994 or instruction <> 1149 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1149, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 37996 {
            if slot <= 37995 {
// PORT: SOURCE EXTENDED_VERBS.agc:236
//# RETURNS TO L+1 IF NOUN 20 - TO L+2 IF NOUN 91.
// PORT: SOURCE EXTENDED_VERBS.agc:237
//IMUCOARK	TC	CKMODCAD		# COARSE ALIGN FROM KEYBOARD
// PORT: Fixed ROM slots 37995.
                if slot <> 37995 or instruction <> 1209 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1209, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:238
//		TC	TESTXACT
// PORT: Fixed ROM slots 37996.
                if slot <> 37996 or instruction <> 1086 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1086, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 37997 {
// PORT: SOURCE EXTENDED_VERBS.agc:239
//		CAF	VNLODCDU		# CALL FOR THETAD LOAD
// PORT: Fixed ROM slots 37997.
                if slot <> 37997 or instruction <> 13435 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1147), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:240
//		TC	BANKCALL
// PORT: Fixed ROM slots 37998.
                if slot <> 37998 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2214] to agcAotUnit2214@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:241
//		CADR	GOXDSPF
// PORT: Fixed ROM slots 37999.
    37999, 17122
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38000–38003.
function agcAotUnit2215 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38001 {
        if slot <= 38000 {
// PORT: SOURCE EXTENDED_VERBS.agc:242
//		TC	TERMEXTV
// PORT: Fixed ROM slots 38000.
            if slot <> 38000 or instruction <> 2908 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2908, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:243
//		TCF	+1
// PORT: Fixed ROM slots 38001.
            if slot <> 38001 or instruction <> 5234 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5234, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38002 {
// PORT: SOURCE EXTENDED_VERBS.agc:244
//# Page 241
// PORT: SOURCE EXTENDED_VERBS.agc:245
//
// PORT: SOURCE EXTENDED_VERBS.agc:246
//ICORK2		CAF	IMUCOARV		# RE-DISPLAY COARSE ALIGN VERB.
// PORT: Fixed ROM slots 38002.
            if slot <> 38002 or instruction <> 13436 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1148), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:247
//		TC	BANKCALL
// PORT: Fixed ROM slots 38003.
            if slot <> 38003 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2215] to agcAotUnit2215@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:248
//		CADR	EXDSPRET
// PORT: Fixed ROM slots 38004.
    38004, 17476
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38005–38005.
function agcAotUnit2216 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXTENDED_VERBS.agc:249
//
// PORT: SOURCE EXTENDED_VERBS.agc:250
//		TC	BANKCALL		# CALL MODE SWITCHING PROG
// PORT: Fixed ROM slots 38005.
    if slot <> 38005 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2216] to agcAotUnit2216@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:251
//		CADR	IMUCOARS
// PORT: Fixed ROM slots 38006.
    38006, 15206
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38007–38007.
function agcAotUnit2217 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXTENDED_VERBS.agc:252
//
// PORT: SOURCE EXTENDED_VERBS.agc:253
//		TC	BANKCALL		# STALL
// PORT: Fixed ROM slots 38007.
    if slot <> 38007 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2217] to agcAotUnit2217@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:254
//		CADR	IMUSTALL
// PORT: Fixed ROM slots 38008.
    38008, 16126
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38009–38010.
function agcAotUnit2218 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38009 {
// PORT: SOURCE EXTENDED_VERBS.agc:255
//		TC	ENDEXTVB
// PORT: Fixed ROM slots 38009.
        if slot <> 38009 or instruction <> 2908 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2908, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:256
//		TC	ENDEXTVB
// PORT: Fixed ROM slots 38010.
        if slot <> 38010 or instruction <> 2908 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2908, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2218] to agcAotUnit2218@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:257
//
// PORT: SOURCE EXTENDED_VERBS.agc:258
//VNLODCDU	VN	2522
// PORT: Fixed ROM slots 38011.
    38011, 6444,
// PORT: SOURCE EXTENDED_VERBS.agc:259
//IMUCOARV	VN	4100
// PORT: Fixed ROM slots 38012.
    38012, 10496
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38013–38022.
function agcAotUnit2219 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38017 {
        if slot <= 38014 {
            if slot <= 38013 {
// PORT: SOURCE EXTENDED_VERBS.agc:260
//
// PORT: SOURCE EXTENDED_VERBS.agc:261
//# Page 242
// PORT: SOURCE EXTENDED_VERBS.agc:262
//# TEMPORARY ROUTINE TO RUN THE OPTICS CDUS FROM THE KEYBOARD
// PORT: SOURCE EXTENDED_VERBS.agc:263
//
// PORT: SOURCE EXTENDED_VERBS.agc:264
//OPTCOARK	CA	OPTCADR
// PORT: Fixed ROM slots 38013.
                if slot <> 38013 or instruction <> 13011 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 723).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:265
//		TC	CKMODCAD +1
// PORT: Fixed ROM slots 38014.
                if slot <> 38014 or instruction <> 1210 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1210, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38015 {
// PORT: SOURCE EXTENDED_VERBS.agc:266
//		TC	TESTXACT
// PORT: Fixed ROM slots 38015.
                if slot <> 38015 or instruction <> 1086 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1086, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38016 {
// PORT: SOURCE EXTENDED_VERBS.agc:267
//		CAF	EBANK5
// PORT: Fixed ROM slots 38016.
                    if slot <> 38016 or instruction <> 14894 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2606), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:268
//		TS	EBANK
// PORT: Fixed ROM slots 38017.
                    if slot <> 38017 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 38019 {
            if slot <= 38018 {
// PORT: SOURCE EXTENDED_VERBS.agc:269
//
// PORT: SOURCE EXTENDED_VERBS.agc:270
//		CCS	SWSAMPLE		# SEE IF SWITCH AT COMPUTER
// PORT: Fixed ROM slots 38018.
                if slot <> 38018 or instruction <> 4812 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 716).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:271
//		TC	+5			# SWITCH AT COMPUTER
// PORT: Fixed ROM slots 38019.
                if slot <> 38019 or instruction <> 1160 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1160, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38020 {
// PORT: SOURCE EXTENDED_VERBS.agc:272
//		TC	+1			# NOT ON COMPUTER
// PORT: Fixed ROM slots 38020.
                if slot <> 38020 or instruction <> 1157 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1157, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38021 {
// PORT: SOURCE EXTENDED_VERBS.agc:273
//		TC	FALTON			# TURN ON OPERATOR ERR
// PORT: Fixed ROM slots 38021.
                    if slot <> 38021 or instruction <> 2304 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2304, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:274
//		TC	ALARM			# AND ALARM
// PORT: Fixed ROM slots 38022.
                    if slot <> 38022 or instruction <> 2984 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2984, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2219] to agcAotUnit2219@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:275
//		OCT	00115
// PORT: Fixed ROM slots 38023.
    38023, 154
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38024–38028.
function agcAotUnit2220 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38025 {
        if slot <= 38024 {
// PORT: SOURCE EXTENDED_VERBS.agc:276
//
// PORT: SOURCE EXTENDED_VERBS.agc:277
//		CCS	OPTIND			# SEE IF OPTICS AVAILABLE
// PORT: Fixed ROM slots 38024.
            if slot <> 38024 or instruction <> 4803 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 707).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:278
//		TC	OPTC1			# IN USE
// PORT: Fixed ROM slots 38025.
            if slot <> 38025 or instruction <> 1167 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1167, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38026 {
// PORT: SOURCE EXTENDED_VERBS.agc:279
//		TC	OPTC1			# IN USE
// PORT: Fixed ROM slots 38026.
            if slot <> 38026 or instruction <> 1167 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1167, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38027 {
// PORT: SOURCE EXTENDED_VERBS.agc:280
//		TC	OPTC1			# IN USE
// PORT: Fixed ROM slots 38027.
                if slot <> 38027 or instruction <> 1167 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1167, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:281
//
// PORT: SOURCE EXTENDED_VERBS.agc:282
//		TC	ALARM			# OPTICS RESERVED (OPTIND=-0)
// PORT: Fixed ROM slots 38028.
                if slot <> 38028 or instruction <> 2984 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2984, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2220] to agcAotUnit2220@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:283
//		OCT	00117
// PORT: Fixed ROM slots 38029.
    38029, 158
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38030–38032.
function agcAotUnit2221 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38030 {
// PORT: SOURCE EXTENDED_VERBS.agc:284
//		TC	ENDEXT
// PORT: Fixed ROM slots 38030.
        if slot <> 38030 or instruction <> 2908 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2908, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 38031 {
// PORT: SOURCE EXTENDED_VERBS.agc:285
//
// PORT: SOURCE EXTENDED_VERBS.agc:286
//OPTC1		CAF	VNLD0CDU		# VERB-NOUN TO LOAD OPTICS CDUS
// PORT: Fixed ROM slots 38031.
            if slot <> 38031 or instruction <> 13471 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1183), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:287
//		TC	BANKCALL
// PORT: Fixed ROM slots 38032.
            if slot <> 38032 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2221] to agcAotUnit2221@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:288
//		CADR	GOXDSPF
// PORT: Fixed ROM slots 38033.
    38033, 17122
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38034–38041.
function agcAotUnit2222 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38037 {
        if slot <= 38035 {
            if slot <= 38034 {
// PORT: SOURCE EXTENDED_VERBS.agc:289
//		TC	TERMEXTV
// PORT: Fixed ROM slots 38034.
                if slot <> 38034 or instruction <> 2908 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2908, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:290
//		TC	+1			# PROCEED
// PORT: Fixed ROM slots 38035.
                if slot <> 38035 or instruction <> 1172 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1172, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38036 {
// PORT: SOURCE EXTENDED_VERBS.agc:291
//
// PORT: SOURCE EXTENDED_VERBS.agc:292
//		CA	SAC
// PORT: Fixed ROM slots 38036.
                if slot <> 38036 or instruction <> 13307 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 1019).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:293
//		TS	DESOPTS
// PORT: Fixed ROM slots 38037.
                if slot <> 38037 or instruction <> 23153 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23153, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38039 {
            if slot <= 38038 {
// PORT: SOURCE EXTENDED_VERBS.agc:294
//		CA	PAC
// PORT: Fixed ROM slots 38038.
                if slot <> 38038 or instruction <> 13309 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 1021).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:295
//		TS	DESOPTT
// PORT: Fixed ROM slots 38039.
                if slot <> 38039 or instruction <> 23152 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23152, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38040 {
// PORT: SOURCE EXTENDED_VERBS.agc:296
//		CAF	OPTCOARV		# RE-DISPLAY OUR OWN VERB
// PORT: Fixed ROM slots 38040.
                if slot <> 38040 or instruction <> 13436 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1148), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:297
//		TC	BANKCALL
// PORT: Fixed ROM slots 38041.
                if slot <> 38041 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2222] to agcAotUnit2222@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:298
//		CADR	EXDSPRET
// PORT: Fixed ROM slots 38042.
    38042, 17476
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38043–38046.
function agcAotUnit2223 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38044 {
        if slot <= 38043 {
// PORT: SOURCE EXTENDED_VERBS.agc:299
//
// PORT: SOURCE EXTENDED_VERBS.agc:300
//		CAF	ONE
// PORT: Fixed ROM slots 38043.
            if slot <> 38043 or instruction <> 14863 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:301
//		TS	OPTIND			# SET COARS WORKING
// PORT: Fixed ROM slots 38044.
            if slot <> 38044 or instruction <> 23235 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23235, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38045 {
// PORT: SOURCE EXTENDED_VERBS.agc:302
//
// PORT: SOURCE EXTENDED_VERBS.agc:303
//		TC	ENDEXTVB
// PORT: Fixed ROM slots 38045.
            if slot <> 38045 or instruction <> 2908 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2908, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:304
//		TC	ENDEXTVB
// PORT: Fixed ROM slots 38046.
            if slot <> 38046 or instruction <> 2908 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2908, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2223] to agcAotUnit2223@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:305
//
// PORT: SOURCE EXTENDED_VERBS.agc:306
//VNLD0CDU	VN	2492
// PORT: Fixed ROM slots 38047.
    38047, 6328
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38048–38051.
function agcAotUnit2224 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38049 {
        if slot <= 38048 {
// PORT: SOURCE EXTENDED_VERBS.agc:307
//OPTCOARV	EQUALS	IMUCOARV		# DIFFERENT NOUNS.
// PORT: SOURCE EXTENDED_VERBS.agc:308
//
// PORT: SOURCE EXTENDED_VERBS.agc:309
//# Page 243
// PORT: SOURCE EXTENDED_VERBS.agc:310
//# IMUFINEK	VERB 42		DESCRIPTION
// PORT: SOURCE EXTENDED_VERBS.agc:311
//#	FINE ALIGN IMU
// PORT: SOURCE EXTENDED_VERBS.agc:312
//#	1. REQUIRE EXT VERB DISPLAY AVAILABLE AND SET BUSY FLAG OR TURN ON OPER ERROR AND GO TO PINBRNCH.
// PORT: SOURCE EXTENDED_VERBS.agc:313
//#	2. DISPLAY FLASHING V25,N93....LOAD DELTA GYRO ANGLES....
// PORT: SOURCE EXTENDED_VERBS.agc:314
//#	   RESPONSES
// PORT: SOURCE EXTENDED_VERBS.agc:315
//#	   A. TERMINATE
// PORT: SOURCE EXTENDED_VERBS.agc:316
//#	      1. RELEASE EXT VERB DISPLAY SYSTEM.
// PORT: SOURCE EXTENDED_VERBS.agc:317
//#	   B. PROCEED OR ENTER
// PORT: SOURCE EXTENDED_VERBS.agc:318
//#	      1. RE-DISPLAY VERB 42
// PORT: SOURCE EXTENDED_VERBS.agc:319
//#	      2. EXECUTE IMUFINE (IMU FIVE ALIGN MODE SWITCHING).
// PORT: SOURCE EXTENDED_VERBS.agc:320
//#	      3. EXECUTE IMUSTALL (ALLOW FOR DATA TRANSFER)
// PORT: SOURCE EXTENDED_VERBS.agc:321
//#		 A. FAILED
// PORT: SOURCE EXTENDED_VERBS.agc:322
//#		    1. RELEASE EXT VERB DISPLAY SYSTEM.
// PORT: SOURCE EXTENDED_VERBS.agc:323
//#		 B. GOOD
// PORT: SOURCE EXTENDED_VERBS.agc:324
//#		    1. EXECUTE IMUPULSE (TORQUE IRIGS).
// PORT: SOURCE EXTENDED_VERBS.agc:325
//#		    2. EXECUTE IMUSTALL AND RELEASE EXT VERB DISPLAY SYSTEM.
// PORT: SOURCE EXTENDED_VERBS.agc:326
//
// PORT: SOURCE EXTENDED_VERBS.agc:327
//IMUFINEK	TC	CKMODCAD		# FINE ALIGN WITH GYRO TORQUING
// PORT: Fixed ROM slots 38048.
            if slot <> 38048 or instruction <> 1209 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1209, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:328
//		TC	TESTXACT
// PORT: Fixed ROM slots 38049.
            if slot <> 38049 or instruction <> 1086 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1086, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38050 {
// PORT: SOURCE EXTENDED_VERBS.agc:329
//		CAF	VNLODGYR		# CALL FOR LOAD OF GYRO COMMANDS
// PORT: Fixed ROM slots 38050.
            if slot <> 38050 or instruction <> 13495 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1207), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:330
//		TC	BANKCALL
// PORT: Fixed ROM slots 38051.
            if slot <> 38051 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2224] to agcAotUnit2224@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:331
//		CADR	GOXDSPF
// PORT: Fixed ROM slots 38052.
    38052, 17122
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38053–38056.
function agcAotUnit2225 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38054 {
        if slot <= 38053 {
// PORT: SOURCE EXTENDED_VERBS.agc:332
//		TC	TERMEXTV
// PORT: Fixed ROM slots 38053.
            if slot <> 38053 or instruction <> 2908 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2908, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:333
//		TC	+1			# PROCEED WITHOUT A LOAD
// PORT: Fixed ROM slots 38054.
            if slot <> 38054 or instruction <> 1191 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1191, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38055 {
// PORT: SOURCE EXTENDED_VERBS.agc:334
//
// PORT: SOURCE EXTENDED_VERBS.agc:335
//		CAF	IMUFINEV		# RE-DISPLAY OUR OWN VERB
// PORT: Fixed ROM slots 38055.
            if slot <> 38055 or instruction <> 13496 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1208), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:336
//		TC	BANKCALL
// PORT: Fixed ROM slots 38056.
            if slot <> 38056 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2225] to agcAotUnit2225@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:337
//		CADR	EXDSPRET
// PORT: Fixed ROM slots 38057.
    38057, 17476
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38058–38058.
function agcAotUnit2226 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXTENDED_VERBS.agc:338
//
// PORT: SOURCE EXTENDED_VERBS.agc:339
//		TC	BANKCALL		# CALL MODE SWITCH PROG
// PORT: Fixed ROM slots 38058.
    if slot <> 38058 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2226] to agcAotUnit2226@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:340
//		CADR	IMUFINE
// PORT: Fixed ROM slots 38059.
    38059, 15478
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38060–38060.
function agcAotUnit2227 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXTENDED_VERBS.agc:341
//
// PORT: SOURCE EXTENDED_VERBS.agc:342
//		TC	BANKCALL		# HIBERNATION
// PORT: Fixed ROM slots 38060.
    if slot <> 38060 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2227] to agcAotUnit2227@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:343
//		CADR	IMUSTALL
// PORT: Fixed ROM slots 38061.
    38061, 16126
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38062–38064.
function agcAotUnit2228 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38062 {
// PORT: SOURCE EXTENDED_VERBS.agc:344
//		TC	ENDEXTVB
// PORT: Fixed ROM slots 38062.
        if slot <> 38062 or instruction <> 2908 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2908, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 38063 {
// PORT: SOURCE EXTENDED_VERBS.agc:345
//
// PORT: SOURCE EXTENDED_VERBS.agc:346
//FINEK2		CAF	LGYROBIN		# PINBALL LEFT COMMANDS IN OGC REGIST5RS
// PORT: Fixed ROM slots 38063.
            if slot <> 38063 or instruction <> 13494 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1206), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:347
//		TC	BANKCALL
// PORT: Fixed ROM slots 38064.
            if slot <> 38064 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2228] to agcAotUnit2228@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:348
//		CADR	IMUPULSE
// PORT: Fixed ROM slots 38065.
    38065, 15628
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38066–38066.
function agcAotUnit2229 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXTENDED_VERBS.agc:349
//
// PORT: SOURCE EXTENDED_VERBS.agc:350
//		TC	BANKCALL		# WAIT FOR PULSES TO GET OUT.
// PORT: Fixed ROM slots 38066.
    if slot <> 38066 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2229] to agcAotUnit2229@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:351
//		CADR	IMUSTALL
// PORT: Fixed ROM slots 38067.
    38067, 16126
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38068–38069.
function agcAotUnit2230 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38068 {
// PORT: SOURCE EXTENDED_VERBS.agc:352
//		TC	ENDEXTVB
// PORT: Fixed ROM slots 38068.
        if slot <> 38068 or instruction <> 2908 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2908, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:353
//		TC	ENDEXTVB
// PORT: Fixed ROM slots 38069.
        if slot <> 38069 or instruction <> 2908 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2908, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2230] to agcAotUnit2230@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:354
//
// PORT: SOURCE EXTENDED_VERBS.agc:355
//LGYROBIN	ECADR	OGC
// PORT: Fixed ROM slots 38070.
    38070, 3038,
// PORT: SOURCE EXTENDED_VERBS.agc:356
//VNLODGYR	VN	2593
// PORT: Fixed ROM slots 38071.
    38071, 6586,
// PORT: SOURCE EXTENDED_VERBS.agc:357
//IMUFINEV	VN	4200			# FINE ALIGN VERB
// PORT: Fixed ROM slots 38072.
    38072, 10752
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38073–38081.
function agcAotUnit2231 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38076 {
        if slot <= 38074 {
            if slot <= 38073 {
// PORT: SOURCE EXTENDED_VERBS.agc:358
//
// PORT: SOURCE EXTENDED_VERBS.agc:359
//CKMODCAD	CA	MODECADR
// PORT: Fixed ROM slots 38073.
                if slot <> 38073 or instruction <> 13010 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 722).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:360
//# Page 244
// PORT: SOURCE EXTENDED_VERBS.agc:361
//		EXTEND
// PORT: Fixed ROM slots 38074.
                if slot <> 38074 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38075 {
// PORT: SOURCE EXTENDED_VERBS.agc:362
//		BZF	TCQ
// PORT: Fixed ROM slots 38075.
                if slot <> 38075 or instruction <> 7625 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7625, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:363
//		TC	ALM/END			# SOMEBODY IS USING MODECADR SO EXIT
// PORT: Fixed ROM slots 38076.
                if slot <> 38076 or instruction <> 1104 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1104, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38078 {
            if slot <= 38077 {
// PORT: SOURCE EXTENDED_VERBS.agc:364
//# GOLOADLV	VERB 50		DESCRIPTION
// PORT: SOURCE EXTENDED_VERBS.agc:365
//#		AND OTHER PLEASE
// PORT: SOURCE EXTENDED_VERBS.agc:366
//#		DO SOMETHING VERBS
// PORT: SOURCE EXTENDED_VERBS.agc:367
//# 	PLEASE PERFORM, MARK, CALIBRATE, ETC.
// PORT: SOURCE EXTENDED_VERBS.agc:368
//#	1. PRESSING ENTER ON DSKY INDICATES REQUESTED ACTION HAS BEEN PERFORMED, AND THE PROGRAM DOES THE
// PORT: SOURCE EXTENDED_VERBS.agc:369
//#	   SAME RECALL AS A COMPLETED LOAD.
// PORT: SOURCE EXTENDED_VERBS.agc:370
//#	2. THE EXECUTION OF A VERB 33 (PROCEED WITHOUT DATA) INDICATES THE REQUESTED ACTION IS NOT DESIRED.
// PORT: SOURCE EXTENDED_VERBS.agc:371
//
// PORT: SOURCE EXTENDED_VERBS.agc:372
//GOLOADLV	TC	FLASHOFF
// PORT: Fixed ROM slots 38077.
                if slot <> 38077 or instruction <> 2343 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2343, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:373
//		CAF	PINSUPBT
// PORT: Fixed ROM slots 38078.
                if slot <> 38078 or instruction <> 14477 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2189), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38079 {
// PORT: SOURCE EXTENDED_VERBS.agc:374
//		EXTEND
// PORT: Fixed ROM slots 38079.
                if slot <> 38079 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38080 {
// PORT: SOURCE EXTENDED_VERBS.agc:375
//		WRITE	SUPERBNK	# TURN ON FE7
// PORT: Fixed ROM slots 38080.
                    if slot <> 38080 or instruction <> 519 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 1, 7, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:376
//		TC	POSTJUMP
// PORT: Fixed ROM slots 38081.
                    if slot <> 38081 or instruction <> 2497 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2497, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2231] to agcAotUnit2231@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:377
//		SBANK=	PINSUPER
// PORT: SOURCE EXTENDED_VERBS.agc:378
//		CADR	LOADLV1
// PORT: Fixed ROM slots 38082.
    38082, 51202
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38083–38089.
function agcAotUnit2232 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38085 {
        if slot <= 38083 {
// PORT: SOURCE EXTENDED_VERBS.agc:379
//
// PORT: SOURCE EXTENDED_VERBS.agc:380
//# V60	VERB 60
// PORT: SOURCE EXTENDED_VERBS.agc:381
//V60		EXTEND			# SET ASTRONAUT TOTAL ATTITUDE (N17) EQUAL
// PORT: Fixed ROM slots 38083.
            if slot <> 38083 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38084 {
// PORT: SOURCE EXTENDED_VERBS.agc:382
//		DCA	CDUX		# TO PRESENT ATTITUDE
// PORT: Fixed ROM slots 38084.
                if slot <> 38084 or instruction <> 12315 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 27, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:383
//		DXCH	CPHIX
// PORT: Fixed ROM slots 38085.
                if slot <> 38085 or instruction <> 22236 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 732, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38087 {
            if slot <= 38086 {
// PORT: SOURCE EXTENDED_VERBS.agc:384
//		CA	CDUZ
// PORT: Fixed ROM slots 38086.
                if slot <> 38086 or instruction <> 12316 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 28).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:385
//		TS	CPHIX	+2
// PORT: Fixed ROM slots 38087.
                if slot <> 38087 or instruction <> 23261 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23261, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38088 {
// PORT: SOURCE EXTENDED_VERBS.agc:386
//		TC	GOPIN
// PORT: Fixed ROM slots 38088.
                if slot <> 38088 or instruction <> 1105 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1105, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:387
//
// PORT: SOURCE EXTENDED_VERBS.agc:388
//# V61	VERB 61
// PORT: SOURCE EXTENDED_VERBS.agc:389
//V61		TC	DOWNFLAG	# SET NEEDLFLG TO 0 (FLAGWRD0,BIT9), PHASE
// PORT: Fixed ROM slots 38089.
                if slot <> 38089 or instruction <> 2928 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2928, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2232] to agcAotUnit2232@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:390
//		ADRES	NEEDLFLG	# PLANE A/P FOLLOWING ERROR DISPLAYED
// PORT: Fixed ROM slots 38090.
    38090, 12
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38091–38092.
function agcAotUnit2233 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38091 {
// PORT: SOURCE EXTENDED_VERBS.agc:391
//		TC	GOPIN
// PORT: Fixed ROM slots 38091.
        if slot <> 38091 or instruction <> 1105 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1105, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:392
//
// PORT: SOURCE EXTENDED_VERBS.agc:393
//# V62	VERB 62
// PORT: SOURCE EXTENDED_VERBS.agc:394
//V62		TC	UPFLAG		# SET NEEDLFLG TO 1 (FLAGWRD0,BIT9),
// PORT: Fixed ROM slots 38092.
        if slot <> 38092 or instruction <> 2918 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2918, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2233] to agcAotUnit2233@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:395
//		ADRES	NEEDLFLG	# TOTAL ATTITUDE ERROR DISPLAYED
// PORT: Fixed ROM slots 38093.
    38093, 12
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38094–38094.
function agcAotUnit2234 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXTENDED_VERBS.agc:396
//
// PORT: SOURCE EXTENDED_VERBS.agc:397
//		TC	UPFLAG		# SET N22ORN17 TO 1 (FLAGWRD9,BIT6),
// PORT: Fixed ROM slots 38094.
    if slot <> 38094 or instruction <> 2918 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2918, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2234] to agcAotUnit2234@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:398
//		ADRES	N22ORN17	# COMPUTE TOTAL ATTITUDE ERROR WRT N22
// PORT: Fixed ROM slots 38095.
    38095, 288
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38096–38097.
function agcAotUnit2235 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38096 {
// PORT: SOURCE EXTENDED_VERBS.agc:399
//		TC	GOPIN
// PORT: Fixed ROM slots 38096.
        if slot <> 38096 or instruction <> 1105 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1105, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:400
//
// PORT: SOURCE EXTENDED_VERBS.agc:401
//# V63	VERB 63
// PORT: SOURCE EXTENDED_VERBS.agc:402
//V63		TC	UPFLAG		# SET NEEDLFLG TO 1 (FLAGWRD0,BIT9),
// PORT: Fixed ROM slots 38097.
        if slot <> 38097 or instruction <> 2918 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2918, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2235] to agcAotUnit2235@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:403
//		ADRES	NEEDLFLG	# TOTAL ATTITUDE ERROR DISPLAYED
// PORT: Fixed ROM slots 38098.
    38098, 12
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38099–38099.
function agcAotUnit2236 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXTENDED_VERBS.agc:404
//
// PORT: SOURCE EXTENDED_VERBS.agc:405
//		TC	DOWNFLAG	# SET N22ORN17 TO 0 (FLAGWRD9,BIT6,
// PORT: Fixed ROM slots 38099.
    if slot <> 38099 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2236] to agcAotUnit2236@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:406
//# Page 245
// PORT: SOURCE EXTENDED_VERBS.agc:407
//		ADRES	N22ORN17	# COMPUTE TOTAL ASTRONAUT ATTITUDE ERROR
// PORT: Fixed ROM slots 38100.
    38100, 288
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38101–38104.
function agcAotUnit2237 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38102 {
        if slot <= 38101 {
// PORT: SOURCE EXTENDED_VERBS.agc:408
//		TC	GOPIN
// PORT: Fixed ROM slots 38101.
            if slot <> 38101 or instruction <> 1105 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1105, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:409
//
// PORT: SOURCE EXTENDED_VERBS.agc:410
//# Page 246
// PORT: SOURCE EXTENDED_VERBS.agc:411
//# ALINTIME	VERB 55		DESCRIPTION
// PORT: SOURCE EXTENDED_VERBS.agc:412
//#	1. SET EXT VERB DISPLAY BUSY FLAG.
// PORT: SOURCE EXTENDED_VERBS.agc:413
//#	2. DISPLAY FLASHING V25,N24 (LOAD DELTA TIME FOR AGC CLOCK.
// PORT: SOURCE EXTENDED_VERBS.agc:414
//#	3. REQUIRE EXECUTION OF VERB 23.
// PORT: SOURCE EXTENDED_VERBS.agc:415
//#	4. ADD DELTA TIME, RECEIVED FROM INPUT REGISTER, TO THE COMPUTER TIME.
// PORT: SOURCE EXTENDED_VERBS.agc:416
//#	5. RELEASE EXT VERB DISPLAY SYSTEM
// PORT: SOURCE EXTENDED_VERBS.agc:417
//
// PORT: SOURCE EXTENDED_VERBS.agc:418
//		COUNT	04/R33
// PORT: SOURCE EXTENDED_VERBS.agc:419
//
// PORT: SOURCE EXTENDED_VERBS.agc:420
//ALINTIME	TC	TESTXACT
// PORT: Fixed ROM slots 38102.
            if slot <> 38102 or instruction <> 1086 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1086, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38103 {
// PORT: SOURCE EXTENDED_VERBS.agc:421
//
// PORT: SOURCE EXTENDED_VERBS.agc:422
//		CAF	VNLODDT
// PORT: Fixed ROM slots 38103.
            if slot <> 38103 or instruction <> 13551 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1263), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:423
//		TC	BANKCALL
// PORT: Fixed ROM slots 38104.
            if slot <> 38104 or instruction <> 2482 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2482, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2237] to agcAotUnit2237@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:424
//		CADR	GOMARKF
// PORT: Fixed ROM slots 38105.
    38105, 17122
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38106–38125.
function agcAotUnit2238 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38115 {
        if slot <= 38110 {
            if slot <= 38107 {
                if slot <= 38106 {
// PORT: SOURCE EXTENDED_VERBS.agc:425
//		TC	ENDEXT		# TERMINATE
// PORT: Fixed ROM slots 38106.
                    if slot <> 38106 or instruction <> 2908 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2908, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:426
//		TC	ENDEXT		# PROCEED
// PORT: Fixed ROM slots 38107.
                    if slot <> 38107 or instruction <> 2908 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2908, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38108 {
// PORT: SOURCE EXTENDED_VERBS.agc:427
//		CS	DEC23		# DATA IN OR RESEQUENCE(UNLIKELY)
// PORT: Fixed ROM slots 38108.
                    if slot <> 38108 or instruction <> 17646 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 1262), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38109 {
// PORT: SOURCE EXTENDED_VERBS.agc:428
//		AD	MPAC		# RECALL LEFT VERB IN MPAC
// PORT: Fixed ROM slots 38109.
                        if slot <> 38109 or instruction <> 24684 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 108).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:429
//		EXTEND
// PORT: Fixed ROM slots 38110.
                        if slot <> 38110 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 38112 {
                if slot <= 38111 {
// PORT: SOURCE EXTENDED_VERBS.agc:430
//		BZF	UPDATIME	# GO AHEAD WITH UPDATE ONLY IF RECALL
// PORT: Fixed ROM slots 38111.
                    if slot <> 38111 or instruction <> 5345 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5345, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:431
//		TC	ENDEXT		#	WITH V23 (DATA IN).
// PORT: Fixed ROM slots 38112.
                    if slot <> 38112 or instruction <> 2908 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2908, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38113 {
// PORT: SOURCE EXTENDED_VERBS.agc:432
//UPDATIME	INHINT			# DELTA TIME IS IN DSPTEM1, +1.
// PORT: Fixed ROM slots 38113.
                    if slot <> 38113 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38114 {
// PORT: SOURCE EXTENDED_VERBS.agc:433
//		CAF	ZERO
// PORT: Fixed ROM slots 38114.
                        if slot <> 38114 or instruction <> 14865 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:434
//		TS	MPAC +2		# NEEDED FOR TP AGREE
// PORT: Fixed ROM slots 38115.
                        if slot <> 38115 or instruction <> 22638 { return choose false if checkOnly else -1. }
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
        if slot <= 38120 {
            if slot <= 38117 {
                if slot <= 38116 {
// PORT: SOURCE EXTENDED_VERBS.agc:435
//		TS	L		# ZERO T1 & 2 WHILE ALIGNING.
// PORT: Fixed ROM slots 38116.
                    if slot <> 38116 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:436
//		DXCH	TIME2
// PORT: Fixed ROM slots 38117.
                    if slot <> 38117 or instruction <> 21525 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 21, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38118 {
// PORT: SOURCE EXTENDED_VERBS.agc:437
//		DXCH	MPAC
// PORT: Fixed ROM slots 38118.
                    if slot <> 38118 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38119 {
// PORT: SOURCE EXTENDED_VERBS.agc:438
//		DXCH	DSPTEM2 +1	# INCREMENT
// PORT: Fixed ROM slots 38119.
                        if slot <> 38119 or instruction <> 22058 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 554, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:439
//		DAS	MPAC
// PORT: Fixed ROM slots 38120.
                        if slot <> 38120 or instruction <> 8301 { return choose false if checkOnly else -1. }
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
            if slot <= 38122 {
                if slot <= 38121 {
// PORT: SOURCE EXTENDED_VERBS.agc:440
//
// PORT: SOURCE EXTENDED_VERBS.agc:441
//		TC	TPAGREE		# FORCE SIGN AGREEMENT.
// PORT: Fixed ROM slots 38121.
                    if slot <> 38121 or instruction <> 3734 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 3734, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:442
//		DXCH	MPAC		# NEW CLOCK.
// PORT: Fixed ROM slots 38122.
                    if slot <> 38122 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38123 {
// PORT: SOURCE EXTENDED_VERBS.agc:443
//		DAS	TIME2
// PORT: Fixed ROM slots 38123.
                    if slot <> 38123 or instruction <> 8213 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 21) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 38124 {
// PORT: SOURCE EXTENDED_VERBS.agc:444
//		RELINT
// PORT: Fixed ROM slots 38124.
                        if slot <> 38124 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:445
//UPDTMEND	TC	ENDEXT
// PORT: Fixed ROM slots 38125.
                        if slot <> 38125 or instruction <> 2908 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2908, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[2238] to agcAotUnit2238@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:446
//DEC23		DEC	23		# V 23
// PORT: Fixed ROM slots 38126.
    38126, 46,
// PORT: SOURCE EXTENDED_VERBS.agc:447
//
// PORT: SOURCE EXTENDED_VERBS.agc:448
//VNLODDT		VN	2524		# V25N24 FOR LOAD DELTA TIME
// PORT: Fixed ROM slots 38127.
    38127, 6448
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38128–38133.
function agcAotUnit2239 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38130 {
        if slot <= 38128 {
// PORT: SOURCE EXTENDED_VERBS.agc:449
//
// PORT: SOURCE EXTENDED_VERBS.agc:450
//# Page 247
// PORT: SOURCE EXTENDED_VERBS.agc:451
//# SYSTEST	VERB 92		DESCRIPTION
// PORT: SOURCE EXTENDED_VERBS.agc:452
//#	OPERATE SELECTED SYSTEM TEST
// PORT: SOURCE EXTENDED_VERBS.agc:453
//#	1. REQUIRE P00 OR P00- OR TURN ON OPERATOR ERROR.
// PORT: SOURCE EXTENDED_VERBS.agc:454
//#	2. TURN OFF DAP IF IT IS ON.
// PORT: SOURCE EXTENDED_VERBS.agc:455
//#	3. DISPLAY FLASHING V21,N01 (LOAD TEST NUMBER 1 THRU 17).
// PORT: SOURCE EXTENDED_VERBS.agc:456
//#	4. UPON ENTRY OF TEST NUMBER, SCHEDULE TSELECT WITH PRIORITY 20.
// PORT: SOURCE EXTENDED_VERBS.agc:457
//# 	TSELECT
// PORT: SOURCE EXTENDED_VERBS.agc:458
//#		1. IF LOADED TEST NUMBER IS VALID, GO TO THAT TEST ROUTINE, OTHERWISE TURN ON OPERATOR ERROR AND
// PORT: SOURCE EXTENDED_VERBS.agc:459
//#		   REPEAT LOAD REQUEST DISPLAY.  (NO. 3 ABOVE)
// PORT: SOURCE EXTENDED_VERBS.agc:460
//
// PORT: SOURCE EXTENDED_VERBS.agc:461
//		EBANK=	QPLACE
// PORT: SOURCE EXTENDED_VERBS.agc:462
//
// PORT: SOURCE EXTENDED_VERBS.agc:463
//		COUNT	04/EXTVB
// PORT: SOURCE EXTENDED_VERBS.agc:464
//
// PORT: SOURCE EXTENDED_VERBS.agc:465
//SYSTEST		TC	CHKPOOH
// PORT: Fixed ROM slots 38128.
            if slot <> 38128 or instruction <> 1496 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1496, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38129 {
// PORT: SOURCE EXTENDED_VERBS.agc:466
//		CA	FLAGWRD1	# IS NODOP01 FLAGBIT ON? (SET BY P11)
// PORT: Fixed ROM slots 38129.
                if slot <> 38129 or instruction <> 12349 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 61).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:467
//		MASK	NOP01BIT
// PORT: Fixed ROM slots 38130.
                if slot <> 38130 or instruction <> 31236 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2564), 32768).
                    if fixedOperand = 2048 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 2048), 2) * 2048).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38131 {
// PORT: SOURCE EXTENDED_VERBS.agc:468
//		EXTEND
// PORT: Fixed ROM slots 38131.
            if slot <> 38131 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38132 {
// PORT: SOURCE EXTENDED_VERBS.agc:469
//		BZF	V92CONT		# IF IT'S NOT YET SET, CONTINUE
// PORT: Fixed ROM slots 38132.
                if slot <> 38132 or instruction <> 5367 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5367, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:470
//		TC	POODOO		# IT'S ON. SEND NODO ALARM FOR P07
// PORT: Fixed ROM slots 38133.
                if slot <> 38133 or instruction <> 3025 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3025, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2239] to agcAotUnit2239@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:471
//		OCT	1521
// PORT: Fixed ROM slots 38134.
    38134, 1698
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38135–38137.
function agcAotUnit2240 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38135 {
// PORT: SOURCE EXTENDED_VERBS.agc:472
//V92CONT		TC	EXDAPOFF	# TURN DAP OFF IF IT'S ON
// PORT: Fixed ROM slots 38135.
        if slot <> 38135 or instruction <> 1500 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1500, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 38136 {
// PORT: SOURCE EXTENDED_VERBS.agc:473
//		CAF	PRIO20
// PORT: Fixed ROM slots 38136.
            if slot <> 38136 or instruction <> 14850 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:474
//		TC	FINDVAC
// PORT: Fixed ROM slots 38137.
            if slot <> 38137 or instruction <> 2663 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2663, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2240] to agcAotUnit2240@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:475
//		EBANK=	QPLACE
// PORT: SOURCE EXTENDED_VERBS.agc:476
//		SBANK=	IMUSUPER
// PORT: SOURCE EXTENDED_VERBS.agc:477
//		2CADR	REDO
// PORT: Fixed ROM slots 38138 38139.
    38138, 2052, 38139, 55402
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38140–38141.
function agcAotUnit2241 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38140 {
// PORT: SOURCE EXTENDED_VERBS.agc:478
//
// PORT: SOURCE EXTENDED_VERBS.agc:479
//		TC	GOPIN
// PORT: Fixed ROM slots 38140.
        if slot <> 38140 or instruction <> 1105 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1105, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:480
//
// PORT: SOURCE EXTENDED_VERBS.agc:481
//
// PORT: SOURCE EXTENDED_VERBS.agc:482
//# REDO AND TSELECT ARE NOW IN SYSTEM TEST.
// PORT: SOURCE EXTENDED_VERBS.agc:483
//
// PORT: SOURCE EXTENDED_VERBS.agc:484
//		COUNT*	$$/EXTVB
// PORT: SOURCE EXTENDED_VERBS.agc:485
//# CKOPTVB	VERB 65		DESCRIPTION
// PORT: SOURCE EXTENDED_VERBS.agc:486
//#	OPTICAL VERIFICATION FOR PRELAUNCH.
// PORT: SOURCE EXTENDED_VERBS.agc:487
//#	1.	SCHEDULE GCOMPVER, OPTICAL VERIFICATION SUBPROGRAM, WITH PRIORITY 17.
// PORT: SOURCE EXTENDED_VERBS.agc:488
//
// PORT: SOURCE EXTENDED_VERBS.agc:489
//CKOPTVB		TC	CHECKMM
// PORT: Fixed ROM slots 38141.
        if slot <> 38141 or instruction <> 2804 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2804, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2241] to agcAotUnit2241@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:490
//		MM	02		# I WONDER IF PRELAUNCH IS RUNNING
// PORT: Fixed ROM slots 38142.
    38142, 4
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38143–38146.
function agcAotUnit2242 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38144 {
        if slot <= 38143 {
// PORT: SOURCE EXTENDED_VERBS.agc:491
//		TC	ALM/END		# NOT RUNNING OPERATOR ERROR
// PORT: Fixed ROM slots 38143.
            if slot <> 38143 or instruction <> 1104 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1104, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:492
//		INHINT
// PORT: Fixed ROM slots 38144.
            if slot <> 38144 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38145 {
// PORT: SOURCE EXTENDED_VERBS.agc:493
//		CAF	PRIO16		# PRELAUNCH OPTICAL VERIFICATION
// PORT: Fixed ROM slots 38145.
            if slot <> 38145 or instruction <> 14904 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2616), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:494
//		TC	FINDVAC
// PORT: Fixed ROM slots 38146.
            if slot <> 38146 or instruction <> 2663 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2663, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2242] to agcAotUnit2242@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:495
//		EBANK=	QPLACE
// PORT: SOURCE EXTENDED_VERBS.agc:496
//		2CADR	COMPVER		# STANDARD LEADIN TO GCOMPVER.
// PORT: Fixed ROM slots 38147 38148.
    38147, 2048, 38148, 55402
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38149–38150.
function agcAotUnit2243 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38149 {
// PORT: SOURCE EXTENDED_VERBS.agc:497
//
// PORT: SOURCE EXTENDED_VERBS.agc:498
//		TC	GOPIN
// PORT: Fixed ROM slots 38149.
        if slot <> 38149 or instruction <> 1105 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1105, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:499
//
// PORT: SOURCE EXTENDED_VERBS.agc:500
//# Page 248
// PORT: SOURCE EXTENDED_VERBS.agc:501
//# V 78....	TO CHANGE GYROCOMPASS AZIMUTH
// PORT: SOURCE EXTENDED_VERBS.agc:502
//
// PORT: SOURCE EXTENDED_VERBS.agc:503
//CHAZFOGC	TC	CHECKMM		# IS IT PRELAUNCH
// PORT: Fixed ROM slots 38150.
        if slot <> 38150 or instruction <> 2804 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2804, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2243] to agcAotUnit2243@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:504
//		MM	02
// PORT: Fixed ROM slots 38151.
    38151, 4
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38152–38154.
function agcAotUnit2244 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38152 {
// PORT: SOURCE EXTENDED_VERBS.agc:505
//		TC	ALM/END		# NO - OPERA TOR ERROR
// PORT: Fixed ROM slots 38152.
        if slot <> 38152 or instruction <> 1104 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1104, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 38153 {
// PORT: SOURCE EXTENDED_VERBS.agc:506
//
// PORT: SOURCE EXTENDED_VERBS.agc:507
//		CAF	PRIO16		#  PRELAUNCH AZIMUTH CHANGE
// PORT: Fixed ROM slots 38153.
            if slot <> 38153 or instruction <> 14904 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2616), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:508
//		TC	FINDVAC
// PORT: Fixed ROM slots 38154.
            if slot <> 38154 or instruction <> 2663 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2663, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2244] to agcAotUnit2244@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:509
//		EBANK=	XSM
// PORT: SOURCE EXTENDED_VERBS.agc:510
//		2CADR	AZMTHCG1
// PORT: Fixed ROM slots 38155 38156.
    38155, 4036, 38156, 55402
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38157–38157.
function agcAotUnit2245 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXTENDED_VERBS.agc:511
//
// PORT: SOURCE EXTENDED_VERBS.agc:512
//		TC	PHASCHNG
// PORT: Fixed ROM slots 38157.
    if slot <> 38157 or instruction <> 2826 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2826, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2245] to agcAotUnit2245@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:513
//		OCT	00174
// PORT: Fixed ROM slots 38158.
    38158, 248
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38159–38172.
function agcAotUnit2246 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38165 {
        if slot <= 38161 {
            if slot <= 38159 {
// PORT: SOURCE EXTENDED_VERBS.agc:514
//		TC	GOPIN
// PORT: Fixed ROM slots 38159.
                if slot <> 38159 or instruction <> 1105 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1105, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38160 {
// PORT: SOURCE EXTENDED_VERBS.agc:515
//# Page 249
// PORT: SOURCE EXTENDED_VERBS.agc:516
//# IMUATTCK	VERB 43		DESCRIPTION
// PORT: SOURCE EXTENDED_VERBS.agc:517
//#	LOAD IMU ATTITUDE ERROR METERS
// PORT: SOURCE EXTENDED_VERBS.agc:518
//#	1. REQUIRE PROGRAM 00 ACTIVE, COARSE ALIGN ENABLE BIT OFF AND ZERO ICDU BIT OFF.
// PORT: SOURCE EXTENDED_VERBS.agc:519
//#	2. IF GUID REF RELEASE OR LIFTOFF HAS OCCURRED REQUIRE EXT VERB DISPLAY AVAILABLE AND SET BUSY
// PORT: SOURCE EXTENDED_VERBS.agc:520
//#	   FLAG, OTHERWISE ALLOW CURRENT EXT VERB DISPLAY TO BE OVER-RIDDEN.
// PORT: SOURCE EXTENDED_VERBS.agc:521
//#	3.  REMOVE COARSE ALIGN ENABLE AND IMU ERROR COUNTER ENABLE
// PORT: SOURCE EXTENDED_VERBS.agc:522
//#	4. DISPLAY FLASHING V25,N22 (LOAD NEW ICDU ANGLES).
// PORT: SOURCE EXTENDED_VERBS.agc:523
//#	5. UPON PROCEED OR ENTER RESPONSE, INITIALIZE CURRENT DAC AND COMMAND VALUES, ENABLE ERROR COUNTERS
// PORT: SOURCE EXTENDED_VERBS.agc:524
//#	   TRANSFER LOADED VALUES TO REGISTERS, AND SEND COMMANDS.
// PORT: SOURCE EXTENDED_VERBS.agc:525
//#	6. IF BUSY FLAG SET, RESET IT TO RELEASE EXT VERB DISPLAY.
// PORT: SOURCE EXTENDED_VERBS.agc:526
//
// PORT: SOURCE EXTENDED_VERBS.agc:527
//IMUATTCK	TC	CHKPOOH
// PORT: Fixed ROM slots 38160.
                    if slot <> 38160 or instruction <> 1496 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1496, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:528
//
// PORT: SOURCE EXTENDED_VERBS.agc:529
//		CAF	OCTAL30		# CHECK IF IMU ZERO AND IMU COARSE ARE ON
// PORT: Fixed ROM slots 38161.
                    if slot <> 38161 or instruction <> 13631 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1343), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 38163 {
                if slot <= 38162 {
// PORT: SOURCE EXTENDED_VERBS.agc:530
//		EXTEND
// PORT: Fixed ROM slots 38162.
                    if slot <> 38162 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:531
//		RAND	CHAN12
// PORT: Fixed ROM slots 38163.
                    if slot <> 38163 or instruction <> 1034 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38164 {
// PORT: SOURCE EXTENDED_VERBS.agc:532
//		CCS	A
// PORT: Fixed ROM slots 38164.
                    if slot <> 38164 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:533
//		TCF	ALM/END		# NOT ALLOWED IF IMU COARSE OR IMU ZERO ON
// PORT: Fixed ROM slots 38165.
                    if slot <> 38165 or instruction <> 5200 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5200, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 38168 {
            if slot <= 38166 {
// PORT: SOURCE EXTENDED_VERBS.agc:534
//
// PORT: SOURCE EXTENDED_VERBS.agc:535
//		TC	CKLFTBTS	# IS IT BEFORE OR AFTER LIFTOFF
// PORT: Fixed ROM slots 38166.
                if slot <> 38166 or instruction <> 1333 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1333, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38167 {
// PORT: SOURCE EXTENDED_VERBS.agc:536
//		TC	TESTXACT	# AFTER
// PORT: Fixed ROM slots 38167.
                    if slot <> 38167 or instruction <> 1086 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1086, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:537
//		CS	OCT50		# REMOVE COARSE AND ECTR ENABLE.
// PORT: Fixed ROM slots 38168.
                    if slot <> 38168 or instruction <> 18971 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2587), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 38170 {
                if slot <= 38169 {
// PORT: SOURCE EXTENDED_VERBS.agc:538
//		EXTEND
// PORT: Fixed ROM slots 38169.
                    if slot <> 38169 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:539
//		WAND	CHAN12
// PORT: Fixed ROM slots 38170.
                    if slot <> 38170 or instruction <> 1546 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38171 {
// PORT: SOURCE EXTENDED_VERBS.agc:540
//
// PORT: SOURCE EXTENDED_VERBS.agc:541
//		CAF	VNLODCDU
// PORT: Fixed ROM slots 38171.
                    if slot <> 38171 or instruction <> 13435 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1147), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:542
//		TC	BANKCALL
// PORT: Fixed ROM slots 38172.
                    if slot <> 38172 or instruction <> 2482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2246] to agcAotUnit2246@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:543
//		CADR	GOXDSPF
// PORT: Fixed ROM slots 38173.
    38173, 17122
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38174–38178.
function agcAotUnit2247 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38175 {
        if slot <= 38174 {
// PORT: SOURCE EXTENDED_VERBS.agc:544
//		TCF	TRMATTCK
// PORT: Fixed ROM slots 38174.
            if slot <> 38174 or instruction <> 5418 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5418, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:545
//		TC	+1
// PORT: Fixed ROM slots 38175.
            if slot <> 38175 or instruction <> 1312 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1312, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38176 {
// PORT: SOURCE EXTENDED_VERBS.agc:546
//		CAF	EBANK6
// PORT: Fixed ROM slots 38176.
            if slot <> 38176 or instruction <> 14895 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2607), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38177 {
// PORT: SOURCE EXTENDED_VERBS.agc:547
//		TS	EBANK		# SET E6 FOR NEEDLES.
// PORT: Fixed ROM slots 38177.
                if slot <> 38177 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:548
//
// PORT: SOURCE EXTENDED_VERBS.agc:549
//		EBANK=	AK
// PORT: SOURCE EXTENDED_VERBS.agc:550
//
// PORT: SOURCE EXTENDED_VERBS.agc:551
//		TC	BANKCALL	# INITIALIZE CURRENT DAC AND
// PORT: Fixed ROM slots 38178.
                if slot <> 38178 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2247] to agcAotUnit2247@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:552
//		CADR	NEEDLE11	# COMMAND VALUES
// PORT: Fixed ROM slots 38179.
    38179, 35398
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38180–38180.
function agcAotUnit2248 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXTENDED_VERBS.agc:553
//
// PORT: SOURCE EXTENDED_VERBS.agc:554
//		TC	BANKCALL	# ENABLE ERROR COUNTERS.
// PORT: Fixed ROM slots 38180.
    if slot <> 38180 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2248] to agcAotUnit2248@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:555
//		CADR	NEEDLER2
// PORT: Fixed ROM slots 38181.
    38181, 35428
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38182–38183.
function agcAotUnit2249 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38182 {
// PORT: SOURCE EXTENDED_VERBS.agc:556
//
// PORT: SOURCE EXTENDED_VERBS.agc:557
//		CAF	TWO		# 4 MS MIN.
// PORT: Fixed ROM slots 38182.
        if slot <> 38182 or instruction <> 14862 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2574), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:558
//		TC	WAITLIST
// PORT: Fixed ROM slots 38183.
        if slot <> 38183 or instruction <> 2725 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2725, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2249] to agcAotUnit2249@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:559
//		EBANK=	AK
// PORT: SOURCE EXTENDED_VERBS.agc:560
//		2CADR	ATTCK1
// PORT: Fixed ROM slots 38184 38185.
    38184, 2650, 38185, 55436
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38186–38193.
function agcAotUnit2250 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38189 {
        if slot <= 38187 {
            if slot <= 38186 {
// PORT: SOURCE EXTENDED_VERBS.agc:561
//
// PORT: SOURCE EXTENDED_VERBS.agc:562
//TRMATTCK	TC	CKLFTBTS	# IS IT BEFORE OR AFRER LIFTOFF
// PORT: Fixed ROM slots 38186.
                if slot <> 38186 or instruction <> 1333 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1333, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:563
//		TCF	ENDEXT		# AFTER
// PORT: Fixed ROM slots 38187.
                if slot <> 38187 or instruction <> 7004 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7004, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38188 {
// PORT: SOURCE EXTENDED_VERBS.agc:564
//		TC	GOPIN
// PORT: Fixed ROM slots 38188.
                if slot <> 38188 or instruction <> 1105 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1105, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:565
//# Page 250
// PORT: SOURCE EXTENDED_VERBS.agc:566
//ATTCK1		EXTEND			# TRANSFER LOADED VALUES TO DESIRED REGS.
// PORT: Fixed ROM slots 38189.
                if slot <> 38189 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38191 {
            if slot <= 38190 {
// PORT: SOURCE EXTENDED_VERBS.agc:567
//		DCA	THETAD
// PORT: Fixed ROM slots 38190.
                if slot <> 38190 or instruction <> 12910 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 622, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:568
//		DXCH	AK
// PORT: Fixed ROM slots 38191.
                if slot <> 38191 or instruction <> 22335 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 831, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38192 {
// PORT: SOURCE EXTENDED_VERBS.agc:569
//		CAE	THETAD	+2
// PORT: Fixed ROM slots 38192.
                if slot <> 38192 or instruction <> 12911 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 623).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:570
//		TS	AK	+2
// PORT: Fixed ROM slots 38193.
                if slot <> 38193 or instruction <> 23360 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23360, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2250] to agcAotUnit2250@.

// PORT: Physical bank 43. Shared continuation entries, slots 38194–38194.
function agcAotUnit2251 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXTENDED_VERBS.agc:571
//
// PORT: SOURCE EXTENDED_VERBS.agc:572
//		TC	IBNKCALL	# SENDS COMMANDS LIMITED TO +,- 384 PULSES
// PORT: Fixed ROM slots 38194.
    if slot <> 38194 or instruction <> 2528 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2528, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2251] to agcAotUnit2251@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:573
//		CADR	NEEDLES		# AND LEAVES ERROR COUNTERS ENABLED.
// PORT: Fixed ROM slots 38195.
    38195, 35452
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38196–38206.
function agcAotUnit2252 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38200 {
        if slot <= 38197 {
            if slot <= 38196 {
// PORT: SOURCE EXTENDED_VERBS.agc:574
//
// PORT: SOURCE EXTENDED_VERBS.agc:575
//		TC	TASKOVER
// PORT: Fixed ROM slots 38196.
                if slot <> 38196 or instruction <> 2772 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2772, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:576
//
// PORT: SOURCE EXTENDED_VERBS.agc:577
//CKLFTBTS	CAF	GRRBKBIT	# HAS LIFTOFF OCCURRED
// PORT: Fixed ROM slots 38197.
                if slot <> 38197 or instruction <> 14859 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2571), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38198 {
// PORT: SOURCE EXTENDED_VERBS.agc:578
//		MASK	FLAGWRD5
// PORT: Fixed ROM slots 38198.
                if slot <> 38198 or instruction <> 28737 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 65).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38199 {
// PORT: SOURCE EXTENDED_VERBS.agc:579
//		CCS	A
// PORT: Fixed ROM slots 38199.
                    if slot <> 38199 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:580
//		TC	Q		# YES
// PORT: Fixed ROM slots 38200.
                    if slot <> 38200 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 38203 {
            if slot <= 38201 {
// PORT: SOURCE EXTENDED_VERBS.agc:581
//		CAF	BIT5
// PORT: Fixed ROM slots 38201.
                if slot <> 38201 or instruction <> 14859 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2571), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38202 {
// PORT: SOURCE EXTENDED_VERBS.agc:582
//		EXTEND
// PORT: Fixed ROM slots 38202.
                    if slot <> 38202 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:583
//		RAND	CHAN30
// PORT: Fixed ROM slots 38203.
                    if slot <> 38203 or instruction <> 1048 { return choose false if checkOnly else -1. }
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
            if slot <= 38204 {
// PORT: SOURCE EXTENDED_VERBS.agc:584
//		CCS	A
// PORT: Fixed ROM slots 38204.
                if slot <> 38204 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38205 {
// PORT: SOURCE EXTENDED_VERBS.agc:585
//		TCF	Q+1
// PORT: Fixed ROM slots 38205.
                    if slot <> 38205 or instruction <> 7622 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 7622, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:586
//XACT0Q		TC	Q		# YES
// PORT: Fixed ROM slots 38206.
                    if slot <> 38206 or instruction <> 2 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2252] to agcAotUnit2252@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:587
//
// PORT: SOURCE EXTENDED_VERBS.agc:588
//OCTAL30		OCT	30
// PORT: Fixed ROM slots 38207.
    38207, 48
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38208–38212.
function agcAotUnit2253 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38209 {
        if slot <= 38208 {
// PORT: SOURCE EXTENDED_VERBS.agc:589
//VB64		TC	CHKPOOH		# DEMAND PROGRAM 00.
// PORT: Fixed ROM slots 38208.
            if slot <> 38208 or instruction <> 1496 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1496, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:590
//		TC	TESTXACT	# IF DISPLAY SYS. NOT BUSY,MAKE IT BUSY.
// PORT: Fixed ROM slots 38209.
            if slot <> 38209 or instruction <> 1086 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1086, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38210 {
// PORT: SOURCE EXTENDED_VERBS.agc:591
//		INHINT
// PORT: Fixed ROM slots 38210.
            if slot <> 38210 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38211 {
// PORT: SOURCE EXTENDED_VERBS.agc:592
//		CAF	PRIO4
// PORT: Fixed ROM slots 38211.
                if slot <> 38211 or instruction <> 14852 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2564), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:593
//		TC	FINDVAC
// PORT: Fixed ROM slots 38212.
                if slot <> 38212 or instruction <> 2663 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2663, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2253] to agcAotUnit2253@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:594
//		EBANK=	RHOSB
// PORT: SOURCE EXTENDED_VERBS.agc:595
//		2CADR	SBANDANT	# CALC.,DISPLAY S-BAND ANTENNA ANGLES.
// PORT: Fixed ROM slots 38213 38214.
    38213, 3924, 38214, 53384
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38215–38216.
function agcAotUnit2254 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38215 {
// PORT: SOURCE EXTENDED_VERBS.agc:596
//
// PORT: SOURCE EXTENDED_VERBS.agc:597
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 38215.
        if slot <> 38215 or instruction <> 2703 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2703, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:598
//
// PORT: SOURCE EXTENDED_VERBS.agc:599
//# 	ENATMA		VERB 58		DESCRIPTION
// PORT: SOURCE EXTENDED_VERBS.agc:600
//#		ENABLE AUTOMATIC ATTITUDE MANEUVER
// PORT: SOURCE EXTENDED_VERBS.agc:601
//
// PORT: SOURCE EXTENDED_VERBS.agc:602
//# VERB58 RESETS STIKFLAG TO ENABLE R61 TO PERFORM AUTOMATIC TRACKING MANEUVERS, AFTER INTERRUPTS BY THE RHC ACT-
// PORT: SOURCE EXTENDED_VERBS.agc:603
//# IVITY.
// PORT: SOURCE EXTENDED_VERBS.agc:604
//
// PORT: SOURCE EXTENDED_VERBS.agc:605
//ENATMA		TC	DOWNFLAG	# RESET STIKFLAG.
// PORT: Fixed ROM slots 38216.
        if slot <> 38216 or instruction <> 2928 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2928, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2254] to agcAotUnit2254@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:606
//		ADRES	STIKFLAG	# BIT 14 FLAG 1
// PORT: Fixed ROM slots 38217.
    38217, 32
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38218–38224.
function agcAotUnit2255 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38220 {
        if slot <= 38218 {
// PORT: SOURCE EXTENDED_VERBS.agc:607
//		TC	GOPIN
// PORT: Fixed ROM slots 38218.
            if slot <> 38218 or instruction <> 1105 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1105, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38219 {
// PORT: SOURCE EXTENDED_VERBS.agc:608
//
// PORT: SOURCE EXTENDED_VERBS.agc:609
//# Page 251
// PORT: SOURCE EXTENDED_VERBS.agc:610
//# STROKON	VERB 68		DESCRIPTION
// PORT: SOURCE EXTENDED_VERBS.agc:611
//
// PORT: SOURCE EXTENDED_VERBS.agc:612
//#	STROKE TEST SETUP/ENABLE
// PORT: SOURCE EXTENDED_VERBS.agc:613
//#	1. SET EXT VERB DISPLAY BUSY FLAG
// PORT: SOURCE EXTENDED_VERBS.agc:614
//#	2. SCHEDULE STRKTST1 WITH PRIORITY 30.
// PORT: SOURCE EXTENDED_VERBS.agc:615
//#	3. RELEASE EXT VERB DISPLAY.
// PORT: SOURCE EXTENDED_VERBS.agc:616
//
// PORT: SOURCE EXTENDED_VERBS.agc:617
//		EBANK=	T5TVCDT
// PORT: SOURCE EXTENDED_VERBS.agc:618
//STROKON		CS	FLAGWRD6	# V68	PERMITTED ONLY DURING TVC
// PORT: Fixed ROM slots 38219.
                if slot <> 38219 or instruction <> 16450 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 66).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:619
//		MASK	OCT60000
// PORT: Fixed ROM slots 38220.
                if slot <> 38220 or instruction <> 30789 { return choose false if checkOnly else -1. }
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
        }
    } else {
        if slot <= 38222 {
            if slot <= 38221 {
// PORT: SOURCE EXTENDED_VERBS.agc:620
//		EXTEND
// PORT: Fixed ROM slots 38221.
                if slot <> 38221 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:621
//		BZMF	ALM/END		# NOT TVC....FLASH OP ERROR LIGHT
// PORT: Fixed ROM slots 38222.
                if slot <> 38222 or instruction <> 25680 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 25680, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38223 {
// PORT: SOURCE EXTENDED_VERBS.agc:622
//		CAF	PRIO30		# JOB REQUEST, TO SET UP STROKE TEST,
// PORT: Fixed ROM slots 38223.
                if slot <> 38223 or instruction <> 14585 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2297), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:623
//		TC	NOVAC		#	INCLUDING INITIALIZATIONS
// PORT: Fixed ROM slots 38224.
                if slot <> 38224 or instruction <> 2652 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2652, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2255] to agcAotUnit2255@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:624
//		EBANK=	STROKER
// PORT: SOURCE EXTENDED_VERBS.agc:625
//		2CADR	STRKTSTI
// PORT: Fixed ROM slots 38225 38226.
    38225, 3714, 38226, 32908
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38227–38238.
function agcAotUnit2256 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38232 {
        if slot <= 38229 {
            if slot <= 38227 {
// PORT: SOURCE EXTENDED_VERBS.agc:626
//
// PORT: SOURCE EXTENDED_VERBS.agc:627
//		TC	GOPIN
// PORT: Fixed ROM slots 38227.
                if slot <> 38227 or instruction <> 1105 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1105, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38228 {
// PORT: SOURCE EXTENDED_VERBS.agc:628
//
// PORT: SOURCE EXTENDED_VERBS.agc:629
//
// PORT: SOURCE EXTENDED_VERBS.agc:630
//# STABLISH	VERB 46		DESCRIPTION
// PORT: SOURCE EXTENDED_VERBS.agc:631
//#	ESTABLISH G & N AUTOPILOT CONTROL
// PORT: SOURCE EXTENDED_VERBS.agc:632
//#	1. SETS UP EITHER RCS, ENTRY, OR SATURN
// PORT: SOURCE EXTENDED_VERBS.agc:633
//#	2. IF TVC IS ON, SETS UP CSM/LM SWITCH-OVER
// PORT: SOURCE EXTENDED_VERBS.agc:634
//#		FROM HIGH BW TO LOW BW
// PORT: SOURCE EXTENDED_VERBS.agc:635
//
// PORT: SOURCE EXTENDED_VERBS.agc:636
//
// PORT: SOURCE EXTENDED_VERBS.agc:637
//STABLISH	CAF	EBANK6		# V46 	- SET EBANK TO E6
// PORT: Fixed ROM slots 38228.
                    if slot <> 38228 or instruction <> 14895 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2607), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:638
//		TS	EBANK
// PORT: Fixed ROM slots 38229.
                    if slot <> 38229 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 38230 {
// PORT: SOURCE EXTENDED_VERBS.agc:639
//
// PORT: SOURCE EXTENDED_VERBS.agc:640
//		CS	FLAGWRD6	# 	TEST FOR TVC
// PORT: Fixed ROM slots 38230.
                if slot <> 38230 or instruction <> 16450 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 66).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38231 {
// PORT: SOURCE EXTENDED_VERBS.agc:641
//		MASK	OCT60000
// PORT: Fixed ROM slots 38231.
                    if slot <> 38231 or instruction <> 30789 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE EXTENDED_VERBS.agc:642
//		EXTEND
// PORT: Fixed ROM slots 38232.
                    if slot <> 38232 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 38235 {
            if slot <= 38233 {
// PORT: SOURCE EXTENDED_VERBS.agc:643
//		BZMF	+8
// PORT: Fixed ROM slots 38233.
                if slot <> 38233 or instruction <> 25953 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 25953, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38234 {
// PORT: SOURCE EXTENDED_VERBS.agc:644
//
// PORT: SOURCE EXTENDED_VERBS.agc:645
//		CAE	DAPDATR1	# 	TEST FOR CSM/LM
// PORT: Fixed ROM slots 38234.
                    if slot <> 38234 or instruction <> 13110 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 822).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:646
//		MASK	BIT14
// PORT: Fixed ROM slots 38235.
                    if slot <> 38235 or instruction <> 31234 { return choose false if checkOnly else -1. }
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
            if slot <= 38236 {
// PORT: SOURCE EXTENDED_VERBS.agc:647
//		EXTEND
// PORT: Fixed ROM slots 38236.
                if slot <> 38236 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38237 {
// PORT: SOURCE EXTENDED_VERBS.agc:648
//		BZMF	+3
// PORT: Fixed ROM slots 38237.
                    if slot <> 38237 or instruction <> 25952 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 25952, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:649
//
// PORT: SOURCE EXTENDED_VERBS.agc:650
//		TC	POSTJUMP	# CSM/LM, SO PERFORM HB TO LB SWITCH-OVER
// PORT: Fixed ROM slots 38238.
                    if slot <> 38238 or instruction <> 2497 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2497, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2256] to agcAotUnit2256@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:651
//		CADR	PRESWTCH
// PORT: Fixed ROM slots 38239.
    38239, 31186
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38240–38241.
function agcAotUnit2257 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38240 {
// PORT: SOURCE EXTENDED_VERBS.agc:652
//
// PORT: SOURCE EXTENDED_VERBS.agc:653
//+3		TC	ALM/END		# CSM, SO ALARM AND EXIT
// PORT: Fixed ROM slots 38240.
        if slot <> 38240 or instruction <> 1104 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1104, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:654
//
// PORT: SOURCE EXTENDED_VERBS.agc:655
//+8		TC	POSTJUMP	# SET UP RCS, ENTRY, OR SATURN-STICK DAP
// PORT: Fixed ROM slots 38241.
        if slot <> 38241 or instruction <> 2497 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2497, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2257] to agcAotUnit2257@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:656
//		CADR	DAPFIG
// PORT: Fixed ROM slots 38242.
    38242, 55052
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38243–38246.
function agcAotUnit2258 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38244 {
        if slot <= 38243 {
// PORT: SOURCE EXTENDED_VERBS.agc:657
//# Page 252
// PORT: SOURCE EXTENDED_VERBS.agc:658
//# CREMANU	VERB 49		DESCRIPTION
// PORT: SOURCE EXTENDED_VERBS.agc:659
//#	START AUTOMATIC ATTITUDE MANEUVER
// PORT: SOURCE EXTENDED_VERBS.agc:660
//#	1. REQUIRE PROGRAM 00 ACTIVE.
// PORT: SOURCE EXTENDED_VERBS.agc:661
//#	2. SET EXT VERB DISPLAY BUSY FLAG.
// PORT: SOURCE EXTENDED_VERBS.agc:662
//#	3. SCHEDULE R62DISP WITH PRIORITY 10.
// PORT: SOURCE EXTENDED_VERBS.agc:663
//#	4. RELEASE EXT VERB DISPLAY.
// PORT: SOURCE EXTENDED_VERBS.agc:664
//
// PORT: SOURCE EXTENDED_VERBS.agc:665
//#	R62DISP
// PORT: SOURCE EXTENDED_VERBS.agc:666
//#	1. DISPLAY FLASHING V06,N22 (DECIMAL DISPLAY NEW ICDU ANGLES).  UPON IMMEDIATE RETURN, SET-UP GROUP
// PORT: SOURCE EXTENDED_VERBS.agc:667
//#	   4 FOR RESTART OF DISPLAY SEQUENCE.
// PORT: SOURCE EXTENDED_VERBS.agc:668
//#	   RESPONSES
// PORT: SOURCE EXTENDED_VERBS.agc:669
//#	   A. TERMINATE
// PORT: SOURCE EXTENDED_VERBS.agc:670
//#	      1. GO TO GOTOPOOH.
// PORT: SOURCE EXTENDED_VERBS.agc:671
//#	   B. PROCEED
// PORT: SOURCE EXTENDED_VERBS.agc:672
//#	      1. SET 3AXISFLG TO INDICATE MANEUVER IS SPECIFIED BY 3 AXIS.
// PORT: SOURCE EXTENDED_VERBS.agc:673
//#	      2. EXECUTE R60CSM (ATTITUDE MANEUVER).
// PORT: SOURCE EXTENDED_VERBS.agc:674
//#	      3. ZERO GROUP 4 (END R62).
// PORT: SOURCE EXTENDED_VERBS.agc:675
//#	   C. ENTER
// PORT: SOURCE EXTENDED_VERBS.agc:676
//#	      1. REPEAT FLASHING V06,N22.
// PORT: SOURCE EXTENDED_VERBS.agc:677
//
// PORT: SOURCE EXTENDED_VERBS.agc:678
//CREWMANU	TC	CHKPOOH		# DEMAND P00
// PORT: Fixed ROM slots 38243.
            if slot <> 38243 or instruction <> 1496 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1496, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:679
//
// PORT: SOURCE EXTENDED_VERBS.agc:680
//		TC	TESTXACT
// PORT: Fixed ROM slots 38244.
            if slot <> 38244 or instruction <> 1086 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1086, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38245 {
// PORT: SOURCE EXTENDED_VERBS.agc:681
//
// PORT: SOURCE EXTENDED_VERBS.agc:682
//		CAF	PRIO10
// PORT: Fixed ROM slots 38245.
            if slot <> 38245 or instruction <> 14851 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:683
//		TC	FINDVAC
// PORT: Fixed ROM slots 38246.
            if slot <> 38246 or instruction <> 2663 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2663, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2258] to agcAotUnit2258@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:684
//		EBANK=	CPHI
// PORT: SOURCE EXTENDED_VERBS.agc:685
//		2CADR	R62DISP
// PORT: Fixed ROM slots 38247 38248.
    38247, 2480, 38248, 47236
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38249–38256.
function agcAotUnit2259 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38252 {
        if slot <= 38250 {
            if slot <= 38249 {
// PORT: SOURCE EXTENDED_VERBS.agc:686
//
// PORT: SOURCE EXTENDED_VERBS.agc:687
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 38249.
                if slot <> 38249 or instruction <> 2703 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2703, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:688
//
// PORT: SOURCE EXTENDED_VERBS.agc:689
//# Page 253
// PORT: SOURCE EXTENDED_VERBS.agc:690
//# DAPDISP	VERB 48		DESCRIPTION
// PORT: SOURCE EXTENDED_VERBS.agc:691
//#	LOAD AUTOPILOT DATA (ROUTINE R03)
// PORT: SOURCE EXTENDED_VERBS.agc:692
//#	0. CHECKFAIL AND RETURN IF TVC.
// PORT: SOURCE EXTENDED_VERBS.agc:693
//#	1. REQUIRE EXT VERB DISPLAY AVAILABLE AND SET BUSY FLAG.
// PORT: SOURCE EXTENDED_VERBS.agc:694
//#	2. LOWER PRIORITY TO 10.
// PORT: SOURCE EXTENDED_VERBS.agc:695
//#	3. DISPLAY FLASHING V04,N46 (DISPLAY AUTOPILOT CONFIGURATION)
// PORT: SOURCE EXTENDED_VERBS.agc:696
//#	4. UPON PROCEED RESPONSE, EXECUTE S41.2.
// PORT: SOURCE EXTENDED_VERBS.agc:697
//#	5. DISPLAY FLASHING V06,N47 (DISPLAY CSM WGT.. LEM WGT.)
// PORT: SOURCE EXTENDED_VERBS.agc:698
//#	6. UPON PROCEED RESPONSE EXECUTE S40.14.
// PORT: SOURCE EXTENDED_VERBS.agc:699
//#	7. DISPLAY FLASHING V06,N48 (DISPLAY PITCH TRIM, YAW TRIM)
// PORT: SOURCE EXTENDED_VERBS.agc:700
//#	8. UPON PROCEED RESPONSE, RELEASE EXTENDED VERB DESPLAY SYSTEM
// PORT: SOURCE EXTENDED_VERBS.agc:701
//		COUNT*	$$/EXTVB
// PORT: SOURCE EXTENDED_VERBS.agc:702
//
// PORT: SOURCE EXTENDED_VERBS.agc:703
//DAPDISP		CS	FLAGWRD6
// PORT: Fixed ROM slots 38250.
                if slot <> 38250 or instruction <> 16450 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 66).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38251 {
// PORT: SOURCE EXTENDED_VERBS.agc:704
//		MASK	OCT60000
// PORT: Fixed ROM slots 38251.
                if slot <> 38251 or instruction <> 30789 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE EXTENDED_VERBS.agc:705
//		EXTEND
// PORT: Fixed ROM slots 38252.
                if slot <> 38252 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38254 {
            if slot <= 38253 {
// PORT: SOURCE EXTENDED_VERBS.agc:706
//		BZMF	+2		# TVC = 10, CS YIELDS 01, BZMF TO CONTINUE
// PORT: Fixed ROM slots 38253.
                if slot <> 38253 or instruction <> 25967 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 25967, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:707
//		TC	ALM/END		# RETURN IF TVC
// PORT: Fixed ROM slots 38254.
                if slot <> 38254 or instruction <> 1104 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1104, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38255 {
// PORT: SOURCE EXTENDED_VERBS.agc:708
//
// PORT: SOURCE EXTENDED_VERBS.agc:709
//		TC	TESTXACT
// PORT: Fixed ROM slots 38255.
                if slot <> 38255 or instruction <> 1086 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1086, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:710
//		TC	BANKCALL
// PORT: Fixed ROM slots 38256.
                if slot <> 38256 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2259] to agcAotUnit2259@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:711
//		CADR	DAPDISP1
// PORT: Fixed ROM slots 38257.
    38257, 53248
)).

// PORT: Physical bank 42. Shared continuation entries, slots 36864–36869.
function agcAotUnit2156 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36866 {
        if slot <= 36864 {
// PORT: SOURCE EXTENDED_VERBS.agc:712
//		BANK	42
// PORT: SOURCE EXTENDED_VERBS.agc:713
//		SETLOC	EXTVBS
// PORT: SOURCE EXTENDED_VERBS.agc:714
//		BANK
// PORT: SOURCE EXTENDED_VERBS.agc:715
//		COUNT	24/R03
// PORT: SOURCE EXTENDED_VERBS.agc:716
//
// PORT: SOURCE EXTENDED_VERBS.agc:717
//DAPDISP1	CAF	EBANK6
// PORT: Fixed ROM slots 36864.
            if slot <> 36864 or instruction <> 14895 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2607), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 36865 {
// PORT: SOURCE EXTENDED_VERBS.agc:718
//		TS	EBANK
// PORT: Fixed ROM slots 36865.
                if slot <> 36865 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:719
//
// PORT: SOURCE EXTENDED_VERBS.agc:720
//		CAF	PRIO10
// PORT: Fixed ROM slots 36866.
                if slot <> 36866 or instruction <> 14851 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 36867 {
// PORT: SOURCE EXTENDED_VERBS.agc:721
//		TC	PRIOCHNG
// PORT: Fixed ROM slots 36867.
            if slot <> 36867 or instruction <> 2696 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2696, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 36868 {
// PORT: SOURCE EXTENDED_VERBS.agc:722
//
// PORT: SOURCE EXTENDED_VERBS.agc:723
//DONOUN46	CAF	V04N46		#	  R1		  R2
// PORT: Fixed ROM slots 36868.
                if slot <> 36868 or instruction <> 13361 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1073), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:724
//		TC	BANKCALL	#	DAPDATR1	DAPDATR2
// PORT: Fixed ROM slots 36869.
                if slot <> 36869 or instruction <> 2482 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2482, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2156] to agcAotUnit2156@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:725
//		CADR	GOXDSPF		# GOXDSP ROUTINES USED FOR EXTENDED VERBS.
// PORT: Fixed ROM slots 36870.
    36870, 17122
)).

// PORT: Physical bank 42. Shared continuation entries, slots 36871–36878.
function agcAotUnit2157 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36874 {
        if slot <= 36872 {
            if slot <= 36871 {
// PORT: SOURCE EXTENDED_VERBS.agc:726
//
// PORT: SOURCE EXTENDED_VERBS.agc:727
//		TC	ENDEXT		# EXT. VBS GO TO ENDEXT, NOT ENDOFJOB.
// PORT: Fixed ROM slots 36871.
                if slot <> 36871 or instruction <> 2908 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2908, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:728
//		TC	+2
// PORT: Fixed ROM slots 36872.
                if slot <> 36872 or instruction <> 1034 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1034, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 36873 {
// PORT: SOURCE EXTENDED_VERBS.agc:729
//		TC	DONOUN46
// PORT: Fixed ROM slots 36873.
                if slot <> 36873 or instruction <> 1028 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1028, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:730
//
// PORT: SOURCE EXTENDED_VERBS.agc:731
//		CA	DAPDATR1
// PORT: Fixed ROM slots 36874.
                if slot <> 36874 or instruction <> 13110 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 822).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 36876 {
            if slot <= 36875 {
// PORT: SOURCE EXTENDED_VERBS.agc:732
//		MASK	BIT4
// PORT: Fixed ROM slots 36875.
                if slot <> 36875 or instruction <> 31244 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                    if fixedOperand = 8 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 8), 2) * 8).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:733
//		CCS	A
// PORT: Fixed ROM slots 36876.
                if slot <> 36876 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 36877 {
// PORT: SOURCE EXTENDED_VERBS.agc:734
//		TCF	MAXIN
// PORT: Fixed ROM slots 36877.
                if slot <> 36877 or instruction <> 5164 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5164, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:735
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 36878.
                if slot <> 36878 or instruction <> 2928 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2928, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2157] to agcAotUnit2157@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:736
//		ADRES	MAXDBFLG
// PORT: Fixed ROM slots 36879.
    36879, 276
)).

// PORT: Physical bank 42. Shared continuation entries, slots 36880–36880.
function agcAotUnit2158 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXTENDED_VERBS.agc:737
//MAXOUT		TC	BANKCALL
// PORT: Fixed ROM slots 36880.
    if slot <> 36880 or instruction <> 2482 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2482, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2158] to agcAotUnit2158@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:738
//		CADR	S41.2
// PORT: Fixed ROM slots 36881.
    36881, 33230
)).

// PORT: Physical bank 42. Shared continuation entries, slots 36882–36883.
function agcAotUnit2159 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36882 {
// PORT: SOURCE EXTENDED_VERBS.agc:739
//
// PORT: SOURCE EXTENDED_VERBS.agc:740
//DONOUN47	CAF	V06N47		#	R1		R2		R3
// PORT: Fixed ROM slots 36882.
        if slot <> 36882 or instruction <> 13360 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1072), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:741
//# Page 254
// PORT: SOURCE EXTENDED_VERBS.agc:742
//		TC	BANKCALL	#	CSM WGT.	LEM WGT.	BLANK
// PORT: Fixed ROM slots 36883.
        if slot <> 36883 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2159] to agcAotUnit2159@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:743
//		CADR	GOXDSPF
// PORT: Fixed ROM slots 36884.
    36884, 17122
)).

// PORT: Physical bank 42. Shared continuation entries, slots 36885–36897.
function agcAotUnit2160 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36890 {
        if slot <= 36887 {
            if slot <= 36885 {
// PORT: SOURCE EXTENDED_VERBS.agc:744
//
// PORT: SOURCE EXTENDED_VERBS.agc:745
//		TC	ENDEXT
// PORT: Fixed ROM slots 36885.
                if slot <> 36885 or instruction <> 2908 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2908, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 36886 {
// PORT: SOURCE EXTENDED_VERBS.agc:746
//		TC	+2
// PORT: Fixed ROM slots 36886.
                    if slot <> 36886 or instruction <> 1048 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1048, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:747
//		TC	DONOUN47
// PORT: Fixed ROM slots 36887.
                    if slot <> 36887 or instruction <> 1042 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1042, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 36888 {
// PORT: SOURCE EXTENDED_VERBS.agc:748
//		CAE	DAPDATR1	# DO MASS PROPERTIES CALCULATION ONLY IF
// PORT: Fixed ROM slots 36888.
                if slot <> 36888 or instruction <> 13110 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 822).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 36889 {
// PORT: SOURCE EXTENDED_VERBS.agc:749
//		MASK	PRIO30		# CONFIG = 1(CSM), 2(CSM/LM), 6(CSM/LMA)
// PORT: Fixed ROM slots 36889.
                    if slot <> 36889 or instruction <> 30969 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2297), 32768).
                        if fixedOperand = 12288 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 4096), 4) * 4096).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:750
//		EXTEND
// PORT: Fixed ROM slots 36890.
                    if slot <> 36890 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 36893 {
            if slot <= 36891 {
// PORT: SOURCE EXTENDED_VERBS.agc:751
//		BZF	DONOUN48	# SKIP IF 0, 4
// PORT: Fixed ROM slots 36891.
                if slot <> 36891 or instruction <> 5158 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5158, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 36892 {
// PORT: SOURCE EXTENDED_VERBS.agc:752
//		COM
// PORT: Fixed ROM slots 36892.
                    if slot <> 36892 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:753
//		MASK	PRIO30
// PORT: Fixed ROM slots 36893.
                    if slot <> 36893 or instruction <> 30969 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2297), 32768).
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
            if slot <= 36895 {
                if slot <= 36894 {
// PORT: SOURCE EXTENDED_VERBS.agc:754
//		EXTEND
// PORT: Fixed ROM slots 36894.
                    if slot <> 36894 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:755
//		BZF	DONOUN48	# SKIP IF 3, 7
// PORT: Fixed ROM slots 36895.
                    if slot <> 36895 or instruction <> 5158 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5158, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 36896 {
// PORT: SOURCE EXTENDED_VERBS.agc:756
//		INHINT
// PORT: Fixed ROM slots 36896.
                    if slot <> 36896 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:757
//		TC	IBNKCALL
// PORT: Fixed ROM slots 36897.
                    if slot <> 36897 or instruction <> 2528 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2160] to agcAotUnit2160@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:758
//		CADR	MASSPROP	# UPDATE IXX, IAVG, IAVG/TLX
// PORT: Fixed ROM slots 36898.
    36898, 11756
)).

// PORT: Physical bank 42. Shared continuation entries, slots 36899–36900.
function agcAotUnit2161 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36899 {
// PORT: SOURCE EXTENDED_VERBS.agc:759
//
// PORT: SOURCE EXTENDED_VERBS.agc:760
//		RELINT
// PORT: Fixed ROM slots 36899.
        if slot <> 36899 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:761
//		TC	BANKCALL
// PORT: Fixed ROM slots 36900.
        if slot <> 36900 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2161] to agcAotUnit2161@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:762
//		CADR	S40.14		# COMPUTE RCS DAP STUFF
// PORT: Fixed ROM slots 36901.
    36901, 33408
)).

// PORT: Physical bank 42. Shared continuation entries, slots 36902–36903.
function agcAotUnit2162 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36902 {
// PORT: SOURCE EXTENDED_VERBS.agc:763
//
// PORT: SOURCE EXTENDED_VERBS.agc:764
//DONOUN48	CAF	V0648		#	 R1		 R2		 R3
// PORT: Fixed ROM slots 36902.
        if slot <> 36902 or instruction <> 13359 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1071), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:765
//		TC	BANKCALL	#	PTRIM		YTRIM		BLANK
// PORT: Fixed ROM slots 36903.
        if slot <> 36903 or instruction <> 2482 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2482, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2162] to agcAotUnit2162@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:766
//		CADR	GOXDSPF
// PORT: Fixed ROM slots 36904.
    36904, 17122
)).

// PORT: Physical bank 42. Shared continuation entries, slots 36905–36908.
function agcAotUnit2163 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 36906 {
        if slot <= 36905 {
// PORT: SOURCE EXTENDED_VERBS.agc:767
//
// PORT: SOURCE EXTENDED_VERBS.agc:768
//		TC	ENDEXT
// PORT: Fixed ROM slots 36905.
            if slot <> 36905 or instruction <> 2908 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2908, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:769
//		TC	ENDEXT
// PORT: Fixed ROM slots 36906.
            if slot <> 36906 or instruction <> 2908 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2908, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 36907 {
// PORT: SOURCE EXTENDED_VERBS.agc:770
//		TC	DONOUN48
// PORT: Fixed ROM slots 36907.
            if slot <> 36907 or instruction <> 1062 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1062, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:771
//
// PORT: SOURCE EXTENDED_VERBS.agc:772
//MAXIN		TC	UPFLAG
// PORT: Fixed ROM slots 36908.
            if slot <> 36908 or instruction <> 2918 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2918, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2163] to agcAotUnit2163@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:773
//		ADRES	MAXDBFLG
// PORT: Fixed ROM slots 36909.
    36909, 276
)).

// PORT: Physical bank 42. Shared continuation entries, slots 36910–36910.
function agcAotUnit2164 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXTENDED_VERBS.agc:774
//		TC	MAXOUT
// PORT: Fixed ROM slots 36910.
    if slot <> 36910 or instruction <> 1040 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1040, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2164] to agcAotUnit2164@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:775
//
// PORT: SOURCE EXTENDED_VERBS.agc:776
//V0648		VN	0648
// PORT: Fixed ROM slots 36911.
    36911, 1632,
// PORT: SOURCE EXTENDED_VERBS.agc:777
//V06N47		VN	0647
// PORT: Fixed ROM slots 36912.
    36912, 1630,
// PORT: SOURCE EXTENDED_VERBS.agc:778
//V04N46		VN	0446
// PORT: Fixed ROM slots 36913.
    36913, 1116
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38258–38261.
function agcAotUnit2260 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38259 {
        if slot <= 38258 {
// PORT: SOURCE EXTENDED_VERBS.agc:779
//		BANK	43
// PORT: SOURCE EXTENDED_VERBS.agc:780
//		SETLOC	EXTVERBS
// PORT: SOURCE EXTENDED_VERBS.agc:781
//		BANK
// PORT: SOURCE EXTENDED_VERBS.agc:782
//
// PORT: SOURCE EXTENDED_VERBS.agc:783
//		COUNT*	$$/EXTVB
// PORT: SOURCE EXTENDED_VERBS.agc:784
//
// PORT: SOURCE EXTENDED_VERBS.agc:785
//# 	V82PERF		VERB82		DESCRIPTION
// PORT: SOURCE EXTENDED_VERBS.agc:786
//#		REQUEST ORBIT PARAMETERS DISPLAY (R30)
// PORT: SOURCE EXTENDED_VERBS.agc:787
//# 1. IF AVERAGE G IS OFF:
// PORT: SOURCE EXTENDED_VERBS.agc:788
//#	FLASH DISPLAY V04N06.  R2 INDICATES WHICH SHIP'S STATE VECTOR IS
// PORT: SOURCE EXTENDED_VERBS.agc:789
//#	TO BE UPDATED.  INITIAL CHOICE IS THIS SHIP (R2=1).  ASTRONAUT
// PORT: SOURCE EXTENDED_VERBS.agc:790
//#	CAN CHANGE TO OTHER SHIP BY V22EXE, WHERE X NOT EQ 1.
// PORT: SOURCE EXTENDED_VERBS.agc:791
//#	SELECTED STATE VECTOR UPDATED BY THISPREC (OTHPREC).
// PORT: SOURCE EXTENDED_VERBS.agc:792
//#	CALLS SR30.1 (WHICH CALLS TFFCONMU + TFFRP/RA) TO CALCULATE
// PORT: SOURCE EXTENDED_VERBS.agc:793
//# Page 255
// PORT: SOURCE EXTENDED_VERBS.agc:794
//#	RPER (PERIGEE RADIUS), RAP0 (APOGEE RADIUS), HPER (PERIGEE
// PORT: SOURCE EXTENDED_VERBS.agc:795
//#	HEIGHT ABOVE LAUNCH PAD OR LUNAR LANDING SITE), HAPO (APOGEE
// PORT: SOURCE EXTENDED_VERBS.agc:796
//#	HEIGHT AS ABOVE), TPER (TIME TO PERIGEE), TFF (TIME TO
// PORT: SOURCE EXTENDED_VERBS.agc:797
//#	INTERSECT 300 KFT ABOVE PAD OR 35KFT ABOVE LANDING SITE).
// PORT: SOURCE EXTENDED_VERBS.agc:798
//#	FLASH MONITOR V16N44 (HAPO, HPER, TFF).  TFF IS -59M59S IF IT WAS
// PORT: SOURCE EXTENDED_VERBS.agc:799
//#	NOT COMPUTABLE, OTHERWISE IT INCREMENTS ONCE PER SECOND.
// PORT: SOURCE EXTENDED_VERBS.agc:800
//#	ASTRONAUT HAS OPTION TO MONITOR TPER BY KEYING IN N 32 E.
// PORT: SOURCE EXTENDED_VERBS.agc:801
//#	DISPLAY IS IN HMS, IS NEGATIVE (AS WAS TFF), AND INCREMENTS
// PORT: SOURCE EXTENDED_VERBS.agc:802
//#	ONCE PER SECOND ONLY IF TFF DISPLAY WAS -59M59S.
// PORT: SOURCE EXTENDED_VERBS.agc:803
//#
// PORT: SOURCE EXTENDED_VERBS.agc:804
//# 2. IF AVERAGE G IS ON:
// PORT: SOURCE EXTENDED_VERBS.agc:805
//#	CALLS SR30.1 APPROX EVERY TWO SECS.  STATE VECTOR IS ALWAYS
// PORT: SOURCE EXTENDED_VERBS.agc:806
//#	FOR THIS VEHICLE.  V82 DOES NOT DISTURB STATE VECTOR.  RESULTS
// PORT: SOURCE EXTENDED_VERBS.agc:807
//#	OF SR30.1 ARE RAPO, RPER, HAPO, HPER, TPER, TFF.
// PORT: SOURCE EXTENDED_VERBS.agc:808
//#	FLASH MONITOR V16N44 (HAPO, HPER, TFF).
// PORT: SOURCE EXTENDED_VERBS.agc:809
//#	IF MODE IS P11, THEN CALL DELRSPL SO ASTRONAUT CAN MONITOR
// PORT: SOURCE EXTENDED_VERBS.agc:810
//#	RESULTS BY N50E.  SPLASH COMPUTATION DONE ONCE PER TWO SECS.
// PORT: SOURCE EXTENDED_VERBS.agc:811
//
// PORT: SOURCE EXTENDED_VERBS.agc:812
//
// PORT: SOURCE EXTENDED_VERBS.agc:813
//# ADDENDUM: HAPO AND HPER SHOULD BE CHANGED TO READ HAPOX AND HPERX IN THE
// PORT: SOURCE EXTENDED_VERBS.agc:814
//#	    ABOVE REMARKS.
// PORT: SOURCE EXTENDED_VERBS.agc:815
//V82PERF		TC	TESTXACT
// PORT: Fixed ROM slots 38258.
            if slot <> 38258 or instruction <> 1086 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1086, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:816
//
// PORT: SOURCE EXTENDED_VERBS.agc:817
//		CAF	PRIO7
// PORT: Fixed ROM slots 38259.
            if slot <> 38259 or instruction <> 14899 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2611), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38260 {
// PORT: SOURCE EXTENDED_VERBS.agc:818
//		TC	PRIOCHNG
// PORT: Fixed ROM slots 38260.
            if slot <> 38260 or instruction <> 2696 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2696, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:819
//		TC	POSTJUMP
// PORT: Fixed ROM slots 38261.
            if slot <> 38261 or instruction <> 2497 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2497, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2260] to agcAotUnit2260@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:820
//		CADR	V82CALL		# ***** V82CALL MUST NOT BE A FINDVAC JOB.
// PORT: Fixed ROM slots 38262.
    38262, 39348
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38263–38269.
function agcAotUnit2261 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38265 {
        if slot <= 38263 {
// PORT: SOURCE EXTENDED_VERBS.agc:821
//
// PORT: SOURCE EXTENDED_VERBS.agc:822
//
// PORT: SOURCE EXTENDED_VERBS.agc:823
//# 	VB83PERF	VERB 83		DESCRIPTION
// PORT: SOURCE EXTENDED_VERBS.agc:824
//#		REQUEST RENDEZVOUS PARAMETER DISPLAY (R31)
// PORT: SOURCE EXTENDED_VERBS.agc:825
//#		1. SET EXT VERB DISPLAY BUSY FLAG.
// PORT: SOURCE EXTENDED_VERBS.agc:826
//#		2. SCHEDULE V83CALL WITH PRIORITY 10.
// PORT: SOURCE EXTENDED_VERBS.agc:827
//#		   A. DISPLAY
// PORT: SOURCE EXTENDED_VERBS.agc:828
//#			R1	RANGE
// PORT: SOURCE EXTENDED_VERBS.agc:829
//#			R2	RANGE RATE
// PORT: SOURCE EXTENDED_VERBS.agc:830
//#			R3	THETA
// PORT: SOURCE EXTENDED_VERBS.agc:831
//
// PORT: SOURCE EXTENDED_VERBS.agc:832
//V83PERF		TC	TESTXACT
// PORT: Fixed ROM slots 38263.
            if slot <> 38263 or instruction <> 1086 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1086, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38264 {
// PORT: SOURCE EXTENDED_VERBS.agc:833
//		INHINT
// PORT: Fixed ROM slots 38264.
                if slot <> 38264 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:834
//		CS	FLAGWRD9	# SET R31 FLAG-BIT 4 FLAGWRD9
// PORT: Fixed ROM slots 38265.
                if slot <> 38265 or instruction <> 16453 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 69).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38267 {
            if slot <= 38266 {
// PORT: SOURCE EXTENDED_VERBS.agc:835
//		MASK	R31FLBIT
// PORT: Fixed ROM slots 38266.
                if slot <> 38266 or instruction <> 31244 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                    if fixedOperand = 8 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 8), 2) * 8).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:836
//		ADS	FLAGWRD9
// PORT: Fixed ROM slots 38267.
                if slot <> 38267 or instruction <> 11333 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 69).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38268 {
// PORT: SOURCE EXTENDED_VERBS.agc:837
//		CAF	PRIO5
// PORT: Fixed ROM slots 38268.
                if slot <> 38268 or instruction <> 14897 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2609), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:838
//		TC	NOVAC
// PORT: Fixed ROM slots 38269.
                if slot <> 38269 or instruction <> 2652 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2652, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2261] to agcAotUnit2261@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:839
//		EBANK=	SUBEXIT
// PORT: SOURCE EXTENDED_VERBS.agc:840
//		2CADR	R31CALL
// PORT: Fixed ROM slots 38270 38271.
    38270, 2048, 38271, 51304
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38272–38279.
function agcAotUnit2262 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38275 {
        if slot <= 38273 {
            if slot <= 38272 {
// PORT: SOURCE EXTENDED_VERBS.agc:841
//
// PORT: SOURCE EXTENDED_VERBS.agc:842
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 38272.
                if slot <> 38272 or instruction <> 2703 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2703, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:843
//
// PORT: SOURCE EXTENDED_VERBS.agc:844
//# Page 256
// PORT: SOURCE EXTENDED_VERBS.agc:845
//V85PERF		TC	TESTXACT
// PORT: Fixed ROM slots 38273.
                if slot <> 38273 or instruction <> 1086 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1086, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38274 {
// PORT: SOURCE EXTENDED_VERBS.agc:846
//		INHINT
// PORT: Fixed ROM slots 38274.
                if slot <> 38274 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:847
//		CS	R31FLBIT	# RESET R31 FLAG TO INDICATE R34
// PORT: Fixed ROM slots 38275.
                if slot <> 38275 or instruction <> 18956 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2572), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38277 {
            if slot <= 38276 {
// PORT: SOURCE EXTENDED_VERBS.agc:848
//		MASK	FLAGWRD9
// PORT: Fixed ROM slots 38276.
                if slot <> 38276 or instruction <> 28741 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 69).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:849
//		TS	FLAGWRD9
// PORT: Fixed ROM slots 38277.
                if slot <> 38277 or instruction <> 22597 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22597, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38278 {
// PORT: SOURCE EXTENDED_VERBS.agc:850
//		TC	V83PERF	+5
// PORT: Fixed ROM slots 38278.
                if slot <> 38278 or instruction <> 1404 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1404, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:851
//# Page 257
// PORT: SOURCE EXTENDED_VERBS.agc:852
//#	GOTOR21		VERB 57
// PORT: SOURCE EXTENDED_VERBS.agc:853
//#	GOTOR23-	VERB 54		DESCRIPTION
// PORT: SOURCE EXTENDED_VERBS.agc:854
//# SET UP MARKING FOR R22(REND TRACK DATA PROC)
// PORT: SOURCE EXTENDED_VERBS.agc:855
//# 1. SET EXT VERB DISPLAY BUSY FLAG
// PORT: SOURCE EXTENDED_VERBS.agc:856
//# 2. IF REND (P20 RUNNING) + TRACK (TRACKING ALLOWED) FLAGS ARE SET,
// PORT: SOURCE EXTENDED_VERBS.agc:857
//#    SCHEDULE R21 OR R23 WITH PRIORITY 16, OTHERWISE TURN ON ALARM 406
// PORT: SOURCE EXTENDED_VERBS.agc:858
//# 3. RELEASE EXT VERB DISPLAY SYSTEM
// PORT: SOURCE EXTENDED_VERBS.agc:859
//GOTOR21		TC	DOWNFLAG	# CLEAR R23FLG
// PORT: Fixed ROM slots 38279.
                if slot <> 38279 or instruction <> 2928 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2928, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2262] to agcAotUnit2262@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:860
//		ADRES	R23FLG		# BIT 9 FLAG 1
// PORT: Fixed ROM slots 38280.
    38280, 42
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38281–38282.
function agcAotUnit2263 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38281 {
// PORT: SOURCE EXTENDED_VERBS.agc:861
//		TC	+3
// PORT: Fixed ROM slots 38281.
        if slot <> 38281 or instruction <> 1420 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1420, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:862
//GOTOR23		TC	UPFLAG		# SET R23FLG
// PORT: Fixed ROM slots 38282.
        if slot <> 38282 or instruction <> 2918 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2918, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2263] to agcAotUnit2263@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:863
//		ADRES	R23FLG		# BIT 9 FLAG 1
// PORT: Fixed ROM slots 38283.
    38283, 42
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38284–38298.
function agcAotUnit2264 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38290 {
        if slot <= 38286 {
            if slot <= 38284 {
// PORT: SOURCE EXTENDED_VERBS.agc:864
//		TC	TESTXACT
// PORT: Fixed ROM slots 38284.
                if slot <> 38284 or instruction <> 1086 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1086, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38285 {
// PORT: SOURCE EXTENDED_VERBS.agc:865
//		CA	FLAGWRD0	# VB 57	UNACCEPTABLE UNLESS BOTH
// PORT: Fixed ROM slots 38285.
                    if slot <> 38285 or instruction <> 12348 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 60).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:866
//		MASK	RNDVZBIT	#	RENDEZVOUS AND TRACK FLAGS ON
// PORT: Fixed ROM slots 38286.
                    if slot <> 38286 or instruction <> 31241 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2569), 32768).
                        if fixedOperand = 64 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 64), 2) * 64).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 38288 {
                if slot <= 38287 {
// PORT: SOURCE EXTENDED_VERBS.agc:867
//		EXTEND
// PORT: Fixed ROM slots 38287.
                    if slot <> 38287 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:868
//		BZF	R22ALARM
// PORT: Fixed ROM slots 38288.
                    if slot <> 38288 or instruction <> 5539 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5539, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38289 {
// PORT: SOURCE EXTENDED_VERBS.agc:869
//
// PORT: SOURCE EXTENDED_VERBS.agc:870
//		CA	FLAGWRD1
// PORT: Fixed ROM slots 38289.
                    if slot <> 38289 or instruction <> 12349 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 61).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:871
//		MASK	TRACKBIT
// PORT: Fixed ROM slots 38290.
                    if slot <> 38290 or instruction <> 31243 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2571), 32768).
                        if fixedOperand = 16 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 16), 2) * 16).
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
        if slot <= 38294 {
            if slot <= 38292 {
                if slot <= 38291 {
// PORT: SOURCE EXTENDED_VERBS.agc:872
//		EXTEND
// PORT: Fixed ROM slots 38291.
                    if slot <> 38291 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:873
//		BZF	R22ALARM
// PORT: Fixed ROM slots 38292.
                    if slot <> 38292 or instruction <> 5539 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5539, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38293 {
// PORT: SOURCE EXTENDED_VERBS.agc:874
//
// PORT: SOURCE EXTENDED_VERBS.agc:875
//		CA	FLAGWRD1	# TEST R23FLG
// PORT: Fixed ROM slots 38293.
                    if slot <> 38293 or instruction <> 12349 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 61).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:876
//		MASK	R23BIT
// PORT: Fixed ROM slots 38294.
                    if slot <> 38294 or instruction <> 31239 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2567), 32768).
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
            if slot <= 38296 {
                if slot <= 38295 {
// PORT: SOURCE EXTENDED_VERBS.agc:877
//		EXTEND
// PORT: Fixed ROM slots 38295.
                    if slot <> 38295 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:878
//		BZF	REGR21		# R21
// PORT: Fixed ROM slots 38296.
                    if slot <> 38296 or instruction <> 5534 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5534, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38297 {
// PORT: SOURCE EXTENDED_VERBS.agc:879
//		CAF	PRIO16
// PORT: Fixed ROM slots 38297.
                    if slot <> 38297 or instruction <> 14904 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2616), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:880
//		TC	NOVAC
// PORT: Fixed ROM slots 38298.
                    if slot <> 38298 or instruction <> 2652 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2652, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2264] to agcAotUnit2264@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:881
//		EBANK=	MRKBUF1
// PORT: SOURCE EXTENDED_VERBS.agc:882
//		2CADR	R23CSM
// PORT: Fixed ROM slots 38299 38300.
    38299, 2672, 38300, 63598
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38301–38303.
function agcAotUnit2265 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38301 {
// PORT: SOURCE EXTENDED_VERBS.agc:883
//
// PORT: SOURCE EXTENDED_VERBS.agc:884
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 38301.
        if slot <> 38301 or instruction <> 2703 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2703, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 38302 {
// PORT: SOURCE EXTENDED_VERBS.agc:885
//REGR21		CAF	PRIO16
// PORT: Fixed ROM slots 38302.
            if slot <> 38302 or instruction <> 14904 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2616), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:886
//		TC	NOVAC
// PORT: Fixed ROM slots 38303.
            if slot <> 38303 or instruction <> 2652 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2652, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2265] to agcAotUnit2265@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:887
//		EBANK=	MRKBUF1
// PORT: SOURCE EXTENDED_VERBS.agc:888
//		2CADR	R21CSM
// PORT: Fixed ROM slots 38304 38305.
    38304, 2668, 38305, 63598
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38306–38307.
function agcAotUnit2266 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38306 {
// PORT: SOURCE EXTENDED_VERBS.agc:889
//
// PORT: SOURCE EXTENDED_VERBS.agc:890
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 38306.
        if slot <> 38306 or instruction <> 2703 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2703, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:891
//R22ALARM	TC	ALARM		# VERB 57 WAS SELECTED AND NEITHER REND
// PORT: Fixed ROM slots 38307.
        if slot <> 38307 or instruction <> 2984 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2984, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2266] to agcAotUnit2266@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:892
//		OCT	00406		#	NOR TRACK FLAG WERE ON.
// PORT: Fixed ROM slots 38308.
    38308, 524
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38309–38319.
function agcAotUnit2267 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38313 {
        if slot <= 38310 {
            if slot <= 38309 {
// PORT: SOURCE EXTENDED_VERBS.agc:893
//		TC	ENDEXT
// PORT: Fixed ROM slots 38309.
                if slot <> 38309 or instruction <> 2908 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2908, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:894
//
// PORT: SOURCE EXTENDED_VERBS.agc:895
//# Page 258
// PORT: SOURCE EXTENDED_VERBS.agc:896
//# VERB 86	DESCRIPTION
// PORT: SOURCE EXTENDED_VERBS.agc:897
//#	V86 IS TO R23 AS MARK REJECT IS TO R21
// PORT: SOURCE EXTENDED_VERBS.agc:898
//#	V86 IS THE MARK REJECT FOR R23(THE BACKUP MARKING ROUTINE)
// PORT: SOURCE EXTENDED_VERBS.agc:899
//		EBANK=	MRKBUF1
// PORT: SOURCE EXTENDED_VERBS.agc:900
//V86PERF		CAF	EBANK7		# BACKUP MARK REJECT (R23)
// PORT: Fixed ROM slots 38310.
                if slot <> 38310 or instruction <> 14896 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2608), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38311 {
// PORT: SOURCE EXTENDED_VERBS.agc:901
//		XCH	EBANK
// PORT: Fixed ROM slots 38311.
                if slot <> 38311 or instruction <> 23555 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 3, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38312 {
// PORT: SOURCE EXTENDED_VERBS.agc:902
//		CA	NEGONE
// PORT: Fixed ROM slots 38312.
                    if slot <> 38312 or instruction <> 16334 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 4046), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:903
//		TS	MRKBUF1
// PORT: Fixed ROM slots 38313.
                    if slot <> 38313 or instruction <> 23509 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23509, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 38316 {
            if slot <= 38314 {
// PORT: SOURCE EXTENDED_VERBS.agc:904
//		TC	GOPIN
// PORT: Fixed ROM slots 38314.
                if slot <> 38314 or instruction <> 1105 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1105, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38315 {
// PORT: SOURCE EXTENDED_VERBS.agc:905
//
// PORT: SOURCE EXTENDED_VERBS.agc:906
//# Page 259
// PORT: SOURCE EXTENDED_VERBS.agc:907
//# TRACKTRM	VERB 56		DESCRIPTION
// PORT: SOURCE EXTENDED_VERBS.agc:908
//#	TERMINATE TRACKING (P20)
// PORT: SOURCE EXTENDED_VERBS.agc:909
//#	1. KNOCK DOWN RENDEZVOUS, TRACK, AND UPDATE FLAGS.
// PORT: SOURCE EXTENDED_VERBS.agc:910
//#	2. REQUIRE P20 NOT RUNNING ALONE OR GO TO GOTOPOOH (REQUEST PROGRAM 00).
// PORT: SOURCE EXTENDED_VERBS.agc:911
//#	3. REQUIRE R22 RUNNING OR GO TO PINBRNCH.
// PORT: SOURCE EXTENDED_VERBS.agc:912
//#	4. IF INTEGRATION RUNNING, STALL UNTIL IT IS COMPLETED, THEN ZERO GROUPS 2 AND 3 TO KILL R21 + R22.
// PORT: SOURCE EXTENDED_VERBS.agc:913
//#	3. KNOCK DOWN RENDEZFOUS, R22, R21, TRACK, UPDATE, AND TARG1 FLAGS.
// PORT: SOURCE EXTENDED_VERBS.agc:914
//#	4. GO TO ENEMA (SOFTWARE RESTART).
// PORT: SOURCE EXTENDED_VERBS.agc:915
//#	REFERENCE
// PORT: SOURCE EXTENDED_VERBS.agc:916
//#		P20	RENDEZVOUS	NAVIGATION.
// PORT: SOURCE EXTENDED_VERBS.agc:917
//#		R21	RENDEZVOUS	TRACKING SIGHTING MARK.
// PORT: SOURCE EXTENDED_VERBS.agc:918
//#		R22	RENDEZVOUS	TRACKING DATA PROCESSING.
// PORT: SOURCE EXTENDED_VERBS.agc:919
//
// PORT: SOURCE EXTENDED_VERBS.agc:920
//TRACKTRM	CA	RNDVZBIT	# IS REND FLAG ON
// PORT: Fixed ROM slots 38315.
                    if slot <> 38315 or instruction <> 14857 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2569), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:921
//		MASK	FLAGWRD0
// PORT: Fixed ROM slots 38316.
                    if slot <> 38316 or instruction <> 28732 { return choose false if checkOnly else -1. }
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
            if slot <= 38317 {
// PORT: SOURCE EXTENDED_VERBS.agc:922
//		EXTEND
// PORT: Fixed ROM slots 38317.
                if slot <> 38317 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38318 {
// PORT: SOURCE EXTENDED_VERBS.agc:923
//		BZF	GOPIN		# NO
// PORT: Fixed ROM slots 38318.
                    if slot <> 38318 or instruction <> 5201 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5201, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:924
//
// PORT: SOURCE EXTENDED_VERBS.agc:925
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 38319.
                    if slot <> 38319 or instruction <> 2928 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2928, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2267] to agcAotUnit2267@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:926
//		ADRES	RNDVZFLG
// PORT: Fixed ROM slots 38320.
    38320, 16
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38321–38325.
function agcAotUnit2268 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38322 {
        if slot <= 38321 {
// PORT: SOURCE EXTENDED_VERBS.agc:927
//
// PORT: SOURCE EXTENDED_VERBS.agc:928
//		CA	TRACKBIT	# IS TRACK FLAG ON
// PORT: Fixed ROM slots 38321.
            if slot <> 38321 or instruction <> 14859 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2571), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:929
//		MASK	FLAGWRD1
// PORT: Fixed ROM slots 38322.
            if slot <> 38322 or instruction <> 28733 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 61).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38323 {
// PORT: SOURCE EXTENDED_VERBS.agc:930
//		EXTEND
// PORT: Fixed ROM slots 38323.
            if slot <> 38323 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38324 {
// PORT: SOURCE EXTENDED_VERBS.agc:931
//		BZF	GOPIN		# NO
// PORT: Fixed ROM slots 38324.
                if slot <> 38324 or instruction <> 5201 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5201, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:932
//
// PORT: SOURCE EXTENDED_VERBS.agc:933
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 38325.
                if slot <> 38325 or instruction <> 2928 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2928, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2268] to agcAotUnit2268@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:934
//		ADRES	TRACKFLG
// PORT: Fixed ROM slots 38326.
    38326, 50
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38327–38327.
function agcAotUnit2269 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXTENDED_VERBS.agc:935
//
// PORT: SOURCE EXTENDED_VERBS.agc:936
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 38327.
    if slot <> 38327 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2269] to agcAotUnit2269@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:937
//		ADRES	UPDATFLG
// PORT: Fixed ROM slots 38328.
    38328, 46
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38329–38329.
function agcAotUnit2270 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXTENDED_VERBS.agc:938
//
// PORT: SOURCE EXTENDED_VERBS.agc:939
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 38329.
    if slot <> 38329 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2270] to agcAotUnit2270@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:940
//		ADRES	IMUSE
// PORT: Fixed ROM slots 38330.
    38330, 14
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38331–38337.
function agcAotUnit2271 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38333 {
        if slot <= 38331 {
// PORT: SOURCE EXTENDED_VERBS.agc:941
//
// PORT: SOURCE EXTENDED_VERBS.agc:942
//		CAF	EBANK6
// PORT: Fixed ROM slots 38331.
            if slot <> 38331 or instruction <> 14895 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2607), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38332 {
// PORT: SOURCE EXTENDED_VERBS.agc:943
//		TS	EBANK
// PORT: Fixed ROM slots 38332.
                if slot <> 38332 or instruction <> 22531 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:944
//
// PORT: SOURCE EXTENDED_VERBS.agc:945
//		INHINT
// PORT: Fixed ROM slots 38333.
                if slot <> 38333 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38335 {
            if slot <= 38334 {
// PORT: SOURCE EXTENDED_VERBS.agc:946
//		TC	STOPRATE
// PORT: Fixed ROM slots 38334.
                if slot <> 38334 or instruction <> 2390 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2390, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:947
//
// PORT: SOURCE EXTENDED_VERBS.agc:948
//		CAF	NEGONE
// PORT: Fixed ROM slots 38335.
                if slot <> 38335 or instruction <> 16334 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4046), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 38336 {
// PORT: SOURCE EXTENDED_VERBS.agc:949
//		TS	OPTIND
// PORT: Fixed ROM slots 38336.
                if slot <> 38336 or instruction <> 23235 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23235, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:950
//
// PORT: SOURCE EXTENDED_VERBS.agc:951
//		TC	INTPRET
// PORT: Fixed ROM slots 38337.
                if slot <> 38337 or instruction <> 3078 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3078, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2271] to agcAotUnit2271@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:952
//		CALL
// PORT: Fixed ROM slots 38338.
    38338, 65320,
// PORT: SOURCE EXTENDED_VERBS.agc:953
//			INTSTALL	# DONT INTERRUPT INTEGRATION
// PORT: Fixed ROM slots 38339.
    38339, 24132,
// PORT: SOURCE EXTENDED_VERBS.agc:954
//		EXIT
// PORT: Fixed ROM slots 38340.
    38340, 65532
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38341–38341.
function agcAotUnit2272 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXTENDED_VERBS.agc:955
//
// PORT: SOURCE EXTENDED_VERBS.agc:956
//		TC	2PHSCHNG
// PORT: Fixed ROM slots 38341.
    if slot <> 38341 or instruction <> 2810 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2810, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2272] to agcAotUnit2272@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:957
//# Page 260
// PORT: SOURCE EXTENDED_VERBS.agc:958
//		OCT	2		# KILL GROUP 2 TO HALT P20 ACTIVITY
// PORT: Fixed ROM slots 38342.
    38342, 4,
// PORT: SOURCE EXTENDED_VERBS.agc:959
//		OCT	1		# ALSO KILL GROUP 1
// PORT: Fixed ROM slots 38343.
    38343, 2
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38344–38345.
function agcAotUnit2273 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38344 {
// PORT: SOURCE EXTENDED_VERBS.agc:960
//
// PORT: SOURCE EXTENDED_VERBS.agc:961
//CLEANOUT 	INHINT
// PORT: Fixed ROM slots 38344.
        if slot <> 38344 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:962
//		TC	POSTJUMP
// PORT: Fixed ROM slots 38345.
        if slot <> 38345 or instruction <> 2497 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2497, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2273] to agcAotUnit2273@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:963
//		CADR	ENEMA		# CAUSE RESTART
// PORT: Fixed ROM slots 38346.
    38346, 11090
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38347–38347.
function agcAotUnit2274 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXTENDED_VERBS.agc:964
//
// PORT: SOURCE EXTENDED_VERBS.agc:965
//# LEMVEC	VERB 80		DESCRIPTION
// PORT: SOURCE EXTENDED_VERBS.agc:966
//#	UPDATE LEM STATE VECTOR
// PORT: SOURCE EXTENDED_VERBS.agc:967
//#		RESET VEHUPFLG TO 0
// PORT: SOURCE EXTENDED_VERBS.agc:968
//
// PORT: SOURCE EXTENDED_VERBS.agc:969
//LEMVEC		TC	DOWNFLAG
// PORT: Fixed ROM slots 38347.
    if slot <> 38347 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2274] to agcAotUnit2274@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:970
//		ADRES	VEHUPFLG	# VEHUPFLG DOWN INDICATES LEM
// PORT: Fixed ROM slots 38348.
    38348, 44
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38349–38350.
function agcAotUnit2275 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38349 {
// PORT: SOURCE EXTENDED_VERBS.agc:971
//
// PORT: SOURCE EXTENDED_VERBS.agc:972
//		TCF	GOPIN
// PORT: Fixed ROM slots 38349.
        if slot <> 38349 or instruction <> 5201 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5201, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:973
//
// PORT: SOURCE EXTENDED_VERBS.agc:974
//# CSMVEC	VERB 81		DESCRIPTION
// PORT: SOURCE EXTENDED_VERBS.agc:975
//#	UPDATE CSM STATE VECTOR
// PORT: SOURCE EXTENDED_VERBS.agc:976
//#		SET VEHUPFLG TO 1
// PORT: SOURCE EXTENDED_VERBS.agc:977
//
// PORT: SOURCE EXTENDED_VERBS.agc:978
//CSMVEC		TC	UPFLAG
// PORT: Fixed ROM slots 38350.
        if slot <> 38350 or instruction <> 2918 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2918, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2275] to agcAotUnit2275@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:979
//		ADRES	VEHUPFLG	# VEHUPFLG UP INDICATES CM.
// PORT: Fixed ROM slots 38351.
    38351, 44
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38352–38355.
function agcAotUnit2276 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38353 {
        if slot <= 38352 {
// PORT: SOURCE EXTENDED_VERBS.agc:980
//
// PORT: SOURCE EXTENDED_VERBS.agc:981
//		TCF	GOPIN
// PORT: Fixed ROM slots 38352.
            if slot <> 38352 or instruction <> 5201 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5201, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:982
//
// PORT: SOURCE EXTENDED_VERBS.agc:983
//# DNEDUMP	VERB 74		DESCRIPTION
// PORT: SOURCE EXTENDED_VERBS.agc:984
//#	INITIALIZE DOWN-TELEMETRY PROGRAM FOR ERASABLE MEMORY DUMP.
// PORT: SOURCE EXTENDED_VERBS.agc:985
//#	1. SET EXT VERB DISPLAY BUSY FLAG.
// PORT: SOURCE EXTENDED_VERBS.agc:986
//#	2. REPLACE CURRENT DOWNLIST WITH ERASABLE MEMORY.
// PORT: SOURCE EXTENDED_VERBS.agc:987
//#	3. RELEASE EXT VERB DISPLAY.
// PORT: SOURCE EXTENDED_VERBS.agc:988
//
// PORT: SOURCE EXTENDED_VERBS.agc:989
//		EBANK=	10
// PORT: SOURCE EXTENDED_VERBS.agc:990
//DNEDUMP		CAF	LDNDUMPI
// PORT: Fixed ROM slots 38353.
            if slot <> 38353 or instruction <> 13780 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1492), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38354 {
// PORT: SOURCE EXTENDED_VERBS.agc:991
//		TS	DNTMGOTO
// PORT: Fixed ROM slots 38354.
            if slot <> 38354 or instruction <> 22749 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22749, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:992
//		TC	GOPIN
// PORT: Fixed ROM slots 38355.
            if slot <> 38355 or instruction <> 1105 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1105, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2276] to agcAotUnit2276@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:993
//
// PORT: SOURCE EXTENDED_VERBS.agc:994
//V74		EQUALS	DNEDUMP
// PORT: SOURCE EXTENDED_VERBS.agc:995
//LDNDUMPI	REMADR	DNDUMPI
// PORT: Fixed ROM slots 38356.
    38356, 4004
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38357–38357.
function agcAotUnit2277 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXTENDED_VERBS.agc:996
//
// PORT: SOURCE EXTENDED_VERBS.agc:997
//# LFTFLGON	VERB 75		DESCRIPTION
// PORT: SOURCE EXTENDED_VERBS.agc:998
//#	SET LIFT-OFF FLAG
// PORT: SOURCE EXTENDED_VERBS.agc:999
//#	1. SETUP GGRBKFLG, GUIDANCE REFERENCE RELEASE BACK-UP FLAG.
// PORT: SOURCE EXTENDED_VERBS.agc:1000
//#	2. RETURN VIA PINBRNCH
// PORT: SOURCE EXTENDED_VERBS.agc:1001
//
// PORT: SOURCE EXTENDED_VERBS.agc:1002
//LFTFLGON	TC	UPFLAG		# VB 75 - SET LIFTOFF FLAG BIT
// PORT: Fixed ROM slots 38357.
    if slot <> 38357 or instruction <> 2918 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2918, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2277] to agcAotUnit2277@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1003
//		ADRES	GRRBKFLG	# BIT 5  FLAG 5
// PORT: Fixed ROM slots 38358.
    38358, 170
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38359–38370.
function agcAotUnit2278 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38364 {
        if slot <= 38361 {
            if slot <= 38359 {
// PORT: SOURCE EXTENDED_VERBS.agc:1004
//		TC	GOPIN
// PORT: Fixed ROM slots 38359.
                if slot <> 38359 or instruction <> 1105 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1105, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38360 {
// PORT: SOURCE EXTENDED_VERBS.agc:1005
//
// PORT: SOURCE EXTENDED_VERBS.agc:1006
//# Page 261
// PORT: SOURCE EXTENDED_VERBS.agc:1007
//CHKPOOH		CA	MODREG
// PORT: Fixed ROM slots 38360.
                    if slot <> 38360 or instruction <> 12809 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 521).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1008
//		EXTEND
// PORT: Fixed ROM slots 38361.
                    if slot <> 38361 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 38362 {
// PORT: SOURCE EXTENDED_VERBS.agc:1009
//		BZF	TCQ
// PORT: Fixed ROM slots 38362.
                if slot <> 38362 or instruction <> 7625 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7625, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38363 {
// PORT: SOURCE EXTENDED_VERBS.agc:1010
//		TCF	ALM/END
// PORT: Fixed ROM slots 38363.
                    if slot <> 38363 or instruction <> 5200 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5200, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1011
//
// PORT: SOURCE EXTENDED_VERBS.agc:1012
//EXDAPOFF	EXTEND
// PORT: Fixed ROM slots 38364.
                    if slot <> 38364 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 38367 {
            if slot <= 38365 {
// PORT: SOURCE EXTENDED_VERBS.agc:1013
//		DCA	IDLECADR	# SET T5 TO IDLE.
// PORT: Fixed ROM slots 38365.
                if slot <> 38365 or instruction <> 13796 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 1508, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38366 {
// PORT: SOURCE EXTENDED_VERBS.agc:1014
//		DXCH	T5LOC
// PORT: Fixed ROM slots 38366.
                    if slot <> 38366 or instruction <> 22219 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 715, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1015
//		CS	OCT60000
// PORT: Fixed ROM slots 38367.
                    if slot <> 38367 or instruction <> 18501 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2117), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 38368 {
// PORT: SOURCE EXTENDED_VERBS.agc:1016
//		MASK	FLAGWRD6	# RESET DAPBITS 1 AND 2.
// PORT: Fixed ROM slots 38368.
                if slot <> 38368 or instruction <> 28738 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 66).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38369 {
// PORT: SOURCE EXTENDED_VERBS.agc:1017
//		TS	FLAGWRD6
// PORT: Fixed ROM slots 38369.
                    if slot <> 38369 or instruction <> 22594 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22594, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1018
//		TC	Q
// PORT: Fixed ROM slots 38370.
                    if slot <> 38370 or instruction <> 2 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2278] to agcAotUnit2278@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1019
//
// PORT: SOURCE EXTENDED_VERBS.agc:1020
//		EBANK=	PACTOFF
// PORT: SOURCE EXTENDED_VERBS.agc:1021
//IDLECADR	2CADR	T5IDLOC
// PORT: Fixed ROM slots 38371 38372.
    38371, 3286, 38372, 10380
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38373–38377.
function agcAotUnit2279 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38374 {
        if slot <= 38373 {
// PORT: SOURCE EXTENDED_VERBS.agc:1022
//
// PORT: SOURCE EXTENDED_VERBS.agc:1023
//# Page 262
// PORT: SOURCE EXTENDED_VERBS.agc:1024
//# VERB 89	DESCRIPTION	RENDEZVOUS FINAL ATTITUDE ROUTINE (R63)
// PORT: SOURCE EXTENDED_VERBS.agc:1025
//
// PORT: SOURCE EXTENDED_VERBS.agc:1026
//# CALLED BY VERB 89 ENTER DURING P00.  PRIO 10 IS USED.  CALCULATES AND
// PORT: SOURCE EXTENDED_VERBS.agc:1027
//# DISPLAYS FINAL GIMBAL ANGLES TO POINT CSM +X AXIS OR PREFERRED AXIS
// PORT: SOURCE EXTENDED_VERBS.agc:1028
//# (UNIT(Z)COS55 DEG + UNIT(X)SIN55 DEG) AT LM.
// PORT: SOURCE EXTENDED_VERBS.agc:1029
//
// PORT: SOURCE EXTENDED_VERBS.agc:1030
//# 1. KEY IN V 89 E ONLY IF IN PROG 00.  IF NOT IN P00, OPERATOR ERROR AND
// PORT: SOURCE EXTENDED_VERBS.agc:1031
//# EXIT R63, OTHERWISE CONTINUE.
// PORT: SOURCE EXTENDED_VERBS.agc:1032
//
// PORT: SOURCE EXTENDED_VERBS.agc:1033
//# 2. IF IN P00, DO IMU STATUS CHECK ROUTINE (R02BOTH).  IF IMU ON AND ITS
// PORT: SOURCE EXTENDED_VERBS.agc:1034
//# ORIENTATION KNOWN TO CGC, CONTINUE.
// PORT: SOURCE EXTENDED_VERBS.agc:1035
//
// PORT: SOURCE EXTENDED_VERBS.agc:1036
//# 3. FLASH DISPLAY V 04 N 06.  R2 INDICATES WHICH SPACECRAFT AXIS IS TO
// PORT: SOURCE EXTENDED_VERBS.agc:1037
//# BE POINTED AT LM.  INITIAL CHOICE IS PREFERRED AXIS.  (R2=1).
// PORT: SOURCE EXTENDED_VERBS.agc:1038
//# ASTRONAUT CAN CHANGE TO (+X) AXIS (R2 NOT= 1) BY V 22 E 2 E.  CONTINUE
// PORT: SOURCE EXTENDED_VERBS.agc:1039
//# AFTER KEYING IN PROCEED.
// PORT: SOURCE EXTENDED_VERBS.agc:1040
//
// PORT: SOURCE EXTENDED_VERBS.agc:1041
//# 4. SET PREFERRED ATTITUDE FLAG ACCORDING TO OPTION DESIRED.  SET FLAG
// PORT: SOURCE EXTENDED_VERBS.agc:1042
//# FOR PREFERRED AXIS.  RESET FLAG FOR X AXIS.
// PORT: SOURCE EXTENDED_VERBS.agc:1043
//
// PORT: SOURCE EXTENDED_VERBS.agc:1044
//# 5. CURRENT TIME IS STORED AND R63COMP IS CALLED
// PORT: SOURCE EXTENDED_VERBS.agc:1045
//
// PORT: SOURCE EXTENDED_VERBS.agc:1046
//#	R63COMP JOB:
// PORT: SOURCE EXTENDED_VERBS.agc:1047
//
// PORT: SOURCE EXTENDED_VERBS.agc:1048
//#		UPDATES CSM AND LM STATE VECTORS USING CONIC EQUATIONS
// PORT: SOURCE EXTENDED_VERBS.agc:1049
//
// PORT: SOURCE EXTENDED_VERBS.agc:1050
//#		CALCULATES BOTH PREFERRED AND X AXIS TRACKING ATT FROM CSM TO LM.
// PORT: SOURCE EXTENDED_VERBS.agc:1051
//
// PORT: SOURCE EXTENDED_VERBS.agc:1052
//#		DESIRED GIMBAL ANGLES AS INDICATED BY PREFERRED ATTITUDE FLAG
// PORT: SOURCE EXTENDED_VERBS.agc:1053
//#		ARE STORED FOR LATER R60CSM CALL.
// PORT: SOURCE EXTENDED_VERBS.agc:1054
//
// PORT: SOURCE EXTENDED_VERBS.agc:1055
//# 6. FLASH DISPLAY V 06 N18 AND AWAIT RESPONSE.
// PORT: SOURCE EXTENDED_VERBS.agc:1056
//
// PORT: SOURCE EXTENDED_VERBS.agc:1057
//# 7. RECYCLE- RETURN TO STEP 5.
// PORT: SOURCE EXTENDED_VERBS.agc:1058
//#    TERMINATE-  EXIT R63 ROUTINE
// PORT: SOURCE EXTENDED_VERBS.agc:1059
//#    PROCEED-  RESET 3AXISFLG AND CALL R60CSM FOR ATTITUDE MANEUVER.
// PORT: SOURCE EXTENDED_VERBS.agc:1060
//
// PORT: SOURCE EXTENDED_VERBS.agc:1061
//V89PERF		TC	CHKPOOH		# DEMAND P00
// PORT: Fixed ROM slots 38373.
            if slot <> 38373 or instruction <> 1496 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1496, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1062
//		TC	TESTXACT
// PORT: Fixed ROM slots 38374.
            if slot <> 38374 or instruction <> 1086 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1086, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38375 {
// PORT: SOURCE EXTENDED_VERBS.agc:1063
//		INHINT
// PORT: Fixed ROM slots 38375.
            if slot <> 38375 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38376 {
// PORT: SOURCE EXTENDED_VERBS.agc:1064
//		CAF	PRIO10
// PORT: Fixed ROM slots 38376.
                if slot <> 38376 or instruction <> 14851 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1065
//		TC	FINDVAC
// PORT: Fixed ROM slots 38377.
                if slot <> 38377 or instruction <> 2663 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2663, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2279] to agcAotUnit2279@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1066
//		EBANK=	P21TIME
// PORT: SOURCE EXTENDED_VERBS.agc:1067
//		2CADR	V89CALL
// PORT: Fixed ROM slots 38378 38379.
    38378, 3988, 38379, 57448
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38380–38381.
function agcAotUnit2280 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38380 {
// PORT: SOURCE EXTENDED_VERBS.agc:1068
//
// PORT: SOURCE EXTENDED_VERBS.agc:1069
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 38380.
        if slot <> 38380 or instruction <> 6799 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6799, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1070
//
// PORT: SOURCE EXTENDED_VERBS.agc:1071
//WMATRXNG	TC	DOWNFLAG	# RESET RENDWFLG
// PORT: Fixed ROM slots 38381.
        if slot <> 38381 or instruction <> 2928 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2928, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2280] to agcAotUnit2280@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1072
//		ADRES	RENDWFLG
// PORT: Fixed ROM slots 38382.
    38382, 178
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38383–38383.
function agcAotUnit2281 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXTENDED_VERBS.agc:1073
//# Page 263
// PORT: SOURCE EXTENDED_VERBS.agc:1074
//
// PORT: SOURCE EXTENDED_VERBS.agc:1075
//		TC	DOWNFLAG	# RESET ORBWFLAG
// PORT: Fixed ROM slots 38383.
    if slot <> 38383 or instruction <> 2928 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2928, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2281] to agcAotUnit2281@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1076
//		ADRES	ORBWFLAG
// PORT: Fixed ROM slots 38384.
    38384, 108
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38385–38400.
function agcAotUnit2282 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38392 {
        if slot <= 38388 {
            if slot <= 38386 {
                if slot <= 38385 {
// PORT: SOURCE EXTENDED_VERBS.agc:1077
//		TC	GOPIN
// PORT: Fixed ROM slots 38385.
                    if slot <> 38385 or instruction <> 1105 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1105, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1078
//
// PORT: SOURCE EXTENDED_VERBS.agc:1079
//GOSHOSUM	EQUALS	SHOWSUM
// PORT: SOURCE EXTENDED_VERBS.agc:1080
//
// PORT: SOURCE EXTENDED_VERBS.agc:1081
//SHOWSUM		TC	CHKPOOH
// PORT: Fixed ROM slots 38386.
                    if slot <> 38386 or instruction <> 1496 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1496, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38387 {
// PORT: SOURCE EXTENDED_VERBS.agc:1082
//		TC	TESTXACT	# *
// PORT: Fixed ROM slots 38387.
                    if slot <> 38387 or instruction <> 1086 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1086, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1083
//		CAF	S+1		# *
// PORT: Fixed ROM slots 38388.
                    if slot <> 38388 or instruction <> 14863 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2575), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 38390 {
                if slot <= 38389 {
// PORT: SOURCE EXTENDED_VERBS.agc:1084
//		TS	SKEEP6		# * SHOWSUM OPTION
// PORT: Fixed ROM slots 38389.
                    if slot <> 38389 or instruction <> 23294 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23294, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1085
//		CAF	S+ZERO		# *
// PORT: Fixed ROM slots 38390.
                    if slot <> 38390 or instruction <> 14865 { return choose false if checkOnly else -1. }
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
                if slot <= 38391 {
// PORT: SOURCE EXTENDED_VERBS.agc:1086
//		TS	SMODE		# * TURN OFF SELF-CHECK
// PORT: Fixed ROM slots 38391.
                    if slot <> 38391 or instruction <> 23282 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23282, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1087
//		CA	SELFADRS	# *
// PORT: Fixed ROM slots 38392.
                    if slot <> 38392 or instruction <> 13991 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1703), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 38396 {
            if slot <= 38394 {
                if slot <= 38393 {
// PORT: SOURCE EXTENDED_VERBS.agc:1088
//		TS	SELFRET		# *
// PORT: Fixed ROM slots 38393.
                    if slot <> 38393 or instruction <> 23281 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23281, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1089
//		TC	STSHOSUM	# * ENTER ROPECHK
// PORT: Fixed ROM slots 38394.
                    if slot <> 38394 or instruction <> 1876 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1876, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38395 {
// PORT: SOURCE EXTENDED_VERBS.agc:1090
//
// PORT: SOURCE EXTENDED_VERBS.agc:1091
//SDISPLAY	LXCH	SKEEP2		# * BNK NO FOR DSP
// PORT: Fixed ROM slots 38395.
                    if slot <> 38395 or instruction <> 9978 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 762, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1092
//		LXCH	SKEEP3		# * BUGGER WORD FOR DSP
// PORT: Fixed ROM slots 38396.
                    if slot <> 38396 or instruction <> 9979 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 763, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 38398 {
                if slot <= 38397 {
// PORT: SOURCE EXTENDED_VERBS.agc:1093
//NOKILL		CA	ADRS1		# *
// PORT: Fixed ROM slots 38397.
                    if slot <> 38397 or instruction <> 13990 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1702), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1094
//		TS	MPAC	+2	# *
// PORT: Fixed ROM slots 38398.
                    if slot <> 38398 or instruction <> 22638 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22638, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38399 {
// PORT: SOURCE EXTENDED_VERBS.agc:1095
//		CA	VNCON		# * 0501
// PORT: Fixed ROM slots 38399.
                    if slot <> 38399 or instruction <> 13832 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1544), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1096
//		TC	BANKCALL	# *
// PORT: Fixed ROM slots 38400.
                    if slot <> 38400 or instruction <> 2482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2282] to agcAotUnit2282@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1097
//		CADR	GOXDSPF		# *
// PORT: Fixed ROM slots 38401.
    38401, 17122
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38402–38407.
function agcAotUnit2283 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38404 {
        if slot <= 38402 {
// PORT: SOURCE EXTENDED_VERBS.agc:1098
//		TC	+3		# *
// PORT: Fixed ROM slots 38402.
            if slot <> 38402 or instruction <> 1541 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1541, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38403 {
// PORT: SOURCE EXTENDED_VERBS.agc:1099
//		TC	NXTBNK		# *
// PORT: Fixed ROM slots 38403.
                if slot <> 38403 or instruction <> 1949 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1949, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1100
//		TC	NOKILL		# *
// PORT: Fixed ROM slots 38404.
                if slot <> 38404 or instruction <> 1533 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1533, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38405 {
// PORT: SOURCE EXTENDED_VERBS.agc:1101
//		CA	SELFADRS
// PORT: Fixed ROM slots 38405.
            if slot <> 38405 or instruction <> 13991 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1703), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38406 {
// PORT: SOURCE EXTENDED_VERBS.agc:1102
//		TS	SKEEP1
// PORT: Fixed ROM slots 38406.
                if slot <> 38406 or instruction <> 23289 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23289, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1103
//
// PORT: SOURCE EXTENDED_VERBS.agc:1104
//		TC	ENDEXT		# *
// PORT: Fixed ROM slots 38407.
                if slot <> 38407 or instruction <> 2908 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2908, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2283] to agcAotUnit2283@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1105
//
// PORT: SOURCE EXTENDED_VERBS.agc:1106
//VNCON		VN	501		# *
// PORT: Fixed ROM slots 38408.
    38408, 1282
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38409–38413.
function agcAotUnit2284 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38410 {
        if slot <= 38409 {
// PORT: SOURCE EXTENDED_VERBS.agc:1107
//
// PORT: SOURCE EXTENDED_VERBS.agc:1108
//ENDSUMS		CA	SKEEP6		# *
// PORT: Fixed ROM slots 38409.
            if slot <> 38409 or instruction <> 13054 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 766).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1109
//		EXTEND			# *
// PORT: Fixed ROM slots 38410.
            if slot <> 38410 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38411 {
// PORT: SOURCE EXTENDED_VERBS.agc:1110
//		BZF	SELFCHK		# * ROPECHK, START SELFCHK AGAIN.
// PORT: Fixed ROM slots 38411.
            if slot <> 38411 or instruction <> 5856 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5856, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38412 {
// PORT: SOURCE EXTENDED_VERBS.agc:1111
//		TC	STSHOSUM	# * START SHOWSUM AGAIN.
// PORT: Fixed ROM slots 38412.
                if slot <> 38412 or instruction <> 1876 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1876, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1112
//
// PORT: SOURCE EXTENDED_VERBS.agc:1113
//
// PORT: SOURCE EXTENDED_VERBS.agc:1114
//# VB 76 SET PREFERRED ATTITUDE FLAG - DRIVE TO PREFERRED.
// PORT: SOURCE EXTENDED_VERBS.agc:1115
//
// PORT: SOURCE EXTENDED_VERBS.agc:1116
//SETPRFLG	TC	UPFLAG
// PORT: Fixed ROM slots 38413.
                if slot <> 38413 or instruction <> 2918 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2918, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2284] to agcAotUnit2284@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1117
//		ADRES	PRFTRKAT	# BIT 10 FLAG 5
// PORT: Fixed ROM slots 38414.
    38414, 160
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38415–38416.
function agcAotUnit2285 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38415 {
// PORT: SOURCE EXTENDED_VERBS.agc:1118
//		TC	GOPIN
// PORT: Fixed ROM slots 38415.
        if slot <> 38415 or instruction <> 1105 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1105, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1119
//
// PORT: SOURCE EXTENDED_VERBS.agc:1120
//
// PORT: SOURCE EXTENDED_VERBS.agc:1121
//# VB 77 RESET PREFERRED ATTITUDE FLAG - DRIVE TO +X-AXIS ATT.
// PORT: SOURCE EXTENDED_VERBS.agc:1122
//
// PORT: SOURCE EXTENDED_VERBS.agc:1123
//RESETPRF	TC	DOWNFLAG
// PORT: Fixed ROM slots 38416.
        if slot <> 38416 or instruction <> 2928 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2928, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2285] to agcAotUnit2285@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1124
//		ADRES	PRFTRKAT	# BIT 10 FLAG 5
// PORT: Fixed ROM slots 38417.
    38417, 160
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38418–38419.
function agcAotUnit2286 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38418 {
// PORT: SOURCE EXTENDED_VERBS.agc:1125
//		TC	GOPIN
// PORT: Fixed ROM slots 38418.
        if slot <> 38418 or instruction <> 1105 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1105, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1126
//
// PORT: SOURCE EXTENDED_VERBS.agc:1127
//# Page 264
// PORT: SOURCE EXTENDED_VERBS.agc:1128
//# VB 87 SET VHF RANGE FLAG - ALLOWS R22 TO ACCEPT RANGE DATA.
// PORT: SOURCE EXTENDED_VERBS.agc:1129
//
// PORT: SOURCE EXTENDED_VERBS.agc:1130
//SETVHFLG	TC	INTPRET
// PORT: Fixed ROM slots 38419.
        if slot <> 38419 or instruction <> 3078 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3078, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2286] to agcAotUnit2286@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1131
//		SET	EXIT
// PORT: Fixed ROM slots 38420.
    38420, 65048,
// PORT: SOURCE EXTENDED_VERBS.agc:1132
//			VHFRFLAG
// PORT: Fixed ROM slots 38421.
    38421, 4716
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38422–38423.
function agcAotUnit2287 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38422 {
// PORT: SOURCE EXTENDED_VERBS.agc:1133
//		TC	GOPIN
// PORT: Fixed ROM slots 38422.
        if slot <> 38422 or instruction <> 1105 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1105, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1134
//
// PORT: SOURCE EXTENDED_VERBS.agc:1135
//
// PORT: SOURCE EXTENDED_VERBS.agc:1136
//# VB 88 RESET VHF RANGE FLAG - STOPS ACCEPTANCE OF RANGE DATA.
// PORT: SOURCE EXTENDED_VERBS.agc:1137
//
// PORT: SOURCE EXTENDED_VERBS.agc:1138
//RESETVHF	TC	INTPRET
// PORT: Fixed ROM slots 38423.
        if slot <> 38423 or instruction <> 3078 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3078, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2287] to agcAotUnit2287@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1139
//		CLEAR	EXIT
// PORT: Fixed ROM slots 38424.
    38424, 65048,
// PORT: SOURCE EXTENDED_VERBS.agc:1140
//			VHFRFLAG
// PORT: Fixed ROM slots 38425.
    38425, 4972
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38426–38429.
function agcAotUnit2288 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38427 {
        if slot <= 38426 {
// PORT: SOURCE EXTENDED_VERBS.agc:1141
//		TC	TRFAILOF	# TRACKER FAIL LIGHT
// PORT: Fixed ROM slots 38426.
            if slot <> 38426 or instruction <> 2969 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2969, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1142
//
// PORT: SOURCE EXTENDED_VERBS.agc:1143
//		TC	GOPIN
// PORT: Fixed ROM slots 38427.
            if slot <> 38427 or instruction <> 1105 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1105, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38428 {
// PORT: SOURCE EXTENDED_VERBS.agc:1144
//
// PORT: SOURCE EXTENDED_VERBS.agc:1145
//
// PORT: SOURCE EXTENDED_VERBS.agc:1146
//# VERB 66. VEHICLES ARE ATTACHED.- MOVE THIS VEHICLE STATE VECTOR TO
// PORT: SOURCE EXTENDED_VERBS.agc:1147
//#	   OTHER VEHICLE STATE VECTOR.
// PORT: SOURCE EXTENDED_VERBS.agc:1148
//
// PORT: SOURCE EXTENDED_VERBS.agc:1149
//# 	USE SUBROUTINE GENTRAN.
// PORT: SOURCE EXTENDED_VERBS.agc:1150
//
// PORT: SOURCE EXTENDED_VERBS.agc:1151
//		EBANK=	RRECTHIS
// PORT: SOURCE EXTENDED_VERBS.agc:1152
//ATTACHED	CAF	PRIO10
// PORT: Fixed ROM slots 38428.
            if slot <> 38428 or instruction <> 14851 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2563), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1153
//		TC	FINDVAC
// PORT: Fixed ROM slots 38429.
            if slot <> 38429 or instruction <> 2663 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2663, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2288] to agcAotUnit2288@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1154
//		EBANK=	RRECTHIS
// PORT: SOURCE EXTENDED_VERBS.agc:1155
//		2CADR	ATTACHIT
// PORT: Fixed ROM slots 38430 38431.
    38430, 3138, 38431, 55430
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38432–38433.
function agcAotUnit2289 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38432 {
// PORT: SOURCE EXTENDED_VERBS.agc:1156
//
// PORT: SOURCE EXTENDED_VERBS.agc:1157
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 38432.
        if slot <> 38432 or instruction <> 2703 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2703, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1158
//
// PORT: SOURCE EXTENDED_VERBS.agc:1159
//ATTACHIT	TC	INTPRET
// PORT: Fixed ROM slots 38433.
        if slot <> 38433 or instruction <> 3078 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3078, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2289] to agcAotUnit2289@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1160
//		CALL
// PORT: Fixed ROM slots 38434.
    38434, 65320,
// PORT: SOURCE EXTENDED_VERBS.agc:1161
//			INTSTALL
// PORT: Fixed ROM slots 38435.
    38435, 24132,
// PORT: SOURCE EXTENDED_VERBS.agc:1162
//		SET	BON
// PORT: Fixed ROM slots 38436.
    38436, 35864,
// PORT: SOURCE EXTENDED_VERBS.agc:1163
//			MOONOTH
// PORT: Fixed ROM slots 38437.
    38437, 4200,
// PORT: SOURCE EXTENDED_VERBS.agc:1164
//			MOONTHIS
// PORT: Fixed ROM slots 38438.
    38438, 4486,
// PORT: SOURCE EXTENDED_VERBS.agc:1165
//			+3
// PORT: Fixed ROM slots 38439.
    38439, 56404,
// PORT: SOURCE EXTENDED_VERBS.agc:1166
//		CLEAR
// PORT: Fixed ROM slots 38440.
    38440, 65304,
// PORT: SOURCE EXTENDED_VERBS.agc:1167
//			MOONOTH
// PORT: Fixed ROM slots 38441.
    38441, 4456,
// PORT: SOURCE EXTENDED_VERBS.agc:1168
//		EXIT
// PORT: Fixed ROM slots 38442.
    38442, 65532
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38443–38444.
function agcAotUnit2290 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38443 {
// PORT: SOURCE EXTENDED_VERBS.agc:1169
//		CAF	OCT51
// PORT: Fixed ROM slots 38443.
        if slot <> 38443 or instruction <> 13888 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1600), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1170
//		TC	GENTRAN
// PORT: Fixed ROM slots 38444.
        if slot <> 38444 or instruction <> 2950 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2950, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2290] to agcAotUnit2290@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1171
//		ADRES	RRECTHIS	# OUR STATE VECTOR INTO OTHER VIA GENTRAN
// PORT: Fixed ROM slots 38445.
    38445, 1752,
// PORT: SOURCE EXTENDED_VERBS.agc:1172
//		ADRES	RRECTOTH
// PORT: Fixed ROM slots 38446.
    38446, 1836
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38447–38448.
function agcAotUnit2291 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38447 {
// PORT: SOURCE EXTENDED_VERBS.agc:1173
//
// PORT: SOURCE EXTENDED_VERBS.agc:1174
//TACHEXIT	RELINT
// PORT: Fixed ROM slots 38447.
        if slot <> 38447 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1175
//		TC	INTPRET
// PORT: Fixed ROM slots 38448.
        if slot <> 38448 or instruction <> 3078 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3078, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2291] to agcAotUnit2291@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1176
//		CALL			# UPDATE RN, VN, R-OTHER, V-OTHER
// PORT: Fixed ROM slots 38449.
    38449, 65320,
// PORT: SOURCE EXTENDED_VERBS.agc:1177
//			PTOACSM
// PORT: Fixed ROM slots 38450.
    38450, 23474,
// PORT: SOURCE EXTENDED_VERBS.agc:1178
//# Page 265
// PORT: SOURCE EXTENDED_VERBS.agc:1179
//		LXA,2	CALL
// PORT: Fixed ROM slots 38451.
    38451, 38104,
// PORT: SOURCE EXTENDED_VERBS.agc:1180
//			PBODY
// PORT: Fixed ROM slots 38452.
    38452, 2256,
// PORT: SOURCE EXTENDED_VERBS.agc:1181
//			SVDWN1
// PORT: Fixed ROM slots 38453.
    38453, 16702,
// PORT: SOURCE EXTENDED_VERBS.agc:1182
//		CALL
// PORT: Fixed ROM slots 38454.
    38454, 65320,
// PORT: SOURCE EXTENDED_VERBS.agc:1183
//			SVDWN2
// PORT: Fixed ROM slots 38455.
    38455, 16742,
// PORT: SOURCE EXTENDED_VERBS.agc:1184
//		EXIT
// PORT: Fixed ROM slots 38456.
    38456, 65532
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38457–38458.
function agcAotUnit2292 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38457 {
// PORT: SOURCE EXTENDED_VERBS.agc:1185
//
// PORT: SOURCE EXTENDED_VERBS.agc:1186
//		CAF	TCPINAD
// PORT: Fixed ROM slots 38457.
        if slot <> 38457 or instruction <> 13889 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1601), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1187
//		INDEX	FIXLOC
// PORT: Fixed ROM slots 38458.
        if slot <> 38458 or instruction <> 20560 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2292] to agcAotUnit2292@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1188
//		TS	QPRET
// PORT: Fixed ROM slots 38459.
    38459, 45140
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38460–38460.
function agcAotUnit2293 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXTENDED_VERBS.agc:1189
//		TC	POSTJUMP
// PORT: Fixed ROM slots 38460.
    if slot <> 38460 or instruction <> 2497 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2497, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2293] to agcAotUnit2293@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1190
//		CADR	INTWAKE
// PORT: Fixed ROM slots 38461.
    38461, 24158,
// PORT: SOURCE EXTENDED_VERBS.agc:1191
//
// PORT: SOURCE EXTENDED_VERBS.agc:1192
//TCPIN		RTB
// PORT: Fixed ROM slots 38462.
    38462, 65336,
// PORT: SOURCE EXTENDED_VERBS.agc:1193
//			PINBRNCH
// PORT: Fixed ROM slots 38463.
    38463, 17780,
// PORT: SOURCE EXTENDED_VERBS.agc:1194
//
// PORT: SOURCE EXTENDED_VERBS.agc:1195
//OCT51		OCT	51
// PORT: Fixed ROM slots 38464.
    38464, 82,
// PORT: SOURCE EXTENDED_VERBS.agc:1196
//TCPINAD		CADR	TCPIN
// PORT: Fixed ROM slots 38465.
    38465, 56444
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38466–38467.
function agcAotUnit2294 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38466 {
// PORT: SOURCE EXTENDED_VERBS.agc:1197
//
// PORT: SOURCE EXTENDED_VERBS.agc:1198
//# VERB 47 MOVE LM STATE VECTOR INTO CSM STATE VECTOR.
// PORT: SOURCE EXTENDED_VERBS.agc:1199
//
// PORT: SOURCE EXTENDED_VERBS.agc:1200
//LMTOCMSV	CAF	PRIO10
// PORT: Fixed ROM slots 38466.
        if slot <> 38466 or instruction <> 14851 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2563), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1201
//		TC	FINDVAC
// PORT: Fixed ROM slots 38467.
        if slot <> 38467 or instruction <> 2663 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2663, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2294] to agcAotUnit2294@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1202
//		EBANK=	RRECTHIS
// PORT: SOURCE EXTENDED_VERBS.agc:1203
//		2CADR	LMTOCM
// PORT: Fixed ROM slots 38468 38469.
    38468, 3214, 38469, 55430
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38470–38471.
function agcAotUnit2295 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38470 {
// PORT: SOURCE EXTENDED_VERBS.agc:1204
//
// PORT: SOURCE EXTENDED_VERBS.agc:1205
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 38470.
        if slot <> 38470 or instruction <> 2703 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2703, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1206
//
// PORT: SOURCE EXTENDED_VERBS.agc:1207
//LMTOCM		TC	INTPRET
// PORT: Fixed ROM slots 38471.
        if slot <> 38471 or instruction <> 3078 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3078, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2295] to agcAotUnit2295@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1208
//		CALL
// PORT: Fixed ROM slots 38472.
    38472, 65320,
// PORT: SOURCE EXTENDED_VERBS.agc:1209
//			INTSTALL
// PORT: Fixed ROM slots 38473.
    38473, 24132,
// PORT: SOURCE EXTENDED_VERBS.agc:1210
//		SET	BON
// PORT: Fixed ROM slots 38474.
    38474, 35864,
// PORT: SOURCE EXTENDED_VERBS.agc:1211
//			MOONTHIS
// PORT: Fixed ROM slots 38475.
    38475, 4198,
// PORT: SOURCE EXTENDED_VERBS.agc:1212
//			MOONOTH
// PORT: Fixed ROM slots 38476.
    38476, 4488,
// PORT: SOURCE EXTENDED_VERBS.agc:1213
//			+3
// PORT: Fixed ROM slots 38477.
    38477, 56480,
// PORT: SOURCE EXTENDED_VERBS.agc:1214
//		CLEAR
// PORT: Fixed ROM slots 38478.
    38478, 65304,
// PORT: SOURCE EXTENDED_VERBS.agc:1215
//			MOONTHIS
// PORT: Fixed ROM slots 38479.
    38479, 4454,
// PORT: SOURCE EXTENDED_VERBS.agc:1216
//		EXIT
// PORT: Fixed ROM slots 38480.
    38480, 65532
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38481–38482.
function agcAotUnit2296 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38481 {
// PORT: SOURCE EXTENDED_VERBS.agc:1217
//
// PORT: SOURCE EXTENDED_VERBS.agc:1218
//		CAF	OCT51
// PORT: Fixed ROM slots 38481.
        if slot <> 38481 or instruction <> 13888 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1600), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1219
//		TC	GENTRAN
// PORT: Fixed ROM slots 38482.
        if slot <> 38482 or instruction <> 2950 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2950, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2296] to agcAotUnit2296@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1220
//		ADRES	RRECTOTH	# LM STATE VECTOR INTO CM VIA GENTRAN
// PORT: Fixed ROM slots 38483.
    38483, 1836,
// PORT: SOURCE EXTENDED_VERBS.agc:1221
//		ADRES	RRECTHIS
// PORT: Fixed ROM slots 38484.
    38484, 1752
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38485–38490.
function agcAotUnit2297 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38487 {
        if slot <= 38485 {
// PORT: SOURCE EXTENDED_VERBS.agc:1222
//
// PORT: SOURCE EXTENDED_VERBS.agc:1223
//		TCF	TACHEXIT
// PORT: Fixed ROM slots 38485.
            if slot <> 38485 or instruction <> 5679 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5679, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38486 {
// PORT: SOURCE EXTENDED_VERBS.agc:1224
//
// PORT: SOURCE EXTENDED_VERBS.agc:1225
//# VERB 94 DO R64 VIA ENEMA TO PICK UP IN P23.
// PORT: SOURCE EXTENDED_VERBS.agc:1226
//
// PORT: SOURCE EXTENDED_VERBS.agc:1227
//VERB94		CAF	V94FLBIT
// PORT: Fixed ROM slots 38486.
                if slot <> 38486 or instruction <> 14853 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2565), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1228
//		MASK	FLAGWRD9	# IS V94FLAG SET
// PORT: Fixed ROM slots 38487.
                if slot <> 38487 or instruction <> 28741 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 69).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 38488 {
// PORT: SOURCE EXTENDED_VERBS.agc:1229
//# Page 266
// PORT: SOURCE EXTENDED_VERBS.agc:1230
//		EXTEND
// PORT: Fixed ROM slots 38488.
            if slot <> 38488 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 38489 {
// PORT: SOURCE EXTENDED_VERBS.agc:1231
//		BZF	ALM/END		# NO - OPERATOR ERROR
// PORT: Fixed ROM slots 38489.
                if slot <> 38489 or instruction <> 5200 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5200, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1232
//
// PORT: SOURCE EXTENDED_VERBS.agc:1233
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 38490.
                if slot <> 38490 or instruction <> 2928 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2928, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2297] to agcAotUnit2297@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1234
//		ADRES	V94FLAG
// PORT: Fixed ROM slots 38491.
    38491, 278
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38492–38492.
function agcAotUnit2298 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXTENDED_VERBS.agc:1235
//
// PORT: SOURCE EXTENDED_VERBS.agc:1236
//		TC	CHECKMM		# IS IT P23
// PORT: Fixed ROM slots 38492.
    if slot <> 38492 or instruction <> 2804 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2804, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2298] to agcAotUnit2298@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1237
//		MM	23
// PORT: Fixed ROM slots 38493.
    38493, 46
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38494–38495.
function agcAotUnit2299 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38494 {
// PORT: SOURCE EXTENDED_VERBS.agc:1238
//		TC	ALM/END		# NO - OPERATOR ERROR
// PORT: Fixed ROM slots 38494.
        if slot <> 38494 or instruction <> 1104 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1104, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1239
//		TC	PHASCHNG
// PORT: Fixed ROM slots 38495.
        if slot <> 38495 or instruction <> 2826 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2826, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2299] to agcAotUnit2299@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1240
//		OCT	112		# SET GROUP 2 TO DO R64
// PORT: Fixed ROM slots 38496.
    38496, 148
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38497–38500.
function agcAotUnit2300 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38498 {
        if slot <= 38497 {
// PORT: SOURCE EXTENDED_VERBS.agc:1241
//
// PORT: SOURCE EXTENDED_VERBS.agc:1242
//		TC	CLEANOUT	# CAUSE RESTART
// PORT: Fixed ROM slots 38497.
            if slot <> 38497 or instruction <> 1480 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1480, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1243
//
// PORT: SOURCE EXTENDED_VERBS.agc:1244
//# V90PERF	VERB 90		DESCRIPTION
// PORT: SOURCE EXTENDED_VERBS.agc:1245
//#	REQUEST RENDEZVOUS OUT-OF-PLANE DISPLAY (R36)
// PORT: SOURCE EXTENDED_VERBS.agc:1246
//#	1. SET EXT VERB DISPLAY BUSY FLAG.
// PORT: SOURCE EXTENDED_VERBS.agc:1247
//#	2. SCHEDULE R36 CALL WITH PRIORITY 10
// PORT: SOURCE EXTENDED_VERBS.agc:1248
//#	   A. DISPLAY
// PORT: SOURCE EXTENDED_VERBS.agc:1249
//#		TIME OF EVENT - HOURS , MINUTES , SECONDS
// PORT: SOURCE EXTENDED_VERBS.agc:1250
//#		Y OUT-OF-PLANE POSITION - NAUTICAL MILES
// PORT: SOURCE EXTENDED_VERBS.agc:1251
//#		YDOT 	 OUT-OF-PLANE VELOCITY - FEET/SECOND
// PORT: SOURCE EXTENDED_VERBS.agc:1252
//#		PSI 	ANGLE BTW LINE OF SIGHT AND FORWARD
// PORT: SOURCE EXTENDED_VERBS.agc:1253
//#			DIRECTION VECTOR IN HORIZONTAL PLANE - DEGREES
// PORT: SOURCE EXTENDED_VERBS.agc:1254
//V90PERF		TC	TESTXACT
// PORT: Fixed ROM slots 38498.
            if slot <> 38498 or instruction <> 1086 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1086, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 38499 {
// PORT: SOURCE EXTENDED_VERBS.agc:1255
//		CAF	PRIO7		# R36,V90
// PORT: Fixed ROM slots 38499.
            if slot <> 38499 or instruction <> 14899 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2611), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1256
//		TC	FINDVAC
// PORT: Fixed ROM slots 38500.
            if slot <> 38500 or instruction <> 2663 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2663, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2300] to agcAotUnit2300@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1257
//		EBANK=	RPASS36
// PORT: SOURCE EXTENDED_VERBS.agc:1258
//		2CADR	R36
// PORT: Fixed ROM slots 38501 38502.
    38501, 2280, 38502, 32904
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38503–38504.
function agcAotUnit2301 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38503 {
// PORT: SOURCE EXTENDED_VERBS.agc:1259
//
// PORT: SOURCE EXTENDED_VERBS.agc:1260
//		TCF	ENDOFJOB
// PORT: Fixed ROM slots 38503.
        if slot <> 38503 or instruction <> 6799 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6799, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1261
//# VERB 96 SET QUITFLAG TO STOP INTEGRATION.
// PORT: SOURCE EXTENDED_VERBS.agc:1262
//
// PORT: SOURCE EXTENDED_VERBS.agc:1263
//VERB96		TC	UPFLAG		# QUITFLAG WILL CAUSE INTEGRATION TO EXIT
// PORT: Fixed ROM slots 38504.
        if slot <> 38504 or instruction <> 2918 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2918, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2301] to agcAotUnit2301@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1264
//		ADRES	QUITFLAG	# 	AT NEXT TIMESTEP
// PORT: Fixed ROM slots 38505.
    38505, 290
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38506–38506.
function agcAotUnit2302 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXTENDED_VERBS.agc:1265
//
// PORT: SOURCE EXTENDED_VERBS.agc:1266
//		TC	UPFLAG
// PORT: Fixed ROM slots 38506.
    if slot <> 38506 or instruction <> 2918 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2918, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2302] to agcAotUnit2302@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1267
//		ADRES	V96ONFLG
// PORT: Fixed ROM slots 38507.
    38507, 264
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38508–38509.
function agcAotUnit2303 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38508 {
// PORT: SOURCE EXTENDED_VERBS.agc:1268
//		CAF	ZERO
// PORT: Fixed ROM slots 38508.
        if slot <> 38508 or instruction <> 14865 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2577), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1269
//		TC	POSTJUMP
// PORT: Fixed ROM slots 38509.
        if slot <> 38509 or instruction <> 2497 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2497, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2303] to agcAotUnit2303@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1270
//		CADR	V37		# GO TO P00
// PORT: Fixed ROM slots 38510.
    38510, 8210
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38511–38511.
function agcAotUnit2304 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXTENDED_VERBS.agc:1271
//
// PORT: SOURCE EXTENDED_VERBS.agc:1272
//		EBANK=	LANDMARK
// PORT: SOURCE EXTENDED_VERBS.agc:1273
//V52		TC	CHECKMM		# IS P22 OPERATING
// PORT: Fixed ROM slots 38511.
    if slot <> 38511 or instruction <> 2804 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2804, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2304] to agcAotUnit2304@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1274
//		MM	22
// PORT: Fixed ROM slots 38512.
    38512, 44
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38513–38527.
function agcAotUnit2305 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38519 {
        if slot <= 38515 {
            if slot <= 38513 {
// PORT: SOURCE EXTENDED_VERBS.agc:1275
//		TC	ALM/END		# NO
// PORT: Fixed ROM slots 38513.
                if slot <> 38513 or instruction <> 1104 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1104, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 38514 {
// PORT: SOURCE EXTENDED_VERBS.agc:1276
//		CAF	LANDBANK
// PORT: Fixed ROM slots 38514.
                    if slot <> 38514 or instruction <> 13952 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1664), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1277
//		TS	EBANK
// PORT: Fixed ROM slots 38515.
                    if slot <> 38515 or instruction <> 22531 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22531, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 38517 {
                if slot <= 38516 {
// PORT: SOURCE EXTENDED_VERBS.agc:1278
//
// PORT: SOURCE EXTENDED_VERBS.agc:1279
//# Page 267
// PORT: SOURCE EXTENDED_VERBS.agc:1280
//		CS	PRIO7		# YES	SET BITS 12,11,10 OF LANDMARK =
// PORT: Fixed ROM slots 38516.
                    if slot <> 38516 or instruction <> 18995 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2611), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1281
//		MASK	LANDMARK	#	BITS 14,13,12 OF MARKSTAT AFTER
// PORT: Fixed ROM slots 38517.
                    if slot <> 38517 or instruction <> 29673 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 1001).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38518 {
// PORT: SOURCE EXTENDED_VERBS.agc:1282
//		TS	LANDMARK	#	SUBT. THEM FROM 5 TO GET OFFSET
// PORT: Fixed ROM slots 38518.
                    if slot <> 38518 or instruction <> 23529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1283
//		CA	MARKSTAT	#	MARK NO.
// PORT: Fixed ROM slots 38519.
                    if slot <> 38519 or instruction <> 13016 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 728).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 38523 {
            if slot <= 38521 {
                if slot <= 38520 {
// PORT: SOURCE EXTENDED_VERBS.agc:1284
//		TS	SR
// PORT: Fixed ROM slots 38520.
                    if slot <> 38520 or instruction <> 22545 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22545, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1285
//		CA	SR
// PORT: Fixed ROM slots 38521.
                    if slot <> 38521 or instruction <> 12305 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 17).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38522 {
// PORT: SOURCE EXTENDED_VERBS.agc:1286
//		CA	SR
// PORT: Fixed ROM slots 38522.
                    if slot <> 38522 or instruction <> 12305 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 17).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1287
//		MASK	PRIO7
// PORT: Fixed ROM slots 38523.
                    if slot <> 38523 or instruction <> 31283 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2611), 32768).
                        if fixedOperand = 3584 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 512), 8) * 512).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 38525 {
                if slot <= 38524 {
// PORT: SOURCE EXTENDED_VERBS.agc:1288
//		CS	A
// PORT: Fixed ROM slots 38524.
                    if slot <> 38524 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1289
//		AD	PRIO5
// PORT: Fixed ROM slots 38525.
                    if slot <> 38525 or instruction <> 27185 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 2609), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 38526 {
// PORT: SOURCE EXTENDED_VERBS.agc:1290
//		ADS	LANDMARK
// PORT: Fixed ROM slots 38526.
                    if slot <> 38526 or instruction <> 12265 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 1001).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1291
//		TC	GOPIN
// PORT: Fixed ROM slots 38527.
                    if slot <> 38527 or instruction <> 1105 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1105, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2305] to agcAotUnit2305@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1292
//LANDBANK	ECADR	LANDMARK
// PORT: Fixed ROM slots 38528.
    38528, 3026
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38529–38531.
function agcAotUnit2306 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38529 {
// PORT: SOURCE EXTENDED_VERBS.agc:1293
//#
// PORT: SOURCE EXTENDED_VERBS.agc:1294
//
// PORT: SOURCE EXTENDED_VERBS.agc:1295
//# VERB 67 ASTRONAUT DISPLAY OF W MATRIX
// PORT: SOURCE EXTENDED_VERBS.agc:1296
//
// PORT: SOURCE EXTENDED_VERBS.agc:1297
//V67		TC	TESTXACT
// PORT: Fixed ROM slots 38529.
        if slot <> 38529 or instruction <> 1086 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1086, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 38530 {
// PORT: SOURCE EXTENDED_VERBS.agc:1298
//		CAF	PRIO5
// PORT: Fixed ROM slots 38530.
            if slot <> 38530 or instruction <> 14897 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2609), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1299
//		TC	FINDVAC
// PORT: Fixed ROM slots 38531.
            if slot <> 38531 or instruction <> 2663 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2663, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2306] to agcAotUnit2306@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1300
//		EBANK=	W
// PORT: SOURCE EXTENDED_VERBS.agc:1301
//		2CADR	V67CALL
// PORT: Fixed ROM slots 38532 38533.
    38532, 3880, 38533, 49290
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38534–38535.
function agcAotUnit2307 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38534 {
// PORT: SOURCE EXTENDED_VERBS.agc:1302
//
// PORT: SOURCE EXTENDED_VERBS.agc:1303
//		TC	ENDOFJOB
// PORT: Fixed ROM slots 38534.
        if slot <> 38534 or instruction <> 2703 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2703, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1304
//# VB 44. SET SURFACE FLAG.
// PORT: SOURCE EXTENDED_VERBS.agc:1305
//
// PORT: SOURCE EXTENDED_VERBS.agc:1306
//SETSURF		TC	UPFLAG
// PORT: Fixed ROM slots 38535.
        if slot <> 38535 or instruction <> 2918 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2918, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2307] to agcAotUnit2307@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1307
//		ADRES	SURFFLAG
// PORT: Fixed ROM slots 38536.
    38536, 254
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38537–38538.
function agcAotUnit2308 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 38537 {
// PORT: SOURCE EXTENDED_VERBS.agc:1308
//		TCF	GOPIN
// PORT: Fixed ROM slots 38537.
        if slot <> 38537 or instruction <> 5201 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5201, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE EXTENDED_VERBS.agc:1309
//
// PORT: SOURCE EXTENDED_VERBS.agc:1310
//
// PORT: SOURCE EXTENDED_VERBS.agc:1311
//# VB 45. RESET SURFACE FLAG.
// PORT: SOURCE EXTENDED_VERBS.agc:1312
//
// PORT: SOURCE EXTENDED_VERBS.agc:1313
//RESTSRF		TC	DOWNFLAG
// PORT: Fixed ROM slots 38538.
        if slot <> 38538 or instruction <> 2928 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2928, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2308] to agcAotUnit2308@.

agcAotInstallSourceRope(list(
// PORT: SOURCE EXTENDED_VERBS.agc:1314
//		ADRES	SURFFLAG
// PORT: Fixed ROM slots 38539.
    38539, 254
)).

// PORT: Physical bank 43. Shared continuation entries, slots 38540–38540.
function agcAotUnit2309 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE EXTENDED_VERBS.agc:1315
//		TCF	GOPIN
// PORT: Fixed ROM slots 38540.
    if slot <> 38540 or instruction <> 5201 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5201, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2309] to agcAotUnit2309@.

