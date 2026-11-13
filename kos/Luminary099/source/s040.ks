// PORT: Original source unit LANDING_ANALOG_DISPLAYS.agc.
// PORT: Physical bank 21. Shared continuation entries, slots 19564–19691.
function agcAotUnit1191 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19627 {
        if slot <= 19595 {
            if slot <= 19579 {
                if slot <= 19571 {
                    if slot <= 19567 {
                        if slot <= 19565 {
                            if slot <= 19564 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:1
//# Copyright:	Public domain.
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:2
//# Filename:	LANDING_ANALOG_DISPLAYS.agc
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:3
//# Purpose:	Part of the source code for Luminary, build 099. It
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:4
//#		is part of the source code for the Lunar Module's
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:5
//#		(LM) Apollo Guidance Computer (AGC), Apollo 11.
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:6
//# Assembler:	yaYUL
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:7
//# Reference:	pp. 898-907
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:8
//# Contact:	Ron Burkey <info@sandroid.org>,
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:9
//#  		Fabrizio Bernardini <fabrizio@spacecraft.it>
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:10
//# Website:	http://www.ibiblio.org/apollo.
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:11
//# Mod history:	05/06/09 FB	Transcription Batch 4 Assignment.
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:12
//#
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:13
//# The contents of the "Luminary099" files, in general, are transcribed
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:14
//# from scanned documents.
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:15
//#
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:16
//#	Assemble revision 001 of AGC program Luminary099 by NASA
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:17
//#	2021112-061.  July 14, 1969.
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:18
//#
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:19
//#	Prepared by
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:20
//#			Massachusetts Institute of Technology
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:21
//#			75 Cambridge Parkway
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:22
//#			Cambridge, Massachusetts
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:23
//#
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:24
//#	under NASA contract NAS 9-4065.
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:25
//#
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:26
//# Refer directly to the online document mentioned above for further
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:27
//# information.  Please report any errors to info@sandroid.org.
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:28
//
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:29
//# Page 898
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:30
//		BANK	21
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:31
//		SETLOC	R10
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:32
//		BANK
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:33
//
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:34
//		EBANK=	UNIT/R/
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:35
//		COUNT*	$$/R10
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:36
//
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:37
//LANDISP		LXCH	PIPCTR1		# UPDATE TBASE2 AND PIPCTR SIMULTANEOUSLY.
// PORT: Fixed ROM slots 19564.
                                if slot <> 19564 or instruction <> 10188 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreExchange(words, 1, 972, readPhysical).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:38
//		CS	TIME1
// PORT: Fixed ROM slots 19565.
                                if slot <> 19565 or instruction <> 16405 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 21).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19566 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:39
//		DXCH	TBASE2
// PORT: Fixed ROM slots 19566.
                                if slot <> 19566 or instruction <> 22062 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 558, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:40
//
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:41
//		CS	FLAGWRD7	# IS LANDING ANALOG DISPLAYS FLAG SET?
// PORT: Fixed ROM slots 19567.
                                if slot <> 19567 or instruction <> 16451 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 67).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19569 {
                            if slot <= 19568 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:42
//		MASK	SWANDBIT
// PORT: Fixed ROM slots 19568.
                                if slot <> 19568 or instruction <> 31201 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:43
//		CCS	A
// PORT: Fixed ROM slots 19569.
                                if slot <> 19569 or instruction <> 4096 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19570 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:44
//		TCF	DISPRSET	# NO.
// PORT: Fixed ROM slots 19570.
                                if slot <> 19570 or instruction <> 5675 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5675, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:45
//		CA	IMODES33	# BIT 7 = 0 (DO ALTRATE), =1 (DO ALT.)
// PORT: Fixed ROM slots 19571.
                                if slot <> 19571 or instruction <> 12995 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 707).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19575 {
                        if slot <= 19573 {
                            if slot <= 19572 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:46
//		MASK	BIT7
// PORT: Fixed ROM slots 19572.
                                if slot <> 19572 or instruction <> 31205 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:47
//		CCS	A
// PORT: Fixed ROM slots 19573.
                                if slot <> 19573 or instruction <> 4096 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19574 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:48
//		TCF	ALTOUT
// PORT: Fixed ROM slots 19574.
                                if slot <> 19574 or instruction <> 5280 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5280, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:49
//ALTROUT		TC	DISINDAT	# CHECK MODE SELECT SWITCH AND DIDFLG.
// PORT: Fixed ROM slots 19575.
                                if slot <> 19575 or instruction <> 1236 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1236, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19577 {
                            if slot <= 19576 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:50
//		CS	IMODES33
// PORT: Fixed ROM slots 19576.
                                if slot <> 19576 or instruction <> 17091 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 707).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:51
//		MASK	BIT7
// PORT: Fixed ROM slots 19577.
                                if slot <> 19577 or instruction <> 31205 { return choose false if checkOnly else -1. }
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
                            if slot <= 19578 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:52
//		ADS	IMODES33	# ALTERNATE ALTITUDE RATE WITH ALTITUDE.
// PORT: Fixed ROM slots 19578.
                                if slot <> 19578 or instruction <> 11971 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 707).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:53
//		CAF	BIT2		# RATE COMMAND IS EXECUTED BEFORE RANGE.
// PORT: Fixed ROM slots 19579.
                                if slot <> 19579 or instruction <> 14826 { return choose false if checkOnly else -1. }
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
                }
            } else {
                if slot <= 19587 {
                    if slot <= 19583 {
                        if slot <= 19581 {
                            if slot <= 19580 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:54
//		EXTEND
// PORT: Fixed ROM slots 19580.
                                if slot <> 19580 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:55
//		WOR	CHAN14		# ALTRATE (BIT2 = 1), ALTITUDE (BIT2 = 0).
// PORT: Fixed ROM slots 19581.
                                if slot <> 19581 or instruction <> 2572 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 5, 12, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19582 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:56
//ARCOMP		CA	RUNIT		# COMPUTE ALTRATE=RUNIT.VVECT M/CS *2(-6).
// PORT: Fixed ROM slots 19582.
                                if slot <> 19582 or instruction <> 13283 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 995).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:57
//		EXTEND
// PORT: Fixed ROM slots 19583.
                                if slot <> 19583 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19585 {
                            if slot <= 19584 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:58
//		MP	VVECT		# MULTIPLY X-COMPONENTS.
// PORT: Fixed ROM slots 19584.
                                if slot <> 19584 or instruction <> 29638 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 966, readEffective:call(words, 966)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:59
//		XCH	RUPTREG1	# SAVE SINGLE PRECISION RESULT M/CS*2(-6).
// PORT: Fixed ROM slots 19585.
                                if slot <> 19585 or instruction <> 23608 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreExchange(words, 0, 56, readPhysical).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19586 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:60
//		CA	RUNIT +1	# MULTIPLY Y-COMPONENTS.
// PORT: Fixed ROM slots 19586.
                                if slot <> 19586 or instruction <> 13284 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 996).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:61
//		EXTEND
// PORT: Fixed ROM slots 19587.
                                if slot <> 19587 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19591 {
                        if slot <= 19589 {
                            if slot <= 19588 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:62
//		MP	VVECT +1
// PORT: Fixed ROM slots 19588.
                                if slot <> 19588 or instruction <> 29639 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 967, readEffective:call(words, 967)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:63
//		ADS	RUPTREG1	# ACCUMULATE PARTIAL PRODUCTS.
// PORT: Fixed ROM slots 19589.
                                if slot <> 19589 or instruction <> 11320 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 56).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19590 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:64
//		CA	RUNIT +2	# MULTIPLY Z-COMPONENTS.
// PORT: Fixed ROM slots 19590.
                                if slot <> 19590 or instruction <> 13285 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 997).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:65
//		EXTEND
// PORT: Fixed ROM slots 19591.
                                if slot <> 19591 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19593 {
                            if slot <= 19592 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:66
//		MP	VVECT +2
// PORT: Fixed ROM slots 19592.
                                if slot <> 19592 or instruction <> 29640 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 968, readEffective:call(words, 968)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:67
//		ADS	RUPTREG1	# ALTITUDE RATE IN M/CS *2(-6).
// PORT: Fixed ROM slots 19593.
                                if slot <> 19593 or instruction <> 11320 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 56).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19594 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:68
//		CA	ARCONV		# CONVERT ALTRATE TO BIT UNITS (.5FPS/BIT)
// PORT: Fixed ROM slots 19594.
                                if slot <> 19594 or instruction <> 13312 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1024), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:69
//		EXTEND
// PORT: Fixed ROM slots 19595.
                                if slot <> 19595 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 19611 {
                if slot <= 19603 {
                    if slot <= 19599 {
                        if slot <= 19597 {
                            if slot <= 19596 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:70
//		MP	RUPTREG1
// PORT: Fixed ROM slots 19596.
                                if slot <> 19596 or instruction <> 28728 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 56, readEffective:call(words, 56)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:71
//		DDOUBL
// PORT: Fixed ROM slots 19597.
                                if slot <> 19597 or instruction <> 8193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 1) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19598 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:72
//		DDOUBL
// PORT: Fixed ROM slots 19598.
                                if slot <> 19598 or instruction <> 8193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 1) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:73
//		XCH	RUPTREG1	# ALTITUDE RATE IN BIT UNITS*2(-14).
// PORT: Fixed ROM slots 19599.
                                if slot <> 19599 or instruction <> 23608 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreExchange(words, 0, 56, readPhysical).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19601 {
                            if slot <= 19600 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:74
//		CA	DALTRATE	# ALTITUDE RATE COMPENSATION FACTOR.
// PORT: Fixed ROM slots 19600.
                                if slot <> 19600 or instruction <> 13262 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 974).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:75
//		EXTEND
// PORT: Fixed ROM slots 19601.
                                if slot <> 19601 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19602 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:76
//		MP	DT
// PORT: Fixed ROM slots 19602.
                                if slot <> 19602 or instruction <> 29645 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 973, readEffective:call(words, 973)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:77
//		AD	RUPTREG1
// PORT: Fixed ROM slots 19603.
                                if slot <> 19603 or instruction <> 24632 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 56).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19607 {
                        if slot <= 19605 {
                            if slot <= 19604 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:78
//		TS	ALTRATE		# ALTITUDE RATE IN BIT UNITS*2(-14).
// PORT: Fixed ROM slots 19604.
                                if slot <> 19604 or instruction <> 23497 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23497, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:79
//		CS	ALTRATE
// PORT: Fixed ROM slots 19605.
                                if slot <> 19605 or instruction <> 17353 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 969).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19606 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:80
//# Page 899
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:81
//		EXTEND			# CHECK POLARITY OF ALTITUDE RATE.
// PORT: Fixed ROM slots 19606.
                                if slot <> 19606 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:82
//		BZMF	+2
// PORT: Fixed ROM slots 19607.
                                if slot <> 19607 or instruction <> 25753 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 25753, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19609 {
                            if slot <= 19608 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:83
//		TCF	DATAOUT		# NEGATIVE - SEND POS. PULSES TO ALTM REG.
// PORT: Fixed ROM slots 19608.
                                if slot <> 19608 or instruction <> 5275 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5275, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:84
//		CA	ALTRATE		# POSITIVE OR ZERO - SET SIGN BIT = 1 AND
// PORT: Fixed ROM slots 19609.
                                if slot <> 19609 or instruction <> 13257 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 969).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19610 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:85
//		AD	BIT15		# SEND TO ALTM REGISTER. *DO NOT SEND +0*
// PORT: Fixed ROM slots 19610.
                                if slot <> 19610 or instruction <> 27101 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:86
//DATAOUT		TS	ALTM		# ACTIVATE THE LANDING ANALOG DISPLAYS - -
// PORT: Fixed ROM slots 19611.
                                if slot <> 19611 or instruction <> 22576 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22576, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 19619 {
                    if slot <= 19615 {
                        if slot <= 19613 {
                            if slot <= 19612 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:87
//		CAF	BIT3
// PORT: Fixed ROM slots 19612.
                                if slot <> 19612 or instruction <> 14825 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2537), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:88
//		EXTEND
// PORT: Fixed ROM slots 19613.
                                if slot <> 19613 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19614 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:89
//		WOR	CHAN14		# BIT3 DRIVES THE ALT/ALTRATE METER.
// PORT: Fixed ROM slots 19614.
                                if slot <> 19614 or instruction <> 2572 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 5, 12, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:90
//		TCF	TASKOVER	# EXIT
// PORT: Fixed ROM slots 19615.
                                if slot <> 19615 or instruction <> 6833 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6833, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19617 {
                            if slot <= 19616 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:91
//
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:92
//ALTOUT		TC	DISINDAT	# CHECK MODE SELECT SWITCH AND DIDFLG.
// PORT: Fixed ROM slots 19616.
                                if slot <> 19616 or instruction <> 1236 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 1236, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:93
//		CS	BIT7
// PORT: Fixed ROM slots 19617.
                                if slot <> 19617 or instruction <> 18917 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19618 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:94
//		MASK	IMODES33
// PORT: Fixed ROM slots 19618.
                                if slot <> 19618 or instruction <> 29379 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMASK(words, 707).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:95
//		TS	IMODES33	# ALTERNATE ALTITUDE RATE WITH ALTITUDE.
// PORT: Fixed ROM slots 19619.
                                if slot <> 19619 or instruction <> 23235 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23235, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19623 {
                        if slot <= 19621 {
                            if slot <= 19620 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:96
//		CS	BIT2
// PORT: Fixed ROM slots 19620.
                                if slot <> 19620 or instruction <> 18922 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:97
//		EXTEND
// PORT: Fixed ROM slots 19621.
                                if slot <> 19621 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19622 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:98
//		WAND	CHAN14
// PORT: Fixed ROM slots 19622.
                                if slot <> 19622 or instruction <> 1548 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 3, 12, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:99
//		CCS	ALTBITS		# =-1 IF OLD ALT. DATA TOBE EXTRAPOLATED.
// PORT: Fixed ROM slots 19623.
                                if slot <> 19623 or instruction <> 5089 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 993).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19625 {
                            if slot <= 19624 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:100
//		TCF	+4
// PORT: Fixed ROM slots 19624.
                                if slot <> 19624 or instruction <> 5292 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5292, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:101
//		TCF	+3
// PORT: Fixed ROM slots 19625.
                                if slot <> 19625 or instruction <> 5292 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5292, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19626 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:102
//		TCF	OLDDATA
// PORT: Fixed ROM slots 19626.
                                if slot <> 19626 or instruction <> 5306 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5306, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:103
//		TS	ALTBITS		# SET ALTBITS FROM -0 TO +0.
// PORT: Fixed ROM slots 19627.
                                if slot <> 19627 or instruction <> 23521 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23521, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 19659 {
            if slot <= 19643 {
                if slot <= 19635 {
                    if slot <= 19631 {
                        if slot <= 19629 {
                            if slot <= 19628 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:104
//		CS	ONE
// PORT: Fixed ROM slots 19628.
                                if slot <> 19628 or instruction <> 18923 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:105
//		DXCH	ALTBITS		# SET ALTBITS=-1 FOR SWITCH USE NEXT PASS.
// PORT: Fixed ROM slots 19629.
                                if slot <> 19629 or instruction <> 22498 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 994, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19630 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:106
//		DXCH	ALTSAVE
// PORT: Fixed ROM slots 19630.
                                if slot <> 19630 or instruction <> 22475 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 971, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:107
//		CA	BIT10		# NEW ALTITUDE EXTRAPOLATION WITH ALTRATE.
// PORT: Fixed ROM slots 19631.
                                if slot <> 19631 or instruction <> 14818 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2530), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19633 {
                            if slot <= 19632 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:108
//		XCH	Q
// PORT: Fixed ROM slots 19632.
                                if slot <> 19632 or instruction <> 23554 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreExchange(words, 0, 2, readPhysical).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:109
//		LXCH	7		# ZL
// PORT: Fixed ROM slots 19633.
                                if slot <> 19633 or instruction <> 9223 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreExchange(words, 1, 7, readPhysical).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19634 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:110
//		CA	DT
// PORT: Fixed ROM slots 19634.
                                if slot <> 19634 or instruction <> 13261 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 973).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:111
//		EXTEND
// PORT: Fixed ROM slots 19635.
                                if slot <> 19635 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19639 {
                        if slot <= 19637 {
                            if slot <= 19636 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:112
//		DV	Q		# RESCALE DT*2(-14) TO *2(-9) TIME IN CS.
// PORT: Fixed ROM slots 19636.
                                if slot <> 19636 or instruction <> 4098 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreDv(words, 2, words[2]).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:113
//		EXTEND
// PORT: Fixed ROM slots 19637.
                                if slot <> 19637 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19638 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:114
//		MP	ARTOA2		# .0021322 *2(+8)
// PORT: Fixed ROM slots 19638.
                                if slot <> 19638 or instruction <> 29698 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 1026, readEffective:call(words, 1026)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:115
//		TCF	OLDDATA +1	# RATE APPLIES FOR DT CS.
// PORT: Fixed ROM slots 19639.
                                if slot <> 19639 or instruction <> 5307 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5307, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19641 {
                            if slot <= 19640 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:116
//
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:117
//ZDATA2		DXCH	ALTSAVE
// PORT: Fixed ROM slots 19640.
                                if slot <> 19640 or instruction <> 22475 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    if not agcCoreDoubleExchange(words, "DXCH", 971, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:118
//		TCF	NEWDATA
// PORT: Fixed ROM slots 19641.
                                if slot <> 19641 or instruction <> 5323 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5323, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19642 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:119
//OLDDATA		CA	ARTOA		# RATE APPLIES FOR .5 SEC. (4X/SEC. CYCLE)
// PORT: Fixed ROM slots 19642.
                                if slot <> 19642 or instruction <> 13313 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 1025), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:120
//		EXTEND
// PORT: Fixed ROM slots 19643.
                                if slot <> 19643 or instruction <> 6 { return choose false if checkOnly else -1. }
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
                if slot <= 19651 {
                    if slot <= 19647 {
                        if slot <= 19645 {
                            if slot <= 19644 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:121
//		MP	ALTRATE		# EXTRAPOLATE WITH ALTITUDE RATE.
// PORT: Fixed ROM slots 19644.
                                if slot <> 19644 or instruction <> 29641 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 969, readEffective:call(words, 969)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:122
//		DDOUBL
// PORT: Fixed ROM slots 19645.
                                if slot <> 19645 or instruction <> 8193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 1) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19646 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:123
//		AD	ALTSAVE +1
// PORT: Fixed ROM slots 19646.
                                if slot <> 19646 or instruction <> 25547 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 971).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:124
//		TS	ALTSAVE +1
// PORT: Fixed ROM slots 19647.
                                if slot <> 19647 or instruction <> 23499 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23499, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19649 {
                            if slot <= 19648 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:125
//		CAF	ZERO
// PORT: Fixed ROM slots 19648.
                                if slot <> 19648 or instruction <> 14829 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:126
//		ADS	ALTSAVE
// PORT: Fixed ROM slots 19649.
                                if slot <> 19649 or instruction <> 12234 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 970).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19650 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:127
//		CAF	POSMAX		# FORCE SIGN AGREEMENT ASSUMING A
// PORT: Fixed ROM slots 19650.
                                if slot <> 19650 or instruction <> 14811 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:128
//		AD	ONE		# NON-NEGATIVE ALTSAVE.
// PORT: Fixed ROM slots 19651.
                                if slot <> 19651 or instruction <> 27115 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19655 {
                        if slot <= 19653 {
                            if slot <= 19652 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:129
//		AD	ALTSAVE +1	# IF ALTSAVE IS NEGATIVE, ZERO ALTSAVE
// PORT: Fixed ROM slots 19652.
                                if slot <> 19652 or instruction <> 25547 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 971).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:130
//		TS	ALTSAVE +1	# AND ALTSAVE +1 AT ZERODATA.
// PORT: Fixed ROM slots 19653.
                                if slot <> 19653 or instruction <> 23499 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23499, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19654 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:131
//# Page 900
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:132
//		CAF	ZERO
// PORT: Fixed ROM slots 19654.
                                if slot <> 19654 or instruction <> 14829 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:133
//		AD	POSMAX
// PORT: Fixed ROM slots 19655.
                                if slot <> 19655 or instruction <> 27099 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 2523), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19657 {
                            if slot <= 19656 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:134
//		AD	ALTSAVE
// PORT: Fixed ROM slots 19656.
                                if slot <> 19656 or instruction <> 25546 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 970).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:135
//		TS	ALTSAVE		# POSSIBLY SKIP TO NEWDATA.
// PORT: Fixed ROM slots 19657.
                                if slot <> 19657 or instruction <> 23498 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23498, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19658 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:136
//		TCF	ZERODATA
// PORT: Fixed ROM slots 19658.
                                if slot <> 19658 or instruction <> 5672 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5672, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:137
//NEWDATA		CCS	ALTSAVE +1
// PORT: Fixed ROM slots 19659.
                                if slot <> 19659 or instruction <> 5067 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 971).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 19675 {
                if slot <= 19667 {
                    if slot <= 19663 {
                        if slot <= 19661 {
                            if slot <= 19660 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:138
//		TCF	+4
// PORT: Fixed ROM slots 19660.
                                if slot <> 19660 or instruction <> 5328 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5328, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:139
//		TCF	+3
// PORT: Fixed ROM slots 19661.
                                if slot <> 19661 or instruction <> 5328 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5328, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19662 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:140
//		CAF	ZERO		# SET NEGATIVE ALTSAVE +1 TO +0.
// PORT: Fixed ROM slots 19662.
                                if slot <> 19662 or instruction <> 14829 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:141
//		TS	ALTSAVE +1
// PORT: Fixed ROM slots 19663.
                                if slot <> 19663 or instruction <> 23499 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23499, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19665 {
                            if slot <= 19664 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:142
//		CCS	ALTSAVE		# PROVIDE A 15 BIT UNSIGNED OUTPUT.
// PORT: Fixed ROM slots 19664.
                                if slot <> 19664 or instruction <> 5066 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 970).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:143
//		CAF	BIT15		# THE HI-ORDER PART IS +1 OR +0.
// PORT: Fixed ROM slots 19665.
                                if slot <> 19665 or instruction <> 14813 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2525), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19666 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:144
//		AD	ALTSAVE +1
// PORT: Fixed ROM slots 19666.
                                if slot <> 19666 or instruction <> 25547 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 971).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:145
//		TCF	DATAOUT		# DISPATCH UNSIGNED BITS TO ALTM REG.
// PORT: Fixed ROM slots 19667.
                                if slot <> 19667 or instruction <> 5275 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5275, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19671 {
                        if slot <= 19669 {
                            if slot <= 19668 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:146
//DISINDAT	EXTEND
// PORT: Fixed ROM slots 19668.
                                if slot <> 19668 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:147
//		QXCH	LADQSAVE	# SAVE RETURN TO ALTROUT +1 OR ALTOUT +1
// PORT: Fixed ROM slots 19669.
                                if slot <> 19669 or instruction <> 10188 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreExchange(words, 2, 972, readPhysical).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19670 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:148
//		CAF	BIT6
// PORT: Fixed ROM slots 19670.
                                if slot <> 19670 or instruction <> 14822 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2534), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:149
//		EXTEND			# WISHETH THE ASTRONAUT THE ANALOG
// PORT: Fixed ROM slots 19671.
                                if slot <> 19671 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19673 {
                            if slot <= 19672 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:150
//		RAND	CHAN30		# DISPLAYS?  I.E.,
// PORT: Fixed ROM slots 19672.
                                if slot <> 19672 or instruction <> 1048 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 2, 24, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:151
//		CCS	A		# IS THE MODE SELECT SWITCH IN PGNCS?
// PORT: Fixed ROM slots 19673.
                                if slot <> 19673 or instruction <> 4096 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19674 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:152
//		TCF	DISPRSET	# NO.  ASTRONAUT REQUESTS NO INERTIAL DATA
// PORT: Fixed ROM slots 19674.
                                if slot <> 19674 or instruction <> 5675 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5675, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:153
//		CS	FLAGWRD1	# YES. CHECK STATUS OF DIDFLAG.
// PORT: Fixed ROM slots 19675.
                                if slot <> 19675 or instruction <> 16445 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 61).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 19683 {
                    if slot <= 19679 {
                        if slot <= 19677 {
                            if slot <= 19676 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:154
//		MASK	DIDFLBIT
// PORT: Fixed ROM slots 19676.
                                if slot <> 19676 or instruction <> 31198 { return choose false if checkOnly else -1. }
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
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:155
//		EXTEND
// PORT: Fixed ROM slots 19677.
                                if slot <> 19677 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19678 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:156
//		BZF	SPEEDRUN	# SET. PERFORM DATA DISPLAY SEQUENCE.
// PORT: Fixed ROM slots 19678.
                                if slot <> 19678 or instruction <> 5372 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5372, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:157
//		CS	FLAGWRD1	# RESET. PERFORM INITIALIZATION FUNCTIONS.
// PORT: Fixed ROM slots 19679.
                                if slot <> 19679 or instruction <> 16445 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 61).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19681 {
                            if slot <= 19680 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:158
//		MASK	DIDFLBIT
// PORT: Fixed ROM slots 19680.
                                if slot <> 19680 or instruction <> 31198 { return choose false if checkOnly else -1. }
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
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:159
//		ADS	FLAGWRD1	# SET DIDFLAG.
// PORT: Fixed ROM slots 19681.
                                if slot <> 19681 or instruction <> 11325 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 61).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19682 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:160
//		CS	BIT7
// PORT: Fixed ROM slots 19682.
                                if slot <> 19682 or instruction <> 18917 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local fixedOperand is mod(readEffective:call(words, 2533), 32768).
                                    set words[0] to agcSignExtend(32767 - fixedOperand).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:161
//		MASK	IMODES33	# TO DISPLAY ALTRATE FIRST AND ALT. SECOND
// PORT: Fixed ROM slots 19683.
                                if slot <> 19683 or instruction <> 29379 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMASK(words, 707).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19687 {
                        if slot <= 19685 {
                            if slot <= 19684 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:162
//		TS	IMODES33
// PORT: Fixed ROM slots 19684.
                                if slot <> 19684 or instruction <> 23235 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 23235, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:163
//		CS	FLAGWRD0	# ARE WE IN DESCENT TRAJECTORY?
// PORT: Fixed ROM slots 19685.
                                if slot <> 19685 or instruction <> 16444 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 60).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19686 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:164
//		MASK	R10FLBIT
// PORT: Fixed ROM slots 19686.
                                if slot <> 19686 or instruction <> 31210 { return choose false if checkOnly else -1. }
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
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:165
//		EXTEND
// PORT: Fixed ROM slots 19687.
                                if slot <> 19687 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19689 {
                            if slot <= 19688 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:166
//		BZF	TASKOVER	# NO
// PORT: Fixed ROM slots 19688.
                                if slot <> 19688 or instruction <> 6833 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6833, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:167
//		CAF	BIT8		# YES.
// PORT: Fixed ROM slots 19689.
                                if slot <> 19689 or instruction <> 14820 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19690 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:168
//		EXTEND
// PORT: Fixed ROM slots 19690.
                                if slot <> 19690 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:169
//		WOR	CHAN12		# SET DISPLAY INERTIAL DATA OUTBIT.
// PORT: Fixed ROM slots 19691.
                                if slot <> 19691 or instruction <> 2570 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
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
set agcAotRoutes[1191] to agcAotUnit1191@.

// PORT: Physical bank 21. Shared continuation entries, slots 19692–19698.
function agcAotUnit1192 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19694 {
        if slot <= 19692 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:170
//		CAF	ZERO
// PORT: Fixed ROM slots 19692.
            if slot <> 19692 or instruction <> 14829 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 2541), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 19693 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:171
//		TS	TRAKLATV	# LATERAL VELOCITY MONITOR FLAG
// PORT: Fixed ROM slots 19693.
                if slot <> 19693 or instruction <> 23490 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23490, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:172
//		TS	TRAKFWDV	# FORWARD VELOCITY MONITOR FLAG
// PORT: Fixed ROM slots 19694.
                if slot <> 19694 or instruction <> 23491 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23491, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 19696 {
            if slot <= 19695 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:173
//		TS	LATVMETR	# LATVEL MONITOR METER
// PORT: Fixed ROM slots 19695.
                if slot <> 19695 or instruction <> 23486 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23486, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:174
//		TS	FORVMETR	# FORVEL MONITOR METER
// PORT: Fixed ROM slots 19696.
                if slot <> 19696 or instruction <> 23487 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23487, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 19697 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:175
//		CAF	BIT4
// PORT: Fixed ROM slots 19697.
                if slot <> 19697 or instruction <> 14824 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2536), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:176
//		TC	TWIDDLE
// PORT: Fixed ROM slots 19698.
                if slot <> 19698 or instruction <> 2683 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2683, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1192] to agcAotUnit1192@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:177
//		ADRES	INTLZE
// PORT: Fixed ROM slots 19699.
    19699, 2538
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19700–19820.
function agcAotUnit1193 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19759 {
        if slot <= 19729 {
            if slot <= 19714 {
                if slot <= 19706 {
                    if slot <= 19702 {
                        if slot <= 19700 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:178
//		TCF	TASKOVER
// PORT: Fixed ROM slots 19700.
                            if slot <> 19700 or instruction <> 6833 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6833, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19701 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:179
//INTLZE		CAF	BIT2
// PORT: Fixed ROM slots 19701.
                                if slot <> 19701 or instruction <> 14826 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2538), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:180
//		EXTEND
// PORT: Fixed ROM slots 19702.
                                if slot <> 19702 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19704 {
                            if slot <= 19703 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:181
//		WOR	CHAN12		# ENABLE RR ERROR COUNTER.
// PORT: Fixed ROM slots 19703.
                                if slot <> 19703 or instruction <> 2570 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreChannelInstruction(words, 5, 10, channelAdapter).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:182
//# Page 901
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:183
//		CS	IMODES33
// PORT: Fixed ROM slots 19704.
                                if slot <> 19704 or instruction <> 17091 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 707).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19705 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:184
//		MASK	BIT8
// PORT: Fixed ROM slots 19705.
                                if slot <> 19705 or instruction <> 31204 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    set words[0] to agcOverflowCorrected(words[0]).
                                    local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                                    if fixedOperand = 128 {
                                        set words[0] to agcSignExtend(mod(floor(words[0] / 128), 2) * 128).
                                    } else {
                                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                                    }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:185
//		ADS	IMODES33	# SET INERTIAL DATA FLAG.
// PORT: Fixed ROM slots 19706.
                                if slot <> 19706 or instruction <> 11971 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 707).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19710 {
                        if slot <= 19708 {
                            if slot <= 19707 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:186
//		TCF	TASKOVER
// PORT: Fixed ROM slots 19707.
                                if slot <> 19707 or instruction <> 6833 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6833, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:187
//
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:188
//SPEEDRUN	CS	PIPTIME +1	# UPDATE THE VELOCITY VECTOR
// PORT: Fixed ROM slots 19708.
                                if slot <> 19708 or instruction <> 17053 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 669).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19709 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:189
//		AD	TIME1		# COMPUTE T - TN
// PORT: Fixed ROM slots 19709.
                                if slot <> 19709 or instruction <> 24597 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 21).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:190
//		AD	HALF		# CORRECT FOR POSSIBLE OVERFLOW OF TIME1.
// PORT: Fixed ROM slots 19710.
                                if slot <> 19710 or instruction <> 27102 { return choose false if checkOnly else -1. }
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
                        if slot <= 19712 {
                            if slot <= 19711 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:191
//		AD	HALF
// PORT: Fixed ROM slots 19711.
                                if slot <> 19711 or instruction <> 27102 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local entryA is words[0].
                                    local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:192
//		XCH	DT		# SAVE FOR LATER USE
// PORT: Fixed ROM slots 19712.
                                if slot <> 19712 or instruction <> 24525 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreExchange(words, 0, 973, readPhysical).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19713 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:193
//		CA	1SEC
// PORT: Fixed ROM slots 19713.
                                if slot <> 19713 or instruction <> 14847 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2559), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:194
//		TS	ITEMP5		# INITIALIZE FOR DIVISION LATER
// PORT: Fixed ROM slots 19714.
                                if slot <> 19714 or instruction <> 22581 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22581, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 19721 {
                    if slot <= 19717 {
                        if slot <= 19715 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:195
//		EXTEND
// PORT: Fixed ROM slots 19715.
                            if slot <> 19715 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19716 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:196
//		DCA	GDT/2		# COMPUTE THE X-COMPONENT OF VELOCITY.
// PORT: Fixed ROM slots 19716.
                                if slot <> 19716 or instruction <> 12959 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 671, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:197
//		DDOUBL
// PORT: Fixed ROM slots 19717.
                                if slot <> 19717 or instruction <> 8193 { return choose false if checkOnly else -1. }
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
                        if slot <= 19719 {
                            if slot <= 19718 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:198
//		DDOUBL
// PORT: Fixed ROM slots 19718.
                                if slot <> 19718 or instruction <> 8193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 1) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:199
//		EXTEND
// PORT: Fixed ROM slots 19719.
                                if slot <> 19719 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19720 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:200
//		MP	DT
// PORT: Fixed ROM slots 19720.
                                if slot <> 19720 or instruction <> 29645 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 973, readEffective:call(words, 973)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:201
//		EXTEND
// PORT: Fixed ROM slots 19721.
                                if slot <> 19721 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19725 {
                        if slot <= 19723 {
                            if slot <= 19722 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:202
//		DV	ITEMP5
// PORT: Fixed ROM slots 19722.
                                if slot <> 19722 or instruction <> 4149 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreDv(words, 53, readEffective:call(words, 53)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:203
//		XCH	VVECT		# VVECT = G(T-TN) M/CS *2(-5)
// PORT: Fixed ROM slots 19723.
                                if slot <> 19723 or instruction <> 24518 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreExchange(words, 0, 966, readPhysical).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19724 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:204
//		EXTEND
// PORT: Fixed ROM slots 19724.
                                if slot <> 19724 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:205
//		DCA	V		# M/CS *2(-7)
// PORT: Fixed ROM slots 19725.
                                if slot <> 19725 or instruction <> 13143 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 855, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19727 {
                            if slot <= 19726 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:206
//		DDOUBL			# RESCALE TO 2(-5)
// PORT: Fixed ROM slots 19726.
                                if slot <> 19726 or instruction <> 8193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 1) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:207
//		DDOUBL
// PORT: Fixed ROM slots 19727.
                                if slot <> 19727 or instruction <> 8193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 1) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19728 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:208
//		ADS	VVECT		# VVECT = VN + G(T-TN) M/CS *2(-5)
// PORT: Fixed ROM slots 19728.
                                if slot <> 19728 or instruction <> 12230 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 966).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:209
//		CA	PIPAX		# DELV CM/SEC *2(-14)
// PORT: Fixed ROM slots 19729.
                                if slot <> 19729 or instruction <> 12319 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 31).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 19744 {
                if slot <= 19736 {
                    if slot <= 19732 {
                        if slot <= 19730 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:210
//		AD	PIPATMPX	# IN CASE PIPAX HAS BEEN ZEROED
// PORT: Fixed ROM slots 19730.
                            if slot <> 19730 or instruction <> 25200 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreAD(words, 624).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19731 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:211
//		EXTEND
// PORT: Fixed ROM slots 19731.
                                if slot <> 19731 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:212
//		MP	KPIP1(5)	# DELV M/CS *2(-5)
// PORT: Fixed ROM slots 19732.
                                if slot <> 19732 or instruction <> 29700 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 1028, readEffective:call(words, 1028)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19734 {
                            if slot <= 19733 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:213
//		ADS	VVECT		# VVECT = VN + DELV + GN(T-TN) M/CS *2(-5)
// PORT: Fixed ROM slots 19733.
                                if slot <> 19733 or instruction <> 12230 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 966).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:214
//		EXTEND
// PORT: Fixed ROM slots 19734.
                                if slot <> 19734 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19735 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:215
//		DCA	GDT/2 +2	# COMPUTE THE Y-COMPONENT OF VELOCITY.
// PORT: Fixed ROM slots 19735.
                                if slot <> 19735 or instruction <> 12961 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 673, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:216
//		DDOUBL
// PORT: Fixed ROM slots 19736.
                                if slot <> 19736 or instruction <> 8193 { return choose false if checkOnly else -1. }
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
                } else {
                    if slot <= 19740 {
                        if slot <= 19738 {
                            if slot <= 19737 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:217
//		DDOUBL
// PORT: Fixed ROM slots 19737.
                                if slot <> 19737 or instruction <> 8193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 1) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:218
//		EXTEND
// PORT: Fixed ROM slots 19738.
                                if slot <> 19738 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19739 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:219
//		MP	DT
// PORT: Fixed ROM slots 19739.
                                if slot <> 19739 or instruction <> 29645 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 973, readEffective:call(words, 973)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:220
//		EXTEND
// PORT: Fixed ROM slots 19740.
                                if slot <> 19740 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19742 {
                            if slot <= 19741 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:221
//		DV	ITEMP5
// PORT: Fixed ROM slots 19741.
                                if slot <> 19741 or instruction <> 4149 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreDv(words, 53, readEffective:call(words, 53)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:222
//		XCH	VVECT +1
// PORT: Fixed ROM slots 19742.
                                if slot <> 19742 or instruction <> 24519 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreExchange(words, 0, 967, readPhysical).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19743 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:223
//		EXTEND
// PORT: Fixed ROM slots 19743.
                                if slot <> 19743 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:224
//		DCA	V +2
// PORT: Fixed ROM slots 19744.
                                if slot <> 19744 or instruction <> 13145 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 857, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 19751 {
                    if slot <= 19747 {
                        if slot <= 19745 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:225
//		DDOUBL
// PORT: Fixed ROM slots 19745.
                            if slot <> 19745 or instruction <> 8193 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 1) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19746 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:226
//		DDOUBL
// PORT: Fixed ROM slots 19746.
                                if slot <> 19746 or instruction <> 8193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 1) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:227
//		ADS	VVECT +1
// PORT: Fixed ROM slots 19747.
                                if slot <> 19747 or instruction <> 12231 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 967).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19749 {
                            if slot <= 19748 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:228
//		CA	PIPAY
// PORT: Fixed ROM slots 19748.
                                if slot <> 19748 or instruction <> 12320 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 32).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:229
//		AD	PIPATMPY
// PORT: Fixed ROM slots 19749.
                                if slot <> 19749 or instruction <> 25201 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 625).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19750 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:230
//		EXTEND
// PORT: Fixed ROM slots 19750.
                                if slot <> 19750 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:231
//		MP	KPIP1(5)
// PORT: Fixed ROM slots 19751.
                                if slot <> 19751 or instruction <> 29700 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 1028, readEffective:call(words, 1028)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19755 {
                        if slot <= 19753 {
                            if slot <= 19752 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:232
//		ADS	VVECT +1
// PORT: Fixed ROM slots 19752.
                                if slot <> 19752 or instruction <> 12231 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 967).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:233
//# Page 902
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:234
//		EXTEND
// PORT: Fixed ROM slots 19753.
                                if slot <> 19753 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19754 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:235
//		DCA	GDT/2 +4	# COMPUTE THE Z-COMPONENT OF VELOCITY.
// PORT: Fixed ROM slots 19754.
                                if slot <> 19754 or instruction <> 12963 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 675, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:236
//		DDOUBL
// PORT: Fixed ROM slots 19755.
                                if slot <> 19755 or instruction <> 8193 { return choose false if checkOnly else -1. }
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
                        if slot <= 19757 {
                            if slot <= 19756 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:237
//		DDOUBL
// PORT: Fixed ROM slots 19756.
                                if slot <> 19756 or instruction <> 8193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 1) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:238
//		EXTEND
// PORT: Fixed ROM slots 19757.
                                if slot <> 19757 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19758 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:239
//		MP	DT
// PORT: Fixed ROM slots 19758.
                                if slot <> 19758 or instruction <> 29645 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 973, readEffective:call(words, 973)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:240
//		EXTEND
// PORT: Fixed ROM slots 19759.
                                if slot <> 19759 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 19789 {
            if slot <= 19774 {
                if slot <= 19766 {
                    if slot <= 19762 {
                        if slot <= 19760 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:241
//		DV	ITEMP5
// PORT: Fixed ROM slots 19760.
                            if slot <> 19760 or instruction <> 4149 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreDv(words, 53, readEffective:call(words, 53)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19761 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:242
//		XCH	VVECT +2
// PORT: Fixed ROM slots 19761.
                                if slot <> 19761 or instruction <> 24520 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreExchange(words, 0, 968, readPhysical).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:243
//		EXTEND
// PORT: Fixed ROM slots 19762.
                                if slot <> 19762 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19764 {
                            if slot <= 19763 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:244
//		DCA	V +4
// PORT: Fixed ROM slots 19763.
                                if slot <> 19763 or instruction <> 13147 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDoubleExchange(words, "DCA", 859, readPhysical, readAdjacent) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:245
//		DDOUBL
// PORT: Fixed ROM slots 19764.
                                if slot <> 19764 or instruction <> 8193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 1) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19765 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:246
//		DDOUBL
// PORT: Fixed ROM slots 19765.
                                if slot <> 19765 or instruction <> 8193 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    if not agcCoreDas(words, 1) { return -1. }
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:247
//		ADS	VVECT +2
// PORT: Fixed ROM slots 19766.
                                if slot <> 19766 or instruction <> 12232 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 968).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19770 {
                        if slot <= 19768 {
                            if slot <= 19767 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:248
//		CA	PIPAZ
// PORT: Fixed ROM slots 19767.
                                if slot <> 19767 or instruction <> 12321 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 33).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:249
//		AD	PIPATMPZ
// PORT: Fixed ROM slots 19768.
                                if slot <> 19768 or instruction <> 25202 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 626).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19769 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:250
//		EXTEND
// PORT: Fixed ROM slots 19769.
                                if slot <> 19769 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:251
//		MP	KPIP1(5)
// PORT: Fixed ROM slots 19770.
                                if slot <> 19770 or instruction <> 29700 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 1028, readEffective:call(words, 1028)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19772 {
                            if slot <= 19771 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:252
//		ADS	VVECT +2
// PORT: Fixed ROM slots 19771.
                                if slot <> 19771 or instruction <> 12232 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 968).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:253
//
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:254
//		CAF	BIT3		# PAUSE 40 MS TO LET OTHER RUPTS IN.
// PORT: Fixed ROM slots 19772.
                                if slot <> 19772 or instruction <> 14825 { return choose false if checkOnly else -1. }
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
                            if slot <= 19773 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:255
//		TC	VARDELAY
// PORT: Fixed ROM slots 19773.
                                if slot <> 19773 or instruction <> 2708 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 2708, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:256
//
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:257
//		CS	FLAGWRD0	# ARE WE IN DESCENT TRAJECTORY?
// PORT: Fixed ROM slots 19774.
                                if slot <> 19774 or instruction <> 16444 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreCS(words, 60).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            } else {
                if slot <= 19781 {
                    if slot <= 19777 {
                        if slot <= 19775 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:258
//		MASK	R10FLBIT
// PORT: Fixed ROM slots 19775.
                            if slot <> 19775 or instruction <> 31210 { return choose false if checkOnly else -1. }
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
                        } else {
                            if slot <= 19776 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:259
//		CCS	A
// PORT: Fixed ROM slots 19776.
                                if slot <> 19776 or instruction <> 4096 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCCS(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:260
//		TCF	+2		# YES.
// PORT: Fixed ROM slots 19777.
                                if slot <> 19777 or instruction <> 5443 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 5443, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19779 {
                            if slot <= 19778 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:261
//		TC	LADQSAVE	# NO.
// PORT: Fixed ROM slots 19778.
                                if slot <> 19778 or instruction <> 972 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 972, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:262
//
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:263
//		CA	DELVS		# HI X OF VELOCITY CORRECTION TERM.
// PORT: Fixed ROM slots 19779.
                                if slot <> 19779 or instruction <> 13275 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 987).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19780 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:264
//		AD	VVECT		# HI X OF UPDATED VELOCITY VECTOR.
// PORT: Fixed ROM slots 19780.
                                if slot <> 19780 or instruction <> 25542 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 966).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:265
//		TS	ITEMP1		# = VX - DVX M/CS*2(-5).
// PORT: Fixed ROM slots 19781.
                                if slot <> 19781 or instruction <> 22577 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22577, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19785 {
                        if slot <= 19783 {
                            if slot <= 19782 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:266
//		CA	DELVS +2	#    Y
// PORT: Fixed ROM slots 19782.
                                if slot <> 19782 or instruction <> 13277 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 989).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:267
//		AD	VVECT +1	#    Y
// PORT: Fixed ROM slots 19783.
                                if slot <> 19783 or instruction <> 25543 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 967).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19784 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:268
//		TS	ITEMP2		# = VY - DVY M/CS*2(-5).
// PORT: Fixed ROM slots 19784.
                                if slot <> 19784 or instruction <> 22578 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22578, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:269
//		CA	DELVS +4	#    Z
// PORT: Fixed ROM slots 19785.
                                if slot <> 19785 or instruction <> 13279 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 991).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19787 {
                            if slot <= 19786 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:270
//		AD	VVECT +2	#    Z
// PORT: Fixed ROM slots 19786.
                                if slot <> 19786 or instruction <> 25544 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 968).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:271
//		TS	ITEMP3		# = VZ - DVZ M/CS*2(-5).
// PORT: Fixed ROM slots 19787.
                                if slot <> 19787 or instruction <> 22579 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22579, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19788 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:272
//		CA	ITEMP1		# COMPUTE VHY, VELOCITY DIRECTED ALONG THE
// PORT: Fixed ROM slots 19788.
                                if slot <> 19788 or instruction <> 12337 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 49).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:273
//		EXTEND			# Y-COORDINATE.
// PORT: Fixed ROM slots 19789.
                                if slot <> 19789 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 19804 {
                if slot <= 19796 {
                    if slot <= 19792 {
                        if slot <= 19790 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:274
//		MP	UHYP		# HI X OF CROSS-RANGE HALF-UNIT VECTOR.
// PORT: Fixed ROM slots 19790.
                            if slot <> 19790 or instruction <> 29647 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 975, readEffective:call(words, 975)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
                            if slot <= 19791 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:275
//		XCH	RUPTREG1
// PORT: Fixed ROM slots 19791.
                                if slot <> 19791 or instruction <> 23608 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreExchange(words, 0, 56, readPhysical).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:276
//		CA	ITEMP2
// PORT: Fixed ROM slots 19792.
                                if slot <> 19792 or instruction <> 12338 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 50).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19794 {
                            if slot <= 19793 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:277
//		EXTEND
// PORT: Fixed ROM slots 19793.
                                if slot <> 19793 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:278
//		MP	UHYP +2		#    Y
// PORT: Fixed ROM slots 19794.
                                if slot <> 19794 or instruction <> 29649 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 977, readEffective:call(words, 977)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19795 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:279
//		ADS	RUPTREG1	# ACCUMULATE PARTIAL PRODUCTS.
// PORT: Fixed ROM slots 19795.
                                if slot <> 19795 or instruction <> 11320 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 56).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:280
//		CA	ITEMP3
// PORT: Fixed ROM slots 19796.
                                if slot <> 19796 or instruction <> 12339 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 51).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19800 {
                        if slot <= 19798 {
                            if slot <= 19797 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:281
//		EXTEND
// PORT: Fixed ROM slots 19797.
                                if slot <> 19797 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:282
//		MP	UHYP +4		#    Z
// PORT: Fixed ROM slots 19798.
                                if slot <> 19798 or instruction <> 29651 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 979, readEffective:call(words, 979)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19799 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:283
//		ADS	RUPTREG1
// PORT: Fixed ROM slots 19799.
                                if slot <> 19799 or instruction <> 11320 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 56).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:284
//# Page 903
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:285
//		CA	RUPTREG1
// PORT: Fixed ROM slots 19800.
                                if slot <> 19800 or instruction <> 12344 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 56).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19802 {
                            if slot <= 19801 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:286
//		DOUBLE
// PORT: Fixed ROM slots 19801.
                                if slot <> 19801 or instruction <> 24576 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreAD(words, 0).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:287
//		XCH	VHY		# VHY=VMP.UHYP M/CS*2(-5).
// PORT: Fixed ROM slots 19802.
                                if slot <> 19802 or instruction <> 24516 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreExchange(words, 0, 964, readPhysical).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19803 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:288
//		CA	ITEMP1		# NO COMPUTE VHZ, VELOCITY DIRECTED ALONG
// PORT: Fixed ROM slots 19803.
                                if slot <> 19803 or instruction <> 12337 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 49).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:289
//		EXTEND			# THE Z-COORDINATE.
// PORT: Fixed ROM slots 19804.
                                if slot <> 19804 or instruction <> 6 { return choose false if checkOnly else -1. }
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
                if slot <= 19812 {
                    if slot <= 19808 {
                        if slot <= 19806 {
                            if slot <= 19805 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:290
//		MP	UHZP		# HI X OF DOWN-RANGE HALF-UNIT VECTOR.
// PORT: Fixed ROM slots 19805.
                                if slot <> 19805 or instruction <> 29653 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 981, readEffective:call(words, 981)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:291
//		XCH	RUPTREG1
// PORT: Fixed ROM slots 19806.
                                if slot <> 19806 or instruction <> 23608 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreExchange(words, 0, 56, readPhysical).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19807 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:292
//		CA	ITEMP2
// PORT: Fixed ROM slots 19807.
                                if slot <> 19807 or instruction <> 12338 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 50).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:293
//		EXTEND
// PORT: Fixed ROM slots 19808.
                                if slot <> 19808 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    } else {
                        if slot <= 19810 {
                            if slot <= 19809 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:294
//		MP	UHZP +2		#    Y
// PORT: Fixed ROM slots 19809.
                                if slot <> 19809 or instruction <> 29655 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 983, readEffective:call(words, 983)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:295
//		ADS	RUPTREG1	# ACCUMULATE PARTIAL PRODUCTS.
// PORT: Fixed ROM slots 19810.
                                if slot <> 19810 or instruction <> 11320 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 56).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19811 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:296
//		CA	ITEMP3
// PORT: Fixed ROM slots 19811.
                                if slot <> 19811 or instruction <> 12339 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 51).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:297
//		EXTEND
// PORT: Fixed ROM slots 19812.
                                if slot <> 19812 or instruction <> 6 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            }
                        }
                    }
                } else {
                    if slot <= 19816 {
                        if slot <= 19814 {
                            if slot <= 19813 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:298
//		MP	UHZP +4		#    Z
// PORT: Fixed ROM slots 19813.
                                if slot <> 19813 or instruction <> 29657 { return choose false if checkOnly else -1. }
                                if extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreMp(words, 985, readEffective:call(words, 985)).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:299
//		ADS	RUPTREG1
// PORT: Fixed ROM slots 19814.
                                if slot <> 19814 or instruction <> 11320 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreADS(words, 56).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19815 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:300
//		CA	RUPTREG1
// PORT: Fixed ROM slots 19815.
                                if slot <> 19815 or instruction <> 12344 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 56).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:301
//		DOUBLE
// PORT: Fixed ROM slots 19816.
                                if slot <> 19816 or instruction <> 24576 { return choose false if checkOnly else -1. }
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
                        if slot <= 19818 {
                            if slot <= 19817 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:302
//		XCH	VHZ		# VHZ = VMP.UHZP M/CS*2(-5).
// PORT: Fixed ROM slots 19817.
                                if slot <> 19817 or instruction <> 24517 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    agcCoreExchange(words, 0, 965, readPhysical).
                                    return list(false, false, true, false, false).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:303
//GET22/32	CAF	EBANK6		# GET SIN(AOG),COS(AOG) FROM GPMATRIX.
// PORT: Fixed ROM slots 19818.
                                if slot <> 19818 or instruction <> 14861 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    local fixedOperand is mod(readEffective:call(words, 2573), 32768).
                                    set words[0] to agcSignExtend(fixedOperand).
                                    return list(false, false, inheritedTransient, false, false).
                                }
                                return choose false if checkOnly else -1.
                            }
                        } else {
                            if slot <= 19819 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:304
//		TS	EBANK
// PORT: Fixed ROM slots 19819.
                                if slot <> 19819 or instruction <> 22531 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    return agcCoreControlExecute(words, 22531, words[0], readEffective).
                                }
                                return choose false if checkOnly else -1.
                            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:305
//		EBANK=	M22
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:306
//		CA	M22
// PORT: Fixed ROM slots 19820.
                                if slot <> 19820 or instruction <> 13071 { return choose false if checkOnly else -1. }
                                if not extended {
                                    if checkOnly { return true. }
                                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                    agcCoreCA(words, 783).
                                    return list(false, false, inheritedTransient, false, false).
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
set agcAotRoutes[1193] to agcAotUnit1193@.

// PORT: Physical bank 21. Shared continuation entries, slots 19821–19857.
function agcAotUnit1194 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19838 {
        if slot <= 19829 {
            if slot <= 19824 {
                if slot <= 19822 {
                    if slot <= 19821 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:307
//		TS	ITEMP3
// PORT: Fixed ROM slots 19821.
                        if slot <> 19821 or instruction <> 22579 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22579, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:308
//		CA	M32
// PORT: Fixed ROM slots 19822.
                        if slot <> 19822 or instruction <> 13072 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 784).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19823 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:309
//		TS	ITEMP4
// PORT: Fixed ROM slots 19823.
                        if slot <> 19823 or instruction <> 22580 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22580, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:310
//		CAF	EBANK7
// PORT: Fixed ROM slots 19824.
                        if slot <> 19824 or instruction <> 14862 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2574), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19826 {
                    if slot <= 19825 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:311
//		TS	EBANK
// PORT: Fixed ROM slots 19825.
                        if slot <> 19825 or instruction <> 22531 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22531, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:312
//		EBANK=	UNIT/R/
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:313
//LATFWDV		CA	ITEMP4		# COMPUTE LATERAL AND FORWARD VELOCITIES.
// PORT: Fixed ROM slots 19826.
                        if slot <> 19826 or instruction <> 12340 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 52).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19827 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:314
//		EXTEND
// PORT: Fixed ROM slots 19827.
                        if slot <> 19827 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19828 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:315
//		MP	VHY
// PORT: Fixed ROM slots 19828.
                            if slot <> 19828 or instruction <> 29636 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreMp(words, 964, readEffective:call(words, 964)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:316
//		XCH	RUPTREG1
// PORT: Fixed ROM slots 19829.
                            if slot <> 19829 or instruction <> 23608 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 56, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 19833 {
                if slot <= 19831 {
                    if slot <= 19830 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:317
//		CA	ITEMP3
// PORT: Fixed ROM slots 19830.
                        if slot <> 19830 or instruction <> 12339 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 51).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:318
//		EXTEND
// PORT: Fixed ROM slots 19831.
                        if slot <> 19831 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19832 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:319
//		MP	VHZ
// PORT: Fixed ROM slots 19832.
                        if slot <> 19832 or instruction <> 29637 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 965, readEffective:call(words, 965)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:320
//		ADS	RUPTREG1	# =VHY(COS)AOG+VHZ(SIN)AOG M/CS *2(-5)
// PORT: Fixed ROM slots 19833.
                        if slot <> 19833 or instruction <> 11320 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreADS(words, 56).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19835 {
                    if slot <= 19834 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:321
//		CA	VELCONV		# CONVERT LATERAL VELOCITY TO BIT UNITS.
// PORT: Fixed ROM slots 19834.
                        if slot <> 19834 or instruction <> 13315 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1027), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:322
//		EXTEND
// PORT: Fixed ROM slots 19835.
                        if slot <> 19835 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19836 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:323
//		MP	RUPTREG1
// PORT: Fixed ROM slots 19836.
                        if slot <> 19836 or instruction <> 28728 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 56, readEffective:call(words, 56)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19837 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:324
//		DDOUBL
// PORT: Fixed ROM slots 19837.
                            if slot <> 19837 or instruction <> 8193 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 1) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:325
//		XCH	LATVEL		# LATERAL VELOCITY IN BIT UNITS *2(-14).
// PORT: Fixed ROM slots 19838.
                            if slot <> 19838 or instruction <> 24512 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 960, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 19847 {
            if slot <= 19842 {
                if slot <= 19840 {
                    if slot <= 19839 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:326
//		CA	ITEMP4		# COMPUTE FORWARD VELOCITY.
// PORT: Fixed ROM slots 19839.
                        if slot <> 19839 or instruction <> 12340 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 52).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:327
//		EXTEND
// PORT: Fixed ROM slots 19840.
                        if slot <> 19840 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19841 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:328
//		MP	VHZ
// PORT: Fixed ROM slots 19841.
                        if slot <> 19841 or instruction <> 29637 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 965, readEffective:call(words, 965)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:329
//		XCH	RUPTREG1
// PORT: Fixed ROM slots 19842.
                        if slot <> 19842 or instruction <> 23608 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 56, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 19844 {
                    if slot <= 19843 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:330
//		CA	ITEMP3
// PORT: Fixed ROM slots 19843.
                        if slot <> 19843 or instruction <> 12339 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCA(words, 51).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:331
//		EXTEND
// PORT: Fixed ROM slots 19844.
                        if slot <> 19844 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19845 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:332
//		MP	VHY
// PORT: Fixed ROM slots 19845.
                        if slot <> 19845 or instruction <> 29636 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 964, readEffective:call(words, 964)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19846 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:333
//		CS	A
// PORT: Fixed ROM slots 19846.
                            if slot <> 19846 or instruction <> 16384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 0).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:334
//		ADS	RUPTREG1	# =VHZ(COS)AOG-VHY(SIN)AOG M/CS *2(-5).
// PORT: Fixed ROM slots 19847.
                            if slot <> 19847 or instruction <> 11320 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                agcCoreADS(words, 56).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 19852 {
                if slot <= 19849 {
                    if slot <= 19848 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:335
//# Page 904
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:336
//		CA	VELCONV		# CONVERT FORWARD VELOCITY TO BIT UNITS.
// PORT: Fixed ROM slots 19848.
                        if slot <> 19848 or instruction <> 13315 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 1027), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:337
//		EXTEND
// PORT: Fixed ROM slots 19849.
                        if slot <> 19849 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19850 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:338
//		MP	RUPTREG1
// PORT: Fixed ROM slots 19850.
                        if slot <> 19850 or instruction <> 28728 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 56, readEffective:call(words, 56)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19851 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:339
//		DDOUBL
// PORT: Fixed ROM slots 19851.
                            if slot <> 19851 or instruction <> 8193 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDas(words, 1) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:340
//		XCH	FORVEL		# FORWARD VELOCITY IN BIT UNITS *2(-14).
// PORT: Fixed ROM slots 19852.
                            if slot <> 19852 or instruction <> 24513 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 961, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 19854 {
                    if slot <= 19853 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:341
//
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:342
//		CS	MAXVBITS	# ACC.=-199.9989 FT./SEC.
// PORT: Fixed ROM slots 19853.
                        if slot <> 19853 or instruction <> 17413 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 1029), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:343
//		TS	ITEMP6		# -547 BIT UNITS (OCTAL) AT 0.5571 FPS/BIT
// PORT: Fixed ROM slots 19854.
                        if slot <> 19854 or instruction <> 22582 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22582, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 19855 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:344
//
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:345
//		CAF	ONE		# LOOP TWICE.
// PORT: Fixed ROM slots 19855.
                        if slot <> 19855 or instruction <> 14827 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 19856 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:346
//VMONITOR	TS	ITEMP5		# FORWARD AND LATERAL VELOCITY LANDING
// PORT: Fixed ROM slots 19856.
                            if slot <> 19856 or instruction <> 22581 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 22581, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:347
//		INDEX	ITEMP5		#    ANALOG DISPLAYS MONITOR.
// PORT: Fixed ROM slots 19857.
                            if slot <> 19857 or instruction <> 20533 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 20533, words[0], readEffective).
                            }
                            if extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 20533, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1194] to agcAotUnit1194@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:348
//		CCS	LATVEL
// PORT: Fixed ROM slots 19858.
    19858, 10112
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19859–19863.
function agcAotUnit1195 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19860 {
        if slot <= 19859 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:349
//		TCF	+4
// PORT: Fixed ROM slots 19859.
            if slot <> 19859 or instruction <> 5527 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5527, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:350
//		TCF	LVLIMITS
// PORT: Fixed ROM slots 19860.
            if slot <> 19860 or instruction <> 5592 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5592, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19861 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:351
//		TCF	+8D
// PORT: Fixed ROM slots 19861.
            if slot <> 19861 or instruction <> 5533 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5533, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 19862 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:352
//		TCF	LVLIMITS
// PORT: Fixed ROM slots 19862.
                if slot <> 19862 or instruction <> 5592 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5592, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:353
//		INDEX	ITEMP5
// PORT: Fixed ROM slots 19863.
                if slot <> 19863 or instruction <> 20533 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20533, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20533, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1195] to agcAotUnit1195@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:354
//		CS	LATVEL
// PORT: Fixed ROM slots 19864.
    19864, 34688
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19865–19869.
function agcAotUnit1196 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19866 {
        if slot <= 19865 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:355
//		AD	MAXVBITS	# +199.9989 FT.SEC.
// PORT: Fixed ROM slots 19865.
            if slot <> 19865 or instruction <> 25605 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 1029), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:356
//		EXTEND
// PORT: Fixed ROM slots 19866.
            if slot <> 19866 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19867 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:357
//		BZMF	CHKLASTY
// PORT: Fixed ROM slots 19867.
            if slot <> 19867 or instruction <> 26019 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26019, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 19868 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:358
//		TCF	LVLIMITS
// PORT: Fixed ROM slots 19868.
                if slot <> 19868 or instruction <> 5592 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5592, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:359
//		INDEX	ITEMP5
// PORT: Fixed ROM slots 19869.
                if slot <> 19869 or instruction <> 20533 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20533, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20533, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1196] to agcAotUnit1196@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:360
//		CA	LATVEL
// PORT: Fixed ROM slots 19870.
    19870, 26496
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19871–19875.
function agcAotUnit1197 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19872 {
        if slot <= 19871 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:361
//		AD	MAXVBITS
// PORT: Fixed ROM slots 19871.
            if slot <> 19871 or instruction <> 25605 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local entryA is words[0].
                local fixedOperand is mod(readEffective:call(words, 1029), 32768).
                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:362
//		EXTEND
// PORT: Fixed ROM slots 19872.
            if slot <> 19872 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19873 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:363
//		BZMF	+2
// PORT: Fixed ROM slots 19873.
            if slot <> 19873 or instruction <> 26019 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26019, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 19874 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:364
//		TCF	LVLIMITS
// PORT: Fixed ROM slots 19874.
                if slot <> 19874 or instruction <> 5592 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5592, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:365
//CHKLASTY	INDEX	ITEMP5
// PORT: Fixed ROM slots 19875.
                if slot <> 19875 or instruction <> 20533 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20533, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20533, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1197] to agcAotUnit1197@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:366
//		CCS	LATVMETR
// PORT: Fixed ROM slots 19876.
    19876, 10108
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19877–19881.
function agcAotUnit1198 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19878 {
        if slot <= 19877 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:367
//		TCF	+4
// PORT: Fixed ROM slots 19877.
            if slot <> 19877 or instruction <> 5545 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5545, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:368
//		TCF	LASTOK
// PORT: Fixed ROM slots 19878.
            if slot <> 19878 or instruction <> 5554 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5554, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19879 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:369
//		TCF	+7
// PORT: Fixed ROM slots 19879.
            if slot <> 19879 or instruction <> 5550 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5550, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 19880 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:370
//		TCF	LASTOK
// PORT: Fixed ROM slots 19880.
                if slot <> 19880 or instruction <> 5554 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5554, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:371
//		INDEX	ITEMP5
// PORT: Fixed ROM slots 19881.
                if slot <> 19881 or instruction <> 20533 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20533, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20533, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1198] to agcAotUnit1198@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:372
//		CA	LATVEL
// PORT: Fixed ROM slots 19882.
    19882, 26496
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19883–19886.
function agcAotUnit1199 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19884 {
        if slot <= 19883 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:373
//		EXTEND
// PORT: Fixed ROM slots 19883.
            if slot <> 19883 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:374
//		BZMF	LASTPOSY +5
// PORT: Fixed ROM slots 19884.
            if slot <> 19884 or instruction <> 26049 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26049, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19885 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:375
//		TCF	+5
// PORT: Fixed ROM slots 19885.
            if slot <> 19885 or instruction <> 5554 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5554, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:376
//		INDEX	ITEMP5
// PORT: Fixed ROM slots 19886.
            if slot <> 19886 or instruction <> 20533 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1199] to agcAotUnit1199@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:377
//		CS	LATVEL
// PORT: Fixed ROM slots 19887.
    19887, 34688
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19888–19890.
function agcAotUnit1200 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19888 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:378
//		EXTEND
// PORT: Fixed ROM slots 19888.
        if slot <> 19888 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 19889 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:379
//		BZMF	LASTNEGY +4
// PORT: Fixed ROM slots 19889.
            if slot <> 19889 or instruction <> 26062 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26062, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:380
//LASTOK		INDEX	ITEMP5
// PORT: Fixed ROM slots 19890.
            if slot <> 19890 or instruction <> 20533 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1200] to agcAotUnit1200@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:381
//		CCS	TRAKLATV
// PORT: Fixed ROM slots 19891.
    19891, 10116
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19892–19895.
function agcAotUnit1201 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19893 {
        if slot <= 19892 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:382
//		TCF	LASTPOSY
// PORT: Fixed ROM slots 19892.
            if slot <> 19892 or instruction <> 5564 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5564, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:383
//		TCF	+2
// PORT: Fixed ROM slots 19893.
            if slot <> 19893 or instruction <> 5559 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5559, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19894 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:384
//		TCF	LASTNEGY
// PORT: Fixed ROM slots 19894.
            if slot <> 19894 or instruction <> 5578 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5578, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:385
//		INDEX	ITEMP5
// PORT: Fixed ROM slots 19895.
            if slot <> 19895 or instruction <> 20533 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1201] to agcAotUnit1201@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:386
//# Page 905
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:387
//		CA	LATVEL
// PORT: Fixed ROM slots 19896.
    19896, 26496
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19897–19900.
function agcAotUnit1202 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19898 {
        if slot <= 19897 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:388
//		EXTEND
// PORT: Fixed ROM slots 19897.
            if slot <> 19897 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:389
//		BZMF	NEGVMAXY
// PORT: Fixed ROM slots 19898.
            if slot <> 19898 or instruction <> 26064 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26064, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19899 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:390
//		TCF	POSVMAXY
// PORT: Fixed ROM slots 19899.
            if slot <> 19899 or instruction <> 5571 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5571, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:391
//LASTPOSY	INDEX	ITEMP5
// PORT: Fixed ROM slots 19900.
            if slot <> 19900 or instruction <> 20533 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1202] to agcAotUnit1202@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:392
//		CA	LATVEL
// PORT: Fixed ROM slots 19901.
    19901, 26496
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19902–19907.
function agcAotUnit1203 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19904 {
        if slot <= 19902 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:393
//		EXTEND
// PORT: Fixed ROM slots 19902.
            if slot <> 19902 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 19903 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:394
//		BZMF	+2
// PORT: Fixed ROM slots 19903.
                if slot <> 19903 or instruction <> 26049 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 26049, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:395
//		TCF	POSVMAXY
// PORT: Fixed ROM slots 19904.
                if slot <> 19904 or instruction <> 5571 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5571, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 19905 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:396
//		CS	MAXVBITS
// PORT: Fixed ROM slots 19905.
            if slot <> 19905 or instruction <> 17413 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local fixedOperand is mod(readEffective:call(words, 1029), 32768).
                set words[0] to agcSignExtend(32767 - fixedOperand).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 19906 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:397
//		TCF	ZEROLSTY
// PORT: Fixed ROM slots 19906.
                if slot <> 19906 or instruction <> 5652 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5652, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:398
//POSVMAXY	INDEX	ITEMP5
// PORT: Fixed ROM slots 19907.
                if slot <> 19907 or instruction <> 20533 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20533, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20533, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1203] to agcAotUnit1203@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:399
//		CS	LATVMETR
// PORT: Fixed ROM slots 19908.
    19908, 34684
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19909–19910.
function agcAotUnit1204 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19909 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:400
//		AD	MAXVBITS
// PORT: Fixed ROM slots 19909.
        if slot <> 19909 or instruction <> 25605 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local entryA is words[0].
            local fixedOperand is mod(readEffective:call(words, 1029), 32768).
            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:401
//		INDEX	ITEMP5
// PORT: Fixed ROM slots 19910.
        if slot <> 19910 or instruction <> 20533 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20533, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20533, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1204] to agcAotUnit1204@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:402
//		XCH	RUPTREG3
// PORT: Fixed ROM slots 19911.
    19911, 47220
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19912–19914.
function agcAotUnit1205 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19912 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:403
//		CAF	ONE
// PORT: Fixed ROM slots 19912.
        if slot <> 19912 or instruction <> 14827 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 19913 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:404
//		TCF	ZEROLSTY +3
// PORT: Fixed ROM slots 19913.
            if slot <> 19913 or instruction <> 5655 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5655, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:405
//LASTNEGY	INDEX	ITEMP5
// PORT: Fixed ROM slots 19914.
            if slot <> 19914 or instruction <> 20533 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1205] to agcAotUnit1205@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:406
//		CA	LATVEL
// PORT: Fixed ROM slots 19915.
    19915, 26496
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19916–19920.
function agcAotUnit1206 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19917 {
        if slot <= 19916 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:407
//		EXTEND
// PORT: Fixed ROM slots 19916.
            if slot <> 19916 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:408
//		BZMF	NEGVMAXY
// PORT: Fixed ROM slots 19917.
            if slot <> 19917 or instruction <> 26064 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26064, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19918 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:409
//		CA	MAXVBITS
// PORT: Fixed ROM slots 19918.
            if slot <> 19918 or instruction <> 13317 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1029), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 19919 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:410
//		TCF	ZEROLSTY
// PORT: Fixed ROM slots 19919.
                if slot <> 19919 or instruction <> 5652 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 5652, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:411
//NEGVMAXY	INDEX	ITEMP5
// PORT: Fixed ROM slots 19920.
                if slot <> 19920 or instruction <> 20533 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20533, words[0], readEffective).
                }
                if extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 20533, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[1206] to agcAotUnit1206@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:412
//		CA	LATVMETR
// PORT: Fixed ROM slots 19921.
    19921, 26492
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19922–19924.
function agcAotUnit1207 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19922 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:413
//		AD	MAXVBITS
// PORT: Fixed ROM slots 19922.
        if slot <> 19922 or instruction <> 25605 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local entryA is words[0].
            local fixedOperand is mod(readEffective:call(words, 1029), 32768).
            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 19923 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:414
//		COM
// PORT: Fixed ROM slots 19923.
            if slot <> 19923 or instruction <> 16384 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreCS(words, 0).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:415
//		INDEX	ITEMP5
// PORT: Fixed ROM slots 19924.
            if slot <> 19924 or instruction <> 20533 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1207] to agcAotUnit1207@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:416
//		XCH	RUPTREG3
// PORT: Fixed ROM slots 19925.
    19925, 47220
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19926–19928.
function agcAotUnit1208 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19926 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:417
//		CS	ONE
// PORT: Fixed ROM slots 19926.
        if slot <> 19926 or instruction <> 18923 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local fixedOperand is mod(readEffective:call(words, 2539), 32768).
            set words[0] to agcSignExtend(32767 - fixedOperand).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 19927 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:418
//		TCF	ZEROLSTY +3
// PORT: Fixed ROM slots 19927.
            if slot <> 19927 or instruction <> 5655 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5655, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:419
//LVLIMITS	INDEX	ITEMP5
// PORT: Fixed ROM slots 19928.
            if slot <> 19928 or instruction <> 20533 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1208] to agcAotUnit1208@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:420
//		CCS	TRAKLATV
// PORT: Fixed ROM slots 19929.
    19929, 10116
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19930–19933.
function agcAotUnit1209 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19931 {
        if slot <= 19930 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:421
//		TCF	LATVPOS
// PORT: Fixed ROM slots 19930.
            if slot <> 19930 or instruction <> 5617 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5617, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:422
//		TCF	+2
// PORT: Fixed ROM slots 19931.
            if slot <> 19931 or instruction <> 5597 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5597, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19932 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:423
//		TCF	LATVNEG
// PORT: Fixed ROM slots 19932.
            if slot <> 19932 or instruction <> 5622 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5622, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:424
//		INDEX	ITEMP5
// PORT: Fixed ROM slots 19933.
            if slot <> 19933 or instruction <> 20533 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1209] to agcAotUnit1209@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:425
//		CS	LATVMETR
// PORT: Fixed ROM slots 19934.
    19934, 34684
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19935–19938.
function agcAotUnit1210 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19936 {
        if slot <= 19935 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:426
//		EXTEND
// PORT: Fixed ROM slots 19935.
            if slot <> 19935 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:427
//		BZMF	+2
// PORT: Fixed ROM slots 19936.
            if slot <> 19936 or instruction <> 26082 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26082, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19937 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:428
//		TCF	NEGLMLV
// PORT: Fixed ROM slots 19937.
            if slot <> 19937 or instruction <> 5629 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5629, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:429
//		INDEX	ITEMP5
// PORT: Fixed ROM slots 19938.
            if slot <> 19938 or instruction <> 20533 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1210] to agcAotUnit1210@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:430
//		CS	LATVEL
// PORT: Fixed ROM slots 19939.
    19939, 34688
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19940–19943.
function agcAotUnit1211 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19941 {
        if slot <= 19940 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:431
//		EXTEND
// PORT: Fixed ROM slots 19940.
            if slot <> 19940 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:432
//		BZMF	LVMINLM
// PORT: Fixed ROM slots 19941.
            if slot <> 19941 or instruction <> 26128 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26128, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19942 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:433
//		AD	ITEMP6
// PORT: Fixed ROM slots 19942.
            if slot <> 19942 or instruction <> 24630 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreAD(words, 54).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:434
//		INDEX	ITEMP5
// PORT: Fixed ROM slots 19943.
            if slot <> 19943 or instruction <> 20533 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1211] to agcAotUnit1211@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:435
//		AD	LATVMETR
// PORT: Fixed ROM slots 19944.
    19944, 51068
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19945–19947.
function agcAotUnit1212 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19945 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:436
//		EXTEND
// PORT: Fixed ROM slots 19945.
        if slot <> 19945 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 19946 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:437
//# Page 906
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:438
//		BZMF	LVMINLM
// PORT: Fixed ROM slots 19946.
            if slot <> 19946 or instruction <> 26128 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26128, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:439
//		INDEX	ITEMP5
// PORT: Fixed ROM slots 19947.
            if slot <> 19947 or instruction <> 20533 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1212] to agcAotUnit1212@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:440
//		AD	LATVEL
// PORT: Fixed ROM slots 19948.
    19948, 51072
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19949–19950.
function agcAotUnit1213 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19949 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:441
//		EXTEND
// PORT: Fixed ROM slots 19949.
        if slot <> 19949 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:442
//		INDEX	ITEMP5
// PORT: Fixed ROM slots 19950.
        if slot <> 19950 or instruction <> 20533 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20533, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20533, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1213] to agcAotUnit1213@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:443
//		SU	LATVMETR
// PORT: Fixed ROM slots 19951.
    19951, 51068
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19952–19953.
function agcAotUnit1214 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19952 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:444
//		TCF	ZEROLSTY
// PORT: Fixed ROM slots 19952.
        if slot <> 19952 or instruction <> 5652 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5652, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:445
//LATVPOS		INDEX	ITEMP5
// PORT: Fixed ROM slots 19953.
        if slot <> 19953 or instruction <> 20533 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20533, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20533, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1214] to agcAotUnit1214@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:446
//		CS	LATVEL
// PORT: Fixed ROM slots 19954.
    19954, 34688
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19955–19958.
function agcAotUnit1215 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19956 {
        if slot <= 19955 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:447
//		EXTEND
// PORT: Fixed ROM slots 19955.
            if slot <> 19955 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:448
//		BZMF	LVMINLM
// PORT: Fixed ROM slots 19956.
            if slot <> 19956 or instruction <> 26128 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26128, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19957 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:449
//		TCF	+5
// PORT: Fixed ROM slots 19957.
            if slot <> 19957 or instruction <> 5626 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5626, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:450
//LATVNEG		INDEX	ITEMP5
// PORT: Fixed ROM slots 19958.
            if slot <> 19958 or instruction <> 20533 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1215] to agcAotUnit1215@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:451
//		CA	LATVEL
// PORT: Fixed ROM slots 19959.
    19959, 26496
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19960–19962.
function agcAotUnit1216 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19960 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:452
//		EXTEND
// PORT: Fixed ROM slots 19960.
        if slot <> 19960 or instruction <> 6 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 6, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 19961 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:453
//		BZMF	LVMINLM
// PORT: Fixed ROM slots 19961.
            if slot <> 19961 or instruction <> 26128 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26128, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:454
//		INDEX	ITEMP5
// PORT: Fixed ROM slots 19962.
            if slot <> 19962 or instruction <> 20533 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1216] to agcAotUnit1216@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:455
//		CS	LATVMETR
// PORT: Fixed ROM slots 19963.
    19963, 34684
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19964–19965.
function agcAotUnit1217 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19964 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:456
//		TCF	ZEROLSTY
// PORT: Fixed ROM slots 19964.
        if slot <> 19964 or instruction <> 5652 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 5652, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:457
//NEGLMLV		INDEX	ITEMP5
// PORT: Fixed ROM slots 19965.
        if slot <> 19965 or instruction <> 20533 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20533, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20533, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1217] to agcAotUnit1217@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:458
//		CA	LATVEL
// PORT: Fixed ROM slots 19966.
    19966, 26496
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19967–19970.
function agcAotUnit1218 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19968 {
        if slot <= 19967 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:459
//		EXTEND
// PORT: Fixed ROM slots 19967.
            if slot <> 19967 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:460
//		BZMF	LVMINLM
// PORT: Fixed ROM slots 19968.
            if slot <> 19968 or instruction <> 26128 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26128, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19969 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:461
//		CA	MAXVBITS
// PORT: Fixed ROM slots 19969.
            if slot <> 19969 or instruction <> 13317 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                local fixedOperand is mod(readEffective:call(words, 1029), 32768).
                set words[0] to agcSignExtend(fixedOperand).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:462
//		INDEX	ITEMP5
// PORT: Fixed ROM slots 19970.
            if slot <> 19970 or instruction <> 20533 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1218] to agcAotUnit1218@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:463
//		AD	LATVMETR
// PORT: Fixed ROM slots 19971.
    19971, 51068
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19972–19973.
function agcAotUnit1219 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19972 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:464
//		COM
// PORT: Fixed ROM slots 19972.
        if slot <> 19972 or instruction <> 16384 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            agcCoreCS(words, 0).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:465
//		INDEX	ITEMP5
// PORT: Fixed ROM slots 19973.
        if slot <> 19973 or instruction <> 20533 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20533, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20533, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1219] to agcAotUnit1219@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:466
//		AD	LATVEL
// PORT: Fixed ROM slots 19974.
    19974, 51072
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19975–19978.
function agcAotUnit1220 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19976 {
        if slot <= 19975 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:467
//		EXTEND
// PORT: Fixed ROM slots 19975.
            if slot <> 19975 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:468
//		BZMF	LVMINLM
// PORT: Fixed ROM slots 19976.
            if slot <> 19976 or instruction <> 26128 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 26128, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 19977 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:469
//		EXTEND
// PORT: Fixed ROM slots 19977.
            if slot <> 19977 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:470
//		INDEX	ITEMP5
// PORT: Fixed ROM slots 19978.
            if slot <> 19978 or instruction <> 20533 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1220] to agcAotUnit1220@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:471
//		SU	LATVEL
// PORT: Fixed ROM slots 19979.
    19979, 51072
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19980–19980.
function agcAotUnit1221 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:472
//		INDEX	ITEMP5
// PORT: Fixed ROM slots 19980.
    if slot <> 19980 or instruction <> 20533 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20533, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20533, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1221] to agcAotUnit1221@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:473
//		AD	LATVMETR
// PORT: Fixed ROM slots 19981.
    19981, 51068
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19982–19984.
function agcAotUnit1222 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19982 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:474
//		COM
// PORT: Fixed ROM slots 19982.
        if slot <> 19982 or instruction <> 16384 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            agcCoreCS(words, 0).
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
        if slot <= 19983 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:475
//		TCF	ZEROLSTY
// PORT: Fixed ROM slots 19983.
            if slot <> 19983 or instruction <> 5652 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 5652, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:476
//LVMINLM		INDEX	ITEMP5
// PORT: Fixed ROM slots 19984.
            if slot <> 19984 or instruction <> 20533 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 20533, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    }
}
set agcAotRoutes[1222] to agcAotUnit1222@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:477
//		CS	LATVMETR
// PORT: Fixed ROM slots 19985.
    19985, 34684
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19986–19986.
function agcAotUnit1223 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:478
//		INDEX	ITEMP5
// PORT: Fixed ROM slots 19986.
    if slot <> 19986 or instruction <> 20533 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20533, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20533, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1223] to agcAotUnit1223@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:479
//		AD	LATVEL
// PORT: Fixed ROM slots 19987.
    19987, 51072
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19988–19988.
function agcAotUnit1224 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:480
//ZEROLSTY	INDEX	ITEMP5
// PORT: Fixed ROM slots 19988.
    if slot <> 19988 or instruction <> 20533 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20533, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20533, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1224] to agcAotUnit1224@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:481
//		XCH	RUPTREG3
// PORT: Fixed ROM slots 19989.
    19989, 47220
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19990–19991.
function agcAotUnit1225 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19990 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:482
//		CAF	ZERO
// PORT: Fixed ROM slots 19990.
        if slot <> 19990 or instruction <> 14829 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local fixedOperand is mod(readEffective:call(words, 2541), 32768).
            set words[0] to agcSignExtend(fixedOperand).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:483
//		INDEX	ITEMP5
// PORT: Fixed ROM slots 19991.
        if slot <> 19991 or instruction <> 20533 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20533, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20533, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1225] to agcAotUnit1225@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:484
//		TS	TRAKLATV
// PORT: Fixed ROM slots 19992.
    19992, 46980
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19993–19993.
function agcAotUnit1226 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:485
//		INDEX	ITEMP5
// PORT: Fixed ROM slots 19993.
    if slot <> 19993 or instruction <> 20533 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20533, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20533, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1226] to agcAotUnit1226@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:486
//		CA	RUPTREG3
// PORT: Fixed ROM slots 19994.
    19994, 24692
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19995–19996.
function agcAotUnit1227 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 19995 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:487
//		AD	NEG0		# AVOIDS +0 DINC HARDWARE MALFUNCTION
// PORT: Fixed ROM slots 19995.
        if slot <> 19995 or instruction <> 27116 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
            local entryA is words[0].
            local fixedOperand is mod(readEffective:call(words, 2540), 32768).
            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
            return list(false, false, inheritedTransient, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:488
//# Page 907
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:489
//		INDEX	ITEMP5
// PORT: Fixed ROM slots 19996.
        if slot <> 19996 or instruction <> 20533 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20533, words[0], readEffective).
        }
        if extended {
            if checkOnly { return true. }
            return agcCoreControlExecute(words, 20533, words[0], readEffective).
        }
        return choose false if checkOnly else -1.
    }
}
set agcAotRoutes[1227] to agcAotUnit1227@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:490
//		TS	CDUTCMD
// PORT: Fixed ROM slots 19997.
    19997, 45142
)).

// PORT: Physical bank 21. Shared continuation entries, slots 19998–19998.
function agcAotUnit1228 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:491
//		INDEX	ITEMP5
// PORT: Fixed ROM slots 19998.
    if slot <> 19998 or instruction <> 20533 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20533, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20533, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1228] to agcAotUnit1228@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:492
//		CA	RUPTREG3
// PORT: Fixed ROM slots 19999.
    19999, 24692
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20000–20000.
function agcAotUnit1229 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:493
//		INDEX	ITEMP5
// PORT: Fixed ROM slots 20000.
    if slot <> 20000 or instruction <> 20533 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20533, words[0], readEffective).
    }
    if extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 20533, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[1229] to agcAotUnit1229@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:494
//		ADS	LATVMETR
// PORT: Fixed ROM slots 20001.
    20001, 24444
)).

// PORT: Physical bank 21. Shared continuation entries, slots 20002–20029.
function agcAotUnit1230 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 20015 {
        if slot <= 20008 {
            if slot <= 20004 {
                if slot <= 20002 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:495
//		CCS	ITEMP5		# FIRST MONITOR FORWARD THEN LATERAL VEL.
// PORT: Fixed ROM slots 20002.
                    if slot <> 20002 or instruction <> 4149 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreCCS(words, 53).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20003 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:496
//		TCF	VMONITOR
// PORT: Fixed ROM slots 20003.
                        if slot <> 20003 or instruction <> 5520 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5520, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:497
//
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:498
//		CAF	BITSET		# DRIVE THE X-POINTER DISPLAY.
// PORT: Fixed ROM slots 20004.
                        if slot <> 20004 or instruction <> 14864 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2576), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 20006 {
                    if slot <= 20005 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:499
//		EXTEND
// PORT: Fixed ROM slots 20005.
                        if slot <> 20005 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:500
//		WOR	CHAN14
// PORT: Fixed ROM slots 20006.
                        if slot <> 20006 or instruction <> 2572 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 5, 12, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 20007 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:501
//		TC	LADQSAVE	# GO TO ALTROUT +1 OR TO ALTOUT +1
// PORT: Fixed ROM slots 20007.
                        if slot <> 20007 or instruction <> 972 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 972, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:502
//ZERODATA	CAF	ZERO		# ZERO ALTSAVE AND ALTSAVE +1 - - -
// PORT: Fixed ROM slots 20008.
                        if slot <> 20008 or instruction <> 14829 { return choose false if checkOnly else -1. }
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
            }
        } else {
            if slot <= 20011 {
                if slot <= 20009 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:503
//		TS	L		#	 NO NEGATIVE ALTITUDES ALLOWED.
// PORT: Fixed ROM slots 20009.
                    if slot <> 20009 or instruction <> 22529 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22529, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20010 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:504
//		TCF	ZDATA2
// PORT: Fixed ROM slots 20010.
                        if slot <> 20010 or instruction <> 5304 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5304, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:505
//
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:506
//# ************************************************************************
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:507
//
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:508
//DISPRSET	CS	FLAGWRD0	# ARE WE IN DESCENT TRAJECTORY?
// PORT: Fixed ROM slots 20011.
                        if slot <> 20011 or instruction <> 16444 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 60).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 20013 {
                    if slot <= 20012 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:509
//		MASK	R10FLBIT
// PORT: Fixed ROM slots 20012.
                        if slot <> 20012 or instruction <> 31210 { return choose false if checkOnly else -1. }
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
                    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:510
//		EXTEND
// PORT: Fixed ROM slots 20013.
                        if slot <> 20013 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 20014 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:511
//		BZF	ABORTON		# NO.
// PORT: Fixed ROM slots 20014.
                        if slot <> 20014 or instruction <> 5687 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5687, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:512
//		CAF	BIT8		# YES.
// PORT: Fixed ROM slots 20015.
                        if slot <> 20015 or instruction <> 14820 { return choose false if checkOnly else -1. }
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
            }
        }
    } else {
        if slot <= 20022 {
            if slot <= 20018 {
                if slot <= 20016 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:513
//		MASK	IMODES33	# CHECK IF INERTIAL DATA JUST DISPLAYED.
// PORT: Fixed ROM slots 20016.
                    if slot <> 20016 or instruction <> 29379 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 707).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20017 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:514
//		CCS	A
// PORT: Fixed ROM slots 20017.
                        if slot <> 20017 or instruction <> 4096 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreCCS(words, 0).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:515
//		CAF	BIT2		# YES. DISABLE RR ERROR COUNTER
// PORT: Fixed ROM slots 20018.
                        if slot <> 20018 or instruction <> 14826 { return choose false if checkOnly else -1. }
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
                if slot <= 20020 {
                    if slot <= 20019 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:516
//		AD	BIT8		# NO. REMOVE DISPLAY INERTIAL DATA
// PORT: Fixed ROM slots 20019.
                        if slot <> 20019 or instruction <> 27108 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:517
//		COM
// PORT: Fixed ROM slots 20020.
                        if slot <> 20020 or instruction <> 16384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreCS(words, 0).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 20021 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:518
//		EXTEND
// PORT: Fixed ROM slots 20021.
                        if slot <> 20021 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:519
//		WAND	CHAN12
// PORT: Fixed ROM slots 20022.
                        if slot <> 20022 or instruction <> 1546 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreChannelInstruction(words, 3, 10, channelAdapter).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 20025 {
                if slot <= 20023 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:520
//ABORTON		CS	BITS8/7		# RESET INERTIAL DATA, INTERLEAVE FLAGS.
// PORT: Fixed ROM slots 20023.
                    if slot <> 20023 or instruction <> 17982 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local fixedOperand is mod(readEffective:call(words, 1598), 32768).
                        set words[0] to agcSignExtend(32767 - fixedOperand).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 20024 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:521
//		MASK	IMODES33
// PORT: Fixed ROM slots 20024.
                        if slot <> 20024 or instruction <> 29379 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 707).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:522
//		TS	IMODES33
// PORT: Fixed ROM slots 20025.
                        if slot <> 20025 or instruction <> 23235 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 23235, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            } else {
                if slot <= 20027 {
                    if slot <= 20026 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:523
//		CS	DIDFLBIT
// PORT: Fixed ROM slots 20026.
                        if slot <> 20026 or instruction <> 18910 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local fixedOperand is mod(readEffective:call(words, 2526), 32768).
                            set words[0] to agcSignExtend(32767 - fixedOperand).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:524
//		MASK	FLAGWRD1
// PORT: Fixed ROM slots 20027.
                        if slot <> 20027 or instruction <> 28733 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMASK(words, 61).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 20028 {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:525
//		TS	FLAGWRD1	# RESET DIDFLAG.
// PORT: Fixed ROM slots 20028.
                        if slot <> 20028 or instruction <> 22589 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 22589, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:526
//		TCF	TASKOVER
// PORT: Fixed ROM slots 20029.
                        if slot <> 20029 or instruction <> 6833 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6833, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    }
}
set agcAotRoutes[1230] to agcAotUnit1230@.

agcAotInstallSourceRope(list(
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:527
//# ************************************************************************
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:528
//BITS8/7		OCT	00300		# INERTIAL DATA AND INTERLEAVE FLAGS.
// PORT: Fixed ROM slots 20030.
    20030, 384
)).

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:529
//
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:530
//BITSET		=	PRIO6
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:531
//# ************************************************************************
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:532
//
// PORT: SOURCE LANDING_ANALOG_DISPLAYS.agc:533
//
