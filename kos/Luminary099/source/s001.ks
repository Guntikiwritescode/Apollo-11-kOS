// PORT: Original source unit AGS_INITIALIZATION.agc.
// PORT: Physical bank 32. Shared continuation entries, slots 28677–28681.
function agcAotUnit1835 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28678 {
        if slot <= 28677 {
// PORT: SOURCE AGS_INITIALIZATION.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE AGS_INITIALIZATION.agc:2
//# Filename:	AGS_INITIALIZATION.agc
// PORT: SOURCE AGS_INITIALIZATION.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// PORT: SOURCE AGS_INITIALIZATION.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// PORT: SOURCE AGS_INITIALIZATION.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// PORT: SOURCE AGS_INITIALIZATION.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE AGS_INITIALIZATION.agc:7
//# Contact:	Hartmuth Gutsche <hgutsche@xplornet.com>.
// PORT: SOURCE AGS_INITIALIZATION.agc:8
//# Website:	www.ibiblio.org/apollo.
// PORT: SOURCE AGS_INITIALIZATION.agc:9
//# Pages:	206-210
// PORT: SOURCE AGS_INITIALIZATION.agc:10
//# Mod history:	2009-05-19 HG	Transcribed from page images.
// PORT: SOURCE AGS_INITIALIZATION.agc:11
//#
// PORT: SOURCE AGS_INITIALIZATION.agc:12
//# This source code has been transcribed or otherwise adapted from
// PORT: SOURCE AGS_INITIALIZATION.agc:13
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// PORT: SOURCE AGS_INITIALIZATION.agc:14
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// PORT: SOURCE AGS_INITIALIZATION.agc:15
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// PORT: SOURCE AGS_INITIALIZATION.agc:16
//# in storage size and consequent reduction in image quality as well) are
// PORT: SOURCE AGS_INITIALIZATION.agc:17
//# available online at www.ibiblio.org/apollo.  If for some reason you
// PORT: SOURCE AGS_INITIALIZATION.agc:18
//# find that the images are illegible, contact me at info@sandroid.org
// PORT: SOURCE AGS_INITIALIZATION.agc:19
//# about getting access to the (much) higher-quality images which Paul
// PORT: SOURCE AGS_INITIALIZATION.agc:20
//# actually created.
// PORT: SOURCE AGS_INITIALIZATION.agc:21
//#
// PORT: SOURCE AGS_INITIALIZATION.agc:22
//# Notations on the hardcopy document read, in part:
// PORT: SOURCE AGS_INITIALIZATION.agc:23
//#
// PORT: SOURCE AGS_INITIALIZATION.agc:24
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// PORT: SOURCE AGS_INITIALIZATION.agc:25
//#	16:27 JULY 14, 1969
// PORT: SOURCE AGS_INITIALIZATION.agc:26
//
// PORT: SOURCE AGS_INITIALIZATION.agc:27
//# Page 206
// PORT: SOURCE AGS_INITIALIZATION.agc:28
//
// PORT: SOURCE AGS_INITIALIZATION.agc:29
//# PROGRAM NAME:  AGS INITIALIZATION (R47)
// PORT: SOURCE AGS_INITIALIZATION.agc:30
//#
// PORT: SOURCE AGS_INITIALIZATION.agc:31
//# WRITTEN BY:  RHODE/KILROY/FOLLETT
// PORT: SOURCE AGS_INITIALIZATION.agc:32
//#
// PORT: SOURCE AGS_INITIALIZATION.agc:33
//# MOD NO.:	0
// PORT: SOURCE AGS_INITIALIZATION.agc:34
//# DATE:		23 MARCH 1967
// PORT: SOURCE AGS_INITIALIZATION.agc:35
//# MOD BY:	KILROY
// PORT: SOURCE AGS_INITIALIZATION.agc:36
//#
// PORT: SOURCE AGS_INITIALIZATION.agc:37
//# MOD NO.:	1
// PORT: SOURCE AGS_INITIALIZATION.agc:38
//# DATE:		28 OCTOBER 1967
// PORT: SOURCE AGS_INITIALIZATION.agc:39
//# MOD BY:	FOLLETT
// PORT: SOURCE AGS_INITIALIZATION.agc:40
//#
// PORT: SOURCE AGS_INITIALIZATION.agc:41
//# FUNCT. DESC.:	(1) TO PROVIDE THE AGS ABORT ELECTRONICS ASSEMBLY (AEA) WITH THE LEM AND CSM STATE VECTORS
// PORT: SOURCE AGS_INITIALIZATION.agc:42
//#		(POSITION,VELOCITY,TIME) IN LEM IMU COORDINATES BY MEANS OF THE LGC DIGITAL DOWNLINK.
// PORT: SOURCE AGS_INITIALIZATION.agc:43
//#
// PORT: SOURCE AGS_INITIALIZATION.agc:44
//#		(2) TO ZERO THE ICDU, LGC, AND AEA GIMBAL ANGLE COUNTER SIMULTANEOUSLY IN ORDER TO ESTABLISH A
// PORT: SOURCE AGS_INITIALIZATION.agc:45
//#		COMMON ZERO REFERENCE FOR THE MEASUREMENT OF GIMBAL (EULER) ANGLES WHICH DEFINE LEM ATTITUDE
// PORT: SOURCE AGS_INITIALIZATION.agc:46
//#		(3) TO ESTABLISH THE GROUND ELAPSED TIME OF AEA CLOCK ZERO.  (IF AN AEA CLOCK ZERO IS
// PORT: SOURCE AGS_INITIALIZATION.agc:47
//#		REQUESTED DURING THIS PROGRAM
// PORT: SOURCE AGS_INITIALIZATION.agc:48
//#
// PORT: SOURCE AGS_INITIALIZATION.agc:49
//# LOG SECTION:	AGS INITIALIZATION
// PORT: SOURCE AGS_INITIALIZATION.agc:50
//#
// PORT: SOURCE AGS_INITIALIZATION.agc:51
//# CALLING SEQ:	PROGRAM IS ENTERED WHEN ASTRONAUT KEYS V47E ON DSKY.
// PORT: SOURCE AGS_INITIALIZATION.agc:52
//#		R47 MAY BE CALLED AT ANY TIME EXCEPT WHEN ANOTHER EXTENDED VERB IS IN PROGRESS
// PORT: SOURCE AGS_INITIALIZATION.agc:53
//#
// PORT: SOURCE AGS_INITIALIZATION.agc:54
//# SUBROUTINES
// PORT: SOURCE AGS_INITIALIZATION.agc:55
//# CALLED:
// PORT: SOURCE AGS_INITIALIZATION.agc:56
//#
// PORT: SOURCE AGS_INITIALIZATION.agc:57
//# NORMAL EXIT:	ENDEXT
// PORT: SOURCE AGS_INITIALIZATION.agc:58
//#
// PORT: SOURCE AGS_INITIALIZATION.agc:59
//# ALARM/ABORT:	ALARM -- BAD REFSMMAT -- CODE:220
// PORT: SOURCE AGS_INITIALIZATION.agc:60
//#		OPERATOR ERROR IF V47 SELECTED DURING ANOTHER EXTENDED VERB.
// PORT: SOURCE AGS_INITIALIZATION.agc:61
//#
// PORT: SOURCE AGS_INITIALIZATION.agc:62
//# ERASABLES
// PORT: SOURCE AGS_INITIALIZATION.agc:63
//# USED:		SAMPTIME	(2)	TIME OF :ENTER: KEYSTROKE
// PORT: SOURCE AGS_INITIALIZATION.agc:64
//#		AGSK		(2)	GROUND ELAPSED TIME OF THE AEA CLOCK :ZERO:
// PORT: SOURCE AGS_INITIALIZATION.agc:65
//#		AGSBUFF		(14D)	CONTAINS AGS INITIALIZATION DATA (SEE :OUTPUT: BELOW)
// PORT: SOURCE AGS_INITIALIZATION.agc:66
//#		AGSWORD		(1)	PREVIOUS DOWNLIST SAVED HERE
// PORT: SOURCE AGS_INITIALIZATION.agc:67
//
// PORT: SOURCE AGS_INITIALIZATION.agc:68
//		EBANK=	AGSBUFF
// PORT: SOURCE AGS_INITIALIZATION.agc:69
//
// PORT: SOURCE AGS_INITIALIZATION.agc:70
//		BANK	40
// PORT: SOURCE AGS_INITIALIZATION.agc:71
//		SETLOC	R47
// PORT: SOURCE AGS_INITIALIZATION.agc:72
//		BANK
// PORT: SOURCE AGS_INITIALIZATION.agc:73
//
// PORT: SOURCE AGS_INITIALIZATION.agc:74
//		COUNT*	$$/R47
// PORT: SOURCE AGS_INITIALIZATION.agc:75
//
// PORT: SOURCE AGS_INITIALIZATION.agc:76
//AGSINIT		CAF	REFSMBIT
// PORT: Fixed ROM slots 28677.
            if slot <> 28677 or instruction <> 14815 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2527), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AGS_INITIALIZATION.agc:77
//		MASK	FLAGWRD3			# CHECK REFSMFLG.
// PORT: Fixed ROM slots 28678.
            if slot <> 28678 or instruction <> 28735 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 63).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 28679 {
// PORT: SOURCE AGS_INITIALIZATION.agc:78
//		CCS	A
// PORT: Fixed ROM slots 28679.
            if slot <> 28679 or instruction <> 4096 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCCS(words, 0).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 28680 {
// PORT: SOURCE AGS_INITIALIZATION.agc:79
//# Page 207
// PORT: SOURCE AGS_INITIALIZATION.agc:80
//		TC	REDSPTEM			# REFSMMAT IS OK
// PORT: Fixed ROM slots 28680.
                if slot <> 28680 or instruction <> 1039 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1039, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AGS_INITIALIZATION.agc:81
//		TC	ALARM				# REFSMMAT IS BAD
// PORT: Fixed ROM slots 28681.
                if slot <> 28681 or instruction <> 2935 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2935, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1835] to agcAotUnit1835@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AGS_INITIALIZATION.agc:82
//		OCT	220
// PORT: Fixed ROM slots 28682.
    28682, 288
)).

// PORT: Physical bank 32. Shared continuation entries, slots 28683–28691.
function agcAotUnit1836 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28686 {
        if slot <= 28684 {
            if slot <= 28683 {
// PORT: SOURCE AGS_INITIALIZATION.agc:83
//		TC	ENDEXT
// PORT: Fixed ROM slots 28683.
                if slot <> 28683 or instruction <> 2874 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2874, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AGS_INITIALIZATION.agc:84
//
// PORT: SOURCE AGS_INITIALIZATION.agc:85
//NEWAGS		EXTEND
// PORT: Fixed ROM slots 28684.
                if slot <> 28684 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28685 {
// PORT: SOURCE AGS_INITIALIZATION.agc:86
//		DCA	SAMPTIME			# TIME OF THE :ENTER: KEYSTROKE
// PORT: Fixed ROM slots 28685.
                if slot <> 28685 or instruction <> 12300 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 12, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AGS_INITIALIZATION.agc:87
//		DXCH	AGSK				# BECOMES NEW AEA CLOCK :ZERO:
// PORT: Fixed ROM slots 28686.
                if slot <> 28686 or instruction <> 22289 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 785, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 28688 {
            if slot <= 28687 {
// PORT: SOURCE AGS_INITIALIZATION.agc:88
//
// PORT: SOURCE AGS_INITIALIZATION.agc:89
//REDSPTEM	EXTEND
// PORT: Fixed ROM slots 28687.
                if slot <> 28687 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AGS_INITIALIZATION.agc:90
//		DCA	AGSK
// PORT: Fixed ROM slots 28688.
                if slot <> 28688 or instruction <> 13073 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 785, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28689 {
// PORT: SOURCE AGS_INITIALIZATION.agc:91
//		DXCH	DSPTEMX
// PORT: Fixed ROM slots 28689.
                if slot <> 28689 or instruction <> 22058 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 554, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28690 {
// PORT: SOURCE AGS_INITIALIZATION.agc:92
//AGSDISPK	CAF	V06N16
// PORT: Fixed ROM slots 28690.
                    if slot <> 28690 or instruction <> 13434 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 1146), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AGS_INITIALIZATION.agc:93
//		TC	BANKCALL			# R1 = 00XXX. HRS., R2 = 000XX MIN.,
// PORT: Fixed ROM slots 28691.
                    if slot <> 28691 or instruction <> 2446 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1836] to agcAotUnit1836@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AGS_INITIALIZATION.agc:94
//		CADR	GOMARKF				# R3 = 0XX.XX SEC.
// PORT: Fixed ROM slots 28692.
    28692, 16824
)).

// PORT: Physical bank 32. Shared continuation entries, slots 28693–28702.
function agcAotUnit1837 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28697 {
        if slot <= 28694 {
            if slot <= 28693 {
// PORT: SOURCE AGS_INITIALIZATION.agc:95
//		TC	ENDEXT				# TERMINATE RETURN
// PORT: Fixed ROM slots 28693.
                if slot <> 28693 or instruction <> 2874 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2874, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AGS_INITIALIZATION.agc:96
//		TC	AGSVCALC			# PROCEED RETURN
// PORT: Fixed ROM slots 28694.
                if slot <> 28694 or instruction <> 1054 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 1054, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28695 {
// PORT: SOURCE AGS_INITIALIZATION.agc:97
//		CS	BIT6				# IS ENTER VIA A V32
// PORT: Fixed ROM slots 28695.
                if slot <> 28695 or instruction <> 18918 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                    set words[0] to agcSignExtend(32767 - fixedOperand).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28696 {
// PORT: SOURCE AGS_INITIALIZATION.agc:98
//		AD	MPAC
// PORT: Fixed ROM slots 28696.
                    if slot <> 28696 or instruction <> 24684 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 108).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AGS_INITIALIZATION.agc:99
//		EXTEND
// PORT: Fixed ROM slots 28697.
                    if slot <> 28697 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 28699 {
            if slot <= 28698 {
// PORT: SOURCE AGS_INITIALIZATION.agc:100
//		BZF	NEWAGS				# YES, USE KEYSTROKE TIME FOR NEW AGSK
// PORT: Fixed ROM slots 28698.
                if slot <> 28698 or instruction <> 5132 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5132, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE AGS_INITIALIZATION.agc:101
//
// PORT: SOURCE AGS_INITIALIZATION.agc:102
//		EXTEND					# NO, NEW AGSK LOADED VIA V25
// PORT: Fixed ROM slots 28699.
                if slot <> 28699 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 28700 {
// PORT: SOURCE AGS_INITIALIZATION.agc:103
//		DCA	DSPTEMX				# LOADED INTO DSPTEMX BY KEYING
// PORT: Fixed ROM slots 28700.
                if slot <> 28700 or instruction <> 12842 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 554, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28701 {
// PORT: SOURCE AGS_INITIALIZATION.agc:104
//		TC	REDSPTEM -1			# V25E FOLLOWED BY HRS.,MINS.,SECS.
// PORT: Fixed ROM slots 28701.
                    if slot <> 28701 or instruction <> 1038 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1038, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AGS_INITIALIZATION.agc:105
//							# DISPLAY THE NEW K
// PORT: SOURCE AGS_INITIALIZATION.agc:106
//
// PORT: SOURCE AGS_INITIALIZATION.agc:107
//AGSVCALC	TC	INTPRET
// PORT: Fixed ROM slots 28702.
                    if slot <> 28702 or instruction <> 3103 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1837] to agcAotUnit1837@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AGS_INITIALIZATION.agc:108
//		SET
// PORT: Fixed ROM slots 28703.
    28703, 65304,
// PORT: SOURCE AGS_INITIALIZATION.agc:109
//			NODOFLAG			# DON'T ALLOW V37
// PORT: Fixed ROM slots 28704.
    28704, 1148,
// PORT: SOURCE AGS_INITIALIZATION.agc:110
//		SET	EXIT
// PORT: Fixed ROM slots 28705.
    28705, 65048,
// PORT: SOURCE AGS_INITIALIZATION.agc:111
//			XDSPFLAG
// PORT: Fixed ROM slots 28706.
    28706, 2172
)).

// PORT: Physical bank 32. Shared continuation entries, slots 28707–28708.
function agcAotUnit1838 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28707 {
// PORT: SOURCE AGS_INITIALIZATION.agc:112
//
// PORT: SOURCE AGS_INITIALIZATION.agc:113
//		CAF	V06N16
// PORT: Fixed ROM slots 28707.
        if slot <> 28707 or instruction <> 13434 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1146), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AGS_INITIALIZATION.agc:114
//		TC	BANKCALL
// PORT: Fixed ROM slots 28708.
        if slot <> 28708 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1838] to agcAotUnit1838@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AGS_INITIALIZATION.agc:115
//		CADR	EXDSPRET
// PORT: Fixed ROM slots 28709.
    28709, 17184
)).

// PORT: Physical bank 32. Shared continuation entries, slots 28710–28710.
function agcAotUnit1839 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE AGS_INITIALIZATION.agc:116
//
// PORT: SOURCE AGS_INITIALIZATION.agc:117
//		TC	INTPRET				# EXTRAPOLATE LEM AND CSM STATE VECTORS
// PORT: Fixed ROM slots 28710.
    if slot <> 28710 or instruction <> 3103 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 3103, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1839] to agcAotUnit1839@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AGS_INITIALIZATION.agc:118
//		RTB					# TO THE PRESENT TIME
// PORT: Fixed ROM slots 28711.
    28711, 65336,
// PORT: SOURCE AGS_INITIALIZATION.agc:119
//			LOADTIME			# LOAD MPAC WITH TIME2,TIME1
// PORT: Fixed ROM slots 28712.
    28712, 18166,
// PORT: SOURCE AGS_INITIALIZATION.agc:120
//		STCALL	TDEC1				# CALCULATE LEM STATE VECTOR
// PORT: Fixed ROM slots 28713.
    28713, 28738,
// PORT: SOURCE AGS_INITIALIZATION.agc:121
//			LEMPREC
// PORT: Fixed ROM slots 28714.
    28714, 23646,
// PORT: SOURCE AGS_INITIALIZATION.agc:122
//		CALL					# CALL ROUTINE TO CONVERT TO SM COORDS AND
// PORT: Fixed ROM slots 28715.
    28715, 65320,
// PORT: SOURCE AGS_INITIALIZATION.agc:123
//			SCALEVEC			# PROVIDE PROPER SCALING
// PORT: Fixed ROM slots 28716.
    28716, 53428,
// PORT: SOURCE AGS_INITIALIZATION.agc:124
//		STODL	AGSBUFF				# (LEMPREC AND CSMPREC LEAVE TDEC1 IN TAT)
// PORT: Fixed ROM slots 28717.
    28717, 14594,
// PORT: SOURCE AGS_INITIALIZATION.agc:125
//			TAT				# TAT = TIME TO WHICH RATT1 AND VATT1 ARE
// PORT: Fixed ROM slots 28718.
    28718, 26,
// PORT: SOURCE AGS_INITIALIZATION.agc:126
//		STCALL	TDEC1				# COMPUTED (CSEC SINCE CLOCK START B-28).
// PORT: Fixed ROM slots 28719.
    28719, 28738,
// PORT: SOURCE AGS_INITIALIZATION.agc:127
//			CSMPREC				# CALCULATE CSM STATE VECTOR FOR SAME TIME
// PORT: Fixed ROM slots 28720.
    28720, 23622,
// PORT: SOURCE AGS_INITIALIZATION.agc:128
//		CALL
// PORT: Fixed ROM slots 28721.
    28721, 65320,
// PORT: SOURCE AGS_INITIALIZATION.agc:129
//			SCALEVEC
// PORT: Fixed ROM slots 28722.
    28722, 53428,
// PORT: SOURCE AGS_INITIALIZATION.agc:130
//# Page 208
// PORT: SOURCE AGS_INITIALIZATION.agc:131
//		STODL	AGSBUFF +6
// PORT: Fixed ROM slots 28723.
    28723, 14606,
// PORT: SOURCE AGS_INITIALIZATION.agc:132
//			TAT
// PORT: Fixed ROM slots 28724.
    28724, 26,
// PORT: SOURCE AGS_INITIALIZATION.agc:133
//		DSU	DDV				# CALCULATE AND STORE THE TIME
// PORT: Fixed ROM slots 28725.
    28725, 47402,
// PORT: SOURCE AGS_INITIALIZATION.agc:134
//			AGSK
// PORT: Fixed ROM slots 28726.
    28726, 2082,
// PORT: SOURCE AGS_INITIALIZATION.agc:135
//			TSCALE
// PORT: Fixed ROM slots 28727.
    28727, 20730,
// PORT: SOURCE AGS_INITIALIZATION.agc:136
//		STORE	AGSBUFF +12D
// PORT: Fixed ROM slots 28728.
    28728, 2330,
// PORT: SOURCE AGS_INITIALIZATION.agc:137
//		EXIT
// PORT: Fixed ROM slots 28729.
    28729, 65532
)).

// PORT: Physical bank 32. Shared continuation entries, slots 28730–28733.
function agcAotUnit1840 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28731 {
        if slot <= 28730 {
// PORT: SOURCE AGS_INITIALIZATION.agc:138
//
// PORT: SOURCE AGS_INITIALIZATION.agc:139
//		CAF	LAGSLIST
// PORT: Fixed ROM slots 28730.
            if slot <> 28730 or instruction <> 14827 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AGS_INITIALIZATION.agc:140
//		TS	DNLSTCOD
// PORT: Fixed ROM slots 28731.
            if slot <> 28731 or instruction <> 22746 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22746, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 28732 {
// PORT: SOURCE AGS_INITIALIZATION.agc:141
//
// PORT: SOURCE AGS_INITIALIZATION.agc:142
//		CAF	20SEC				# DELAY FOR 20 SEC WHILE THE AGS
// PORT: Fixed ROM slots 28732.
            if slot <> 28732 or instruction <> 13438 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1150), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AGS_INITIALIZATION.agc:143
//		TC	BANKCALL			# DOWNLIST IS TRANSMITTED
// PORT: Fixed ROM slots 28733.
            if slot <> 28733 or instruction <> 2446 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2446, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1840] to agcAotUnit1840@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AGS_INITIALIZATION.agc:144
//		CADR	DELAYJOB
// PORT: Fixed ROM slots 28734.
    28734, 1978
)).

// PORT: Physical bank 32. Shared continuation entries, slots 28735–28746.
function agcAotUnit1841 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28740 {
        if slot <= 28737 {
            if slot <= 28735 {
// PORT: SOURCE AGS_INITIALIZATION.agc:145
//
// PORT: SOURCE AGS_INITIALIZATION.agc:146
//		CA	AGSWORD
// PORT: Fixed ROM slots 28735.
                if slot <> 28735 or instruction <> 13012 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 724).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28736 {
// PORT: SOURCE AGS_INITIALIZATION.agc:147
//		TS	DNLSTCOD			# RETURN TO THE OLD DOWNLIST
// PORT: Fixed ROM slots 28736.
                    if slot <> 28736 or instruction <> 22746 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22746, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AGS_INITIALIZATION.agc:148
//		CAF	IMUSEBIT
// PORT: Fixed ROM slots 28737.
                    if slot <> 28737 or instruction <> 14820 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 28738 {
// PORT: SOURCE AGS_INITIALIZATION.agc:149
//		MASK	FLAGWRD0			# CHECK IMUSE FLAG.
// PORT: Fixed ROM slots 28738.
                if slot <> 28738 or instruction <> 28732 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 60).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28739 {
// PORT: SOURCE AGS_INITIALIZATION.agc:150
//		CCS	A
// PORT: Fixed ROM slots 28739.
                    if slot <> 28739 or instruction <> 4096 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 0).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AGS_INITIALIZATION.agc:151
//		TC	AGSEND				# IMU IS BEING USED -- DO NOT ZERO
// PORT: Fixed ROM slots 28740.
                    if slot <> 28740 or instruction <> 1106 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 1106, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 28743 {
            if slot <= 28741 {
// PORT: SOURCE AGS_INITIALIZATION.agc:152
//CKSTALL		CCS	IMUCADR				# CHECK FOR IMU USAGE WHICH AVOIDS THE
// PORT: Fixed ROM slots 28741.
                if slot <> 28741 or instruction <> 4804 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCCS(words, 708).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28742 {
// PORT: SOURCE AGS_INITIALIZATION.agc:153
//		TCF	+3				# IMUSE BIT:  I.E., IMU COMPENSATION.
// PORT: Fixed ROM slots 28742.
                    if slot <> 28742 or instruction <> 5193 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5193, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AGS_INITIALIZATION.agc:154
//		TCF	+6				# FREE.  GO AHEAD WITH THE IMU ZERO.
// PORT: Fixed ROM slots 28743.
                    if slot <> 28743 or instruction <> 5197 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 5197, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 28744 {
// PORT: SOURCE AGS_INITIALIZATION.agc:155
//		TCF	+1
// PORT: Fixed ROM slots 28744.
                if slot <> 28744 or instruction <> 5193 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5193, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 28745 {
// PORT: SOURCE AGS_INITIALIZATION.agc:156
// +3		CAF	TEN				# WAIT .1 SEC AND TRY AGAIN.
// PORT: Fixed ROM slots 28745.
                    if slot <> 28745 or instruction <> 14579 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local fixedOperand is mod(readEffective:call(words, 2291), 32768).
                        set words[0] to agcSignExtend(fixedOperand).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE AGS_INITIALIZATION.agc:157
// 		TC	BANKCALL
// PORT: Fixed ROM slots 28746.
                    if slot <> 28746 or instruction <> 2446 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[1841] to agcAotUnit1841@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AGS_INITIALIZATION.agc:158
//		CADR	DELAYJOB
// PORT: Fixed ROM slots 28747.
    28747, 1978
)).

// PORT: Physical bank 32. Shared continuation entries, slots 28748–28749.
function agcAotUnit1842 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28748 {
// PORT: SOURCE AGS_INITIALIZATION.agc:159
//		TCF	CKSTALL
// PORT: Fixed ROM slots 28748.
        if slot <> 28748 or instruction <> 5189 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5189, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AGS_INITIALIZATION.agc:160
//
// PORT: SOURCE AGS_INITIALIZATION.agc:161
// +6		TC	BANKCALL			# IMU IS NOT IN USE
// PORT: Fixed ROM slots 28749.
        if slot <> 28749 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1842] to agcAotUnit1842@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AGS_INITIALIZATION.agc:162
// 		CADR	IMUZERO				# SET IMU ZERO DISCRETE FOR 320 MSECS.
// PORT: Fixed ROM slots 28750.
    28750, 15256
)).

// PORT: Physical bank 32. Shared continuation entries, slots 28751–28751.
function agcAotUnit1843 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE AGS_INITIALIZATION.agc:163
//		TC	BANKCALL			# WAIT 3 SEC FOR COUNTERS TO INCREMENT
// PORT: Fixed ROM slots 28751.
    if slot <> 28751 or instruction <> 2446 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2446, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1843] to agcAotUnit1843@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AGS_INITIALIZATION.agc:164
//		CADR	IMUSTALL
// PORT: Fixed ROM slots 28752.
    28752, 16284
)).

// PORT: Physical bank 32. Shared continuation entries, slots 28753–28754.
function agcAotUnit1844 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28753 {
// PORT: SOURCE AGS_INITIALIZATION.agc:165
//		TC	AGSEND
// PORT: Fixed ROM slots 28753.
        if slot <> 28753 or instruction <> 1106 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 1106, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AGS_INITIALIZATION.agc:166
//AGSEND		TC	DOWNFLAG			# ALLOW V37
// PORT: Fixed ROM slots 28754.
        if slot <> 28754 or instruction <> 2894 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2894, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1844] to agcAotUnit1844@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AGS_INITIALIZATION.agc:167
//		ADRES	NODOFLAG
// PORT: Fixed ROM slots 28755.
    28755, 88
)).

// PORT: Physical bank 32. Shared continuation entries, slots 28756–28757.
function agcAotUnit1845 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28756 {
// PORT: SOURCE AGS_INITIALIZATION.agc:168
//
// PORT: SOURCE AGS_INITIALIZATION.agc:169
//		CAF	V50N16
// PORT: Fixed ROM slots 28756.
        if slot <> 28756 or instruction <> 13435 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 1147), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE AGS_INITIALIZATION.agc:170
//		TC	BANKCALL
// PORT: Fixed ROM slots 28757.
        if slot <> 28757 or instruction <> 2446 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 2446, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1845] to agcAotUnit1845@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AGS_INITIALIZATION.agc:171
//		CADR	GOMARK3
// PORT: Fixed ROM slots 28758.
    28758, 16836
)).

// PORT: Physical bank 32. Shared continuation entries, slots 28759–28761.
function agcAotUnit1846 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 28759 {
// PORT: SOURCE AGS_INITIALIZATION.agc:172
//		TCF	ENDEXT
// PORT: Fixed ROM slots 28759.
        if slot <> 28759 or instruction <> 6970 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6970, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 28760 {
// PORT: SOURCE AGS_INITIALIZATION.agc:173
//		TCF	ENDEXT
// PORT: Fixed ROM slots 28760.
            if slot <> 28760 or instruction <> 6970 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6970, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE AGS_INITIALIZATION.agc:174
//		TC	ENDEXT
// PORT: Fixed ROM slots 28761.
            if slot <> 28761 or instruction <> 2874 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 2874, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1846] to agcAotUnit1846@.

agcAotInstallSourceRope(list(
// PORT: SOURCE AGS_INITIALIZATION.agc:175
//
// PORT: SOURCE AGS_INITIALIZATION.agc:176
//SCALEVEC	VLOAD	MXV
// PORT: Fixed ROM slots 28762.
    28762, 53754,
// PORT: SOURCE AGS_INITIALIZATION.agc:177
//			VATT1
// PORT: Fixed ROM slots 28763.
    28763, 42,
// PORT: SOURCE AGS_INITIALIZATION.agc:178
//			REFSMMAT
// PORT: Fixed ROM slots 28764.
    28764, 1976,
// PORT: SOURCE AGS_INITIALIZATION.agc:179
//		VXSC	VSL2
// PORT: Fixed ROM slots 28765.
    28765, 60130,
// PORT: SOURCE AGS_INITIALIZATION.agc:180
//			VSCALE
// PORT: Fixed ROM slots 28766.
    28766, 20740,
// PORT: SOURCE AGS_INITIALIZATION.agc:181
//# Page 209
// PORT: SOURCE AGS_INITIALIZATION.agc:182
//		VAD	VAD				# THIS SECTION ROUNDS THE VECTOR, AND
// PORT: Fixed ROM slots 28767.
    28767, 44378,
// PORT: SOURCE AGS_INITIALIZATION.agc:183
//			AGSRND1				# CORRECTS FOR THE FACT THAT THE AGS
// PORT: Fixed ROM slots 28768.
    28768, 20744,
// PORT: SOURCE AGS_INITIALIZATION.agc:184
//			AGSRND2				# IS A 2 S COMPLEMENT MACHINE WHILE THE
// PORT: Fixed ROM slots 28769.
    28769, 20756,
// PORT: SOURCE AGS_INITIALIZATION.agc:185
//		RTB					# LGC IS A 1 S COMPLEMENT MACHINE.
// PORT: Fixed ROM slots 28770.
    28770, 65336,
// PORT: SOURCE AGS_INITIALIZATION.agc:186
//			VECSGNAG
// PORT: Fixed ROM slots 28771.
    28771, 18420,
// PORT: SOURCE AGS_INITIALIZATION.agc:187
//		STOVL	VATT1
// PORT: Fixed ROM slots 28772.
    28772, 20522,
// PORT: SOURCE AGS_INITIALIZATION.agc:188
//			RATT1
// PORT: Fixed ROM slots 28773.
    28773, 30,
// PORT: SOURCE AGS_INITIALIZATION.agc:189
//		MXV	VXSC
// PORT: Fixed ROM slots 28774.
    28774, 61858,
// PORT: SOURCE AGS_INITIALIZATION.agc:190
//			REFSMMAT
// PORT: Fixed ROM slots 28775.
    28775, 1976,
// PORT: SOURCE AGS_INITIALIZATION.agc:191
//			RSCALE
// PORT: Fixed ROM slots 28776.
    28776, 20736,
// PORT: SOURCE AGS_INITIALIZATION.agc:192
//		VSL8	VAD				# AGAIN THIS SECTION ROUNDS.  TWO VECTORS
// PORT: Fixed ROM slots 28777.
    28777, 44308,
// PORT: SOURCE AGS_INITIALIZATION.agc:193
//			AGSRND1				# ARE ADDED TO DEFEAT ALSIGNAG IN THE
// PORT: Fixed ROM slots 28778.
    28778, 20744,
// PORT: SOURCE AGS_INITIALIZATION.agc:194
//		VAD	RTB				# CASE OF A HIGH-ORDER ZERO COUPLED WITH
// PORT: Fixed ROM slots 28779.
    28779, 40026,
// PORT: SOURCE AGS_INITIALIZATION.agc:195
//			AGSRND2				# A LOW ORDER NEGATIVE PART.
// PORT: Fixed ROM slots 28780.
    28780, 20756,
// PORT: SOURCE AGS_INITIALIZATION.agc:196
//			VECSGNAG
// PORT: Fixed ROM slots 28781.
    28781, 18420,
// PORT: SOURCE AGS_INITIALIZATION.agc:197
//		LXA,1
// PORT: Fixed ROM slots 28782.
    28782, 65488,
// PORT: SOURCE AGS_INITIALIZATION.agc:198
//			VATT1
// PORT: Fixed ROM slots 28783.
    28783, 40,
// PORT: SOURCE AGS_INITIALIZATION.agc:199
//		SXA,1	LXA,1
// PORT: Fixed ROM slots 28784.
    28784, 59568,
// PORT: SOURCE AGS_INITIALIZATION.agc:200
//			MPAC +1
// PORT: Fixed ROM slots 28785.
    28785, 218,
// PORT: SOURCE AGS_INITIALIZATION.agc:201
//			VATT1 +2
// PORT: Fixed ROM slots 28786.
    28786, 44,
// PORT: SOURCE AGS_INITIALIZATION.agc:202
//		SXA,1	LXA,1
// PORT: Fixed ROM slots 28787.
    28787, 59568,
// PORT: SOURCE AGS_INITIALIZATION.agc:203
//			MPAC +4
// PORT: Fixed ROM slots 28788.
    28788, 224,
// PORT: SOURCE AGS_INITIALIZATION.agc:204
//			VATT1 +4
// PORT: Fixed ROM slots 28789.
    28789, 48,
// PORT: SOURCE AGS_INITIALIZATION.agc:205
//		SXA,1	RVQ
// PORT: Fixed ROM slots 28790.
    28790, 36528,
// PORT: SOURCE AGS_INITIALIZATION.agc:206
//			MPAC +6
// PORT: Fixed ROM slots 28791.
    28791, 228,
// PORT: SOURCE AGS_INITIALIZATION.agc:207
//
// PORT: SOURCE AGS_INITIALIZATION.agc:208
//LAGSLIST	=	ONE
// PORT: SOURCE AGS_INITIALIZATION.agc:209
//V01N14		VN	0114
// PORT: Fixed ROM slots 28792.
    28792, 284,
// PORT: SOURCE AGS_INITIALIZATION.agc:210
//V50N00A		VN	5000
// PORT: Fixed ROM slots 28793.
    28793, 12800,
// PORT: SOURCE AGS_INITIALIZATION.agc:211
//V00N25		EQUALS	OCT31
// PORT: SOURCE AGS_INITIALIZATION.agc:212
//V06N16		VN	0616
// PORT: Fixed ROM slots 28794.
    28794, 1568,
// PORT: SOURCE AGS_INITIALIZATION.agc:213
//V00N34		EQUALS	34DEC
// PORT: SOURCE AGS_INITIALIZATION.agc:214
//V50N16		VN	5016
// PORT: Fixed ROM slots 28795.
    28795, 12832,
// PORT: SOURCE AGS_INITIALIZATION.agc:215
//TSCALE		2DEC	100 B-10			# CSEC TO SEC SCALE FACTOR
// PORT: Fixed ROM slots 28796 28797.
    28796, 3200, 28797, 0,
// PORT: SOURCE AGS_INITIALIZATION.agc:216
//20SEC		DEC	2000
// PORT: Fixed ROM slots 28798.
    28798, 4000,
// PORT: SOURCE AGS_INITIALIZATION.agc:217
//RSCALE		2DEC	3.280839 B-3			# METERS TO FEET SCALE FACTOR
// PORT: Fixed ROM slots 28799 28800.
    28799, 13438, 28800, 5186,
// PORT: SOURCE AGS_INITIALIZATION.agc:218
//VSCALE		2DEC	3.280839 E2 B-9			# METERS/CS TO FEET/SEC SCALE FACTOR
// PORT: Fixed ROM slots 28801 28802.
    28801, 20996, 28802, 22440,
// PORT: SOURCE AGS_INITIALIZATION.agc:219
//AGSRND1		2OCT	0000060000
// PORT: Fixed ROM slots 28803 28804.
    28803, 0, 28804, 49152,
// PORT: SOURCE AGS_INITIALIZATION.agc:220
//		2OCT	0000060000
// PORT: Fixed ROM slots 28805 28806.
    28805, 0, 28806, 49152,
// PORT: SOURCE AGS_INITIALIZATION.agc:221
//		2OCT	0000060000
// PORT: Fixed ROM slots 28807 28808.
    28807, 0, 28808, 49152,
// PORT: SOURCE AGS_INITIALIZATION.agc:222
//AGSRND2		2OCT	0000037777
// PORT: Fixed ROM slots 28809 28810.
    28809, 0, 28810, 32766,
// PORT: SOURCE AGS_INITIALIZATION.agc:223
//		2OCT	0000037777
// PORT: Fixed ROM slots 28811 28812.
    28811, 0, 28812, 32766,
// PORT: SOURCE AGS_INITIALIZATION.agc:224
//# Page 210
// PORT: SOURCE AGS_INITIALIZATION.agc:225
//		2OCT	0000037777
// PORT: Fixed ROM slots 28813 28814.
    28813, 0, 28814, 32766
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE AGS_INITIALIZATION.agc:226
//
// PORT: SOURCE AGS_INITIALIZATION.agc:227
//		SBANK=	LOWSUPER			# FOR SUBSEQUENT LOW 2CADRS.
// PORT: SOURCE AGS_INITIALIZATION.agc:228
//
