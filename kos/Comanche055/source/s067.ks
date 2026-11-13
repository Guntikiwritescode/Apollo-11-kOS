// SINGLE_PRECISION_SUBROUTINES.agc
// bank 02, slots 4668-4676
function agcAotUnit183 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4671 {
        if slot <= 4669 {
            if slot <= 4668 {
// SINGLE_PRECISION_SUBROUTINES.agc:1
//# Copyright:	Public domain.
// SINGLE_PRECISION_SUBROUTINES.agc:2
//# Filename:	SINGLE_PRECISION_SUBROUTINES.agc
// SINGLE_PRECISION_SUBROUTINES.agc:3
//# Purpose:	Part of the source code for Colossus 2A, AKA Comanche 055.
// SINGLE_PRECISION_SUBROUTINES.agc:4
//#		It is part of the source code for the Command Module's (CM)
// SINGLE_PRECISION_SUBROUTINES.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// SINGLE_PRECISION_SUBROUTINES.agc:6
//# Assembler:	yaYUL
// SINGLE_PRECISION_SUBROUTINES.agc:7
//# Contact:	Burkey Kerman <info@sandroid.org>.
// SINGLE_PRECISION_SUBROUTINES.agc:8
//# Website:	www.ibiblio.org/apollo.
// SINGLE_PRECISION_SUBROUTINES.agc:9
//# Pages:	1207
// SINGLE_PRECISION_SUBROUTINES.agc:10
//# Mod history:	2009-05-13 RSB	Adapted from the Colossus249/ file of the
// SINGLE_PRECISION_SUBROUTINES.agc:11
//#				same name, using Comanche055 page images.
// SINGLE_PRECISION_SUBROUTINES.agc:12
//#
// SINGLE_PRECISION_SUBROUTINES.agc:13
//# This source code has been transcribed or otherwise adapted from digitized
// SINGLE_PRECISION_SUBROUTINES.agc:14
//# images of a hardcopy from the MIT Museum.  The digitization was performed
// SINGLE_PRECISION_SUBROUTINES.agc:15
//# by Fjeld Kerman, and arranged for by Douglas Kerman of the Museum.  Many
// SINGLE_PRECISION_SUBROUTINES.agc:16
//# thanks to both.  The images (with suitable reduction in storage size and
// SINGLE_PRECISION_SUBROUTINES.agc:17
//# consequent reduction in image quality as well) are available online at
// SINGLE_PRECISION_SUBROUTINES.agc:18
//# www.ibiblio.org/apollo.  If for some reason you find that the images are
// SINGLE_PRECISION_SUBROUTINES.agc:19
//# illegible, contact me at info@sandroid.org about getting access to the
// SINGLE_PRECISION_SUBROUTINES.agc:20
//# (much) higher-quality images which Fjeld Kerman actually created.
// SINGLE_PRECISION_SUBROUTINES.agc:21
//#
// SINGLE_PRECISION_SUBROUTINES.agc:22
//# Notations on the hardcopy document read, in part:
// SINGLE_PRECISION_SUBROUTINES.agc:23
//#
// SINGLE_PRECISION_SUBROUTINES.agc:24
//#	Assemble revision 055 of AGC program Comanche by NASA
// SINGLE_PRECISION_SUBROUTINES.agc:25
//#	2021113-051.  10:28 APR. 1, 1969
// SINGLE_PRECISION_SUBROUTINES.agc:26
//#
// SINGLE_PRECISION_SUBROUTINES.agc:27
//#	This AGC program shall also be referred to as
// SINGLE_PRECISION_SUBROUTINES.agc:28
//#			Colossus 2A
// SINGLE_PRECISION_SUBROUTINES.agc:29
//
// SINGLE_PRECISION_SUBROUTINES.agc:30
//# Page 1207
// SINGLE_PRECISION_SUBROUTINES.agc:31
//		BLOCK	02
// SINGLE_PRECISION_SUBROUTINES.agc:32
//# SINGLE PRECISION SINE AND COSINE
// SINGLE_PRECISION_SUBROUTINES.agc:33
//
// SINGLE_PRECISION_SUBROUTINES.agc:34
//		COUNT	02/INTER
// SINGLE_PRECISION_SUBROUTINES.agc:35
//SPCOS		AD	HALF		# ARGUMENTS SCALED AT PI
// slot 4668
                if slot <> 4668 or instruction <> 27138 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local entryA is words[0].
                    local fixedOperand is mod(readEffective:call(words, 2562), 32768).
                    set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SINGLE_PRECISION_SUBROUTINES.agc:36
//SPSIN		TS	TEMK
// slot 4669
                if slot <> 4669 or instruction <> 23101 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23101, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4670 {
// SINGLE_PRECISION_SUBROUTINES.agc:37
//		TCF	SPT
// slot 4670
                if slot <> 4670 or instruction <> 6720 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6720, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SINGLE_PRECISION_SUBROUTINES.agc:38
//		CS	TEMK
// slot 4671
                if slot <> 4671 or instruction <> 16957 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 573).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 4673 {
            if slot <= 4672 {
// SINGLE_PRECISION_SUBROUTINES.agc:39
//SPT		DOUBLE
// slot 4672
                if slot <> 4672 or instruction <> 24576 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SINGLE_PRECISION_SUBROUTINES.agc:40
//		TS	TEMK
// slot 4673
                if slot <> 4673 or instruction <> 23101 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23101, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4674 {
// SINGLE_PRECISION_SUBROUTINES.agc:41
//		TCF	POLLEY
// slot 4674
                if slot <> 4674 or instruction <> 6731 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6731, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4675 {
// SINGLE_PRECISION_SUBROUTINES.agc:42
//		XCH	TEMK
// slot 4675
                    if slot <> 4675 or instruction <> 24125 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 573, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SINGLE_PRECISION_SUBROUTINES.agc:43
//		INDEX	TEMK
// slot 4676
                    if slot <> 4676 or instruction <> 21053 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21053, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21053, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[183] to agcAotUnit183@.

agcAotInstallSourceRope(list(
// SINGLE_PRECISION_SUBROUTINES.agc:44
//		AD 	LIMITS
// slot 4677
    4677, 54272
)).

// bank 02, slots 4678-4697
function agcAotUnit184 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4687 {
        if slot <= 4682 {
            if slot <= 4679 {
                if slot <= 4678 {
// SINGLE_PRECISION_SUBROUTINES.agc:45
//		COM
// slot 4678
                    if slot <> 4678 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SINGLE_PRECISION_SUBROUTINES.agc:46
//		AD	TEMK
// slot 4679
                    if slot <> 4679 or instruction <> 25149 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 573).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4680 {
// SINGLE_PRECISION_SUBROUTINES.agc:47
//		TS	TEMK
// slot 4680
                    if slot <> 4680 or instruction <> 23101 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23101, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4681 {
// SINGLE_PRECISION_SUBROUTINES.agc:48
//		TCF	POLLEY
// slot 4681
                        if slot <> 4681 or instruction <> 6731 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6731, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SINGLE_PRECISION_SUBROUTINES.agc:49
//		TCF	ARG90
// slot 4682
                        if slot <> 4682 or instruction <> 6745 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6745, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 4684 {
                if slot <= 4683 {
// SINGLE_PRECISION_SUBROUTINES.agc:50
//POLLEY		EXTEND
// slot 4683
                    if slot <> 4683 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SINGLE_PRECISION_SUBROUTINES.agc:51
//		MP	TEMK
// slot 4684
                    if slot <> 4684 or instruction <> 29245 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 573, readEffective:call(words, 573)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4685 {
// SINGLE_PRECISION_SUBROUTINES.agc:52
//		TS	SQ
// slot 4685
                    if slot <> 4685 or instruction <> 23102 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23102, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4686 {
// SINGLE_PRECISION_SUBROUTINES.agc:53
//		EXTEND
// slot 4686
                        if slot <> 4686 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SINGLE_PRECISION_SUBROUTINES.agc:54
//		MP	C5/2
// slot 4687
                        if slot <> 4687 or instruction <> 31271 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2599, readEffective:call(words, 2599)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 4692 {
            if slot <= 4689 {
                if slot <= 4688 {
// SINGLE_PRECISION_SUBROUTINES.agc:55
//		AD	C3/2
// slot 4688
                    if slot <> 4688 or instruction <> 28614 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 4038), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SINGLE_PRECISION_SUBROUTINES.agc:56
//		EXTEND
// slot 4689
                    if slot <> 4689 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4690 {
// SINGLE_PRECISION_SUBROUTINES.agc:57
//		MP	SQ
// slot 4690
                    if slot <> 4690 or instruction <> 29246 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 574, readEffective:call(words, 574)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4691 {
// SINGLE_PRECISION_SUBROUTINES.agc:58
//		AD	C1/2
// slot 4691
                        if slot <> 4691 or instruction <> 28598 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 4022), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SINGLE_PRECISION_SUBROUTINES.agc:59
//		EXTEND
// slot 4692
                        if slot <> 4692 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 4694 {
                if slot <= 4693 {
// SINGLE_PRECISION_SUBROUTINES.agc:60
//		MP	TEMK
// slot 4693
                    if slot <> 4693 or instruction <> 29245 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 573, readEffective:call(words, 573)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SINGLE_PRECISION_SUBROUTINES.agc:61
//		DDOUBL
// slot 4694
                    if slot <> 4694 or instruction <> 8193 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 1) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4695 {
// SINGLE_PRECISION_SUBROUTINES.agc:62
//		TS	TEMK
// slot 4695
                    if slot <> 4695 or instruction <> 23101 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23101, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4696 {
// SINGLE_PRECISION_SUBROUTINES.agc:63
//		TC	Q
// slot 4696
                        if slot <> 4696 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SINGLE_PRECISION_SUBROUTINES.agc:64
//ARG90		INDEX	A
// slot 4697
                        if slot <> 4697 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[184] to agcAotUnit184@.

agcAotInstallSourceRope(list(
// SINGLE_PRECISION_SUBROUTINES.agc:65
//		CS	LIMITS
// slot 4698
    4698, 37888
)).

// bank 02, slots 4699-4699
function agcAotUnit185 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SINGLE_PRECISION_SUBROUTINES.agc:66
//		TC	Q		# RESULT SCALED AT 1
// slot 4699
    if slot <> 4699 or instruction <> 2 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[185] to agcAotUnit185@.

// no code for the lines below
// SINGLE_PRECISION_SUBROUTINES.agc:67
//# SPROOT WAS DELETED IN REV 51 OF MASTER. ASS. CONT. HAS CARDS.
