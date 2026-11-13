// RCS_FAILURE_MONITOR.agc
// bank 06, slots 8814-8834
function agcAotUnit510 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8823 {
        if slot <= 8818 {
            if slot <= 8815 {
                if slot <= 8814 {
// RCS_FAILURE_MONITOR.agc:1
//# Copyright:	Public domain.
// RCS_FAILURE_MONITOR.agc:2
//# Filename:	RCS_FAILURE_MONITOR.agc
// RCS_FAILURE_MONITOR.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// RCS_FAILURE_MONITOR.agc:4
//#		It is part of the source code for the Munar Excursion Module's (LM)
// RCS_FAILURE_MONITOR.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// RCS_FAILURE_MONITOR.agc:6
//# Assembler:	yaYUL
// RCS_FAILURE_MONITOR.agc:7
//# Contact:	Gutsche Kerman <hgutsche@xplornet.com>.
// RCS_FAILURE_MONITOR.agc:8
//# Website:	www.ibiblio.org/apollo.
// RCS_FAILURE_MONITOR.agc:9
//# Pages:	190-192
// RCS_FAILURE_MONITOR.agc:10
//# Mod history:	2009-05-19 HG	Transcribed from page images.
// RCS_FAILURE_MONITOR.agc:11
//#
// RCS_FAILURE_MONITOR.agc:12
//# This source code has been transcribed or otherwise adapted from
// RCS_FAILURE_MONITOR.agc:13
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// RCS_FAILURE_MONITOR.agc:14
//# was performed by Fjeld Kerman, and arranged for by Douglas Kerman of
// RCS_FAILURE_MONITOR.agc:15
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// RCS_FAILURE_MONITOR.agc:16
//# in storage size and consequent reduction in image quality as well) are
// RCS_FAILURE_MONITOR.agc:17
//# available online at www.ibiblio.org/apollo.  If for some reason you
// RCS_FAILURE_MONITOR.agc:18
//# find that the images are illegible, contact me at info@sandroid.org
// RCS_FAILURE_MONITOR.agc:19
//# about getting access to the (much) higher-quality images which Fjeld Kerman
// RCS_FAILURE_MONITOR.agc:20
//# actually created.
// RCS_FAILURE_MONITOR.agc:21
//#
// RCS_FAILURE_MONITOR.agc:22
//# Notations on the hardcopy document read, in part:
// RCS_FAILURE_MONITOR.agc:23
//#
// RCS_FAILURE_MONITOR.agc:24
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// RCS_FAILURE_MONITOR.agc:25
//#	16:27 JULY 14, 1969
// RCS_FAILURE_MONITOR.agc:26
//
// RCS_FAILURE_MONITOR.agc:27
//# Page 190
// RCS_FAILURE_MONITOR.agc:28
//# PROGRAM DESCRIPTION
// RCS_FAILURE_MONITOR.agc:29
//#
// RCS_FAILURE_MONITOR.agc:30
//# AUTHOR:  MILLER KERMAN
// RCS_FAILURE_MONITOR.agc:31
//#
// RCS_FAILURE_MONITOR.agc:32
//# MODIFIED 6 MARCH 1968 BY WEISSMAN KERMAN TO SET UP JOB FOR 1/ACCS WHEN THE MASKS ARE CHANGED.
// RCS_FAILURE_MONITOR.agc:33
//#
// RCS_FAILURE_MONITOR.agc:34
//#      THIS ROUTINE IS ATTACHED TO T4RUPT, AND IS ENTERED EVERY 480 MS.  ITS FUNCTION IS TO EXAMINE THE LOW 8 BITS
// RCS_FAILURE_MONITOR.agc:35
//# OF CHANNEL 32 TO SEE IF ANY ISOLATION-VALVE CLOSURE BITS HAVE APPEARED OR DISAPPEARED (THE CREW IS WARNED OF JET
// RCS_FAILURE_MONITOR.agc:36
//# FAILURES BY LAMPS LIT BY THE GRUMMAN FAILURE-DETECTION CIRCUITRY; THEY MAY RESPOND BY OPERATING SWITCHES WHICH
// RCS_FAILURE_MONITOR.agc:37
//# ISOLATE PAIRS OF JETS FROM THE PROPELLANT TANKS AND SET BITS IN CHANNEL 32).  IN THE EVENT THAT CHANNEL 32 BITS
// RCS_FAILURE_MONITOR.agc:38
//# DIFFER FROM 'PVALVEST', THE RECORD OF ACTIONS TAKEN BY THIS ROUTINE, THE APPROPRIATE BITS IN 'CH5MASK' &
// RCS_FAILURE_MONITOR.agc:39
//# 'CH6MASK', USED BY THE DAP JET-SELECTION LOGIC, ARE UPDATED, AS IS 'PVALVEST'.  TO SPEED UP & SHORTEN THE
// RCS_FAILURE_MONITOR.agc:40
//# ROUTINE, NO MORE THAN ONE CHANGE IS ACCEPTED PER ENTRY.  THE HIGHEST-NUMBERED BIT IN CHANNEL 32 WHICH REQUIRES
// RCS_FAILURE_MONITOR.agc:41
//# ACTION IS THE ONE PROCESSED.
// RCS_FAILURE_MONITOR.agc:42
//#
// RCS_FAILURE_MONITOR.agc:43
//#      THE CODING IN THE FAILURE MONITOR HAS BEEN WRITTEN SO AS TO HAVE ALMOST COMPLETE RESTART PROTECTION.  FOR
// RCS_FAILURE_MONITOR.agc:44
//# EXAMPLE, NO ASSUMPTION IS MADE WHEN SETTING A 'CH5MASK' BIT TO 1 THAT THE PREVIOUS STATE IS 0, ALTHOUGH IT OF
// RCS_FAILURE_MONITOR.agc:45
//# COURSE SHOULD BE.  ONE CASE WHICH MAY BE SEEN TO EVADE PROTECTION IS THE OCCURRENCE OF A RESTART AFTER UPDATING
// RCS_FAILURE_MONITOR.agc:46
//# ONE OR BOTH DAP MASK-WORDS BUT BEFORE UPDATING 'PVALVEST', COUPLED WITH A CHANGE IN THE VALVE-BIT BACK TO ITS
// RCS_FAILURE_MONITOR.agc:47
//# FORMER STATE.  THE CONSEQUENCE OF THIS IS THAT THE NEXT ENTRY WOULD NOT SEE THE CHANGE INCOMPLETELY INCORP-
// RCS_FAILURE_MONITOR.agc:48
//# ORATED BY THE LAST PASS (BECAUSE IT WENT AWAY AT JUST THE RIGHT TIME), BUT THE DAP MASK-WORDS WILL BE INCORRECT.
// RCS_FAILURE_MONITOR.agc:49
//# THIS COMBINATION OF EVENTS SEEMS QUITE REMOTE, BUT NOT IMPOSSIBLE UNLESS THE CREW OPERATES THE SWITCHES AT HALF-
// RCS_FAILURE_MONITOR.agc:50
//# SECOND INTERVALS OR LONGER.  IN ANY EVENT, A DISAGREEMENT BETWEEN REALITY AND THE DAP MASKS WILL BE CURED IF
// RCS_FAILURE_MONITOR.agc:51
//# THE MISINTERPRETED SWITCH IS REVERSED AND THEN RESTORED TO ITS CORRECT POSITION (SLOWLY).
// RCS_FAILURE_MONITOR.agc:52
//#
// RCS_FAILURE_MONITOR.agc:53
//# CALLING SEQUENCE:
// RCS_FAILURE_MONITOR.agc:54
//#
// RCS_FAILURE_MONITOR.agc:55
//#		TCF	RCSMONIT	(IN INTERRUPT MODE, EVERY 480 MS.)
// RCS_FAILURE_MONITOR.agc:56
//#
// RCS_FAILURE_MONITOR.agc:57
//# EXIT:  TCF  RCSMONEX  (ALL PATHS EXIT VIA SUCH AN INSTRUCTION)
// RCS_FAILURE_MONITOR.agc:58
//RCSMONEX	EQUALS	RESUME
// RCS_FAILURE_MONITOR.agc:59
//
// RCS_FAILURE_MONITOR.agc:60
//# ERASABLE INITIALIZATION REQUIRED:
// RCS_FAILURE_MONITOR.agc:61
//#
// RCS_FAILURE_MONITOR.agc:62
//#	   VIA FRESH START:  PVALVEST	       = +0  (ALL JETS ENABLED)
// RCS_FAILURE_MONITOR.agc:63
//#			     CH5MASK, CH6MASK  = +0  (ALL JETS OK)
// RCS_FAILURE_MONITOR.agc:64
//#
// RCS_FAILURE_MONITOR.agc:65
//# OUTPUT:  CH5MASK & CH6MASK UPDATED  (1'S WHERE JETS NOT TO BE USED, IN CHANNEL 5 & 6 FORMAT)
// RCS_FAILURE_MONITOR.agc:66
//#	   PVALTEST UPDATED  (1.5 WHEN VALVE CLOSURES HAVE BEEN TRANSLATED INTO CH5MASK & CH6MASK; CHAN 32 FORMAT)
// RCS_FAILURE_MONITOR.agc:67
//#	   JOB TO DO 1/ACCS.
// RCS_FAILURE_MONITOR.agc:68
//#
// RCS_FAILURE_MONITOR.agc:69
//# DEBRIS:  A, L, Q AND DEBRIS OF NOVAC.
// RCS_FAILURE_MONITOR.agc:70
//#
// RCS_FAILURE_MONITOR.agc:71
//# SUBROUTINE CALLED:  NOVAC.
// RCS_FAILURE_MONITOR.agc:72
//
// RCS_FAILURE_MONITOR.agc:73
//		EBANK=	CH5MASK
// RCS_FAILURE_MONITOR.agc:74
//
// RCS_FAILURE_MONITOR.agc:75
//		BANK	23
// RCS_FAILURE_MONITOR.agc:76
//		SETLOC	RCSMONT
// RCS_FAILURE_MONITOR.agc:77
//		BANK
// RCS_FAILURE_MONITOR.agc:78
//# Page 191
// RCS_FAILURE_MONITOR.agc:79
//		COUNT*	$$/T4RCS
// RCS_FAILURE_MONITOR.agc:80
//
// RCS_FAILURE_MONITOR.agc:81
//RCSMONIT	EQUALS	RCSMON
// RCS_FAILURE_MONITOR.agc:82
//
// RCS_FAILURE_MONITOR.agc:83
//RCSMON		CS	ZERO
// slot 8814
                    if slot <> 8814 or instruction <> 18925 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RCS_FAILURE_MONITOR.agc:84
//		EXTEND
// slot 8815
                    if slot <> 8815 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8816 {
// RCS_FAILURE_MONITOR.agc:85
//		RXOR	CHAN32		# PICK UP + INVERT INVERTED CHANNEL 32.
// slot 8816
                    if slot <> 8816 or instruction <> 3098 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 6, 26, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8817 {
// RCS_FAILURE_MONITOR.agc:86
//		MASK	LOW8		# KEEP JET-FAIL BITS ONLY.
// slot 8817
                        if slot <> 8817 or instruction <> 30959 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            set words[0] to agcOverflowCorrected(words[0]).
                            local fixedOperand is mod(readEffective:call(words, 2287), 32768).
                            if fixedOperand = 255 {
                                set words[0] to agcSignExtend(mod(floor(words[0] / 1), 256) * 1).
                            } else {
                                set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                            }
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS_FAILURE_MONITOR.agc:87
//		TS	Q
// slot 8818
                        if slot <> 8818 or instruction <> 22530 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22530, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8820 {
                if slot <= 8819 {
// RCS_FAILURE_MONITOR.agc:88
//
// RCS_FAILURE_MONITOR.agc:89
//		CS	PVALVEST	#       -   -
// slot 8819
                    if slot <> 8819 or instruction <> 17086 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 702).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RCS_FAILURE_MONITOR.agc:90
//		MASK	Q		# FORM PC + PC.
// slot 8820
                    if slot <> 8820 or instruction <> 28674 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 2).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8821 {
// RCS_FAILURE_MONITOR.agc:91
//		TS	L		#   (P = PREVIOUS ISOLATION VALVE STATE,
// slot 8821
                    if slot <> 8821 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8822 {
// RCS_FAILURE_MONITOR.agc:92
//		CS	Q		#    C = CURRENT VALVE STATE (CH 32)).
// slot 8822
                        if slot <> 8822 or instruction <> 16386 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 2).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS_FAILURE_MONITOR.agc:93
//		MASK	PVALVEST
// slot 8823
                        if slot <> 8823 or instruction <> 29374 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 702).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 8828 {
            if slot <= 8825 {
                if slot <= 8824 {
// RCS_FAILURE_MONITOR.agc:94
//		ADS	L		# RESULT NZ INDICATES ACTION REQUIRED.
// slot 8824
                    if slot <> 8824 or instruction <> 11265 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreADS(words, 1).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// RCS_FAILURE_MONITOR.agc:95
//
// RCS_FAILURE_MONITOR.agc:96
//		EXTEND
// slot 8825
                    if slot <> 8825 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 8826 {
// RCS_FAILURE_MONITOR.agc:97
//		BZF	RCSMONEX	# QUIT IF NO ACTION REQUIRED.
// slot 8826
                    if slot <> 8826 or instruction <> 6840 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6840, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8827 {
// RCS_FAILURE_MONITOR.agc:98
//
// RCS_FAILURE_MONITOR.agc:99
//		EXTEND
// slot 8827
                        if slot <> 8827 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS_FAILURE_MONITOR.agc:100
//		MP	BIT7		# MOVE BITS 8 - 1 OF A TO 14 - 7 OF L.
// slot 8828
                        if slot <> 8828 or instruction <> 31205 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2533, readEffective:call(words, 2533)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 8831 {
                if slot <= 8829 {
// RCS_FAILURE_MONITOR.agc:101
//		XCH	L		# ZERO TO L IN THE PROCESS.
// slot 8829
                    if slot <> 8829 or instruction <> 23553 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 1, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8830 {
// RCS_FAILURE_MONITOR.agc:102
//
// RCS_FAILURE_MONITOR.agc:103
// -3		INCR	L
// slot 8830
                        if slot <> 8830 or instruction <> 10241 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreINCR(words, 1).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS_FAILURE_MONITOR.agc:104
//		DOUBLE			# BOUND TO GET OVERFLOW IN THIS LOOP.
// slot 8831
                        if slot <> 8831 or instruction <> 24576 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreAD(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 8832 {
// RCS_FAILURE_MONITOR.agc:105
//		OVSK			# SINCE WE ASSURED INITIAL NZ IN A.
// slot 8832
                    if slot <> 8832 or instruction <> 22528 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22528, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 8833 {
// RCS_FAILURE_MONITOR.agc:106
//		TCF	-3
// slot 8833
                        if slot <> 8833 or instruction <> 5758 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5758, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// RCS_FAILURE_MONITOR.agc:107
//
// RCS_FAILURE_MONITOR.agc:108
//		INDEX	L
// slot 8834
                        if slot <> 8834 or instruction <> 20481 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[510] to agcAotUnit510@.

agcAotInstallSourceRope(list(
// RCS_FAILURE_MONITOR.agc:109
//		CA	BIT8 -1		# SAVE THE RELEVANT BIT (8 - 1).
// slot 8835
    8835, 29638
)).

// bank 06, slots 8836-8841
function agcAotUnit511 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8838 {
        if slot <= 8836 {
// RCS_FAILURE_MONITOR.agc:110
//		TS	Q
// slot 8836
            if slot <> 8836 or instruction <> 22530 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22530, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8837 {
// RCS_FAILURE_MONITOR.agc:111
//		MASK	PVALVEST	# LOOK AT PREVIOUS VALVE STATE BIT.
// slot 8837
                if slot <> 8837 or instruction <> 29374 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 702).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS_FAILURE_MONITOR.agc:112
//		CCS	A
// slot 8838
                if slot <> 8838 or instruction <> 4096 { return choose false if checkOnly else -1. }
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
        if slot <= 8839 {
// RCS_FAILURE_MONITOR.agc:113
//		TCF	VOPENED		# THE VALVE HAS JUST BEEN OPENED.
// slot 8839
            if slot <> 8839 or instruction <> 5779 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5779, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8840 {
// RCS_FAILURE_MONITOR.agc:114
//
// RCS_FAILURE_MONITOR.agc:115
//		CS	CH5MASK		# THE VALVE HAS JUST BEEN CLOSED.
// slot 8840
                if slot <> 8840 or instruction <> 17074 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 690).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS_FAILURE_MONITOR.agc:116
//		INDEX	L
// slot 8841
                if slot <> 8841 or instruction <> 20481 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[511] to agcAotUnit511@.

agcAotInstallSourceRope(list(
// RCS_FAILURE_MONITOR.agc:117
//		MASK	5FAILTAB
// slot 8842
    8842, 60740
)).

// bank 06, slots 8843-8845
function agcAotUnit512 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8843 {
// RCS_FAILURE_MONITOR.agc:118
//		ADS	CH5MASK		# SET INHIBIT BIT FOR CHANNEL 5 JET.
// slot 8843
        if slot <> 8843 or instruction <> 11954 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreADS(words, 690).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 8844 {
// RCS_FAILURE_MONITOR.agc:119
//
// RCS_FAILURE_MONITOR.agc:120
//		CS	CH6MASK
// slot 8844
            if slot <> 8844 or instruction <> 17075 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 691).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// RCS_FAILURE_MONITOR.agc:121
//		INDEX	L
// slot 8845
            if slot <> 8845 or instruction <> 20481 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[512] to agcAotUnit512@.

agcAotInstallSourceRope(list(
// RCS_FAILURE_MONITOR.agc:122
//		MASK	6FAILTAB
// slot 8846
    8846, 60756
)).

// bank 06, slots 8847-8851
function agcAotUnit513 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8848 {
        if slot <= 8847 {
// RCS_FAILURE_MONITOR.agc:123
//		ADS	CH6MASK		# SET INGIBIT BIT FOR CHANNEL 6 JET.
// slot 8847
            if slot <> 8847 or instruction <> 11955 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreADS(words, 691).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// RCS_FAILURE_MONITOR.agc:124
//
// RCS_FAILURE_MONITOR.agc:125
//		CA	Q
// slot 8848
            if slot <> 8848 or instruction <> 12290 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreCA(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 8849 {
// RCS_FAILURE_MONITOR.agc:126
//		ADS	PVALVEST	# RECORD ACTION TAKEN.
// slot 8849
            if slot <> 8849 or instruction <> 11966 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreADS(words, 702).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8850 {
// RCS_FAILURE_MONITOR.agc:127
//
// RCS_FAILURE_MONITOR.agc:128
//		TCF	1/ACCFIX	# SET UP 1/ACCJOB AND EXIT.
// slot 8850
                if slot <> 8850 or instruction <> 5790 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5790, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS_FAILURE_MONITOR.agc:129
//
// RCS_FAILURE_MONITOR.agc:130
//# Page 192
// RCS_FAILURE_MONITOR.agc:131
//VOPENED		INDEX	L		# A VALVE HAS JUST BEEN OPENED.
// slot 8851
                if slot <> 8851 or instruction <> 20481 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[513] to agcAotUnit513@.

agcAotInstallSourceRope(list(
// RCS_FAILURE_MONITOR.agc:132
//		CS	5FAILTAB
// slot 8852
    8852, 36164
)).

// bank 06, slots 8853-8855
function agcAotUnit514 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8853 {
// RCS_FAILURE_MONITOR.agc:133
//		MASK	CH5MASK
// slot 8853
        if slot <> 8853 or instruction <> 29362 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            agcCoreMASK(words, 690).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 8854 {
// RCS_FAILURE_MONITOR.agc:134
//		TS	CH5MASK		# REMOVE INHIBIT BIT FOR CHANNEL 5 JET.
// slot 8854
            if slot <> 8854 or instruction <> 23218 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 23218, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// RCS_FAILURE_MONITOR.agc:135
//
// RCS_FAILURE_MONITOR.agc:136
//		INDEX	L
// slot 8855
            if slot <> 8855 or instruction <> 20481 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[514] to agcAotUnit514@.

agcAotInstallSourceRope(list(
// RCS_FAILURE_MONITOR.agc:137
//		CS	6FAILTAB
// slot 8856
    8856, 36180
)).

// bank 06, slots 8857-8863
function agcAotUnit515 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 8859 {
        if slot <= 8857 {
// RCS_FAILURE_MONITOR.agc:138
//		MASK	CH6MASK
// slot 8857
            if slot <> 8857 or instruction <> 29363 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreMASK(words, 691).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 8858 {
// RCS_FAILURE_MONITOR.agc:139
//		TS	CH6MASK		# REMOVE INHIBIT BIT FOR CHANNEL 6 JET.
// slot 8858
                if slot <> 8858 or instruction <> 23219 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23219, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS_FAILURE_MONITOR.agc:140
//
// RCS_FAILURE_MONITOR.agc:141
//		CS	Q
// slot 8859
                if slot <> 8859 or instruction <> 16386 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 2).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 8861 {
            if slot <= 8860 {
// RCS_FAILURE_MONITOR.agc:142
//		MASK	PVALVEST
// slot 8860
                if slot <> 8860 or instruction <> 29374 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreMASK(words, 702).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS_FAILURE_MONITOR.agc:143
//		TS	PVALVEST	# RECORD ACTION TAKEN.
// slot 8861
                if slot <> 8861 or instruction <> 23230 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23230, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 8862 {
// RCS_FAILURE_MONITOR.agc:144
//
// RCS_FAILURE_MONITOR.agc:145
//1/ACCFIX	CAF	PRIO27		# SET UP 1/ACCS SO THAT THE SWITCH CURVES
// slot 8862
                if slot <> 8862 or instruction <> 16333 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 4045), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// RCS_FAILURE_MONITOR.agc:146
//		TC	NOVAC		#   FOR TJETLAW CAN BE MODIFIED IF CH5MASK
// slot 8863
                if slot <> 8863 or instruction <> 2618 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2618, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[515] to agcAotUnit515@.

agcAotInstallSourceRope(list(
// RCS_FAILURE_MONITOR.agc:147
//		EBANK=	AOSQ		#   HAS BEEN ALTERED.
// RCS_FAILURE_MONITOR.agc:148
//		2CADR	1/ACCJOB
// slot 8864 8865
    8864, 2648, 8865, 32908
)).

// bank 06, slots 8866-8866
function agcAotUnit516 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// RCS_FAILURE_MONITOR.agc:149
//
// RCS_FAILURE_MONITOR.agc:150
//		TCF	RCSMONEX	# EXIT.
// slot 8866
    if slot <> 8866 or instruction <> 6840 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 6840, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[516] to agcAotUnit516@.

agcAotInstallSourceRope(list(
// RCS_FAILURE_MONITOR.agc:151
//
// RCS_FAILURE_MONITOR.agc:152
//
// RCS_FAILURE_MONITOR.agc:153
//5FAILTAB	EQUALS	-1		# CH 5 JET BIT CORRESPONDING TO CH 32 BIT:
// RCS_FAILURE_MONITOR.agc:154
//		OCT	00040		# 8
// slot 8867
    8867, 64,
// RCS_FAILURE_MONITOR.agc:155
//		OCT	00020		# 7
// slot 8868
    8868, 32,
// RCS_FAILURE_MONITOR.agc:156
//		OCT	00100		# 6
// slot 8869
    8869, 128,
// RCS_FAILURE_MONITOR.agc:157
//		OCT	00200		# 5
// slot 8870
    8870, 256,
// RCS_FAILURE_MONITOR.agc:158
//		OCT	00010		# 4
// slot 8871
    8871, 16,
// RCS_FAILURE_MONITOR.agc:159
//		OCT	00001		# 3
// slot 8872
    8872, 2,
// RCS_FAILURE_MONITOR.agc:160
//		OCT	00004		# 2
// slot 8873
    8873, 8,
// RCS_FAILURE_MONITOR.agc:161
//		OCT	00002		# 1
// slot 8874
    8874, 4,
// RCS_FAILURE_MONITOR.agc:162
//
// RCS_FAILURE_MONITOR.agc:163
//6FAILTAB	EQUALS	-1		# CH 6 JET BIT CORRESPONDING TO CH 32 BIT:
// RCS_FAILURE_MONITOR.agc:164
//		OCT	00010		# 8
// slot 8875
    8875, 16,
// RCS_FAILURE_MONITOR.agc:165
//		OCT	00020		# 7
// slot 8876
    8876, 32,
// RCS_FAILURE_MONITOR.agc:166
//		OCT	00004		# 6
// slot 8877
    8877, 8,
// RCS_FAILURE_MONITOR.agc:167
//		OCT	00200		# 5
// slot 8878
    8878, 256,
// RCS_FAILURE_MONITOR.agc:168
//		OCT	00001		# 4
// slot 8879
    8879, 2,
// RCS_FAILURE_MONITOR.agc:169
//		OCT	00002		# 3
// slot 8880
    8880, 4,
// RCS_FAILURE_MONITOR.agc:170
//		OCT	00040		# 2
// slot 8881
    8881, 64,
// RCS_FAILURE_MONITOR.agc:171
//		OCT	00100		# 1
// slot 8882
    8882, 128
)).

// no code for the lines below
// RCS_FAILURE_MONITOR.agc:172
//
// RCS_FAILURE_MONITOR.agc:173
//
