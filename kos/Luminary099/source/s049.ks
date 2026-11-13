// P12.agc
// bank 30, slots 26673-26673
function agcAotUnit1685 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P12.agc:1
//# Copyright:	Public domain.
// P12.agc:2
//# Filename:	P12.agc
// P12.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// P12.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// P12.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// P12.agc:6
//# Assembler:	yaYUL
// P12.agc:7
//# Contact:	Hartmuth Gutsche <hgutsche@xplornet.com>.
// P12.agc:8
//# Website:	www.ibiblio.org/apollo.
// P12.agc:9
//# Pages:	838-842
// P12.agc:10
//# Mod history:	2009-05-23 HG	Transcribed from page images.
// P12.agc:11
//#
// P12.agc:12
//# This source code has been transcribed or otherwise adapted from
// P12.agc:13
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// P12.agc:14
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// P12.agc:15
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// P12.agc:16
//# in storage size and consequent reduction in image quality as well) are
// P12.agc:17
//# available online at www.ibiblio.org/apollo.  If for some reason you
// P12.agc:18
//# find that the images are illegible, contact me at info@sandroid.org
// P12.agc:19
//# about getting access to the (much) higher-quality images which Paul
// P12.agc:20
//# actually created.
// P12.agc:21
//#
// P12.agc:22
//# Notations on the hardcopy document read, in part:
// P12.agc:23
//#
// P12.agc:24
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// P12.agc:25
//#	16:27 JULY 14, 1969
// P12.agc:26
//
// P12.agc:27
//# Page 838
// P12.agc:28
//		BANK	24
// P12.agc:29
//		SETLOC	P12
// P12.agc:30
//		BANK
// P12.agc:31
//
// P12.agc:32
//		EBANK=	DVCNTR
// P12.agc:33
//		COUNT*	$$/P12
// P12.agc:34
//
// P12.agc:35
//P12LM		TC	PHASCHNG
// slot 26673
    if slot <> 26673 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1685] to agcAotUnit1685@.

agcAotInstallSourceRope(list(
// P12.agc:36
//		OCT	04024
// slot 26674
    26674, 4136
)).

// bank 30, slots 26675-26675
function agcAotUnit1686 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P12.agc:37
//
// P12.agc:38
//		TC	BANKCALL
// slot 26675
    if slot <> 26675 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1686] to agcAotUnit1686@.

agcAotInstallSourceRope(list(
// P12.agc:39
//		CADR	R02BOTH		# CHECK THE STATUS OF THE IMU.
// slot 26676
    26676, 9560
)).

// bank 30, slots 26677-26677
function agcAotUnit1687 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P12.agc:40
//
// P12.agc:41
//		TC	UPFLAG
// slot 26677
    if slot <> 26677 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1687] to agcAotUnit1687@.

agcAotInstallSourceRope(list(
// P12.agc:42
//		ADRES	MUNFLAG
// slot 26678
    26678, 194
)).

// bank 30, slots 26679-26679
function agcAotUnit1688 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P12.agc:43
//
// P12.agc:44
//		TC	UPFLAG		# INSURE 4-JET TRANSLATION CAPABILITY.
// slot 26679
    if slot <> 26679 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1688] to agcAotUnit1688@.

agcAotInstallSourceRope(list(
// P12.agc:45
//		ADRES	ACC4-2FL
// slot 26680
    26680, 398
)).

// bank 30, slots 26681-26681
function agcAotUnit1689 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P12.agc:46
//
// P12.agc:47
//		TC	UPFLAG		# PREVENT R10 FROM ISSUING CROSS-POINTER
// slot 26681
    if slot <> 26681 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1689] to agcAotUnit1689@.

agcAotInstallSourceRope(list(
// P12.agc:48
//		ADRES	R10FLAG		# OUTPUTS.
// slot 26682
    26682, 26
)).

// bank 30, slots 26683-26684
function agcAotUnit1690 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26683 {
// P12.agc:49
//
// P12.agc:50
//		TC	CLRADMOD	# INITIALIZE RADMODES FOR R29.
// slot 26683
        if slot <> 26683 or instruction <> 3081 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3081, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P12.agc:51
//
// P12.agc:52
//		TC	DOWNFLAG	# CLEAR RENDEZVOUS FLAG FOR P22
// slot 26684
        if slot <> 26684 or instruction <> 2894 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2894, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1690] to agcAotUnit1690@.

agcAotInstallSourceRope(list(
// P12.agc:53
//		ADRES	RNDVZFLG
// slot 26685
    26685, 16
)).

// bank 30, slots 26686-26693
function agcAotUnit1691 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26689 {
        if slot <= 26687 {
            if slot <= 26686 {
// P12.agc:54
//
// P12.agc:55
//		CAF	THRESH2		# INITIALIZE DVMON
// slot 26686
                if slot <> 26686 or instruction <> 15360 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 3072), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P12.agc:56
//		TS	DVTHRUSH
// slot 26687
                if slot <> 26687 or instruction <> 23209 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23209, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 26688 {
// P12.agc:57
//		CAF	FOUR
// slot 26688
                if slot <> 26688 or instruction <> 14825 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P12.agc:58
//		TS	DVCNTR
// slot 26689
                if slot <> 26689 or instruction <> 23373 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23373, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 26691 {
            if slot <= 26690 {
// P12.agc:59
//
// P12.agc:60
//		CA	ZERO
// slot 26690
                if slot <> 26690 or instruction <> 14829 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P12.agc:61
//		TS	TRKMKCNT	# SHOW THAT R29 DOWNLINK DATA ISN'T READY.
// slot 26691
                if slot <> 26691 or instruction <> 23346 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23346, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 26692 {
// P12.agc:62
//		CAF	V06N33A
// slot 26692
                if slot <> 26692 or instruction <> 13853 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 1565), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// P12.agc:63
//		TC	BANKCALL	# FLASH TIG
// slot 26693
                if slot <> 26693 or instruction <> 2446 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2446, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1691] to agcAotUnit1691@.

agcAotInstallSourceRope(list(
// P12.agc:64
//		CADR	GOFLASH
// slot 26694
    26694, 17020
)).

// bank 30, slots 26695-26698
function agcAotUnit1692 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26696 {
        if slot <= 26695 {
// P12.agc:65
//		TCF	GOTOPOOH
// slot 26695
            if slot <> 26695 or instruction <> 7169 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7169, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P12.agc:66
//		TCF	+2		# PROCEED
// slot 26696
            if slot <> 26696 or instruction <> 5194 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5194, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 26697 {
// P12.agc:67
//		TCF	-5		# ENTER
// slot 26697
            if slot <> 26697 or instruction <> 5188 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5188, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// P12.agc:68
//
// P12.agc:69
//		TC	PHASCHNG
// slot 26698
            if slot <> 26698 or instruction <> 2795 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2795, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1692] to agcAotUnit1692@.

agcAotInstallSourceRope(list(
// P12.agc:70
//		OCT	04024
// slot 26699
    26699, 4136
)).

// bank 30, slots 26700-26700
function agcAotUnit1693 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P12.agc:71
//
// P12.agc:72
//		TC	INTPRET
// slot 26700
    if slot <> 26700 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1693] to agcAotUnit1693@.

agcAotInstallSourceRope(list(
// P12.agc:73
//		CALL			# INITIALZE WM AND /LAND/
// slot 26701
    26701, 65320,
// P12.agc:74
//			GUIDINIT
// slot 26702
    26702, 39476,
// P12.agc:75
//		SET	CALL
// slot 26703
    26703, 37912,
// P12.agc:76
//			FLPI
// slot 26704
    26704, 4712,
// P12.agc:77
//			P12INIT
// slot 26705
    26705, 49496,
// P12.agc:78
//# Page 839
// P12.agc:79
//P12LMB		DLOAD
// slot 26706
    26706, 65482,
// P12.agc:80
//			(TGO)A		# SET TGO TO AN INITIAL NOMINAL VALUE.
// slot 26707
    26707, 22498,
// P12.agc:81
//		STODL	TGO
// slot 26708
    26708, 16030,
// P12.agc:82
//			TIG
// slot 26709
    26709, 3652,
// P12.agc:83
//		STCALL	TDEC1
// slot 26710
    26710, 28738,
// P12.agc:84
//			LEMPREC		# ROTATE THE STATE VECTORS TO THE
// slot 26711
    26711, 23646,
// P12.agc:85
//		VLOAD	MXV		# IGNITION TIME.
// slot 26712
    26712, 53754,
// P12.agc:86
//			VATT
// slot 26713
    26713, 14,
// P12.agc:87
//			REFSMMAT
// slot 26714
    26714, 1976,
// P12.agc:88
//		VSL1
// slot 26715
    26715, 65524,
// P12.agc:89
//		STOVL	V1S		# COMPUTE V1S = VEL(TIG)*2(-7)M/CS.
// slot 26716
    26716, 24322,
// P12.agc:90
//			RATT
// slot 26717
    26717, 2,
// P12.agc:91
//		MXV	VSL6
// slot 26718
    26718, 43682,
// P12.agc:92
//			REFSMMAT
// slot 26719
    26719, 1976,
// P12.agc:93
//		STCALL	R		# COMPUTE R = POS(TIG)*2(-24)M.
// slot 26720
    26720, 32418,
// P12.agc:94
//			MUNGRAV		# COMPUTE GDT1/2(TIG)*2(-7)M/CS.
// slot 26721
    26721, 56496,
// P12.agc:95
//		VLOAD	UNIT
// slot 26722
    26722, 44794,
// P12.agc:96
//			R
// slot 26723
    26723, 3746,
// P12.agc:97
//		STCALL	UNIT/R/		# COMPUTE UNIT/R/ FOR YCOMP.
// slot 26724
    26724, 32446,
// P12.agc:98
//			YCOMP
// slot 26725
    26725, 48532,
// P12.agc:99
//		SR	DCOMP
// slot 26726
    26726, 48738,
// P12.agc:100
//			5D
// slot 26727
    26727, 17164,
// P12.agc:101
//		STODL	XRANGE		# INITIALIZE XRANGE FOR NOUN 76.
// slot 26728
    26728, 16198,
// P12.agc:102
//			VINJNOM
// slot 26729
    26729, 6748,
// P12.agc:103
//		STODL	ZDOTD
// slot 26730
    26730, 14718,
// P12.agc:104
//			RDOTDNOM
// slot 26731
    26731, 6752,
// P12.agc:105
//		STORE	RDOTD
// slot 26732
    26732, 2422,
// P12.agc:106
//		EXIT
// slot 26733
    26733, 65532
)).

// bank 30, slots 26734-26734
function agcAotUnit1694 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P12.agc:107
//
// P12.agc:108
//		TC	PHASCHNG
// slot 26734
    if slot <> 26734 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1694] to agcAotUnit1694@.

agcAotInstallSourceRope(list(
// P12.agc:109
//		OCT	04024
// slot 26735
    26735, 4136
)).

// bank 30, slots 26736-26737
function agcAotUnit1695 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26736 {
// P12.agc:110
//
// P12.agc:111
//NEWLOAD		CAF	V06N76		# FLASH CROSS-RANGE, AND APOLUNE VALUES.
// slot 26736
        if slot <> 26736 or instruction <> 13852 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1564), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// P12.agc:112
//		TC	BANKCALL
// slot 26737
        if slot <> 26737 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1695] to agcAotUnit1695@.

agcAotInstallSourceRope(list(
// P12.agc:113
//		CADR	GOFLASH
// slot 26738
    26738, 17020
)).

// bank 30, slots 26739-26744
function agcAotUnit1696 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26741 {
        if slot <= 26739 {
// P12.agc:114
//		TCF	GOTOPOOH
// slot 26739
            if slot <> 26739 or instruction <> 7169 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7169, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 26740 {
// P12.agc:115
//		TCF	+2		# PROCEED
// slot 26740
                if slot <> 26740 or instruction <> 5238 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5238, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P12.agc:116
//		TCF	NEWLOAD		# ENTER NEW DATA.
// slot 26741
                if slot <> 26741 or instruction <> 5232 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5232, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 26742 {
// P12.agc:117
//
// P12.agc:118
//		CAF	P12ADRES
// slot 26742
            if slot <> 26742 or instruction <> 13520 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1232), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 26743 {
// P12.agc:119
//		TS	WHICH
// slot 26743
                if slot <> 26743 or instruction <> 23341 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23341, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// P12.agc:120
//
// P12.agc:121
//		TC	PHASCHNG
// slot 26744
                if slot <> 26744 or instruction <> 2795 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2795, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1696] to agcAotUnit1696@.

agcAotInstallSourceRope(list(
// P12.agc:122
//		OCT	04024
// slot 26745
    26745, 4136
)).

// bank 30, slots 26746-26746
function agcAotUnit1697 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P12.agc:123
//
// P12.agc:124
//		TC	INTPRET
// slot 26746
    if slot <> 26746 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1697] to agcAotUnit1697@.

agcAotInstallSourceRope(list(
// P12.agc:125
//		DLOAD	SL
// slot 26747
    26747, 45514,
// P12.agc:126
//			XRANGE
// slot 26748
    26748, 3910,
// P12.agc:127
//			5D
// slot 26749
    26749, 16652,
// P12.agc:128
//		DAD
// slot 26750
    26750, 65306,
// P12.agc:129
//# Page 840
// P12.agc:130
//			Y
// slot 26751
    26751, 2490,
// P12.agc:131
//		STOVL	YCO
// slot 26752
    26752, 24374,
// P12.agc:132
//			UNIT/R/
// slot 26753
    26753, 3774,
// P12.agc:133
//		VXSC	VAD
// slot 26754
    26754, 44514,
// P12.agc:134
//			49FPS
// slot 26755
    26755, 6744,
// P12.agc:135
//			V1S
// slot 26756
    26756, 3842,
// P12.agc:136
//		STORE	V		# V(TIPOVER) = V(IGN) + 57FPS (UNIT/R/)
// slot 26757
    26757, 3758,
// P12.agc:137
//		DOT	SL1
// slot 26758
    26758, 59970,
// P12.agc:138
//			UNIT/R/
// slot 26759
    26759, 3774,
// P12.agc:139
//		STOVL	RDOT		# RDOT * 2(-7)
// slot 26760
    26760, 24184,
// P12.agc:140
//			UNIT/R/
// slot 26761
    26761, 3774,
// P12.agc:141
//		VXV	UNIT
// slot 26762
    26762, 44602,
// P12.agc:142
//			QAXIS
// slot 26763
    26763, 4000,
// P12.agc:143
//		STORE	ZAXIS1
// slot 26764
    26764, 4012,
// P12.agc:144
//		SETGO
// slot 26765
    26765, 65304,
// P12.agc:145
//			FLVR
// slot 26766
    26766, 4642,
// P12.agc:146
//			ASCENT
// slot 26767
    26767, 49570,
// P12.agc:147
//P12RET		DLOAD
// slot 26768
    26768, 65482,
// P12.agc:148
//			ATP		# ATP(2)*2(18)
// slot 26769
    26769, 2530,
// P12.agc:149
//		DSQ	PDDL
// slot 26770
    26770, 54684,
// P12.agc:150
//			ATY		# ATY(2)*2(18)
// slot 26771
    26771, 2522,
// P12.agc:151
//		DSQ	DAD
// slot 26772
    26772, 36252,
// P12.agc:152
//		BZE	SQRT
// slot 26773
    26773, 63064,
// P12.agc:153
//			YAWDUN
// slot 26774
    26774, 49460,
// P12.agc:154
//		SL1	BDDV
// slot 26775
    26775, 46548,
// P12.agc:155
//			ATY
// slot 26776
    26776, 2522,
// P12.agc:156
//		ARCSIN
// slot 26777
    26777, 65468,
// P12.agc:157
//YAWDUN		STOVL	YAW
// slot 26778
    26778, 23014,
// P12.agc:158
//			UNFC/2
// slot 26779
    26779, 3416,
// P12.agc:159
//		UNIT	DOT
// slot 26780
    26780, 41308,
// P12.agc:160
//			UNIT/R/
// slot 26781
    26781, 3774,
// P12.agc:161
//		SL1	ARCCOS
// slot 26782
    26782, 54996,
// P12.agc:162
//		DCOMP
// slot 26783
    26783, 65404,
// P12.agc:163
//		STORE	PITCH
// slot 26784
    26784, 2538,
// P12.agc:164
//		EXIT
// slot 26785
    26785, 65532
)).

// bank 30, slots 26786-26786
function agcAotUnit1698 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P12.agc:165
//		TC	PHASCHNG
// slot 26786
    if slot <> 26786 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1698] to agcAotUnit1698@.

agcAotInstallSourceRope(list(
// P12.agc:166
//		OCT	04024
// slot 26787
    26787, 4136
)).

// bank 30, slots 26788-26788
function agcAotUnit1699 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// P12.agc:167
//
// P12.agc:168
//		TC	DOWNFLAG
// slot 26788
    if slot <> 26788 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1699] to agcAotUnit1699@.

agcAotInstallSourceRope(list(
// P12.agc:169
//		ADRES	FLPI
// slot 26789
    26789, 278
)).

// bank 30, slots 26790-26791
function agcAotUnit1700 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26790 {
// P12.agc:170
//
// P12.agc:171
//		INHINT
// slot 26790
        if slot <> 26790 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P12.agc:172
//		TC	IBNKCALL
// slot 26791
        if slot <> 26791 or instruction <> 2492 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2492, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1700] to agcAotUnit1700@.

agcAotInstallSourceRope(list(
// P12.agc:173
//		CADR	PFLITEDB
// slot 26792
    26792, 32964
)).

// bank 30, slots 26793-26794
function agcAotUnit1701 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26793 {
// P12.agc:174
//		RELINT
// slot 26793
        if slot <> 26793 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// P12.agc:175
//
// P12.agc:176
//		TC	POSTJUMP
// slot 26794
        if slot <> 26794 or instruction <> 2461 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2461, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1701] to agcAotUnit1701@.

agcAotInstallSourceRope(list(
// P12.agc:177
//		CADR	BURNBABY
// slot 26795
    26795, 61612,
// P12.agc:178
//
// P12.agc:179
//P12INIT		DLOAD			# INITIALIZE ENGINE DATA.  USED FOR P12 AND
// slot 26796
    26796, 65482,
// P12.agc:180
//# Page 841
// P12.agc:181
//			(1/DV)A		# P71.
// slot 26797
    26797, 14358,
// P12.agc:182
//		STORE	1/DV3
// slot 26798
    26798, 3906,
// P12.agc:183
//		STORE	1/DV2
// slot 26799
    26799, 3902,
// P12.agc:184
//		STODL	1/DV1
// slot 26800
    26800, 16186,
// P12.agc:185
//			(AT)A
// slot 26801
    26801, 14366,
// P12.agc:186
//		STODL	AT
// slot 26802
    26802, 14694,
// P12.agc:187
//			(TBUP)A
// slot 26803
    26803, 14370,
// P12.agc:188
//		STODL	TBUP
// slot 26804
    26804, 14706,
// P12.agc:189
//			ATDECAY
// slot 26805
    26805, 28694,
// P12.agc:190
//		DCOMP	SL
// slot 26806
    26806, 45436,
// P12.agc:191
//			11D
// slot 26807
    26807, 16664,
// P12.agc:192
//		STORE	TTO
// slot 26808
    26808, 2414,
// P12.agc:193
//		SLOAD	DCOMP
// slot 26809
    26809, 48826,
// P12.agc:194
//			APSVEX
// slot 26810
    26810, 22530,
// P12.agc:195
//		SR2
// slot 26811
    26811, 65412,
// P12.agc:196
//		STORE	VE
// slot 26812
    26812, 2410,
// P12.agc:197
//		BOFF	RVQ
// slot 26813
    26813, 36376,
// P12.agc:198
//			FLAP
// slot 26814
    26814, 5070,
// P12.agc:199
//			COMMINIT
// slot 26815
    26815, 49536,
// P12.agc:200
//COMMINIT	DLOAD	DAD		# INITIALIZE TARGET DATA.  USED BY P12, P70
// slot 26816
    26816, 36298,
// P12.agc:201
//			HINJECT		# AND P71 IF IT DOES NOT FOLLOW P70.
// slot 26817
    26817, 22494,
// P12.agc:202
//			/LAND/
// slot 26818
    26818, 2486,
// P12.agc:203
//		STODL	RCO
// slot 26819
    26819, 16178,
// P12.agc:204
//			HI6ZEROS
// slot 26820
    26820, 6820,
// P12.agc:205
//		STORE	TXO
// slot 26821
    26821, 3928,
// P12.agc:206
//		STORE	YCO
// slot 26822
    26822, 3894,
// P12.agc:207
//		STORE	RDOTD
// slot 26823
    26823, 2422,
// P12.agc:208
//		STOVL	YDOTD
// slot 26824
    26824, 22906,
// P12.agc:209
//			VRECTCSM
// slot 26825
    26825, 1766,
// P12.agc:210
//		VXV	MXV
// slot 26826
    26826, 53562,
// P12.agc:211
//			RRECTCSM
// slot 26827
    26827, 1754,
// P12.agc:212
//			REFSMMAT
// slot 26828
    26828, 1976,
// P12.agc:213
//		UNIT
// slot 26829
    26829, 65372,
// P12.agc:214
//		STORE	QAXIS
// slot 26830
    26830, 4000,
// P12.agc:215
//		RVQ
// slot 26831
    26831, 65308,
// P12.agc:216
//P12ADRES	REMADR	P12TABLE
// slot 26832
    26832, 2084,
// P12.agc:217
//
// P12.agc:218
//		SETLOC	P12A
// P12.agc:219
//		BANK
// P12.agc:220
//		COUNT*	$$/P12
// P12.agc:221
//
// P12.agc:222
//GUIDINIT	STQ	SETPD
// slot 21786
    21786, 33056,
// P12.agc:223
//			TEMPR60
// slot 21787
    21787, 1256,
// P12.agc:224
//			0D
// slot 21788
    21788, 2,
// P12.agc:225
//		VLOAD	PUSH
// slot 21789
    21789, 34554,
// P12.agc:226
//			UNITZ
// slot 21790
    21790, 6808,
// P12.agc:227
//		RTB	PUSH
// slot 21791
    21791, 34360,
// P12.agc:228
//			LOADTIME
// slot 21792
    21792, 18166,
// P12.agc:229
//		CALL
// slot 21793
    21793, 65320,
// P12.agc:230
//			RP-TO-R
// slot 21794
    21794, 47004,
// P12.agc:231
//# Page 842
// P12.agc:232
//		MXV	VXSC
// slot 21795
    21795, 61858,
// P12.agc:233
//			REFSMMAT
// slot 21796
    21796, 1976,
// P12.agc:234
//			MOONRATE
// slot 21797
    21797, 14382,
// P12.agc:235
//		STOVL	WM
// slot 21798
    21798, 22954,
// P12.agc:236
//			RLS
// slot 21799
    21799, 2086,
// P12.agc:237
//		ABVAL	SL3
// slot 21800
    21800, 43596,
// P12.agc:238
//		STCALL	/LAND/
// slot 21801
    21801, 31158,
// P12.agc:239
//			TEMPR60
// slot 21802
    21802, 1256,
// P12.agc:240
//
// P12.agc:241
//49FPS		2DEC	.149352 B-6	# EXPECTED RDOT AT TIPOVER
// slot 21803 21804
    21803, 76, 21804, 7672,
// P12.agc:242
//VINJNOM		2DEC	16.7924 B-7	# 5509.5 FPS(APO=30NM WITH RDOT=19.5FPS)
// slot 21805 21806
    21805, 4298, 21806, 13998,
// P12.agc:243
//RDOTDNOM	2DEC	.059436 B-7	# 19.5 FPS
// slot 21807 21808
    21807, 14, 21808, 19916
)).

