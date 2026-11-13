// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc
agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1
//# Copyright:	Public domain.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:2
//# Filename:	BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:4
//#		It is part of the source code for the Munar Excursion Module's (LM)
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:6
//# Assembler:	yaYUL
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:7
//# Contact:	Burkey Kerman <info@sandroid.org>.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:8
//# Website:	www.ibiblio.org/apollo.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:9
//# Pages:	731-751
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:10
//# Mod history:	2009-05-19 RSB	Adapted from the corresponding
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:11
//#				Luminary131 file, using page
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:12
//#				images from Luminary 1A.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:13
//#		2009-06-07 RSB	Corrected 3 typos.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:14
//#		2009-07-23 RSB	Added Hommes Kerman's notes on the naming
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:15
//#				of this function, which he got from
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:16
//#				Eyles Kerman.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:17
//#
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:18
//# This source code has been transcribed or otherwise adapted from
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:19
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:20
//# was performed by Fjeld Kerman, and arranged for by Douglas Kerman of
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:21
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:22
//# in storage size and consequent reduction in image quality as well) are
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:23
//# available online at www.ibiblio.org/apollo.  If for some reason you
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:24
//# find that the images are illegible, contact me at info@sandroid.org
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:25
//# about getting access to the (much) higher-quality images which Fjeld Kerman
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:26
//# actually created.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:27
//#
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:28
//# Notations on the hardcopy document read, in part:
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:29
//#
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:30
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:31
//#	16:27 JULY 14, 1969
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:32
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:33
//# Page 731
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:34
//## At the get-together of the AGC developers celebrating the 40th anniversary
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:35
//## of the first munwalk, Eyles Kerman (one of the authors of this routine along
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:36
//## with Adler Kerman) has related to us a little interesting history behind the
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:37
//## naming of the routine.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:38
//##
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:39
//## It traces back to 1965 and the Los Angeles riots, and was inspired
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:40
//## by disc jockey extraordinaire and radio station owner Montague Kerman.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:41
//## Montague Kerman used the phrase "Burn, baby! BURN!" when spinning the
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:42
//## hottest new records. Montague Kerman was the charismatic voice of
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:43
//## soul music in Chicago, New York, and Los Angeles from the mid-1950s to
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:44
//## the mid-1960s.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:45
//# BURN, JEB, BURN -- MASTER IGNITION ROUTINE
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:46
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:47
//		BANK	36
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:48
//		SETLOC	P40S
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:49
//		BANK
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:50
//		EBANK=	WHICH
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:51
//		COUNT*	$$/P40
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:52
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:53
//# THE MASTER IGNITION ROUTINE IS DESIGNED FOR USE BY THE FOLLOWING LEM PROGRAMS:  P12, P40, P42, P61, P63.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:54
//# IT PERFORMS ALL FUNCTIONS IMMEDIATELY ASSOCIATED WITH APS OR DPS IGNITION:  IN PARTICULAR, EVERYTHING LYING
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:55
//# BETWEEN THE PRE-IGNITION TIME CHECK -- ARE WE WITHIN 45 SECONDS OF TIG? -- AND TIG + 26 SECONDS, WHEN DPS
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:56
//# PROGRAMS THROTTLE UP.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:57
//#
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:58
//# VARIATIONS AMONG PROGRAMS ARE ACCOMODATED BY MEANS OF TABLES CONTAINING CONSTANTS (FOR AVEGEXIT, FOR
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:59
//# WAITLIST, FOR PINBALL) AND TCF INSTRUCTIONS.  USERS PLACE THE ADRES OF THE HEAD OF THE APPROPRIATE TABLE
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:60
//# (OF P61TABLE FOR P61LM, FOR EXAMPLE) IN ERASABLE REGISTER `WHICH' (E4).  THE IGNITION ROUTINE THEN INDEXES BY
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:61
//# WHICH TO OBTAIN OR EXECUTE THE PROPER TABLE ENTRY.  THE IGNITION ROUTINE IS INITIATED BY A TCF BURNBABY,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:62
//# THROUGH BANKJUMP IF NECESSARY.  THERE IS NO RETURN.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:63
//#
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:64
//# THE MASTER IGNITION ROUTINE WAS CONCEIVED AND EXECUTED, AND (NOTA BENE) IS MAINTAINED BY ADLER KERMAN AND EYLES KERMAN.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:65
//#
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:66
//# 		   AD ASTRA PER MOAR BOOSTERS
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:67
//#
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:68
//#	***********************************************
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:69
//#		TABLES FOR THE IGNITION ROUTINE
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:70
//#	***********************************************
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:71
//#
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:72
//#			NOLI KRAKEN EXCITARE
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:73
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:74
//P12TABLE	VN	0674		# (0)
// slot 32786
    32786, 1684
)).

// bank 36, slots 32787-32791
function agcAotUnit2064 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32788 {
        if slot <= 32787 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:75
//		TCF	ULLGNOT		# (1)
// slot 32787
            if slot <> 32787 or instruction <> 5333 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5333, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:76
//		TCF	COMFAIL3	# (2)
// slot 32788
            if slot <> 32788 or instruction <> 5514 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5514, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32789 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:77
//		TCF	GOCUTOFF	# (3)
// slot 32789
            if slot <> 32789 or instruction <> 5682 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5682, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 32790 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:78
//		TCF	TASKOVER	# (4)
// slot 32790
                if slot <> 32790 or instruction <> 6833 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6833, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:79
//		TCF	P12SPOT		# (5)
// slot 32791
                if slot <> 32791 or instruction <> 5222 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5222, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2064] to agcAotUnit2064@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:80
//		DEC	0		# (6)	NO ULLAGE
// slot 32792
    32792, 0,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:81
//		EBANK=	WHICH
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:82
//		2CADR	SERVEXIT	# (7)
// slot 32793 32794
    32793, 4080, 32794, 53358
)).

// bank 36, slots 32795-32797
function agcAotUnit2065 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32795 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:83
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:84
//		TCF	DISPCHNG	# (11)
// slot 32795
        if slot <> 32795 or instruction <> 5374 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5374, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32796 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:85
//		TCF	WAITABIT	# (12)
// slot 32796
            if slot <> 32796 or instruction <> 5491 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5491, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:86
//		TCF	P12IGN		# (13)
// slot 32797
            if slot <> 32797 or instruction <> 5457 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5457, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2065] to agcAotUnit2065@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:87
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:88
//P40TABLE	VN	0640		# (0)
// slot 32798
    32798, 1616
)).

// bank 36, slots 32799-32803
function agcAotUnit2066 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32800 {
        if slot <= 32799 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:89
//		TCF	ULLGNOT		# (1)
// slot 32799
            if slot <> 32799 or instruction <> 5333 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5333, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:90
//		TCF	COMFAIL4	# (2)
// slot 32800
            if slot <> 32800 or instruction <> 5516 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5516, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32801 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:91
//		TCF	GOPOST		# (3)
// slot 32801
            if slot <> 32801 or instruction <> 5671 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5671, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 32802 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:92
//		TCF	TASKOVER	# (4)
// slot 32802
                if slot <> 32802 or instruction <> 6833 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6833, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:93
//		TCF	P40SPOT		# (5)
// slot 32803
                if slot <> 32803 or instruction <> 5222 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5222, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2066] to agcAotUnit2066@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:94
//# Page 732
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:95
//		DEC	2240		# (6)
// slot 32804
    32804, 4480,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:96
//		EBANK=	OMEGAQ
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:97
//		2CADR	STEERING	# (7)
// slot 32805 32806
    32805, 3948, 32806, 61548
)).

// bank 36, slots 32807-32811
function agcAotUnit2067 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32808 {
        if slot <= 32807 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:98
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:99
//		TCF	P40SJUNK	# (11)
// slot 32807
            if slot <> 32807 or instruction <> 5366 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5366, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:100
//		TCF	WAITABIT	# (12)
// slot 32808
            if slot <> 32808 or instruction <> 5491 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5491, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32809 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:101
//		TCF	P40IGN		# (13)
// slot 32809
            if slot <> 32809 or instruction <> 5444 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5444, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 32810 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:102
//		TCF	REP40ALM	# (14)
// slot 32810
                if slot <> 32810 or instruction <> 5715 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5715, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:103
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:104
//P41TABLE	TCF	P41SPOT		# (5)
// slot 32811
                if slot <> 32811 or instruction <> 5225 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5225, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2067] to agcAotUnit2067@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:105
//		DEC	-1		# (6)
// slot 32812
    32812, 65532,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:106
//		EBANK=	OMEGAQ
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:107
//		2CADR	CALCN85		# (7)
// slot 32813 32814
    32813, 3580, 32814, 61548
)).

// bank 36, slots 32815-32816
function agcAotUnit2068 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32815 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:108
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:109
//		TCF	COMMON		# (11)
// slot 32815
        if slot <> 32815 or instruction <> 5376 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5376, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:110
//		TCF	TIGTASK		# (12)
// slot 32816
        if slot <> 32816 or instruction <> 5495 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5495, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2068] to agcAotUnit2068@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:111
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:112
//P42TABLE	VN	0640		# (0)
// slot 32817
    32817, 1616
)).

// bank 36, slots 32818-32822
function agcAotUnit2069 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32819 {
        if slot <= 32818 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:113
//		TCF	WANTAPS		# (1)
// slot 32818
            if slot <> 32818 or instruction <> 5330 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5330, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:114
//		TCF	COMFAIL4	# (2)
// slot 32819
            if slot <> 32819 or instruction <> 5516 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5516, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32820 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:115
//		TCF	GOPOST		# (3)
// slot 32820
            if slot <> 32820 or instruction <> 5671 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5671, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 32821 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:116
//		TCF	TASKOVER	# (4)
// slot 32821
                if slot <> 32821 or instruction <> 6833 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6833, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:117
//		TCF	P42SPOT		# (5)
// slot 32822
                if slot <> 32822 or instruction <> 5222 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5222, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2069] to agcAotUnit2069@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:118
//		DEC	2640		# (6)
// slot 32823
    32823, 5280,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:119
//		EBANK=	OMEGAQ
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:120
//		2CADR	STEERING	# (7)
// slot 32824 32825
    32824, 3948, 32825, 61548
)).

// bank 36, slots 32826-32829
function agcAotUnit2070 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32827 {
        if slot <= 32826 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:121
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:122
//		TCF	P40SJUNK	# (11)
// slot 32826
            if slot <> 32826 or instruction <> 5366 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5366, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:123
//		TCF	WAITABIT	# (12)
// slot 32827
            if slot <> 32827 or instruction <> 5491 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5491, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32828 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:124
//		TCF	P42IGN		# (13)
// slot 32828
            if slot <> 32828 or instruction <> 5473 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5473, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:125
//		TCF	P42STAGE	# (14)
// slot 32829
            if slot <> 32829 or instruction <> 5904 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5904, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2070] to agcAotUnit2070@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:126
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:127
//P63TABLE	VN	0662		# (0)
// slot 32830
    32830, 1660
)).

// bank 36, slots 32831-32835
function agcAotUnit2071 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32832 {
        if slot <= 32831 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:128
//		TCF	ULLGNOT		# (1)
// slot 32831
            if slot <> 32831 or instruction <> 5333 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5333, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:129
//		TCF	COMFAIL3	# (2)
// slot 32832
            if slot <> 32832 or instruction <> 5514 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5514, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32833 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:130
//		TCF	V99RECYC	# (3)
// slot 32833
            if slot <> 32833 or instruction <> 5631 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5631, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 32834 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:131
//		TCF	TASKOVER	# (4)
// slot 32834
                if slot <> 32834 or instruction <> 6833 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6833, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:132
//		TCF	P63SPOT		# (5)
// slot 32835
                if slot <> 32835 or instruction <> 5225 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5225, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2071] to agcAotUnit2071@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:133
//		DEC	2240		# (6)
// slot 32836
    32836, 4480,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:134
//		EBANK=	WHICH
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:135
//		2CADR	SERVEXIT	# (7)
// slot 32837 32838
    32837, 4080, 32838, 53358
)).

// bank 36, slots 32839-32841
function agcAotUnit2072 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32839 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:136
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:137
//		TCF	DISPCHNG	# (11)
// slot 32839
        if slot <> 32839 or instruction <> 5374 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5374, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32840 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:138
//		TCF	WAITABIT	# (12)
// slot 32840
            if slot <> 32840 or instruction <> 5491 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5491, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:139
//# Page 733
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:140
//		TCF	P63IGN		# (13)
// slot 32841
            if slot <> 32841 or instruction <> 5421 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5421, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2072] to agcAotUnit2072@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:141
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:142
//ABRTABLE	VN	0663		# (0)
// slot 32842
    32842, 1662
)).

// bank 36, slots 32843-32854
function agcAotUnit2073 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32848 {
        if slot <= 32845 {
            if slot <= 32843 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:143
//		TCF	ULLGNOT		# (1)
// slot 32843
                if slot <> 32843 or instruction <> 5333 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5333, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32844 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:144
//		TCF	COMFAIL3	# (2)
// slot 32844
                    if slot <> 32844 or instruction <> 5514 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5514, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:145
//		TCF	GOCUTOFF	# (3)
// slot 32845
                    if slot <> 32845 or instruction <> 5682 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5682, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 32846 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:146
//		TCF	TASKOVER	# (4)
// slot 32846
                if slot <> 32846 or instruction <> 6833 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6833, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32847 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:147
//		NOOP			# (5)
// slot 32847
                    if slot <> 32847 or instruction <> 5200 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5200, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:148
//		NOOP			# (6)
// slot 32848
                    if slot <> 32848 or instruction <> 5201 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5201, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 32851 {
            if slot <= 32849 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:149
//		NOOP			# (7)
// slot 32849
                if slot <> 32849 or instruction <> 5202 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5202, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32850 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:150
//		NOOP
// slot 32850
                    if slot <> 32850 or instruction <> 5203 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5203, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:151
//		TCF	DISPCHNG	# (11)
// slot 32851
                    if slot <> 32851 or instruction <> 5374 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5374, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 32852 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:152
//		TCF	WAITABIT	# (12)
// slot 32852
                if slot <> 32852 or instruction <> 5491 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5491, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32853 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:153
//		TCF	ABRTIGN		# (13)
// slot 32853
                    if slot <> 32853 or instruction <> 5465 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5465, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:154
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:155
//#	*********************************
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:156
//#	GENERAL PURPOSE IGNITION ROUTINES
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:157
//#	*********************************
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:158
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:159
//BURNBABY	TC	PHASCHNG	# GROUP 4 RESTARTS HERE
// slot 32854
                    if slot <> 32854 or instruction <> 2795 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2795, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2073] to agcAotUnit2073@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:160
//		OCT	04024
// slot 32855
    32855, 4136
)).

// bank 36, slots 32856-32859
function agcAotUnit2074 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32857 {
        if slot <= 32856 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:161
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:162
//		CAF	ZERO		# EXTIRPATE JUNK LEFT IN DVTOTAL
// slot 32856
            if slot <> 32856 or instruction <> 14829 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:163
//		TS	DVTOTAL
// slot 32857
            if slot <> 32857 or instruction <> 23367 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23367, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32858 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:164
//		TS	DVTOTAL +1
// slot 32858
            if slot <> 32858 or instruction <> 23368 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23368, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:165
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:166
//		TC	BANKCALL	# P40AUTO MUST BE BANKCALLED EVEN FROM ITS
// slot 32859
            if slot <> 32859 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2074] to agcAotUnit2074@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:167
//		CADR	P40AUTO		# OWN BANK TO SET UP RETURN PROPERLY
// slot 32860
    32860, 61390
)).

// bank 36, slots 32861-32865
function agcAotUnit2075 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32862 {
        if slot <= 32861 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:168
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:169
//B*RNB*B*	EXTEND
// slot 32861
            if slot <> 32861 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:170
//		DCA	TIG		# STORE NOMINAL TIG FOR OBLATENESS COMP.
// slot 32862
            if slot <> 32862 or instruction <> 13090 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 802, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32863 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:171
//		DXCH	GOBLTIME	# AND FOR P70 OR P71.
// slot 32863
            if slot <> 32863 or instruction <> 22346 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 842, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 32864 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:172
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:173
//		INHINT
// slot 32864
                if slot <> 32864 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:174
//		TC	IBNKCALL
// slot 32865
                if slot <> 32865 or instruction <> 2492 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2492, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2075] to agcAotUnit2075@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:175
//		CADR	ENGINOF3
// slot 32866
    32866, 63208
)).

// bank 36, slots 32867-32868
function agcAotUnit2076 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32867 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:176
//		RELINT
// slot 32867
        if slot <> 32867 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:177
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:178
//		INDEX	WHICH
// slot 32868
        if slot <> 32868 or instruction <> 21293 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21293, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21293, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2076] to agcAotUnit2076@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:179
//		TCF	5
// slot 32869
    32869, 8202
)).

// bank 36, slots 32870-32871
function agcAotUnit2077 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32870 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:180
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:181
//P42SPOT		=	P40SPOT		# (5)
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:182
//P12SPOT		=	P40SPOT		# (5)
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:183
//P63SPOT		=	P41SPOT		# (5)	IN P63 CLOKTASK ALREADY GOING
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:184
//P40SPOT		CS	CNTDNDEX	# (5)
// slot 32870
        if slot <> 32870 or instruction <> 18930 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local fixedOperand is mod(readEffective:call(words, 2546), 32768).
            set words[0] to agcSignExtend(32767 - fixedOperand).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:185
//# Page 734
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:186
//		TC	BANKCALL	# MUST BE BANKCALLED FOR GENERALIZED
// slot 32871
        if slot <> 32871 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2077] to agcAotUnit2077@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:187
//		CADR	STCLOK2		# 	RETURN
// slot 32872
    32872, 62312
)).

// bank 36, slots 32873-32873
function agcAotUnit2078 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:188
//P41SPOT		TC	INTPRET		# (5)
// slot 32873
    if slot <> 32873 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2078] to agcAotUnit2078@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:189
//		DLOAD	DSU
// slot 32874
    32874, 38346,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:190
//			TIG
// slot 32875
    32875, 3652,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:191
//			D29.9SEC
// slot 32876
    32876, 29894,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:192
//		STCALL	TDEC1
// slot 32877
    32877, 28738,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:193
//			INITCDUW
// slot 32878
    32878, 50312,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:194
//		BOFF	CALL
// slot 32879
    32879, 37912,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:195
//			MUNFLAG
// slot 32880
    32880, 3534,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:196
//			GOMIDAV
// slot 32881
    32881, 61696,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:197
//			CSMPREC
// slot 32882
    32882, 23622,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:198
//		VLOAD	MXV
// slot 32883
    32883, 53754,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:199
//			VATT1
// slot 32884
    32884, 42,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:200
//			REFSMMAT
// slot 32885
    32885, 1976,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:201
//		VSR1
// slot 32886
    32886, 65508,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:202
//		STOVL	V(CSM)		# CSM VELOCITY -- M/CS*2(7)
// slot 32887
    32887, 22444,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:203
//			RATT1
// slot 32888
    32888, 30,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:204
//		VSL4	MXV
// slot 32889
    32889, 53652,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:205
//			REFSMMAT
// slot 32890
    32890, 1976,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:206
//		STCALL	R(CSM)		# CSM POSITION -- M*2(24)
// slot 32891
    32891, 30624,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:207
//			MUNGRAV
// slot 32892
    32892, 56496,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:208
//		STODL	G(CSM)		# CSM GRAVITY VEC. -- M/CS*2(7)
// slot 32893
    32893, 14750,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:209
//			TAT
// slot 32894
    32894, 26,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:210
//		STORE	TDEC1		# RELOAD TDEC1 FOR MIDTOAV.
// slot 32895
    32895, 66,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:211
//GOMIDAV		CALRB
// slot 32896
    32896, 65320,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:212
//			MIDTOAV1
// slot 32897
    32897, 24286
)).

// bank 36, slots 32898-32912
function agcAotUnit2079 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32904 {
        if slot <= 32900 {
            if slot <= 32898 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:213
//		TCF	CALLT-35	# MADE IT IN TIME.
// slot 32898
                if slot <> 32898 or instruction <> 5257 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5257, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32899 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:214
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:215
//		EXTEND			# TIG WAS SLIPPED, SO RESET TIG TO 29.9
// slot 32899
                    if slot <> 32899 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:216
//		DCA	PIPTIME1	# SECONDS AFTER THE TIME TO WHICH WE DID
// slot 32900
                    if slot <> 32900 or instruction <> 13169 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 881, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 32902 {
                if slot <= 32901 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:217
//		DXCH	TIG		# INTEGRATE.
// slot 32901
                    if slot <> 32901 or instruction <> 22306 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 802, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:218
//		EXTEND
// slot 32902
                    if slot <> 32902 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 32903 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:219
//		DCA	D29.9SEC
// slot 32903
                    if slot <> 32903 or instruction <> 13923 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 1635, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:220
//		DAS	TIG
// slot 32904
                    if slot <> 32904 or instruction <> 8994 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 802) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 32908 {
            if slot <= 32906 {
                if slot <= 32905 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:221
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:222
//CALLT-35	DXCH	MPAC
// slot 32905
                    if slot <> 32905 or instruction <> 21613 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:223
//		DXCH	SAVET-30	# DELTA-T UNTIL TIG-30
// slot 32906
                    if slot <> 32906 or instruction <> 22336 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 832, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 32907 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:224
//		EXTEND
// slot 32907
                    if slot <> 32907 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:225
//		DCS	5SECDP
// slot 32908
                    if slot <> 32908 or instruction <> 18414 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCS", 2030, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 32910 {
                if slot <= 32909 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:226
//		DAS	SAVET-30	# DELTA-T UNTIL TIG-35
// slot 32909
                    if slot <> 32909 or instruction <> 9024 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 832) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:227
//		EXTEND
// slot 32910
                    if slot <> 32910 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 32911 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:228
//		DCA	SAVET-30
// slot 32911
                    if slot <> 32911 or instruction <> 13120 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 832, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:229
//		TC	LONGCALL
// slot 32912
                    if slot <> 32912 or instruction <> 2751 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2751, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2079] to agcAotUnit2079@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:230
//		EBANK=	TTOGO
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:231
//		2CADR	TIG-35
// slot 32913 32914
    32913, 2368, 32914, 61550
)).

// bank 36, slots 32915-32915
function agcAotUnit2080 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:232
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:233
//		TC	PHASCHNG
// slot 32915
    if slot <> 32915 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2080] to agcAotUnit2080@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:234
//		OCT	20254		# 4.25SPOT FOR TIG-35 RESTART.
// slot 32916
    32916, 16728
)).

// bank 36, slots 32917-32917
function agcAotUnit2081 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:235
//# Page 735
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:236
//		TC	CHECKMM
// slot 32917
    if slot <> 32917 or instruction <> 2769 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2769, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2081] to agcAotUnit2081@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:237
//		DEC	63
// slot 32918
    32918, 126
)).

// bank 36, slots 32919-32922
function agcAotUnit2082 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32920 {
        if slot <= 32919 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:238
//		TCF	ENDOFJOB	# NOT P63
// slot 32919
            if slot <> 32919 or instruction <> 6765 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6765, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:239
//		CS	CNTDNDEX	# P63 CAN START DISPLAYING NOW.
// slot 32920
            if slot <> 32920 or instruction <> 18930 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2546), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32921 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:240
//		TS	DISPDEX
// slot 32921
            if slot <> 32921 or instruction <> 23155 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23155, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:241
//		TC	INTPRET
// slot 32922
            if slot <> 32922 or instruction <> 3103 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 3103, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2082] to agcAotUnit2082@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:242
//		VLOAD	ABVAL
// slot 32923
    32923, 42746,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:243
//			VN1
// slot 32924
    32924, 3798,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:244
//		STORE	ABVEL		# INITIALIZE ABVEL FOR P63 DISPLAY
// slot 32925
    32925, 3700,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:245
//		EXIT
// slot 32926
    32926, 65532
)).

// bank 36, slots 32927-32929
function agcAotUnit2083 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32927 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:246
//		TCF	ENDOFJOB
// slot 32927
        if slot <> 32927 or instruction <> 6765 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6765, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32928 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:247
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:248
//#	********************************
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:249
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:250
//TIG-35		CAF	5SEC
// slot 32928
            if slot <> 32928 or instruction <> 14318 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2030), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:251
//		TC	TWIDDLE
// slot 32929
            if slot <> 32929 or instruction <> 2683 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2683, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2083] to agcAotUnit2083@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:252
//		ADRES	TIG-30
// slot 32930
    32930, 2428
)).

// bank 36, slots 32931-32931
function agcAotUnit2084 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:253
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:254
//		TC	PHASCHNG
// slot 32931
    if slot <> 32931 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2084] to agcAotUnit2084@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:255
//		OCT	40154		# 4.15SPOT FOR TIG-30 RESTART
// slot 32932
    32932, 32984
)).

// bank 36, slots 32933-32935
function agcAotUnit2085 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32933 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:256
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:257
//		CS	BLANKDEX	# BLANK DSKY FOR 5 SECONDS
// slot 32933
        if slot <> 32933 or instruction <> 18922 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local fixedOperand is mod(readEffective:call(words, 2538), 32768).
            set words[0] to agcSignExtend(32767 - fixedOperand).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32934 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:258
//		TS	DISPDEX
// slot 32934
            if slot <> 32934 or instruction <> 23155 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23155, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:259
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:260
//		INDEX	WHICH
// slot 32935
            if slot <> 32935 or instruction <> 21293 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21293, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21293, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2085] to agcAotUnit2085@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:261
//		CS	6		# CHECK ULLAGE TIME.
// slot 32936
    32936, 32780
)).

// bank 36, slots 32937-32940
function agcAotUnit2086 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32938 {
        if slot <= 32937 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:262
//		EXTEND
// slot 32937
            if slot <> 32937 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:263
//		BZMF	TASKOVER
// slot 32938
            if slot <> 32938 or instruction <> 27313 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 27313, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32939 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:264
//		CAF	4.9SEC		# SET UP TASK TO RESTORE DISPLAY AT TIG-30
// slot 32939
            if slot <> 32939 or instruction <> 13925 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1637), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:265
//		TC	TWIDDLE
// slot 32940
            if slot <> 32940 or instruction <> 2683 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2683, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2086] to agcAotUnit2086@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:266
//		ADRES	TIG-30.1
// slot 32941
    32941, 2412
)).

// bank 36, slots 32942-32943
function agcAotUnit2087 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32942 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:267
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:268
//		CAF	PRIO17		# A NEGATIVE ULLAGE TIME INDICATES P41, IN
// slot 32942
        if slot <> 32942 or instruction <> 14871 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2583), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:269
//		TC	NOVAC		# WHICH CASE WE HAVE TO SET UP A JOB TO
// slot 32943
        if slot <> 32943 or instruction <> 2618 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2618, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2087] to agcAotUnit2087@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:270
//		EBANK=	TTOGO		# BLANK THE DSKY FOR FIVE SECONDS, SINCE
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:271
//		2CADR	P41BLANK	# CLOKJOB IS NOT RUNNING DURING P41.
// slot 32944 32945
    32944, 2406, 32945, 61550
)).

// bank 36, slots 32946-32947
function agcAotUnit2088 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32946 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:272
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:273
//		TCF	TASKOVER
// slot 32946
        if slot <> 32946 or instruction <> 6833 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6833, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:274
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:275
//P41BLANK	TC	BANKCALL	# BLANK DSKY.
// slot 32947
        if slot <> 32947 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2088] to agcAotUnit2088@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:276
//		CADR	CLEANDSP
// slot 32948
    32948, 16988
)).

// bank 36, slots 32949-32951
function agcAotUnit2089 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32949 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:277
//		TCF	ENDOFJOB
// slot 32949
        if slot <> 32949 or instruction <> 6765 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6765, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32950 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:278
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:279
//TIG-30.1	CAF	PRIO17		# SET UP JOB TO RESTORE DISPLAY AT TIG-30
// slot 32950
            if slot <> 32950 or instruction <> 14871 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2583), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:280
//		TC	NOVAC
// slot 32951
            if slot <> 32951 or instruction <> 2618 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2618, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2089] to agcAotUnit2089@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:281
//		EBANK=	TTOGO
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:282
//		2CADR	TIG-30A
// slot 32952 32953
    32952, 2422, 32953, 61550
)).

// bank 36, slots 32954-32956
function agcAotUnit2090 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32954 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:283
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:284
//		TCF	TASKOVER
// slot 32954
        if slot <> 32954 or instruction <> 6833 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6833, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32955 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:285
//# Page 736
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:286
//TIG-30A		CAF	V16N85B
// slot 32955
            if slot <> 32955 or instruction <> 14321 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2033), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:287
//		TC	BANKCALL	# RESTORE DISPLAY.
// slot 32956
            if slot <> 32956 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2090] to agcAotUnit2090@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:288
//		CADR	REGODSP		# REGODSP DOES A TCF ENDOFJOB
// slot 32957
    32957, 17002
)).

// bank 36, slots 32958-32959
function agcAotUnit2091 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32958 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:289
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:290
//#	********************************
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:291
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:292
//TIG-30		CAF	S24.9SEC
// slot 32958
        if slot <> 32958 or instruction <> 13924 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1636), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:293
//		TC	TWIDDLE
// slot 32959
        if slot <> 32959 or instruction <> 2683 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2683, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2091] to agcAotUnit2091@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:294
//		ADRES	TIG-5
// slot 32960
    32960, 2516
)).

// bank 36, slots 32961-32963
function agcAotUnit2092 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32961 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:295
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:296
//		CS	CNTDNDEX	# START UP CLOKTASK AGAIN
// slot 32961
        if slot <> 32961 or instruction <> 18930 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local fixedOperand is mod(readEffective:call(words, 2546), 32768).
            set words[0] to agcSignExtend(32767 - fixedOperand).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32962 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:297
//		TS	DISPDEX
// slot 32962
            if slot <> 32962 or instruction <> 23155 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23155, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:298
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:299
//		INDEX	WHICH		# PICK UP APPROPRIATE ULLAGE -- ON TIME
// slot 32963
            if slot <> 32963 or instruction <> 21293 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21293, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21293, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2092] to agcAotUnit2092@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:300
//		CA	6		# Was CAF --- RSB 2009.
// slot 32964
    32964, 24588
)).

// bank 36, slots 32965-32968
function agcAotUnit2093 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32966 {
        if slot <= 32965 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:301
//		EXTEND
// slot 32965
            if slot <> 32965 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:302
//		BZMF	ULLGNOT		# DON'T SET UP ULLAGE IF DT IS NEG OR ZERO
// slot 32966
            if slot <> 32966 or instruction <> 25813 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 25813, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32967 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:303
//		TS	SAVET-30	# SAVE DELTA-T FOR RESTART
// slot 32967
            if slot <> 32967 or instruction <> 23359 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23359, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:304
//		TC	TWIDDLE
// slot 32968
            if slot <> 32968 or instruction <> 2683 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2683, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2093] to agcAotUnit2093@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:305
//		ADRES	ULLGTASK
// slot 32969
    32969, 2508
)).

// bank 36, slots 32970-32976
function agcAotUnit2094 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32972 {
        if slot <= 32970 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:306
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:307
//		CA	THREE		# RESTART PROTECT ULLGTASK (1.3SPOT)
// slot 32970
            if slot <> 32970 or instruction <> 15525 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 3237), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 32971 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:308
//		TS	L
// slot 32971
                if slot <> 32971 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:309
//		CS	THREE
// slot 32972
                if slot <> 32972 or instruction <> 19621 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 3237), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 32974 {
            if slot <= 32973 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:310
//		DXCH	-PHASE1
// slot 32973
                if slot <> 32973 or instruction <> 21995 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 491, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:311
//		CS	TIME1
// slot 32974
                if slot <> 32974 or instruction <> 16405 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 21).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 32975 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:312
//		TS	TBASE1
// slot 32975
                if slot <> 32975 or instruction <> 23083 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23083, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:313
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:314
//		INDEX	WHICH
// slot 32976
                if slot <> 32976 or instruction <> 21293 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21293, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21293, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2094] to agcAotUnit2094@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:315
//		TCF	1
// slot 32977
    32977, 8194
)).

// bank 36, slots 32978-32982
function agcAotUnit2095 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32979 {
        if slot <= 32978 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:316
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:317
//WANTAPS		CS	FLGWRD10	# (1) FOR P42 ENSURE APSFLAG IS SET.  IF IT
// slot 32978
            if slot <> 32978 or instruction <> 16454 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 70).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:318
//		MASK	APSFLBIT	# WASN'T SET, DAP WILL BE INITIALIZED TO
// slot 32979
            if slot <> 32979 or instruction <> 31199 { return choose false if checkOnly else -1. }
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
    } else {
        if slot <= 32980 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:319
//		ADS	FLGWRD10	# ASCENT VALUES BY 1/ACCS IN 2 SECONDS.
// slot 32980
            if slot <> 32980 or instruction <> 11334 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreADS(words, 70).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 32981 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:320
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:321
//ULLGNOT		EXTEND			# (1)
// slot 32981
                if slot <> 32981 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:322
//		INDEX	WHICH
// slot 32982
                if slot <> 32982 or instruction <> 21293 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21293, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 21293, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2095] to agcAotUnit2095@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:323
//		DCA	7		# LOAD AVEGEXIT WITH APPROPRIATE 2CADR
// slot 32983
    32983, 24592
)).

// bank 36, slots 32984-32985
function agcAotUnit2096 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32984 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:324
//		DXCH	AVEGEXIT
// slot 32984
        if slot <> 32984 or instruction <> 22187 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 683, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:325
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:326
//		CAF	TWO		# 4.2SPOT RESTARTS IMMEDIATELY AT REDO4.2
// slot 32985
        if slot <> 32985 or instruction <> 14826 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2096] to agcAotUnit2096@.

// bank 36, slots 32986-32996
function agcAotUnit2097 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32990 {
        if slot <= 32987 {
            if slot <= 32986 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:327
//		TS	L
// slot 32986
                if slot <> 32986 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:328
//		CS	TWO		# AND ALSO AT TIG-5 AT THE CORRECT TIME.
// slot 32987
                if slot <> 32987 or instruction <> 18922 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 32988 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:329
//		DXCH	-PHASE4
// slot 32988
                if slot <> 32988 or instruction <> 22001 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 497, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32989 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:330
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:331
//		CS	TIME1
// slot 32989
                    if slot <> 32989 or instruction <> 16405 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 21).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:332
//		TS	TBASE4		# SET TBASE4 FOR TIG-5 RESTART
// slot 32990
                    if slot <> 32990 or instruction <> 23089 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23089, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 32993 {
            if slot <= 32991 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:333
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:334
//REDO2.17	EXTEND
// slot 32991
                if slot <> 32991 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32992 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:335
//# Page 737
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:336
//		DCA	NEG0		# CLEAR OUT GROUP 2 SO LAMBERT CAN START
// slot 32992
                    if slot <> 32992 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 2541, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:337
//		DXCH	-PHASE2		# IF NEEDED.
// slot 32993
                    if slot <> 32993 or instruction <> 21997 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 493, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 32994 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:338
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:339
//REDO4.2		CCS	PHASE5		# IF SERVICER GOING?
// slot 32994
                if slot <> 32994 or instruction <> 4595 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 499).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32995 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:340
//		TCF	TASKOVER	# YES, DON'T START IT UP AGAIN.
// slot 32995
                    if slot <> 32995 or instruction <> 6833 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6833, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:341
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:342
//		TC	POSTJUMP
// slot 32996
                    if slot <> 32996 or instruction <> 2461 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2097] to agcAotUnit2097@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:343
//		CADR	PREREAD		# PREREAD END THIS TASK
// slot 32997
    32997, 65040
)).

// bank 36, slots 32998-32999
function agcAotUnit2098 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32998 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:344
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:345
//# 	*********************************
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:346
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:347
//ULLGTASK	TC	ONULLAGE	# THIS COMES AT TIG-7.5 OR TIG-3.5
// slot 32998
        if slot <> 32998 or instruction <> 1455 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1455, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:348
//		TC	PHASCHNG
// slot 32999
        if slot <> 32999 or instruction <> 2795 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2795, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2098] to agcAotUnit2098@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:349
//		OCT	1
// slot 33000
    33000, 2
)).

// bank 36, slots 33001-33006
function agcAotUnit2099 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33003 {
        if slot <= 33001 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:350
//		TCF	TASKOVER
// slot 33001
            if slot <> 33001 or instruction <> 6833 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6833, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33002 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:351
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:352
//# 	*********************************
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:353
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:354
//TIG-5		EXTEND
// slot 33002
                if slot <> 33002 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:355
//		DCA	NEG0		# INSURE THAT GROUP 3 IS INACTIVE.
// slot 33003
                if slot <> 33003 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 2541, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 33004 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:356
//		DXCH	-PHASE3
// slot 33004
            if slot <> 33004 or instruction <> 21999 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 495, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33005 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:357
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:358
//		CAF	5SEC
// slot 33005
                if slot <> 33005 or instruction <> 14318 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2030), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:359
//		TC	TWIDDLE
// slot 33006
                if slot <> 33006 or instruction <> 2683 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2683, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2099] to agcAotUnit2099@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:360
//		ADRES	TIG-0
// slot 33007
    33007, 2566
)).

// bank 36, slots 33008-33008
function agcAotUnit2100 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:361
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:362
//		TC	DOWNFLAG	# RESET IGNFLAG AND ASINFLAG
// slot 33008
    if slot <> 33008 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2100] to agcAotUnit2100@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:363
//		ADRES	IGNFLAG		# 	FOR LIGHT-UP LOGIC.
// slot 33009
    33009, 214
)).

// bank 36, slots 33010-33010
function agcAotUnit2101 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:364
//		TC	DOWNFLAG
// slot 33010
    if slot <> 33010 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2101] to agcAotUnit2101@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:365
//		ADRES	ASTNFLAG
// slot 33011
    33011, 216
)).

// bank 36, slots 33012-33012
function agcAotUnit2102 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:366
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:367
//		INDEX	WHICH
// slot 33012
    if slot <> 33012 or instruction <> 21293 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21293, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 21293, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2102] to agcAotUnit2102@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:368
//		TCF	11
// slot 33013
    33013, 8210
)).

// bank 36, slots 33014-33017
function agcAotUnit2103 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33015 {
        if slot <= 33014 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:369
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:370
//P40SJUNK	CCS	PHASE3		# (11) P40 AND P42.  S40.13 IN PROGRESS?
// slot 33014
            if slot <> 33014 or instruction <> 4591 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 495).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:371
//		TCF	DISPCHNG	# YES
// slot 33015
            if slot <> 33015 or instruction <> 5374 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5374, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33016 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:372
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:373
//		CAF	PRIO20
// slot 33016
            if slot <> 33016 or instruction <> 14814 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:374
//		TC	FINDVAC
// slot 33017
            if slot <> 33017 or instruction <> 2629 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2629, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2103] to agcAotUnit2103@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:375
//		EBANK=	TTOGO
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:376
//		2CADR	S40.13
// slot 33018 33019
    33018, 2752, 33019, 47214
)).

// bank 36, slots 33020-33020
function agcAotUnit2104 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:377
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:378
//		TC	PHASCHNG	# 3.5SPOT FOR S40.13
// slot 33020
    if slot <> 33020 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2104] to agcAotUnit2104@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:379
//		OCT	00053
// slot 33021
    33021, 86
)).

// bank 36, slots 33022-33024
function agcAotUnit2105 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33022 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:380
//DISPCHNG	CS	VB99DEX		# (11)
// slot 33022
        if slot <> 33022 or instruction <> 18928 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local fixedOperand is mod(readEffective:call(words, 2544), 32768).
            set words[0] to agcSignExtend(32767 - fixedOperand).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 33023 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:381
//		TS	DISPDEX
// slot 33023
            if slot <> 33023 or instruction <> 23155 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23155, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:382
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:383
//# Page 738
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:384
//COMMON		TC	PHASCHNG	# RESTART TIG-0 (4.7SPOT)
// slot 33024
            if slot <> 33024 or instruction <> 2795 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2795, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2105] to agcAotUnit2105@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:385
//		OCT	40074
// slot 33025
    33025, 32888
)).

// bank 36, slots 33026-33030
function agcAotUnit2106 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33027 {
        if slot <= 33026 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:386
//		TCF	TASKOVER
// slot 33026
            if slot <> 33026 or instruction <> 6833 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6833, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:387
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:388
//# 	*********************************
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:389
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:390
//TIG-0		CS	FLAGWRD7	# SET IGNFLAG SINCE TIG HAS ARRIVED
// slot 33027
            if slot <> 33027 or instruction <> 16451 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 67).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33028 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:391
//		MASK	IGNFLBIT
// slot 33028
            if slot <> 33028 or instruction <> 31199 { return choose false if checkOnly else -1. }
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
            if slot <= 33029 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:392
//		ADS	FLAGWRD7
// slot 33029
                if slot <> 33029 or instruction <> 11331 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreADS(words, 67).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:393
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:394
//		TC	CHECKMM		# IN P63 CASE, THROTTLE-UP IS ZOOMTIME
// slot 33030
                if slot <> 33030 or instruction <> 2769 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2769, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2106] to agcAotUnit2106@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:395
//		DEC	63		# AFTER NOMINAL IGNITION, NOT ACTUAL
// slot 33031
    33031, 126
)).

// bank 36, slots 33032-33034
function agcAotUnit2107 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33032 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:396
//		TCF	IGNYET?
// slot 33032
        if slot <> 33032 or instruction <> 5393 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5393, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 33033 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:397
//		CA	ZOOMTIME
// slot 33033
            if slot <> 33033 or instruction <> 13074 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 786).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:398
//		TC	WAITLIST
// slot 33034
            if slot <> 33034 or instruction <> 2691 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2691, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2107] to agcAotUnit2107@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:399
//		EBANK=	DVCNTR
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:400
//		2CADR	P63ZOOM
// slot 33035 33036
    33035, 2062, 33036, 30830
)).

// bank 36, slots 33037-33037
function agcAotUnit2108 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:401
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:402
//		TC	2PHSCHNG
// slot 33037
    if slot <> 33037 or instruction <> 2775 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2775, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2108] to agcAotUnit2108@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:403
//		OCT	40033
// slot 33038
    33038, 32822,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:404
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:405
//		OCT	05014
// slot 33039
    33039, 5144,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:406
//		OCT	77777
// slot 33040
    33040, 65534
)).

// bank 36, slots 33041-33044
function agcAotUnit2109 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33042 {
        if slot <= 33041 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:407
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:408
//IGNYET?		CAF	ASTNBIT		# CHECK ASTNFLAG:  HAS BOB RESPONDED
// slot 33041
            if slot <> 33041 or instruction <> 14816 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2528), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:409
//		MASK	FLAGWRD7	# TO OUR ENGINE ENABLE REQUEST?
// slot 33042
            if slot <> 33042 or instruction <> 28739 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 67).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33043 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:410
//		EXTEND
// slot 33043
            if slot <> 33043 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:411
//		INDEX	WHICH
// slot 33044
            if slot <> 33044 or instruction <> 21293 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21293, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21293, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2109] to agcAotUnit2109@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:412
//		BZF	12		# BRANCH IF HE HAS NOT RESPONDED YET
// slot 33045
    33045, 8212
)).

// bank 36, slots 33046-33067
function agcAotUnit2110 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33056 {
        if slot <= 33050 {
            if slot <= 33047 {
                if slot <= 33046 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:413
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:414
//IGNITION	CS	FLAGWRD5	# INSURE ENGONFLG IS SET.
// slot 33046
                    if slot <> 33046 or instruction <> 16449 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 65).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:415
//		MASK	ENGONBIT
// slot 33047
                    if slot <> 33047 or instruction <> 31205 { return choose false if checkOnly else -1. }
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
                }
            } else {
                if slot <= 33048 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:416
//		ADS	FLAGWRD5
// slot 33048
                    if slot <> 33048 or instruction <> 11329 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 65).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33049 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:417
//		CS	PRIO30		# TURN ON THE ENGINE.
// slot 33049
                        if slot <> 33049 or instruction <> 18669 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2285), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:418
//		EXTEND
// slot 33050
                        if slot <> 33050 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 33053 {
                if slot <= 33051 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:419
//		RAND	DSALMOUT
// slot 33051
                    if slot <> 33051 or instruction <> 1033 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 2, 9, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33052 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:420
//		AD	BIT13
// slot 33052
                        if slot <> 33052 or instruction <> 27103 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:421
//		EXTEND
// slot 33053
                        if slot <> 33053 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 33054 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:422
//		WRITE	DSALMOUT
// slot 33054
                    if slot <> 33054 or instruction <> 521 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 1, 9, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33055 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:423
//		EXTEND			# SET TEVENT FOR DOWNLINK
// slot 33055
                        if slot <> 33055 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:424
//		DCA	TIME2
// slot 33056
                        if slot <> 33056 or instruction <> 12309 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 33061 {
            if slot <= 33058 {
                if slot <= 33057 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:425
//		DXCH	TEVENT
// slot 33057
                    if slot <> 33057 or instruction <> 22245 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 741, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:426
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:427
//		EXTEND			# UPDATE TIG USING TGO FROM S40.13
// slot 33058
                    if slot <> 33058 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 33059 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:428
//		DCA	TGO
// slot 33059
                    if slot <> 33059 or instruction <> 13135 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 847, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33060 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:429
//		DXCH	TIG
// slot 33060
                        if slot <> 33060 or instruction <> 22306 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 802, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:430
//		EXTEND
// slot 33061
                        if slot <> 33061 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 33064 {
                if slot <= 33062 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:431
//		DCA	TIME2
// slot 33062
                    if slot <> 33062 or instruction <> 12309 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33063 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:432
//		DAS	TIG
// slot 33063
                        if slot <> 33063 or instruction <> 8994 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 802) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:433
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:434
//# Page 739
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:435
//		CS	FLUNDBIT	# PERMIT GUIDANCE LOOP DISPLAYS
// slot 33064
                        if slot <> 33064 or instruction <> 18914 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 33065 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:436
//		MASK	FLAGWRD8
// slot 33065
                    if slot <> 33065 or instruction <> 28740 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 68).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33066 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:437
//		TS	FLAGWRD8
// slot 33066
                        if slot <> 33066 or instruction <> 22596 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22596, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:438
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:439
//		INDEX	WHICH
// slot 33067
                        if slot <> 33067 or instruction <> 21293 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21293, words[0], readEffective).
                        }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 21293, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[2110] to agcAotUnit2110@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:440
//		TCF	13
// slot 33068
    33068, 8214
)).

// bank 36, slots 33069-33097
function agcAotUnit2111 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33082 {
        if slot <= 33075 {
            if slot <= 33071 {
                if slot <= 33069 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:441
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:442
//P63IGN		EXTEND			# (13)	INITIATE BURN DISPLAYS
// slot 33069
                    if slot <> 33069 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33070 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:443
//		DCA	DSP2CADR
// slot 33070
                        if slot <> 33070 or instruction <> 13919 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 1631, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:444
//		DXCH	AVGEXIT
// slot 33071
                        if slot <> 33071 or instruction <> 22187 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 683, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 33073 {
                    if slot <= 33072 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:445
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:446
//		CA	Z		# ASSASSINATE CLOKTASK
// slot 33072
                        if slot <> 33072 or instruction <> 12293 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 5).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:447
//		TS	DISPDEX
// slot 33073
                        if slot <> 33073 or instruction <> 23155 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23155, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 33074 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:448
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:449
//		CS	FLAGWRD9	# SET FLAG FOR P70-P71
// slot 33074
                        if slot <> 33074 or instruction <> 16453 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 69).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:450
//		MASK	LETABBIT
// slot 33075
                        if slot <> 33075 or instruction <> 31203 { return choose false if checkOnly else -1. }
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
            }
        } else {
            if slot <= 33078 {
                if slot <= 33076 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:451
//		ADS	FLAGWRD9
// slot 33076
                    if slot <> 33076 or instruction <> 11333 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 69).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33077 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:452
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:453
//		CS	FLAGWRD7	# SET SWANDISP TO ENABLE R10.
// slot 33077
                        if slot <> 33077 or instruction <> 16451 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 67).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:454
//		MASK	SWANDBIT
// slot 33078
                        if slot <> 33078 or instruction <> 31201 { return choose false if checkOnly else -1. }
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
                    }
                }
            } else {
                if slot <= 33080 {
                    if slot <= 33079 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:455
//		ADS	FLAGWRD7
// slot 33079
                        if slot <> 33079 or instruction <> 11331 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 67).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:456
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:457
//		CS	PULSES		# MAKE SURE DAP IS NOT IN MINIMUM-IMPULSE
// slot 33080
                        if slot <> 33080 or instruction <> 18909 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 33081 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:458
//		MASK	DAPBOOLS	# MODE, IN CASE OF SWITCH TO P66
// slot 33081
                        if slot <> 33081 or instruction <> 28745 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 73).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:459
//		TS	DAPBOOLS
// slot 33082
                        if slot <> 33082 or instruction <> 22601 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22601, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 33089 {
            if slot <= 33085 {
                if slot <= 33083 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:460
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:461
//		EXTEND			# INITIALIZE TIG FOR P70 AND P71.
// slot 33083
                    if slot <> 33083 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33084 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:462
//		DCA	TIME2
// slot 33084
                        if slot <> 33084 or instruction <> 12309 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:463
//		DXCH	TIG
// slot 33085
                        if slot <> 33085 or instruction <> 22306 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 802, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 33087 {
                    if slot <= 33086 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:464
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:465
//		CAF	ZERO		# INITIALIZE WCHPHASE, AND FLPASS0
// slot 33086
                        if slot <> 33086 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:466
//		TS	WCHPHASE
// slot 33087
                        if slot <> 33087 or instruction <> 23273 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23273, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 33088 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:467
//		TS	WCHPHOLD	# ALSO WHCPHOLD
// slot 33088
                        if slot <> 33088 or instruction <> 23441 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23441, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:468
//		CA	TWO
// slot 33089
                        if slot <> 33089 or instruction <> 14826 { return choose false if checkOnly else -1. }
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
            if slot <= 33093 {
                if slot <= 33091 {
                    if slot <= 33090 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:469
//		TS	FLPASS0
// slot 33090
                        if slot <> 33090 or instruction <> 23443 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23443, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:470
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:471
//		TCF	P42IGN
// slot 33091
                        if slot <> 33091 or instruction <> 5473 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5473, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 33092 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:472
//P40IGN		CS	FLAGWRD5	# (13)
// slot 33092
                        if slot <> 33092 or instruction <> 16449 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 65).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:473
//		MASK	NOTHRBIT
// slot 33093
                        if slot <> 33093 or instruction <> 31200 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2528), 32768).
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
                if slot <= 33095 {
                    if slot <= 33094 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:474
//		EXTEND
// slot 33094
                        if slot <> 33094 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:475
//		BZF	P42IGN
// slot 33095
                        if slot <> 33095 or instruction <> 5473 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5473, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 33096 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:476
//		CA	ZOOMTIME
// slot 33096
                        if slot <> 33096 or instruction <> 13074 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 786).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:477
//		TC	WAITLIST
// slot 33097
                        if slot <> 33097 or instruction <> 2691 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[2111] to agcAotUnit2111@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:478
//		EBANK=	DVCNTR
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:479
//		2CADR	P40ZOOM
// slot 33098 33099
    33098, 2074, 33099, 30830
)).

// bank 36, slots 33100-33100
function agcAotUnit2112 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:480
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:481
//P63IGN1		TC	2PHSCHNG
// slot 33100
    if slot <> 33100 or instruction <> 2775 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2775, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2112] to agcAotUnit2112@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:482
//		OCT	40033		# 3.3SPOT FOR ZOOM RESTART.
// slot 33101
    33101, 32822,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:483
//		OCT	05014		# TYPE C RESTARTS HERE IMMEDIATELY
// slot 33102
    33102, 5144,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:484
//		OCT	77777
// slot 33103
    33103, 65534
)).

// bank 36, slots 33104-33128
function agcAotUnit2113 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33115 {
        if slot <= 33109 {
            if slot <= 33106 {
                if slot <= 33104 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:485
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:486
//# Page 740
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:487
//		TCF	P42IGN
// slot 33104
                    if slot <> 33104 or instruction <> 5473 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5473, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33105 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:488
//P12IGN		CAF	EBANK6
// slot 33105
                        if slot <> 33105 or instruction <> 14861 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:489
//		TS	EBANK
// slot 33106
                        if slot <> 33106 or instruction <> 22531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22531, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 33107 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:490
//		EBANK=	AOSQ
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:491
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:492
//		CA	IGNAOSQ		# INITIALIZE DAP BIAS ACCELERATION
// slot 33107
                    if slot <> 33107 or instruction <> 13066 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 778).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33108 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:493
//		TS	AOSQ		# ESTIMATES AT P12 IGNITION.
// slot 33108
                        if slot <> 33108 or instruction <> 23391 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23391, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:494
//		CA	IGNAOSR
// slot 33109
                        if slot <> 33109 or instruction <> 13067 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 779).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 33112 {
                if slot <= 33110 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:495
//		TS	AOSR
// slot 33110
                    if slot <> 33110 or instruction <> 23393 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23393, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33111 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:496
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:497
//		CAF	EBANK7
// slot 33111
                        if slot <> 33111 or instruction <> 14862 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:498
//		TS	EBANK
// slot 33112
                        if slot <> 33112 or instruction <> 22531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22531, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 33113 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:499
//		EBANK=	DVCNTR
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:500
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:501
//ABRTIGN		CA	Z		# (13) KILL CLOKTASK
// slot 33113
                    if slot <> 33113 or instruction <> 12293 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCA(words, 5).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33114 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:502
//		TS	DISPDEX
// slot 33114
                        if slot <> 33114 or instruction <> 23155 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23155, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:503
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:504
//		EXTEND			# CONNECT ASCENT GYIDANCE TO SERVICER.
// slot 33115
                        if slot <> 33115 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 33121 {
            if slot <= 33118 {
                if slot <= 33116 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:505
//		DCA	ATMAGADR
// slot 33116
                    if slot <> 33116 or instruction <> 13921 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 1633, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33117 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:506
//		DXCH	AVGEXIT
// slot 33117
                        if slot <> 33117 or instruction <> 22187 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 683, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:507
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:508
//		CS	FLAGWRD7	# ENABLE R10.
// slot 33118
                        if slot <> 33118 or instruction <> 16451 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 67).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 33119 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:509
//		MASK	SWANDBIT
// slot 33119
                    if slot <> 33119 or instruction <> 31201 { return choose false if checkOnly else -1. }
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
                    if slot <= 33120 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:510
//		ADS	FLAGWRD7
// slot 33120
                        if slot <> 33120 or instruction <> 11331 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 67).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:511
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:512
//P42IGN		CS	DRIFTBIT	# ENSURE THAT POWERED-FLIGHT SWITCHING
// slot 33121
                        if slot <> 33121 or instruction <> 18916 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 33124 {
                if slot <= 33122 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:513
//		MASK	DAPBOOLS	# CURVES ARE USED.
// slot 33122
                    if slot <> 33122 or instruction <> 28745 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 73).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33123 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:514
//		TS	DAPBOOLS
// slot 33123
                        if slot <> 33123 or instruction <> 22601 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22601, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:515
//		CAF	IMPULBIT	# EXAMINE IMPULSE SWITCH
// slot 33124
                        if slot <> 33124 or instruction <> 14819 { return choose false if checkOnly else -1. }
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
            } else {
                if slot <= 33126 {
                    if slot <= 33125 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:516
//		MASK	FLAGWRD2
// slot 33125
                        if slot <> 33125 or instruction <> 28734 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 62).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:517
//		CCS	A
// slot 33126
                        if slot <> 33126 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 33127 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:518
//		TCF	IMPLBURN
// slot 33127
                        if slot <> 33127 or instruction <> 5970 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5970, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:519
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:520
//DVMONCON	TC	DOWNFLAG
// slot 33128
                        if slot <> 33128 or instruction <> 2894 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2894, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[2113] to agcAotUnit2113@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:521
//		ADRES	IGNFLAG		# CONNECT DVMON
// slot 33129
    33129, 214
)).

// bank 36, slots 33130-33130
function agcAotUnit2114 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:522
//		TC	DOWNFLAG
// slot 33130
    if slot <> 33130 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2114] to agcAotUnit2114@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:523
//		ADRES	ASTNFLAG
// slot 33131
    33131, 216
)).

// bank 36, slots 33132-33132
function agcAotUnit2115 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:524
//		TC	DOWNFLAG
// slot 33132
    if slot <> 33132 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2115] to agcAotUnit2115@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:525
//		ADRES	IDLEFLAG
// slot 33133
    33133, 226
)).

// bank 36, slots 33134-33134
function agcAotUnit2116 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:526
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:527
//		TC	PHASCHNG
// slot 33134
    if slot <> 33134 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2116] to agcAotUnit2116@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:528
//		OCT	40054
// slot 33135
    33135, 32856
)).

// bank 36, slots 33136-33136
function agcAotUnit2117 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:529
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:530
//		TC	FIXDELAY	# TURN ULLAGE OFF HALF A SECOND AFTER
// slot 33136
    if slot <> 33136 or instruction <> 2705 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2705, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2117] to agcAotUnit2117@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:531
//		DEC	50		# LIGHT UP.
// slot 33137
    33137, 100
)).

// bank 36, slots 33138-33141
function agcAotUnit2118 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33139 {
        if slot <= 33138 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:532
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:533
//ULLAGOFF	TC	NOULLAGE
// slot 33138
            if slot <> 33138 or instruction <> 1451 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 1451, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:534
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:535
//WAITABIT	EXTEND			# KILL GROUP 4
// slot 33139
            if slot <> 33139 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33140 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:536
//		DCA	NEG0
// slot 33140
            if slot <> 33140 or instruction <> 14829 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 2541, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:537
//# Page 741
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:538
//		DXCH	-PHASE4
// slot 33141
            if slot <> 33141 or instruction <> 22001 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                if not agcCoreDoubleExchange(words, "DXCH", 497, readPhysical, readAdjacent) { return -1. }
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2118] to agcAotUnit2118@.

// bank 36, slots 33142-33143
function agcAotUnit2119 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33142 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:539
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:540
//		TCF	TASKOVER
// slot 33142
        if slot <> 33142 or instruction <> 6833 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6833, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:541
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:542
//TIGTASK		TC	POSTJUMP	# (12)
// slot 33143
        if slot <> 33143 or instruction <> 2461 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2461, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2119] to agcAotUnit2119@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:543
//		CADR	TIGTASK1
// slot 33144
    33144, 30720
)).

// bank 17, slots 17408-17409
function agcAotUnit1037 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17408 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:544
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:545
//#	********************************
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:546
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:547
//		BANK	31
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:548
//		SETLOC	P40S3
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:549
//		BANK
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:550
//		COUNT*	$$/P40
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:551
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:552
//TIGTASK1	CAF	PRIO16
// slot 17408
        if slot <> 17408 or instruction <> 14870 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2582), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:553
//		TC	NOVAC
// slot 17409
        if slot <> 17409 or instruction <> 2618 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2618, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1037] to agcAotUnit1037@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:554
//		EBANK=	TRKMKCNT
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:555
//		2CADR	TIGNOW
// slot 17410 17411
    17410, 3394, 17411, 61550
)).

// bank 17, slots 17412-17412
function agcAotUnit1038 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:556
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:557
//		TC	PHASCHNG
// slot 17412
    if slot <> 17412 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1038] to agcAotUnit1038@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:558
//		OCT	6		# KILL GROUP 6
// slot 17413
    17413, 12
)).

// bank 17, slots 17414-17418
function agcAotUnit1039 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17415 {
        if slot <= 17414 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:559
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:560
//		TCF	TASKOVER
// slot 17414
            if slot <> 17414 or instruction <> 6833 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6833, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:561
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:562
//#	********************************
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:563
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:564
//P63ZOOM		EXTEND
// slot 17415
            if slot <> 17415 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 17416 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:565
//		DCA	LUNLANAD
// slot 17416
            if slot <> 17416 or instruction <> 13334 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                if not agcCoreDoubleExchange(words, "DCA", 1046, readPhysical, readAdjacent) { return -1. }
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 17417 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:566
//		DXCH	AVEGEXIT
// slot 17417
                if slot <> 17417 or instruction <> 22187 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 683, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:567
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:568
//		TC	IBNKCALL
// slot 17418
                if slot <> 17418 or instruction <> 2492 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2492, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1039] to agcAotUnit1039@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:569
//		CADR	FLATOUT
// slot 17419
    17419, 51696
)).

// bank 17, slots 17420-17426
function agcAotUnit1040 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 17422 {
        if slot <= 17420 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:570
//		TCF	P40ZOOMA
// slot 17420
            if slot <> 17420 or instruction <> 5138 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5138, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 17421 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:571
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:572
//P40ZOOM		CAF	BIT13
// slot 17421
                if slot <> 17421 or instruction <> 14815 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:573
//		TS	THRUST
// slot 17422
                if slot <> 17422 or instruction <> 22573 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22573, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 17424 {
            if slot <= 17423 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:574
//		CAF	BIT4
// slot 17423
                if slot <> 17423 or instruction <> 14824 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:575
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:576
//		EXTEND
// slot 17424
                if slot <> 17424 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 17425 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:577
//		WOR	CHAN14
// slot 17425
                if slot <> 17425 or instruction <> 2572 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 5, 12, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:578
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:579
//P40ZOOMA	TC	PHASCHNG
// slot 17426
                if slot <> 17426 or instruction <> 2795 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2795, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1040] to agcAotUnit1040@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:580
//		OCT	3
// slot 17427
    17427, 6
)).

// bank 17, slots 17428-17428
function agcAotUnit1041 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:581
//		TCF	TASKOVER
// slot 17428
    if slot <> 17428 or instruction <> 6833 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6833, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1041] to agcAotUnit1041@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:582
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:583
//		EBANK=	DVCNTR
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:584
//LUNLANAD	2CADR	LUNLAND
// slot 17429 17430
    17429, 2660, 17430, 51310
)).

// bank 36, slots 33145-33145
function agcAotUnit2120 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:585
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:586
//# Page 742
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:587
//ZOOM		=	P40ZOOMA
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:588
//		BANK	36
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:589
//		SETLOC	P40S
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:590
//		BANK
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:591
//		COUNT*	$$/P40
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:592
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:593
//#	********************************
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:594
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:595
//COMFAIL		TC	UPFLAG		# (15)
// slot 33145
    if slot <> 33145 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2120] to agcAotUnit2120@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:596
//		ADRES	IDLEFLAG
// slot 33146
    33146, 226
)).

// bank 36, slots 33147-33147
function agcAotUnit2121 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:597
//		TC	UPFLAG		# SET FLAG TO SUPPRESS CONFLICTING DISPLAY
// slot 33147
    if slot <> 33147 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2121] to agcAotUnit2121@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:598
//		ADRES	FLUNDISP
// slot 33148
    33148, 250
)).

// bank 36, slots 33149-33153
function agcAotUnit2122 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33150 {
        if slot <= 33149 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:599
//		CAF	FOUR		# RESET DVMON
// slot 33149
            if slot <> 33149 or instruction <> 14825 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:600
//		TS	DVCNTR
// slot 33150
            if slot <> 33150 or instruction <> 23373 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23373, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33151 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:601
//		CCS	PHASE6		# CLOCKTASK ACTIVE?
// slot 33151
            if slot <> 33151 or instruction <> 4597 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 501).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33152 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:602
//		TCF	+3		# YES
// slot 33152
                if slot <> 33152 or instruction <> 5507 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5507, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:603
//		TC	BANKCALL	# OTHERWISE, START IT UP
// slot 33153
                if slot <> 33153 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2122] to agcAotUnit2122@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:604
//		CADR	STCLOK1
// slot 33154
    33154, 62310
)).

// bank 36, slots 33155-33157
function agcAotUnit2123 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33155 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:605
// +3		CS	VB97DEX
// slot 33155
        if slot <> 33155 or instruction <> 18933 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local fixedOperand is mod(readEffective:call(words, 2549), 32768).
            set words[0] to agcSignExtend(32767 - fixedOperand).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 33156 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:606
// 		TS	DISPDEX
// slot 33156
            if slot <> 33156 or instruction <> 23155 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23155, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:607
//		TC	PHASCHNG	# TURN OFF GROUP 4.
// slot 33157
            if slot <> 33157 or instruction <> 2795 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2795, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2123] to agcAotUnit2123@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:608
//		OCT	00004
// slot 33158
    33158, 8
)).

// bank 36, slots 33159-33160
function agcAotUnit2124 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33159 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:609
//		TCF	ENDOFJOB
// slot 33159
        if slot <> 33159 or instruction <> 6765 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6765, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:610
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:611
//COMFAIL1	INDEX	WHICH
// slot 33160
        if slot <> 33160 or instruction <> 21293 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21293, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 21293, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2124] to agcAotUnit2124@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:612
//		TCF	2
// slot 33161
    33161, 8196
)).

// bank 36, slots 33162-33166
function agcAotUnit2125 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33163 {
        if slot <= 33162 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:613
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:614
//COMFAIL3	CA	Z		# (15)	KILL CLOKTASK USING Z
// slot 33162
            if slot <> 33162 or instruction <> 12293 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 5).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:615
//		TCF	+2
// slot 33163
            if slot <> 33163 or instruction <> 5517 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5517, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33164 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:616
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:617
//COMFAIL4	CS	CNTDNDEX
// slot 33164
            if slot <> 33164 or instruction <> 18930 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2546), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33165 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:618
//		TS	DISPDEX
// slot 33165
                if slot <> 33165 or instruction <> 23155 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23155, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:619
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:620
//		TC	DOWNFLAG	# RECONNECT DV MONITOR
// slot 33166
                if slot <> 33166 or instruction <> 2894 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2894, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2125] to agcAotUnit2125@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:621
//		ADRES	IDLEFLAG
// slot 33167
    33167, 226
)).

// bank 36, slots 33168-33168
function agcAotUnit2126 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:622
//		TC	DOWNFLAG	# PERMIT GUIDANCE LOOP DISPLAYS
// slot 33168
    if slot <> 33168 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2126] to agcAotUnit2126@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:623
//		ADRES	FLUNDISP
// slot 33169
    33169, 250
)).

// bank 36, slots 33170-33171
function agcAotUnit2127 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33170 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:624
//		TCF	ENDOFJOB
// slot 33170
        if slot <> 33170 or instruction <> 6765 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6765, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:625
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:626
//COMFAIL2	TC	PHASCHNG	# KILL ZOOM RESTART PROTECTION
// slot 33171
        if slot <> 33171 or instruction <> 2795 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2795, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2127] to agcAotUnit2127@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:627
//		OCT	00003
// slot 33172
    33172, 6
)).

// bank 36, slots 33173-33174
function agcAotUnit2128 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33173 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:628
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:629
//		INHINT
// slot 33173
        if slot <> 33173 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:630
//		TC	KILLTASK	# KILL ZOOM IN CASE IT'S STILL TO COME
// slot 33174
        if slot <> 33174 or instruction <> 3095 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3095, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2128] to agcAotUnit2128@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:631
//		CADR	ZOOM
// slot 33175
    33175, 30756
)).

// bank 36, slots 33176-33176
function agcAotUnit2129 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:632
//		TC	IBNKCALL	# COMMAND ENGINE OFF
// slot 33176
    if slot <> 33176 or instruction <> 2492 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2492, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2129] to agcAotUnit2129@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:633
//		CADR	ENGINOF4
// slot 33177
    33177, 63202
)).

// bank 36, slots 33178-33178
function agcAotUnit2130 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:634
//		TC	UPFLAG		# SET THE DRIFT BIT FOR THE DAP.
// slot 33178
    if slot <> 33178 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2130] to agcAotUnit2130@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:635
//		ADRES	DRIFTDFL
// slot 33179
    33179, 404
)).

// bank 36, slots 33180-33180
function agcAotUnit2131 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:636
//# Page 743
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:637
//		TC	INVFLAG		# USE OTHER RCS SYSTEM
// slot 33180
    if slot <> 33180 or instruction <> 1445 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 1445, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2131] to agcAotUnit2131@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:638
//		ADRES	AORBTFLG
// slot 33181
    33181, 400
)).

// bank 36, slots 33182-33182
function agcAotUnit2132 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:639
//		TC	UPFLAG		# TURN ON ULLAGE
// slot 33182
    if slot <> 33182 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2132] to agcAotUnit2132@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:640
//		ADRES	ULLAGFLG
// slot 33183
    33183, 408
)).

// bank 36, slots 33184-33186
function agcAotUnit2133 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33184 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:641
//		CAF	BIT1
// slot 33184
        if slot <> 33184 or instruction <> 14827 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 33185 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:642
//		INHINT
// slot 33185
            if slot <> 33185 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:643
//		TC	TWIDDLE
// slot 33186
            if slot <> 33186 or instruction <> 2683 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2683, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2133] to agcAotUnit2133@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:644
//		ADRES	TIG-5
// slot 33187
    33187, 2516
)).

// bank 36, slots 33188-33223
function agcAotUnit2134 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33205 {
        if slot <= 33196 {
            if slot <= 33191 {
                if slot <= 33189 {
                    if slot <= 33188 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:645
//		TCF	ENDOFJOB
// slot 33188
                        if slot <> 33188 or instruction <> 6765 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6765, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:646
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:647
//#	***********************************
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:648
//#	SUBROUTINES OF THE IGNITION ROUTINE
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:649
//#	***********************************
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:650
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:651
//INVFLAG		CA	Q
// slot 33189
                        if slot <> 33189 or instruction <> 12290 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 2).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 33190 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:652
//		TC	DEBIT
// slot 33190
                        if slot <> 33190 or instruction <> 2898 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2898, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:653
//		COM
// slot 33191
                        if slot <> 33191 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 33193 {
                    if slot <= 33192 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:654
//		EXTEND
// slot 33192
                        if slot <> 33192 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:655
//		RXOR	LCHAN
// slot 33193
                        if slot <> 33193 or instruction <> 3073 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 6, 1, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 33194 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:656
//		TCF	COMFLAG
// slot 33194
                        if slot <> 33194 or instruction <> 6985 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6985, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 33195 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:657
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:658
//#	***********************************
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:659
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:660
//NOULLAGE	CS	ULLAGER		# MUST BE CALLED IN A TASK OR UNDER INHINT
// slot 33195
                            if slot <> 33195 or instruction <> 18918 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                                set words[0] to agcSignExtend(32767 - fixedOperand).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:661
//		MASK	DAPBOOLS
// slot 33196
                            if slot <> 33196 or instruction <> 28745 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMASK(words, 73).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 33200 {
                if slot <= 33198 {
                    if slot <= 33197 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:662
//		TS	DAPBOOLS
// slot 33197
                        if slot <> 33197 or instruction <> 22601 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22601, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:663
//		TC	Q
// slot 33198
                        if slot <> 33198 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 33199 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:664
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:665
//#	***********************************
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:666
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:667
//ONULLAGE	CS	DAPBOOLS	# TURN ON ULLAGE.  MUST BE CALLED IN
// slot 33199
                        if slot <> 33199 or instruction <> 16457 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 73).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:668
//		MASK	ULLAGER		# A TASK OR WHILE INHINTED.
// slot 33200
                        if slot <> 33200 or instruction <> 31206 { return choose false if checkOnly else -1. }
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
                if slot <= 33202 {
                    if slot <= 33201 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:669
//		ADS	DAPBOOLS
// slot 33201
                        if slot <> 33201 or instruction <> 11337 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 73).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:670
//		TC	Q
// slot 33202
                        if slot <> 33202 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 33203 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:671
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:672
//# 	***********************************
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:673
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:674
//STCLOK1		CA	ZERO		# THIS ROUTINE STARTS THE COUNT-DOWN
// slot 33203
                        if slot <> 33203 or instruction <> 14829 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 33204 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:675
//STCLOK2		TS	DISPDEX		# (CLOKTASK AND CLOKJOB).  SETTING
// slot 33204
                            if slot <> 33204 or instruction <> 23155 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 23155, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:676
//STCLOK3		TC	MAKECADR	# SETTING DISPDEX POSITIVE KILLS IT.
// slot 33205
                            if slot <> 33205 or instruction <> 2469 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2469, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 33214 {
            if slot <= 33209 {
                if slot <= 33207 {
                    if slot <= 33206 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:677
//		TS	TBASE4		# RETURN SAVE (NOT FOR RESTARTS).
// slot 33206
                        if slot <> 33206 or instruction <> 23089 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23089, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:678
//		EXTEND
// slot 33207
                        if slot <> 33207 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 33208 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:679
//		DCA	TIG
// slot 33208
                        if slot <> 33208 or instruction <> 13090 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCA", 802, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:680
//		DXCH	MPAC
// slot 33209
                        if slot <> 33209 or instruction <> 21613 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 33211 {
                    if slot <= 33210 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:681
//		EXTEND
// slot 33210
                        if slot <> 33210 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:682
//		DCS	TIME2
// slot 33211
                        if slot <> 33211 or instruction <> 16405 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDoubleExchange(words, "DCS", 21, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 33212 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:683
//# Page 744
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:684
//		DAS	MPAC		# HAVE TIG -- TIME2, UNDOUBTEDLY A + NUMBER
// slot 33212
                        if slot <> 33212 or instruction <> 8301 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            if not agcCoreDas(words, 109) { return -1. }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 33213 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:685
//		TC	TPAGREE		# POSITIVE, SINCE WE PASSED THE
// slot 33213
                            if slot <> 33213 or instruction <> 3759 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 3759, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:686
//		CAF	1SEC		# 45 SECOND CHECK.
// slot 33214
                            if slot <> 33214 or instruction <> 14847 { return choose false if checkOnly else -1. }
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
            }
        } else {
            if slot <= 33218 {
                if slot <= 33216 {
                    if slot <= 33215 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:687
//		TS	Q
// slot 33215
                        if slot <> 33215 or instruction <> 22530 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22530, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:688
//		DXCH	MPAC
// slot 33216
                        if slot <> 33216 or instruction <> 21613 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 109, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 33217 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:689
//		MASK	LOW5		# RESTRICT MAGNITUDE OF NUMBER IN A
// slot 33217
                        if slot <> 33217 or instruction <> 30950 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2278), 32768).
                            if fixedOperand = 31 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 1), 32) * 1).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:690
//		EXTEND
// slot 33218
                        if slot <> 33218 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 33220 {
                    if slot <= 33219 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:691
//		DV	Q
// slot 33219
                        if slot <> 33219 or instruction <> 4098 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreDv(words, 2, words[2]).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:692
//		CA	L		# GET REMAINDER
// slot 33220
                        if slot <> 33220 or instruction <> 12289 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 1).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 33221 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:693
//		AD	TWO
// slot 33221
                        if slot <> 33221 or instruction <> 27114 { return choose false if checkOnly else -1. }
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
                        if slot <= 33222 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:694
//		INHINT
// slot 33222
                            if slot <> 33222 or instruction <> 4 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 4, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:695
//		TC	TWIDDLE
// slot 33223
                            if slot <> 33223 or instruction <> 2683 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 2683, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[2134] to agcAotUnit2134@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:696
//		ADRES	CLOKTASK
// slot 33224
    33224, 2974
)).

// bank 36, slots 33225-33225
function agcAotUnit2135 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:697
//		TC	2PHSCHNG
// slot 33225
    if slot <> 33225 or instruction <> 2775 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2775, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2135] to agcAotUnit2135@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:698
//		OCT	40036		# 6.3SPOT FOR CLOKTASK
// slot 33226
    33226, 32828,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:699
//		OCT	05024
// slot 33227
    33227, 5160,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:700
//		OCT	13000
// slot 33228
    33228, 11264
)).

// bank 36, slots 33229-33237
function agcAotUnit2136 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33232 {
        if slot <= 33230 {
            if slot <= 33229 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:701
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:702
//		CA	TBASE4
// slot 33229
                if slot <> 33229 or instruction <> 12849 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 561).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:703
//		TC	BANKJUMP
// slot 33230
                if slot <> 33230 or instruction <> 2464 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2464, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33231 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:704
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:705
//CLOKTASK	CS	TIME1		# SET TBASE6 FOR GROUP 6 RESTART
// slot 33231
                if slot <> 33231 or instruction <> 16405 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 21).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:706
//		TS	TBASE6
// slot 33232
                if slot <> 33232 or instruction <> 23093 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23093, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 33234 {
            if slot <= 33233 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:707
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:708
//		CCS	DISPDEX
// slot 33233
                if slot <> 33233 or instruction <> 4723 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 627).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:709
//		TCF	KILLCLOK
// slot 33234
                if slot <> 33234 or instruction <> 5595 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5595, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33235 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:710
//		NOOP
// slot 33235
                if slot <> 33235 or instruction <> 5588 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5588, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 33236 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:711
//		CAF	PRIO27
// slot 33236
                    if slot <> 33236 or instruction <> 16333 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 4045), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:712
//		TC	NOVAC
// slot 33237
                    if slot <> 33237 or instruction <> 2618 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2618, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[2136] to agcAotUnit2136@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:713
//		EBANK=	TTOGO
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:714
//		2CADR	CLOKJOB
// slot 33238 33239
    33238, 3006, 33239, 61550
)).

// bank 36, slots 33240-33240
function agcAotUnit2137 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:715
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:716
//		TC	FIXDELAY	# WAIT A SECOND BEFORE STARTING OVER
// slot 33240
    if slot <> 33240 or instruction <> 2705 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2705, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2137] to agcAotUnit2137@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:717
//		DEC	100
// slot 33241
    33241, 200
)).

// bank 36, slots 33242-33259
function agcAotUnit2138 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33250 {
        if slot <= 33245 {
            if slot <= 33243 {
                if slot <= 33242 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:718
//		TCF	CLOKTASK
// slot 33242
                    if slot <> 33242 or instruction <> 5583 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5583, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:719
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:720
//KILLCLOK	EXTEND			# KILL RESTART
// slot 33243
                    if slot <> 33243 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 33244 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:721
//		DCA	NEG0
// slot 33244
                    if slot <> 33244 or instruction <> 14829 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 2541, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:722
//		DXCH	-PHASE6
// slot 33245
                    if slot <> 33245 or instruction <> 22005 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 501, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 33247 {
                if slot <= 33246 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:723
//		TCF	TASKOVER
// slot 33246
                    if slot <> 33246 or instruction <> 6833 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6833, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:724
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:725
//CLOKJOB		EXTEND
// slot 33247
                    if slot <> 33247 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 33248 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:726
//		DCS	TIG
// slot 33248
                    if slot <> 33248 or instruction <> 17186 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCS", 802, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33249 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:727
//		DXCH	TTOGO
// slot 33249
                        if slot <> 33249 or instruction <> 22316 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 812, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:728
//		EXTEND
// slot 33250
                        if slot <> 33250 or instruction <> 6 { return choose false if checkOnly else -1. }
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
        if slot <= 33254 {
            if slot <= 33252 {
                if slot <= 33251 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:729
//# Page 745
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:730
//		DCA	TIME2
// slot 33251
                    if slot <> 33251 or instruction <> 12309 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDoubleExchange(words, "DCA", 21, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:731
//		DAS	TTOGO
// slot 33252
                    if slot <> 33252 or instruction <> 9004 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 812) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 33253 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:732
//		INHINT
// slot 33253
                    if slot <> 33253 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:733
//		CCS	DISPDEX		# IF DISPDEX HAS BEEN SET POSITIVE BY A
// slot 33254
                    if slot <> 33254 or instruction <> 4723 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 627).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 33256 {
                if slot <= 33255 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:734
//		TCF	ENDOFJOB	# TASK OR A HIGHER PRIORITY JOB SINCE THE
// slot 33255
                    if slot <> 33255 or instruction <> 6765 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6765, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:735
//		TCF	ENDOFJOB	# LAST CLOKTASK, AVOID USING IT AS AN
// slot 33256
                    if slot <> 33256 or instruction <> 6765 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6765, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 33257 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:736
//		COM			# INDEX.
// slot 33257
                    if slot <> 33257 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 33258 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:737
//		RELINT			# ***** DISPDEX MUST NEVER B -0 *****
// slot 33258
                        if slot <> 33258 or instruction <> 3 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 3, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:738
//		INDEX	A
// slot 33259
                        if slot <> 33259 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2138] to agcAotUnit2138@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:739
//		TCF	DISPNOT -1	# (-1 DUE TO EFFECT OF CCS)
// slot 33260
    33260, 11282
)).

// bank 36, slots 33261-33264
function agcAotUnit2139 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33262 {
        if slot <= 33261 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:740
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:741
//VB97DEX		=	OCT35		# NEGATIVE OF THIS IS PROPER FOR DISPDEX
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:742
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:743
// -35		CS	ZERO		# INDICATE VERB 97 PASTE
// slot 33261
            if slot <> 33261 or instruction <> 18925 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:744
// 		TS	NVWORD1
// slot 33262
            if slot <> 33262 or instruction <> 23095 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23095, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33263 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:745
//		CA	NVWORD 	+2	# NVWORD+2 CONTAINS V06 & APPROPRIATE NOUN
// slot 33263
            if slot <> 33263 or instruction <> 12537 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 249).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:746
//		TC	BANKCALL
// slot 33264
            if slot <> 33264 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2139] to agcAotUnit2139@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:747
//		CADR	CLOCPLAY
// slot 33265
    33265, 17014
)).

// bank 36, slots 33266-33270
function agcAotUnit2140 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33267 {
        if slot <= 33266 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:748
//		TCF	STOPCLOK	# TERMINATE CLOKTASK ON THE WAY TO POOH
// slot 33266
            if slot <> 33266 or instruction <> 5643 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5643, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:749
//		TCF	COMFAIL1
// slot 33267
            if slot <> 33267 or instruction <> 5512 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5512, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33268 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:750
//		TCF	COMFAIL2
// slot 33268
            if slot <> 33268 or instruction <> 5523 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5523, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 33269 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:751
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:752
//					# THIS DISPLAY IS CALLED VIA ASTNCLOK
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:753
// -25		CAF	V06N61		# IT IS PRIMARILY USED BY THE CREW IN P63
// slot 33269
                if slot <> 33269 or instruction <> 13926 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1638), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:754
// 		TC	BANKCALL	# TO RESET HIS EVENT TIMER TO AGREE WITH
// slot 33270
                if slot <> 33270 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2140] to agcAotUnit2140@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:755
//		CADR	REFLASH		# TIG.
// slot 33271
    33271, 16990
)).

// bank 36, slots 33272-33275
function agcAotUnit2141 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33273 {
        if slot <= 33272 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:756
//		TCF	STOPCLOK
// slot 33272
            if slot <> 33272 or instruction <> 5643 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5643, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:757
//		TCF	ASTNRETN
// slot 33273
            if slot <> 33273 or instruction <> 5656 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5656, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33274 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:758
//		TCF	-6
// slot 33274
            if slot <> 33274 or instruction <> 5620 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5620, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:759
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:760
//CNTDNDEX	=	LOW4		# OCT17:  NEGATIVE PROPER FOR DISPDEX
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:761
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:762
// -17		INDEX	WHICH		# THIS DISPLAY COMES UP AT ONE SECOND
// slot 33275
            if slot <> 33275 or instruction <> 21293 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21293, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21293, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2141] to agcAotUnit2141@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:763
//		# Was CAF --- RSB 2009
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:764
// 		CA	0		# INTERVALS.  IT IS NORMALLY OPERATED
// slot 33276
    33276, 24576
)).

// bank 36, slots 33277-33277
function agcAotUnit2142 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:765
//		TC	BANKCALL	# BETWEEN TIG-30 SECONDS AND TIG-5 SECONDS
// slot 33277
    if slot <> 33277 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2142] to agcAotUnit2142@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:766
//		CADR	REGODSP		# REGODSP DOES ITS OWN TCF ENDOFJOB
// slot 33278
    33278, 17002
)).

// bank 36, slots 33279-33281
function agcAotUnit2143 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33279 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:767
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:768
//VB99DEX		=	ELEVEN		# OCT13:  NEGATIVE PROPER FOR DISPDEX
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:769
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:770
//V99RECYC	EQUALS
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:771
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:772
// -13		CS	BIT9		# INDICATE VERB 99 PASTE
// slot 33279
        if slot <> 33279 or instruction <> 18915 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local fixedOperand is mod(readEffective:call(words, 2531), 32768).
            set words[0] to agcSignExtend(32767 - fixedOperand).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 33280 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:773
// 		TS	NVWORD1
// slot 33280
            if slot <> 33280 or instruction <> 23095 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23095, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:774
//		INDEX	WHICH		# THIS IS THE "PLEASE ENABLE ENGINE"
// slot 33281
            if slot <> 33281 or instruction <> 21293 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21293, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21293, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2143] to agcAotUnit2143@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:775
//		# Was CAF --- RSB 2004
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:776
//		CA	0		# DISPLAY; IT IS INITIATED AT TIG-5 SEC.
// slot 33282
    33282, 24576
)).

// bank 36, slots 33283-33283
function agcAotUnit2144 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:777
//		TC	BANKCALL	# THE DISPLAY IS A V99NXX, WHERE XX IS
// slot 33283
    if slot <> 33283 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2144] to agcAotUnit2144@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:778
//		CADR	CLOCPLAY	# NOUN THAT HAD PREVIOUSLY BEEN DISPLAYED
// slot 33284
    33284, 17014
)).

// bank 36, slots 33285-33288
function agcAotUnit2145 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33286 {
        if slot <= 33285 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:779
//		TCF	STOPCLOK	# TERMINATE GOTOPOOH TURNS OFF ULLAGE.
// slot 33285
            if slot <> 33285 or instruction <> 5643 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5643, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:780
//		TCF	*PROCEED
// slot 33286
            if slot <> 33286 or instruction <> 5665 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5665, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33287 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:781
//		TCF	*ENTER
// slot 33287
            if slot <> 33287 or instruction <> 5668 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5668, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:782
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:783
//# Page 746
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:784
//BLANKDEX	=	TWO		# NEGATIVE OF THIS IS PROPER FOR DISPDEX
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:785
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:786
// -2		TC	BANKCALL	# BLANK DSKY.  THE DSKY IS BLANKED FOR
// slot 33288
            if slot <> 33288 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2145] to agcAotUnit2145@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:787
// 		CADR	CLEANDSP	# 5 SECONDS AT TIG-35 TO INDICATE THAT
// slot 33289
    33289, 16988
)).

// bank 36, slots 33290-33297
function agcAotUnit2146 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33293 {
        if slot <= 33291 {
            if slot <= 33290 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:788
//DISPNOT		TCF	ENDOFJOB	# AVERAGE G IS STARTING.
// slot 33290
                if slot <> 33290 or instruction <> 6765 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6765, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:789
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:790
//STOPCLOK	TC	NULLCLOK	# STOP CLOKTASK & TURN OFF ULLAGE ON THE
// slot 33291
                if slot <> 33291 or instruction <> 1549 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1549, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33292 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:791
//		TCF	GOTOPOOH	# WAY TO P00 (GOTOPOOH RELINTS)
// slot 33292
                if slot <> 33292 or instruction <> 7169 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 7169, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:792
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:793
//NULLCLOK	INHINT
// slot 33293
                if slot <> 33293 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 33295 {
            if slot <= 33294 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:794
//		EXTEND
// slot 33294
                if slot <> 33294 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:795
//		QXCH	P40/RET
// slot 33295
                if slot <> 33295 or instruction <> 9826 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 610, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33296 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:796
//		TC	NOULLAGE	# TURN OFF ULLAGE ...
// slot 33296
                if slot <> 33296 or instruction <> 1451 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1451, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:797
//		TC	KILLTASK	#	DON'T LET IT COME ON, EITHER ...
// slot 33297
                if slot <> 33297 or instruction <> 3095 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3095, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2146] to agcAotUnit2146@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:798
//		CADR	ULLGTASK
// slot 33298
    33298, 61900
)).

// bank 36, slots 33299-33299
function agcAotUnit2147 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:799
//		TC	PHASCHNG	#		NOT EVEN IF THERE'S A RESTART.
// slot 33299
    if slot <> 33299 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2147] to agcAotUnit2147@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:800
//		OCT	1
// slot 33300
    33300, 2
)).

// bank 36, slots 33301-33301
function agcAotUnit2148 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:801
//		CA	Z		# KILL CLOKTASK
// slot 33301
    if slot <> 33301 or instruction <> 12293 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
        agcCoreCA(words, 5).
        return list(false, false, inheritedTransient, false, false).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2148] to agcAotUnit2148@.

// bank 36, slots 33302-33304
function agcAotUnit2149 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33302 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:802
//		TS	DISPDEX
// slot 33302
        if slot <> 33302 or instruction <> 23155 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 23155, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 33303 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:803
//		TC	P40/RET
// slot 33303
            if slot <> 33303 or instruction <> 610 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 610, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:804
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:805
//ASTNRETN	TC	PHASCHNG
// slot 33304
            if slot <> 33304 or instruction <> 2795 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2795, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2149] to agcAotUnit2149@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:806
//		OCT	04024
// slot 33305
    33305, 4136
)).

// bank 36, slots 33306-33309
function agcAotUnit2150 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33307 {
        if slot <= 33306 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:807
//		CAF	ZERO		# STOP DISPLAYING BUT KEEP RUNNING
// slot 33306
            if slot <> 33306 or instruction <> 14829 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:808
//		TS	DISPDEX
// slot 33307
            if slot <> 33307 or instruction <> 23155 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23155, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33308 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:809
//		CAF	PRIO13
// slot 33308
            if slot <> 33308 or instruction <> 14867 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2579), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:810
//		TC	FINDVAC
// slot 33309
            if slot <> 33309 or instruction <> 2629 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2629, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2150] to agcAotUnit2150@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:811
//		EBANK=	STARIND
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:812
//		2CADR	ASTNRET
// slot 33310 33311
    33310, 3344, 33311, 53354
)).

// bank 36, slots 33312-33313
function agcAotUnit2151 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33312 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:813
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:814
//		TCF	ENDOFJOB
// slot 33312
        if slot <> 33312 or instruction <> 6765 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6765, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:815
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:816
//*PROCEED	TC	UPFLAG
// slot 33313
        if slot <> 33313 or instruction <> 2884 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2884, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2151] to agcAotUnit2151@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:817
//		ADRES	ASTNFLAG
// slot 33314
    33314, 216
)).

// bank 36, slots 33315-33317
function agcAotUnit2152 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33315 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:818
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:819
//		TCF	IGNITE
// slot 33315
        if slot <> 33315 or instruction <> 5698 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5698, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 33316 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:820
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:821
//*ENTER		INHINT
// slot 33316
            if slot <> 33316 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:822
//		INDEX	WHICH
// slot 33317
            if slot <> 33317 or instruction <> 21293 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21293, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21293, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2152] to agcAotUnit2152@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:823
//		TCF	3
// slot 33318
    33318, 8198
)).

// bank 36, slots 33319-33320
function agcAotUnit2153 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33319 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:824
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:825
//GOPOST		CAF	PRIO12		# (3) MUST BE LOWER PRIORITY THAN CLOKJOB
// slot 33319
        if slot <> 33319 or instruction <> 14756 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2468), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:826
//		TC	FINDVAC
// slot 33320
        if slot <> 33320 or instruction <> 2629 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2629, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2153] to agcAotUnit2153@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:827
//		EBANK=	TTOGO
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:828
//		2CADR	POSTBURN
// slot 33321 33322
    33321, 3366, 33322, 61550
)).

// bank 36, slots 33323-33324
function agcAotUnit2154 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33323 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:829
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:830
//# Page 747
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:831
//		INHINT			# SET UP THE DAP FOR COASTING FLIGHT.
// slot 33323
        if slot <> 33323 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:832
//		TC	IBNKCALL
// slot 33324
        if slot <> 33324 or instruction <> 2492 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2492, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2154] to agcAotUnit2154@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:833
//		CADR	ALLCOAST
// slot 33325
    33325, 33032
)).

// bank 36, slots 33326-33327
function agcAotUnit2155 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33326 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:834
//		TC	NULLCLOK
// slot 33326
        if slot <> 33326 or instruction <> 1549 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1549, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:835
//		TC	PHASCHNG	# 4.13 RESTART FOR POSTBURN
// slot 33327
        if slot <> 33327 or instruction <> 2795 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2795, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2155] to agcAotUnit2155@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:836
//		OCT	00134
// slot 33328
    33328, 184
)).

// bank 36, slots 33329-33331
function agcAotUnit2156 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33329 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:837
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:838
//		TCF	ENDOFJOB
// slot 33329
        if slot <> 33329 or instruction <> 6765 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6765, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 33330 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:839
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:840
//GOCUTOFF	CAF	PRIO17		# (3)
// slot 33330
            if slot <> 33330 or instruction <> 14871 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2583), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:841
//		TC	FINDVAC
// slot 33331
            if slot <> 33331 or instruction <> 2629 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2629, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2156] to agcAotUnit2156@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:842
//		EBANK=	TGO
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:843
//		2CADR	CUTOFF
// slot 33332 33333
    33332, 2600, 33333, 24686
)).

// bank 36, slots 33334-33334
function agcAotUnit2157 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:844
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:845
//		TC	DOWNFLAG
// slot 33334
    if slot <> 33334 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[2157] to agcAotUnit2157@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:846
//		ADRES	FLUNDISP
// slot 33335
    33335, 250
)).

// bank 36, slots 33336-33337
function agcAotUnit2158 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33336 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:847
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:848
//		INHINT			# SET UP THE DAP FOR COASTING FLIGHT.
// slot 33336
        if slot <> 33336 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:849
//		TC	IBNKCALL
// slot 33337
        if slot <> 33337 or instruction <> 2492 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2492, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2158] to agcAotUnit2158@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:850
//		CADR	ALLCOAST
// slot 33338
    33338, 33032
)).

// bank 36, slots 33339-33340
function agcAotUnit2159 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33339 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:851
//		TC	NULLCLOK
// slot 33339
        if slot <> 33339 or instruction <> 1549 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1549, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:852
//		TC	PHASCHNG
// slot 33340
        if slot <> 33340 or instruction <> 2795 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2795, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2159] to agcAotUnit2159@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:853
//		OCT	07024
// slot 33341
    33341, 7208,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:854
//		OCT	17000
// slot 33342
    33342, 15360,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:855
//		EBANK=	TGO
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:856
//		2CADR	CUTOFF
// slot 33343 33344
    33343, 2600, 33344, 24686
)).

// bank 36, slots 33345-33352
function agcAotUnit2160 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33348 {
        if slot <= 33346 {
            if slot <= 33345 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:857
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:858
//		TCF	ENDOFJOB
// slot 33345
                if slot <> 33345 or instruction <> 6765 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6765, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:859
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:860
//IGNITE		CS	FLAGWRD7	# (2)
// slot 33346
                if slot <> 33346 or instruction <> 16451 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 67).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33347 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:861
//		MASK	IGNFLBIT
// slot 33347
                if slot <> 33347 or instruction <> 31199 { return choose false if checkOnly else -1. }
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
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:862
//		CCS	A
// slot 33348
                if slot <> 33348 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
        if slot <= 33350 {
            if slot <= 33349 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:863
//		TCF	IGNITE1
// slot 33349
                if slot <> 33349 or instruction <> 5710 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5710, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:864
//		CAF	BIT1
// slot 33350
                if slot <> 33350 or instruction <> 14827 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33351 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:865
//		INHINT
// slot 33351
                if slot <> 33351 or instruction <> 4 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 4, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:866
//		TC	TWIDDLE
// slot 33352
                if slot <> 33352 or instruction <> 2683 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2683, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2160] to agcAotUnit2160@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:867
//		ADRES	IGNITION
// slot 33353
    33353, 2604
)).

// bank 36, slots 33354-33361
function agcAotUnit2161 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33357 {
        if slot <= 33355 {
            if slot <= 33354 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:868
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:869
//		CAF	OCT23		# IMMEDIATE RESTART AT IGNITION
// slot 33354
                if slot <> 33354 or instruction <> 14576 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2288), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:870
//		TS	L
// slot 33355
                if slot <> 33355 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33356 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:871
//		COM
// slot 33356
                if slot <> 33356 or instruction <> 16384 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 0).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:872
//		DXCH	-PHASE4
// slot 33357
                if slot <> 33357 or instruction <> 22001 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 497, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 33359 {
            if slot <= 33358 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:873
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:874
//IGNITE1		CS	CNTDNDEX	# RESTORE OLD DISPLAY.
// slot 33358
                if slot <> 33358 or instruction <> 18930 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2546), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:875
//		TS	DISPDEX
// slot 33359
                if slot <> 33359 or instruction <> 23155 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23155, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 33360 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:876
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:877
//		TCF	ENDOFJOB
// slot 33360
                if slot <> 33360 or instruction <> 6765 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6765, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:878
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:879
//# Page 748
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:880
//#	********************************
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:881
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:882
//P40ALM		TC	ALARM		# PROGRAM SELECTION NOT CONSISTENT WITH
// slot 33361
                if slot <> 33361 or instruction <> 2935 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2935, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[2161] to agcAotUnit2161@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:883
//		OCT	1706		# VEHICLE CONFIGURATION
// slot 33362
    33362, 1932
)).

// bank 36, slots 33363-33364
function agcAotUnit2162 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33363 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:884
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:885
//REP40ALM	CAF	V05N09		# (14)
// slot 33363
        if slot <> 33363 or instruction <> 14854 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2566), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:886
//		TC	BANKCALL
// slot 33364
        if slot <> 33364 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[2162] to agcAotUnit2162@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:887
//		CADR	GOFLASH
// slot 33365
    33365, 17020
)).

// bank 36, slots 33366-33369
function agcAotUnit2163 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 33367 {
        if slot <= 33366 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:888
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:889
//		TCF	GOTOPOOH	# V34E 		TERMINATE
// slot 33366
            if slot <> 33366 or instruction <> 7169 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7169, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:890
//		TCF	+2		# PROCEED 	CHECK FOR P42
// slot 33367
            if slot <> 33367 or instruction <> 5721 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5721, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 33368 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:891
//		TCF	REP40ALM	# V32E		REDISPLAY ALARM
// slot 33368
            if slot <> 33368 or instruction <> 5715 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5715, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:892
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:893
//		INDEX	WHICH		# FOR P42, ALLOW CREW TO PROCEED EVEN
// slot 33369
            if slot <> 33369 or instruction <> 21293 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21293, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 21293, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2163] to agcAotUnit2163@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:894
//		TCF	14		# THOUGH VEHICLE IS UNSTAGED.
// slot 33370
    33370, 8216
)).

// bank 35, slots 32743-32745
function agcAotUnit2061 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32743 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:895
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:896
//#	********************************
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:897
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:898
//		BANK	31
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:899
//		SETLOC	P40S2
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:900
//		BANK
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:901
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:902
//		COUNT*	$$/P40
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:903
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:904
//P40AUTO		TC	MAKECADR	# HELLO THERE, JEB.
// slot 32743
        if slot <> 32743 or instruction <> 2469 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2469, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 32744 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:905
//		TS	TEMPR60		# FOR GENERALIZED RETURN TO OTHER BANKS.
// slot 32744
            if slot <> 32744 or instruction <> 23156 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23156, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:906
//P40A/P		TC	BANKCALL	# SUBROUTINE TO CHECK PGNCS CONTROL
// slot 32745
            if slot <> 32745 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2061] to agcAotUnit2061@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:907
//		CADR	G+N,AUTO	# AND AUTO STABILIZATION MODES
// slot 32746
    32746, 45402
)).

// bank 35, slots 32747-32759
function agcAotUnit2062 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32752 {
        if slot <= 32749 {
            if slot <= 32747 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:908
//		CCS	A		# +0 INDICATES IN PGNCS, IN AUTO
// slot 32747
                if slot <> 32747 or instruction <> 4096 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32748 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:909
//		TCF	TURNITON	# + INDICATES NOT IN PGNCS AND/OR AUTO
// slot 32748
                    if slot <> 32748 or instruction <> 6134 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6134, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:910
//		CAF	APSFLBIT	# ARE WE ON THE DESCENT STAGE?
// slot 32749
                    if slot <> 32749 or instruction <> 14815 { return choose false if checkOnly else -1. }
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
        } else {
            if slot <= 32750 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:911
//		MASK	FLGWRD10
// slot 32750
                if slot <> 32750 or instruction <> 28742 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 70).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32751 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:912
//		CCS	A
// slot 32751
                    if slot <> 32751 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:913
//		TCF	GOBACK		# RETURN
// slot 32752
                    if slot <> 32752 or instruction <> 6139 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6139, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 32755 {
            if slot <= 32753 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:914
//		CAF	BIT5		# YES, CHECK FOR AUTO-THROTTLE MODE
// slot 32753
                if slot <> 32753 or instruction <> 14823 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 32754 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:915
//		EXTEND
// slot 32754
                    if slot <> 32754 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:916
//		RAND	CHAN30
// slot 32755
                    if slot <> 32755 or instruction <> 1048 { return choose false if checkOnly else -1. }
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
            if slot <= 32757 {
                if slot <= 32756 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:917
//		EXTEND
// slot 32756
                    if slot <> 32756 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:918
//		BZF	GOBACK		# IN AUTO-THROTTLE MODE -- RETURN
// slot 32757
                    if slot <> 32757 or instruction <> 6139 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6139, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 32758 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:919
//TURNITON	CAF	P40A/PMD	# DISPLAYS V50N25 R1=203 PLEASE PERFORM
// slot 32758
                    if slot <> 32758 or instruction <> 14333 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2045), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:920
//		TC	BANKCALL	# CHECKLIST 203 TURN ON PGNCS ETC.
// slot 32759
                    if slot <> 32759 or instruction <> 2446 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[2062] to agcAotUnit2062@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:921
//		CADR	GOPERF1
// slot 32760
    32760, 17190
)).

// bank 35, slots 32761-32764
function agcAotUnit2063 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 32762 {
        if slot <= 32761 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:922
//		TCF	GOTOPOOH	# V34E TERMINATE
// slot 32761
            if slot <> 32761 or instruction <> 7169 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7169, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:923
//		TCF	P40A/P		# RECYCLE
// slot 32762
            if slot <> 32762 or instruction <> 6121 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6121, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 32763 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:924
//GOBACK		CA	TEMPR60
// slot 32763
            if slot <> 32763 or instruction <> 12916 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 628).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:925
//		TC	BANKJUMP	# GOODBYE.  COME AGAIN SOON.  BRING SNACKS.
// slot 32764
            if slot <> 32764 or instruction <> 2464 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2464, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[2063] to agcAotUnit2063@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:926
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:927
//P40A/PMD	OCT	00203
// slot 32765
    32765, 262,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:928
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:929
//# Page 749
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:930
//		BANK	36
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:931
//		SETLOC	P40S
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:932
//		BANK
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:933
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:934
//		COUNT*	$$/P40
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:935
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:936
//#	**********************************
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:937
//#	CONSTANTS FOR THE IGNITION ROUTINE
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:938
//#	**********************************
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:939
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:940
//SERVCADR	=	P63TABLE +7
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:941
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:942
//P40ADRES	ADRES	P40TABLE
// slot 33371
    33371, 2108,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:943
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:944
//P41ADRES	ADRES	P41TABLE -5
// slot 33372
    33372, 2124,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:945
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:946
//P42ADRES	ADRES	P42TABLE
// slot 33373
    33373, 2146,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:947
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:948
//		EBANK=	DVCNTR
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:949
//DSP2CADR	2CADR	P63DISPS -2
// slot 33374 33375
    33374, 3698, 33375, 51310,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:950
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:951
//		EBANK=	DVCNTR
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:952
//ATMAGADR	2CADR	ATMAG
// slot 33376 33377
    33376, 3908, 33377, 57454,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:953
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:954
//?		=	GOTOPOOH
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:955
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:956
//D29.9SEC	2DEC	2990
// slot 33378 33379
    33378, 0, 33379, 5980,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:957
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:958
//S24.9SEC	DEC	2490
// slot 33380
    33380, 4980,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:959
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:960
//4.9SEC		DEC	490
// slot 33381
    33381, 980,
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:961
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:962
//OCT20		=	BIT5
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:963
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:964
//V06N61		VN	0661
// slot 33382
    33382, 1658
)).

// bank 03, slots 5143-5146
function agcAotUnit253 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5144 {
        if slot <= 5143 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:965
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:966
//# Page 750
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:967
//# KILLTASK
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:968
//# MOD NO:  NEW PROGRAM
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:969
//# MOD BY:  COVELLI KERMAN
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:970
//#
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:971
//# FUNCTIONAL DESCRIPTION:
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:972
//#
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:973
//#	KILLTASK IS USED TO REMOVE A TASK FROM THE WAITLIST BY SUBSTITUTING A NULL TASK CALLED `NULLTASK' (OF COURSE),
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:974
//#	WHICH MERELY DOES A TC TASKOVER.  IF THE SAME TASK IS SCHEDULED MORE THAN ONCE, ONLY THE ONE WHICH WILL OCCUR
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:975
//#	FIRST IS REMOVED.  IF THE TASK IS NOT SCHEDULED, KILLTASK TAKES NO ACTION AND RETURNS WITH NO ALARM.  KILLTASK
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:976
//#	LEAVES INTERRUPTS INHIBITED SO CALLER MUST RELINT
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:977
//#
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:978
//# CALLING SEQUENCE
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:979
//#	L	TC	KILLTASK	# IN FIXED-FIXED
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:980
//#	L+1	CADR	????????	# CADR (NOT 2CADR) OF TASK TO BE REMOVED.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:981
//#	L+2	(RELINT)		# RETURN
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:982
//#
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:983
//# EXIT MODE:  AT L+2 OF CALLING SEQUENCE.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:984
//#
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:985
//# ERASABLE INITIALIZATION:  NONE.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:986
//#
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:987
//# OUTPUT:  2CADR OF NULLTASK IN LST2
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:988
//#
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:989
//# DEBRIS:  ITEMP1 - ITEMP4, A, L, Q.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:990
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:991
//		EBANK=	LST2
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:992
//		BLOCK	3		# KILLTASK MUST BE IN FIXED-FIXED.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:993
//		SETLOC	FFTAG6
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:994
//		BANK
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:995
//		COUNT*	$$/KILL
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:996
//KILLTASK	CA	KILLBB
// slot 5143
            if slot <> 5143 or instruction <> 15390 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 3102), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:997
//		INHINT
// slot 5144
            if slot <> 5144 or instruction <> 4 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 4, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 5145 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:998
//		LXCH	A
// slot 5145
            if slot <> 5145 or instruction <> 9216 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreExchange(words, 1, 0, readPhysical).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:999
//		INDEX	Q
// slot 5146
            if slot <> 5146 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[253] to agcAotUnit253@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1000
//		CA	0		# GET CADR.
// slot 5147
    5147, 24576
)).

// bank 03, slots 5148-5149
function agcAotUnit254 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 5148 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1001
//		LXCH	BBANK
// slot 5148
        if slot <> 5148 or instruction <> 9222 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreExchange(words, 1, 6, readPhysical).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1002
//		TCF	KILLTSK2	# CONTINUE IN SWITCHED FIXED.
// slot 5149
        if slot <> 5149 or instruction <> 5248 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5248, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[254] to agcAotUnit254@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1003
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1004
//		EBANK=	LST2
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1005
//KILLBB		BBCON	KILLTSK2
// slot 5150
    5150, 47206
)).

// bank 27, slots 25728-25740
function agcAotUnit1660 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25733 {
        if slot <= 25730 {
            if slot <= 25728 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1006
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1007
//		BANK	27
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1008
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1009
//		SETLOC	P40S1
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1010
//		BANK
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1011
//		COUNT*	$$/KILL
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1012
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1013
//KILLTSK2	LXCH	ITEMP2		# SAVE CALLER'S BBANK
// slot 25728
                if slot <> 25728 or instruction <> 9266 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 50, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 25729 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1014
//# Page 751
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1015
//		INCR	Q
// slot 25729
                    if slot <> 25729 or instruction <> 10242 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 2).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1016
//		EXTEND
// slot 25730
                    if slot <> 25730 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 25731 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1017
//		QXCH	ITEMP1		# RETURN 2ADR IN ITEMP1,ITEMP2
// slot 25731
                if slot <> 25731 or instruction <> 9265 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 2, 49, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 25732 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1018
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1019
//		TS	ITEMP3		# CADR IS IN A
// slot 25732
                    if slot <> 25732 or instruction <> 22579 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22579, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1020
//		MASK	LOW10
// slot 25733
                    if slot <> 25733 or instruction <> 31242 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                        if fixedOperand = 1023 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 1), 1024) * 1).
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
        if slot <= 25736 {
            if slot <= 25734 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1021
//		AD	BIT11
// slot 25734
                if slot <> 25734 or instruction <> 27105 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2529), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 25735 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1022
//		TS	ITEMP4		# GENADR OF TASK
// slot 25735
                    if slot <> 25735 or instruction <> 22580 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22580, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1023
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1024
//		CS	LOW10
// slot 25736
                    if slot <> 25736 or instruction <> 18954 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 25738 {
                if slot <= 25737 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1025
//		MASK	ITEMP3
// slot 25737
                    if slot <> 25737 or instruction <> 28723 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 51).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1026
//		TS	ITEMP3		# FBANK OF TASK
// slot 25738
                    if slot <> 25738 or instruction <> 22579 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22579, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 25739 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1027
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1028
//		ZL
// slot 25739
                    if slot <> 25739 or instruction <> 9223 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreExchange(words, 1, 7, readPhysical).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1029
//ADRSCAN		INDEX	L
// slot 25740
                    if slot <> 25740 or instruction <> 20481 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20481, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20481, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1660] to agcAotUnit1660@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1030
//		CS	LST2
// slot 25741
    25741, 34320
)).

// bank 27, slots 25742-25755
function agcAotUnit1661 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25748 {
        if slot <= 25744 {
            if slot <= 25742 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1031
//		AD	ITEMP4		# COMPARE GENADRS
// slot 25742
                if slot <> 25742 or instruction <> 24628 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 52).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 25743 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1032
//		EXTEND
// slot 25743
                    if slot <> 25743 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1033
//		BZF	TSTFBANK	# IF THEY MATCH, COMPARE FBANKS
// slot 25744
                    if slot <> 25744 or instruction <> 5274 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5274, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 25746 {
                if slot <= 25745 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1034
//LETITLIV	CS	LSTLIM
// slot 25745
                    if slot <> 25745 or instruction <> 18919 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2535), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1035
//		AD	L
// slot 25746
                    if slot <> 25746 or instruction <> 24577 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 25747 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1036
//		EXTEND			# ARE WE DONE?
// slot 25747
                    if slot <> 25747 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1037
//		BZF	DEAD		# YES -- DONE, SO RETURN
// slot 25748
                    if slot <> 25748 or instruction <> 5272 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5272, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 25751 {
            if slot <= 25749 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1038
//		INCR	L
// slot 25749
                if slot <> 25749 or instruction <> 10241 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreINCR(words, 1).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 25750 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1039
//		INCR	L
// slot 25750
                    if slot <> 25750 or instruction <> 10241 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreINCR(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1040
//		TCF	ADRSCAN		# CONTINUE LOOP.
// slot 25751
                    if slot <> 25751 or instruction <> 5260 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5260, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 25753 {
                if slot <= 25752 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1041
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1042
//DEAD		DXCH	ITEMP1
// slot 25752
                    if slot <> 25752 or instruction <> 21554 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 50, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1043
//		DTCB
// slot 25753
                    if slot <> 25753 or instruction <> 21510 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 25754 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1044
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1045
//TSTFBANK	CS	LOW10
// slot 25754
                    if slot <> 25754 or instruction <> 18954 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1046
//		INDEX	L
// slot 25755
                    if slot <> 25755 or instruction <> 20481 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20481, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 20481, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[1661] to agcAotUnit1661@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1047
//		MASK	LST2 	+1	# COMPARE FBANKS ONLY.
// slot 25756
    25756, 58898
)).

// bank 27, slots 25757-25763
function agcAotUnit1662 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 25759 {
        if slot <= 25757 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1048
//		EXTEND
// slot 25757
            if slot <> 25757 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 25758 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1049
//		SU	ITEMP3
// slot 25758
                if slot <> 25758 or instruction <> 24627 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreSU(words, 51).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1050
//		EXTEND
// slot 25759
                if slot <> 25759 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 25761 {
            if slot <= 25760 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1051
//		BZF	KILLDEAD	# MATCH -- KILL IT.
// slot 25760
                if slot <> 25760 or instruction <> 5282 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5282, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1052
//		TCF	LETITLIV	# NO MATCH -- CONTINUE.
// slot 25761
                if slot <> 25761 or instruction <> 5265 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5265, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 25762 {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1053
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1054
//KILLDEAD	CA	TCTSKOVR
// slot 25762
                if slot <> 25762 or instruction <> 14571 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2283), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1055
//		INDEX	L
// slot 25763
                if slot <> 25763 or instruction <> 20481 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20481, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20481, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1662] to agcAotUnit1662@.

agcAotInstallSourceRope(list(
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1056
//		TS	LST2		# REMOVE TASK BY INSERTING TASKOVER
// slot 25764
    25764, 46608
)).

// bank 27, slots 25765-25765
function agcAotUnit1663 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1057
//		TCF	DEAD
// slot 25765
    if slot <> 25765 or instruction <> 5272 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 5272, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1663] to agcAotUnit1663@.

// no code for the lines below
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1058
//
// BURN_BABY_BURN--MASTER_IGNITION_ROUTINE.agc:1059
//LSTLIM		EQUALS	BIT5		# DEC 16
