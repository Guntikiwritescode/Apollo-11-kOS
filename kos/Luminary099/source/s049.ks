// PORT: Original source unit P12.agc.
// PORT: Physical bank 30. Shared continuation entries, slots 26673–26673.
function agcAotUnit1685 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P12.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE P12.agc:2
//# Filename:	P12.agc
// PORT: SOURCE P12.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE P12.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE P12.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE P12.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE P12.agc:7
//# Contact:	Hartmuth Gutsche <hgutsche@xplornet.com>.
// PORT: SOURCE P12.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE P12.agc:9
//# Pages:	838-842
// PORT: SOURCE P12.agc:10
//# Mod history:	2009-05-23 HG	Transcribed from page images.
// PORT: SOURCE P12.agc:11
//#
// PORT: SOURCE P12.agc:12
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE P12.agc:13
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE P12.agc:14
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE P12.agc:15
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE P12.agc:16
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE P12.agc:17
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE P12.agc:18
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE P12.agc:19
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE P12.agc:20
//# actually created.
// PORT: SOURCE P12.agc:21
//#
// PORT: SOURCE P12.agc:22
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE P12.agc:23
//#
// PORT: SOURCE P12.agc:24
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE P12.agc:25
//#	16:27 JULY 14, 1969
// PORT: SOURCE P12.agc:26
//
// PORT: SOURCE P12.agc:27
//# Page 838
// PORT: SOURCE P12.agc:28
//		BANK	24
// PORT: SOURCE P12.agc:29
//		SETLOC	P12
// PORT: SOURCE P12.agc:30
//		BANK
// PORT: SOURCE P12.agc:31
//
// PORT: SOURCE P12.agc:32
//		EBANK=	DVCNTR
// PORT: SOURCE P12.agc:33
//		COUNT*	$$/P12
// PORT: SOURCE P12.agc:34
//
// PORT: SOURCE P12.agc:35
//P12LM		TC	PHASCHNG
// PORT: Fixed ROM slots 26673.
    if slot <> 26673 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1685] to agcAotUnit1685@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P12.agc:36
//		OCT	04024
// PORT: Fixed ROM slots 26674.
    26674, 4136
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26675–26675.
function agcAotUnit1686 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P12.agc:37
//
// PORT: SOURCE P12.agc:38
//		TC	BANKCALL
// PORT: Fixed ROM slots 26675.
    if slot <> 26675 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1686] to agcAotUnit1686@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P12.agc:39
//		CADR	R02BOTH		# CHECK THE STATUS OF THE IMU.
// PORT: Fixed ROM slots 26676.
    26676, 9560
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26677–26677.
function agcAotUnit1687 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P12.agc:40
//
// PORT: SOURCE P12.agc:41
//		TC	UPFLAG
// PORT: Fixed ROM slots 26677.
    if slot <> 26677 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1687] to agcAotUnit1687@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P12.agc:42
//		ADRES	MUNFLAG
// PORT: Fixed ROM slots 26678.
    26678, 194
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26679–26679.
function agcAotUnit1688 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P12.agc:43
//
// PORT: SOURCE P12.agc:44
//		TC	UPFLAG		# INSURE 4-JET TRANSLATION CAPABILITY.
// PORT: Fixed ROM slots 26679.
    if slot <> 26679 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1688] to agcAotUnit1688@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P12.agc:45
//		ADRES	ACC4-2FL
// PORT: Fixed ROM slots 26680.
    26680, 398
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26681–26681.
function agcAotUnit1689 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P12.agc:46
//
// PORT: SOURCE P12.agc:47
//		TC	UPFLAG		# PREVENT R10 FROM ISSUING CROSS-POINTER
// PORT: Fixed ROM slots 26681.
    if slot <> 26681 or instruction <> 2884 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2884, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1689] to agcAotUnit1689@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P12.agc:48
//		ADRES	R10FLAG		# OUTPUTS.
// PORT: Fixed ROM slots 26682.
    26682, 26
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26683–26684.
function agcAotUnit1690 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26683 {
// PORT: SOURCE P12.agc:49
//
// PORT: SOURCE P12.agc:50
//		TC	CLRADMOD	# INITIALIZE RADMODES FOR R29.
// PORT: Fixed ROM slots 26683.
        if slot <> 26683 or instruction <> 3081 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3081, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P12.agc:51
//
// PORT: SOURCE P12.agc:52
//		TC	DOWNFLAG	# CLEAR RENDEZVOUS FLAG FOR P22
// PORT: Fixed ROM slots 26684.
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
// PORT: SOURCE P12.agc:53
//		ADRES	RNDVZFLG
// PORT: Fixed ROM slots 26685.
    26685, 16
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26686–26693.
function agcAotUnit1691 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26689 {
        if slot <= 26687 {
            if slot <= 26686 {
// PORT: SOURCE P12.agc:54
//
// PORT: SOURCE P12.agc:55
//		CAF	THRESH2		# INITIALIZE DVMON
// PORT: Fixed ROM slots 26686.
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
// PORT: SOURCE P12.agc:56
//		TS	DVTHRUSH
// PORT: Fixed ROM slots 26687.
                if slot <> 26687 or instruction <> 23209 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23209, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 26688 {
// PORT: SOURCE P12.agc:57
//		CAF	FOUR
// PORT: Fixed ROM slots 26688.
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
// PORT: SOURCE P12.agc:58
//		TS	DVCNTR
// PORT: Fixed ROM slots 26689.
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
// PORT: SOURCE P12.agc:59
//
// PORT: SOURCE P12.agc:60
//		CA	ZERO
// PORT: Fixed ROM slots 26690.
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
// PORT: SOURCE P12.agc:61
//		TS	TRKMKCNT	# SHOW THAT R29 DOWNLINK DATA ISN'T READY.
// PORT: Fixed ROM slots 26691.
                if slot <> 26691 or instruction <> 23346 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23346, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 26692 {
// PORT: SOURCE P12.agc:62
//		CAF	V06N33A
// PORT: Fixed ROM slots 26692.
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
// PORT: SOURCE P12.agc:63
//		TC	BANKCALL	# FLASH TIG
// PORT: Fixed ROM slots 26693.
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
// PORT: SOURCE P12.agc:64
//		CADR	GOFLASH
// PORT: Fixed ROM slots 26694.
    26694, 17020
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26695–26698.
function agcAotUnit1692 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26696 {
        if slot <= 26695 {
// PORT: SOURCE P12.agc:65
//		TCF	GOTOPOOH
// PORT: Fixed ROM slots 26695.
            if slot <> 26695 or instruction <> 7169 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7169, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P12.agc:66
//		TCF	+2		# PROCEED
// PORT: Fixed ROM slots 26696.
            if slot <> 26696 or instruction <> 5194 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5194, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 26697 {
// PORT: SOURCE P12.agc:67
//		TCF	-5		# ENTER
// PORT: Fixed ROM slots 26697.
            if slot <> 26697 or instruction <> 5188 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5188, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE P12.agc:68
//
// PORT: SOURCE P12.agc:69
//		TC	PHASCHNG
// PORT: Fixed ROM slots 26698.
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
// PORT: SOURCE P12.agc:70
//		OCT	04024
// PORT: Fixed ROM slots 26699.
    26699, 4136
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26700–26700.
function agcAotUnit1693 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P12.agc:71
//
// PORT: SOURCE P12.agc:72
//		TC	INTPRET
// PORT: Fixed ROM slots 26700.
    if slot <> 26700 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1693] to agcAotUnit1693@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P12.agc:73
//		CALL			# INITIALZE WM AND /LAND/
// PORT: Fixed ROM slots 26701.
    26701, 65320,
// PORT: SOURCE P12.agc:74
//			GUIDINIT
// PORT: Fixed ROM slots 26702.
    26702, 39476,
// PORT: SOURCE P12.agc:75
//		SET	CALL
// PORT: Fixed ROM slots 26703.
    26703, 37912,
// PORT: SOURCE P12.agc:76
//			FLPI
// PORT: Fixed ROM slots 26704.
    26704, 4712,
// PORT: SOURCE P12.agc:77
//			P12INIT
// PORT: Fixed ROM slots 26705.
    26705, 49496,
// PORT: SOURCE P12.agc:78
//# Page 839
// PORT: SOURCE P12.agc:79
//P12LMB		DLOAD
// PORT: Fixed ROM slots 26706.
    26706, 65482,
// PORT: SOURCE P12.agc:80
//			(TGO)A		# SET TGO TO AN INITIAL NOMINAL VALUE.
// PORT: Fixed ROM slots 26707.
    26707, 22498,
// PORT: SOURCE P12.agc:81
//		STODL	TGO
// PORT: Fixed ROM slots 26708.
    26708, 16030,
// PORT: SOURCE P12.agc:82
//			TIG
// PORT: Fixed ROM slots 26709.
    26709, 3652,
// PORT: SOURCE P12.agc:83
//		STCALL	TDEC1
// PORT: Fixed ROM slots 26710.
    26710, 28738,
// PORT: SOURCE P12.agc:84
//			LEMPREC		# ROTATE THE STATE VECTORS TO THE
// PORT: Fixed ROM slots 26711.
    26711, 23646,
// PORT: SOURCE P12.agc:85
//		VLOAD	MXV		# IGNITION TIME.
// PORT: Fixed ROM slots 26712.
    26712, 53754,
// PORT: SOURCE P12.agc:86
//			VATT
// PORT: Fixed ROM slots 26713.
    26713, 14,
// PORT: SOURCE P12.agc:87
//			REFSMMAT
// PORT: Fixed ROM slots 26714.
    26714, 1976,
// PORT: SOURCE P12.agc:88
//		VSL1
// PORT: Fixed ROM slots 26715.
    26715, 65524,
// PORT: SOURCE P12.agc:89
//		STOVL	V1S		# COMPUTE V1S = VEL(TIG)*2(-7)M/CS.
// PORT: Fixed ROM slots 26716.
    26716, 24322,
// PORT: SOURCE P12.agc:90
//			RATT
// PORT: Fixed ROM slots 26717.
    26717, 2,
// PORT: SOURCE P12.agc:91
//		MXV	VSL6
// PORT: Fixed ROM slots 26718.
    26718, 43682,
// PORT: SOURCE P12.agc:92
//			REFSMMAT
// PORT: Fixed ROM slots 26719.
    26719, 1976,
// PORT: SOURCE P12.agc:93
//		STCALL	R		# COMPUTE R = POS(TIG)*2(-24)M.
// PORT: Fixed ROM slots 26720.
    26720, 32418,
// PORT: SOURCE P12.agc:94
//			MUNGRAV		# COMPUTE GDT1/2(TIG)*2(-7)M/CS.
// PORT: Fixed ROM slots 26721.
    26721, 56496,
// PORT: SOURCE P12.agc:95
//		VLOAD	UNIT
// PORT: Fixed ROM slots 26722.
    26722, 44794,
// PORT: SOURCE P12.agc:96
//			R
// PORT: Fixed ROM slots 26723.
    26723, 3746,
// PORT: SOURCE P12.agc:97
//		STCALL	UNIT/R/		# COMPUTE UNIT/R/ FOR YCOMP.
// PORT: Fixed ROM slots 26724.
    26724, 32446,
// PORT: SOURCE P12.agc:98
//			YCOMP
// PORT: Fixed ROM slots 26725.
    26725, 48532,
// PORT: SOURCE P12.agc:99
//		SR	DCOMP
// PORT: Fixed ROM slots 26726.
    26726, 48738,
// PORT: SOURCE P12.agc:100
//			5D
// PORT: Fixed ROM slots 26727.
    26727, 17164,
// PORT: SOURCE P12.agc:101
//		STODL	XRANGE		# INITIALIZE XRANGE FOR NOUN 76.
// PORT: Fixed ROM slots 26728.
    26728, 16198,
// PORT: SOURCE P12.agc:102
//			VINJNOM
// PORT: Fixed ROM slots 26729.
    26729, 6748,
// PORT: SOURCE P12.agc:103
//		STODL	ZDOTD
// PORT: Fixed ROM slots 26730.
    26730, 14718,
// PORT: SOURCE P12.agc:104
//			RDOTDNOM
// PORT: Fixed ROM slots 26731.
    26731, 6752,
// PORT: SOURCE P12.agc:105
//		STORE	RDOTD
// PORT: Fixed ROM slots 26732.
    26732, 2422,
// PORT: SOURCE P12.agc:106
//		EXIT
// PORT: Fixed ROM slots 26733.
    26733, 65532
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26734–26734.
function agcAotUnit1694 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P12.agc:107
//
// PORT: SOURCE P12.agc:108
//		TC	PHASCHNG
// PORT: Fixed ROM slots 26734.
    if slot <> 26734 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1694] to agcAotUnit1694@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P12.agc:109
//		OCT	04024
// PORT: Fixed ROM slots 26735.
    26735, 4136
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26736–26737.
function agcAotUnit1695 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26736 {
// PORT: SOURCE P12.agc:110
//
// PORT: SOURCE P12.agc:111
//NEWLOAD		CAF	V06N76		# FLASH CROSS-RANGE, AND APOLUNE VALUES.
// PORT: Fixed ROM slots 26736.
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
// PORT: SOURCE P12.agc:112
//		TC	BANKCALL
// PORT: Fixed ROM slots 26737.
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
// PORT: SOURCE P12.agc:113
//		CADR	GOFLASH
// PORT: Fixed ROM slots 26738.
    26738, 17020
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26739–26744.
function agcAotUnit1696 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26741 {
        if slot <= 26739 {
// PORT: SOURCE P12.agc:114
//		TCF	GOTOPOOH
// PORT: Fixed ROM slots 26739.
            if slot <> 26739 or instruction <> 7169 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 7169, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 26740 {
// PORT: SOURCE P12.agc:115
//		TCF	+2		# PROCEED
// PORT: Fixed ROM slots 26740.
                if slot <> 26740 or instruction <> 5238 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5238, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P12.agc:116
//		TCF	NEWLOAD		# ENTER NEW DATA.
// PORT: Fixed ROM slots 26741.
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
// PORT: SOURCE P12.agc:117
//
// PORT: SOURCE P12.agc:118
//		CAF	P12ADRES
// PORT: Fixed ROM slots 26742.
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
// PORT: SOURCE P12.agc:119
//		TS	WHICH
// PORT: Fixed ROM slots 26743.
                if slot <> 26743 or instruction <> 23341 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23341, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE P12.agc:120
//
// PORT: SOURCE P12.agc:121
//		TC	PHASCHNG
// PORT: Fixed ROM slots 26744.
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
// PORT: SOURCE P12.agc:122
//		OCT	04024
// PORT: Fixed ROM slots 26745.
    26745, 4136
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26746–26746.
function agcAotUnit1697 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P12.agc:123
//
// PORT: SOURCE P12.agc:124
//		TC	INTPRET
// PORT: Fixed ROM slots 26746.
    if slot <> 26746 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1697] to agcAotUnit1697@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P12.agc:125
//		DLOAD	SL
// PORT: Fixed ROM slots 26747.
    26747, 45514,
// PORT: SOURCE P12.agc:126
//			XRANGE
// PORT: Fixed ROM slots 26748.
    26748, 3910,
// PORT: SOURCE P12.agc:127
//			5D
// PORT: Fixed ROM slots 26749.
    26749, 16652,
// PORT: SOURCE P12.agc:128
//		DAD
// PORT: Fixed ROM slots 26750.
    26750, 65306,
// PORT: SOURCE P12.agc:129
//# Page 840
// PORT: SOURCE P12.agc:130
//			Y
// PORT: Fixed ROM slots 26751.
    26751, 2490,
// PORT: SOURCE P12.agc:131
//		STOVL	YCO
// PORT: Fixed ROM slots 26752.
    26752, 24374,
// PORT: SOURCE P12.agc:132
//			UNIT/R/
// PORT: Fixed ROM slots 26753.
    26753, 3774,
// PORT: SOURCE P12.agc:133
//		VXSC	VAD
// PORT: Fixed ROM slots 26754.
    26754, 44514,
// PORT: SOURCE P12.agc:134
//			49FPS
// PORT: Fixed ROM slots 26755.
    26755, 6744,
// PORT: SOURCE P12.agc:135
//			V1S
// PORT: Fixed ROM slots 26756.
    26756, 3842,
// PORT: SOURCE P12.agc:136
//		STORE	V		# V(TIPOVER) = V(IGN) + 57FPS (UNIT/R/)
// PORT: Fixed ROM slots 26757.
    26757, 3758,
// PORT: SOURCE P12.agc:137
//		DOT	SL1
// PORT: Fixed ROM slots 26758.
    26758, 59970,
// PORT: SOURCE P12.agc:138
//			UNIT/R/
// PORT: Fixed ROM slots 26759.
    26759, 3774,
// PORT: SOURCE P12.agc:139
//		STOVL	RDOT		# RDOT * 2(-7)
// PORT: Fixed ROM slots 26760.
    26760, 24184,
// PORT: SOURCE P12.agc:140
//			UNIT/R/
// PORT: Fixed ROM slots 26761.
    26761, 3774,
// PORT: SOURCE P12.agc:141
//		VXV	UNIT
// PORT: Fixed ROM slots 26762.
    26762, 44602,
// PORT: SOURCE P12.agc:142
//			QAXIS
// PORT: Fixed ROM slots 26763.
    26763, 4000,
// PORT: SOURCE P12.agc:143
//		STORE	ZAXIS1
// PORT: Fixed ROM slots 26764.
    26764, 4012,
// PORT: SOURCE P12.agc:144
//		SETGO
// PORT: Fixed ROM slots 26765.
    26765, 65304,
// PORT: SOURCE P12.agc:145
//			FLVR
// PORT: Fixed ROM slots 26766.
    26766, 4642,
// PORT: SOURCE P12.agc:146
//			ASCENT
// PORT: Fixed ROM slots 26767.
    26767, 49570,
// PORT: SOURCE P12.agc:147
//P12RET		DLOAD
// PORT: Fixed ROM slots 26768.
    26768, 65482,
// PORT: SOURCE P12.agc:148
//			ATP		# ATP(2)*2(18)
// PORT: Fixed ROM slots 26769.
    26769, 2530,
// PORT: SOURCE P12.agc:149
//		DSQ	PDDL
// PORT: Fixed ROM slots 26770.
    26770, 54684,
// PORT: SOURCE P12.agc:150
//			ATY		# ATY(2)*2(18)
// PORT: Fixed ROM slots 26771.
    26771, 2522,
// PORT: SOURCE P12.agc:151
//		DSQ	DAD
// PORT: Fixed ROM slots 26772.
    26772, 36252,
// PORT: SOURCE P12.agc:152
//		BZE	SQRT
// PORT: Fixed ROM slots 26773.
    26773, 63064,
// PORT: SOURCE P12.agc:153
//			YAWDUN
// PORT: Fixed ROM slots 26774.
    26774, 49460,
// PORT: SOURCE P12.agc:154
//		SL1	BDDV
// PORT: Fixed ROM slots 26775.
    26775, 46548,
// PORT: SOURCE P12.agc:155
//			ATY
// PORT: Fixed ROM slots 26776.
    26776, 2522,
// PORT: SOURCE P12.agc:156
//		ARCSIN
// PORT: Fixed ROM slots 26777.
    26777, 65468,
// PORT: SOURCE P12.agc:157
//YAWDUN		STOVL	YAW
// PORT: Fixed ROM slots 26778.
    26778, 23014,
// PORT: SOURCE P12.agc:158
//			UNFC/2
// PORT: Fixed ROM slots 26779.
    26779, 3416,
// PORT: SOURCE P12.agc:159
//		UNIT	DOT
// PORT: Fixed ROM slots 26780.
    26780, 41308,
// PORT: SOURCE P12.agc:160
//			UNIT/R/
// PORT: Fixed ROM slots 26781.
    26781, 3774,
// PORT: SOURCE P12.agc:161
//		SL1	ARCCOS
// PORT: Fixed ROM slots 26782.
    26782, 54996,
// PORT: SOURCE P12.agc:162
//		DCOMP
// PORT: Fixed ROM slots 26783.
    26783, 65404,
// PORT: SOURCE P12.agc:163
//		STORE	PITCH
// PORT: Fixed ROM slots 26784.
    26784, 2538,
// PORT: SOURCE P12.agc:164
//		EXIT
// PORT: Fixed ROM slots 26785.
    26785, 65532
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26786–26786.
function agcAotUnit1698 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P12.agc:165
//		TC	PHASCHNG
// PORT: Fixed ROM slots 26786.
    if slot <> 26786 or instruction <> 2795 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2795, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1698] to agcAotUnit1698@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P12.agc:166
//		OCT	04024
// PORT: Fixed ROM slots 26787.
    26787, 4136
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26788–26788.
function agcAotUnit1699 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE P12.agc:167
//
// PORT: SOURCE P12.agc:168
//		TC	DOWNFLAG
// PORT: Fixed ROM slots 26788.
    if slot <> 26788 or instruction <> 2894 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2894, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1699] to agcAotUnit1699@.

agcAotInstallSourceRope(list(
// PORT: SOURCE P12.agc:169
//		ADRES	FLPI
// PORT: Fixed ROM slots 26789.
    26789, 278
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26790–26791.
function agcAotUnit1700 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26790 {
// PORT: SOURCE P12.agc:170
//
// PORT: SOURCE P12.agc:171
//		INHINT
// PORT: Fixed ROM slots 26790.
        if slot <> 26790 or instruction <> 4 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 4, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P12.agc:172
//		TC	IBNKCALL
// PORT: Fixed ROM slots 26791.
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
// PORT: SOURCE P12.agc:173
//		CADR	PFLITEDB
// PORT: Fixed ROM slots 26792.
    26792, 32964
)).

// PORT: Physical bank 30. Shared continuation entries, slots 26793–26794.
function agcAotUnit1701 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 26793 {
// PORT: SOURCE P12.agc:174
//		RELINT
// PORT: Fixed ROM slots 26793.
        if slot <> 26793 or instruction <> 3 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 3, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE P12.agc:175
//
// PORT: SOURCE P12.agc:176
//		TC	POSTJUMP
// PORT: Fixed ROM slots 26794.
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
// PORT: SOURCE P12.agc:177
//		CADR	BURNBABY
// PORT: Fixed ROM slots 26795.
    26795, 61612,
// PORT: SOURCE P12.agc:178
//
// PORT: SOURCE P12.agc:179
//P12INIT		DLOAD			# INITIALIZE ENGINE DATA.  USED FOR P12 AND
// PORT: Fixed ROM slots 26796.
    26796, 65482,
// PORT: SOURCE P12.agc:180
//# Page 841
// PORT: SOURCE P12.agc:181
//			(1/DV)A		# P71.
// PORT: Fixed ROM slots 26797.
    26797, 14358,
// PORT: SOURCE P12.agc:182
//		STORE	1/DV3
// PORT: Fixed ROM slots 26798.
    26798, 3906,
// PORT: SOURCE P12.agc:183
//		STORE	1/DV2
// PORT: Fixed ROM slots 26799.
    26799, 3902,
// PORT: SOURCE P12.agc:184
//		STODL	1/DV1
// PORT: Fixed ROM slots 26800.
    26800, 16186,
// PORT: SOURCE P12.agc:185
//			(AT)A
// PORT: Fixed ROM slots 26801.
    26801, 14366,
// PORT: SOURCE P12.agc:186
//		STODL	AT
// PORT: Fixed ROM slots 26802.
    26802, 14694,
// PORT: SOURCE P12.agc:187
//			(TBUP)A
// PORT: Fixed ROM slots 26803.
    26803, 14370,
// PORT: SOURCE P12.agc:188
//		STODL	TBUP
// PORT: Fixed ROM slots 26804.
    26804, 14706,
// PORT: SOURCE P12.agc:189
//			ATDECAY
// PORT: Fixed ROM slots 26805.
    26805, 28694,
// PORT: SOURCE P12.agc:190
//		DCOMP	SL
// PORT: Fixed ROM slots 26806.
    26806, 45436,
// PORT: SOURCE P12.agc:191
//			11D
// PORT: Fixed ROM slots 26807.
    26807, 16664,
// PORT: SOURCE P12.agc:192
//		STORE	TTO
// PORT: Fixed ROM slots 26808.
    26808, 2414,
// PORT: SOURCE P12.agc:193
//		SLOAD	DCOMP
// PORT: Fixed ROM slots 26809.
    26809, 48826,
// PORT: SOURCE P12.agc:194
//			APSVEX
// PORT: Fixed ROM slots 26810.
    26810, 22530,
// PORT: SOURCE P12.agc:195
//		SR2
// PORT: Fixed ROM slots 26811.
    26811, 65412,
// PORT: SOURCE P12.agc:196
//		STORE	VE
// PORT: Fixed ROM slots 26812.
    26812, 2410,
// PORT: SOURCE P12.agc:197
//		BOFF	RVQ
// PORT: Fixed ROM slots 26813.
    26813, 36376,
// PORT: SOURCE P12.agc:198
//			FLAP
// PORT: Fixed ROM slots 26814.
    26814, 5070,
// PORT: SOURCE P12.agc:199
//			COMMINIT
// PORT: Fixed ROM slots 26815.
    26815, 49536,
// PORT: SOURCE P12.agc:200
//COMMINIT	DLOAD	DAD		# INITIALIZE TARGET DATA.  USED BY P12, P70
// PORT: Fixed ROM slots 26816.
    26816, 36298,
// PORT: SOURCE P12.agc:201
//			HINJECT		# AND P71 IF IT DOES NOT FOLLOW P70.
// PORT: Fixed ROM slots 26817.
    26817, 22494,
// PORT: SOURCE P12.agc:202
//			/LAND/
// PORT: Fixed ROM slots 26818.
    26818, 2486,
// PORT: SOURCE P12.agc:203
//		STODL	RCO
// PORT: Fixed ROM slots 26819.
    26819, 16178,
// PORT: SOURCE P12.agc:204
//			HI6ZEROS
// PORT: Fixed ROM slots 26820.
    26820, 6820,
// PORT: SOURCE P12.agc:205
//		STORE	TXO
// PORT: Fixed ROM slots 26821.
    26821, 3928,
// PORT: SOURCE P12.agc:206
//		STORE	YCO
// PORT: Fixed ROM slots 26822.
    26822, 3894,
// PORT: SOURCE P12.agc:207
//		STORE	RDOTD
// PORT: Fixed ROM slots 26823.
    26823, 2422,
// PORT: SOURCE P12.agc:208
//		STOVL	YDOTD
// PORT: Fixed ROM slots 26824.
    26824, 22906,
// PORT: SOURCE P12.agc:209
//			VRECTCSM
// PORT: Fixed ROM slots 26825.
    26825, 1766,
// PORT: SOURCE P12.agc:210
//		VXV	MXV
// PORT: Fixed ROM slots 26826.
    26826, 53562,
// PORT: SOURCE P12.agc:211
//			RRECTCSM
// PORT: Fixed ROM slots 26827.
    26827, 1754,
// PORT: SOURCE P12.agc:212
//			REFSMMAT
// PORT: Fixed ROM slots 26828.
    26828, 1976,
// PORT: SOURCE P12.agc:213
//		UNIT
// PORT: Fixed ROM slots 26829.
    26829, 65372,
// PORT: SOURCE P12.agc:214
//		STORE	QAXIS
// PORT: Fixed ROM slots 26830.
    26830, 4000,
// PORT: SOURCE P12.agc:215
//		RVQ
// PORT: Fixed ROM slots 26831.
    26831, 65308,
// PORT: SOURCE P12.agc:216
//P12ADRES	REMADR	P12TABLE
// PORT: Fixed ROM slots 26832.
    26832, 2084,
// PORT: SOURCE P12.agc:217
//
// PORT: SOURCE P12.agc:218
//		SETLOC	P12A
// PORT: SOURCE P12.agc:219
//		BANK
// PORT: SOURCE P12.agc:220
//		COUNT*	$$/P12
// PORT: SOURCE P12.agc:221
//
// PORT: SOURCE P12.agc:222
//GUIDINIT	STQ	SETPD
// PORT: Fixed ROM slots 21786.
    21786, 33056,
// PORT: SOURCE P12.agc:223
//			TEMPR60
// PORT: Fixed ROM slots 21787.
    21787, 1256,
// PORT: SOURCE P12.agc:224
//			0D
// PORT: Fixed ROM slots 21788.
    21788, 2,
// PORT: SOURCE P12.agc:225
//		VLOAD	PUSH
// PORT: Fixed ROM slots 21789.
    21789, 34554,
// PORT: SOURCE P12.agc:226
//			UNITZ
// PORT: Fixed ROM slots 21790.
    21790, 6808,
// PORT: SOURCE P12.agc:227
//		RTB	PUSH
// PORT: Fixed ROM slots 21791.
    21791, 34360,
// PORT: SOURCE P12.agc:228
//			LOADTIME
// PORT: Fixed ROM slots 21792.
    21792, 18166,
// PORT: SOURCE P12.agc:229
//		CALL
// PORT: Fixed ROM slots 21793.
    21793, 65320,
// PORT: SOURCE P12.agc:230
//			RP-TO-R
// PORT: Fixed ROM slots 21794.
    21794, 47004,
// PORT: SOURCE P12.agc:231
//# Page 842
// PORT: SOURCE P12.agc:232
//		MXV	VXSC
// PORT: Fixed ROM slots 21795.
    21795, 61858,
// PORT: SOURCE P12.agc:233
//			REFSMMAT
// PORT: Fixed ROM slots 21796.
    21796, 1976,
// PORT: SOURCE P12.agc:234
//			MOONRATE
// PORT: Fixed ROM slots 21797.
    21797, 14382,
// PORT: SOURCE P12.agc:235
//		STOVL	WM
// PORT: Fixed ROM slots 21798.
    21798, 22954,
// PORT: SOURCE P12.agc:236
//			RLS
// PORT: Fixed ROM slots 21799.
    21799, 2086,
// PORT: SOURCE P12.agc:237
//		ABVAL	SL3
// PORT: Fixed ROM slots 21800.
    21800, 43596,
// PORT: SOURCE P12.agc:238
//		STCALL	/LAND/
// PORT: Fixed ROM slots 21801.
    21801, 31158,
// PORT: SOURCE P12.agc:239
//			TEMPR60
// PORT: Fixed ROM slots 21802.
    21802, 1256,
// PORT: SOURCE P12.agc:240
//
// PORT: SOURCE P12.agc:241
//49FPS		2DEC	.149352 B-6	# EXPECTED RDOT AT TIPOVER
// PORT: Fixed ROM slots 21803 21804.
    21803, 76, 21804, 7672,
// PORT: SOURCE P12.agc:242
//VINJNOM		2DEC	16.7924 B-7	# 5509.5 FPS(APO=30NM WITH RDOT=19.5FPS)
// PORT: Fixed ROM slots 21805 21806.
    21805, 4298, 21806, 13998,
// PORT: SOURCE P12.agc:243
//RDOTDNOM	2DEC	.059436 B-7	# 19.5 FPS
// PORT: Fixed ROM slots 21807 21808.
    21807, 14, 21808, 19916
)).

