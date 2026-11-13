// SINGLE_PRECISION_SUBROUTINES.agc
// bank 02, slots 4634-4642
function agcAotUnit183 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4637 {
        if slot <= 4635 {
            if slot <= 4634 {
// SINGLE_PRECISION_SUBROUTINES.agc:1
//# Copyright:	Public domain.
// SINGLE_PRECISION_SUBROUTINES.agc:2
//# Filename:	SINGLE_PRECISION_SUBROUTINES.agc
// SINGLE_PRECISION_SUBROUTINES.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// SINGLE_PRECISION_SUBROUTINES.agc:4
//#		It is part of the source code for the Munar Excursion Module's (LM)
// SINGLE_PRECISION_SUBROUTINES.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// SINGLE_PRECISION_SUBROUTINES.agc:6
//# Assembler:	yaYUL
// SINGLE_PRECISION_SUBROUTINES.agc:7
//# Contact:	Burkey Kerman <info@sandroid.org>.
// SINGLE_PRECISION_SUBROUTINES.agc:8
//# Website:	www.ibiblio.org/apollo.
// SINGLE_PRECISION_SUBROUTINES.agc:9
//# Pages:	1102
// SINGLE_PRECISION_SUBROUTINES.agc:10
//# Mod history:	2009-05-25 RSB	Adapted from the corresponding
// SINGLE_PRECISION_SUBROUTINES.agc:11
//#				Luminary131 file, using page
// SINGLE_PRECISION_SUBROUTINES.agc:12
//#				images from Luminary 1A.
// SINGLE_PRECISION_SUBROUTINES.agc:13
//#		2010-12-31 JL	Fixed page number comment.
// SINGLE_PRECISION_SUBROUTINES.agc:14
//#
// SINGLE_PRECISION_SUBROUTINES.agc:15
//# This source code has been transcribed or otherwise adapted from
// SINGLE_PRECISION_SUBROUTINES.agc:16
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// SINGLE_PRECISION_SUBROUTINES.agc:17
//# was performed by Fjeld Kerman, and arranged for by Douglas Kerman of
// SINGLE_PRECISION_SUBROUTINES.agc:18
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// SINGLE_PRECISION_SUBROUTINES.agc:19
//# in storage size and consequent reduction in image quality as well) are
// SINGLE_PRECISION_SUBROUTINES.agc:20
//# available online at www.ibiblio.org/apollo.  If for some reason you
// SINGLE_PRECISION_SUBROUTINES.agc:21
//# find that the images are illegible, contact me at info@sandroid.org
// SINGLE_PRECISION_SUBROUTINES.agc:22
//# about getting access to the (much) higher-quality images which Fjeld Kerman
// SINGLE_PRECISION_SUBROUTINES.agc:23
//# actually created.
// SINGLE_PRECISION_SUBROUTINES.agc:24
//#
// SINGLE_PRECISION_SUBROUTINES.agc:25
//# Notations on the hardcopy document read, in part:
// SINGLE_PRECISION_SUBROUTINES.agc:26
//#
// SINGLE_PRECISION_SUBROUTINES.agc:27
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// SINGLE_PRECISION_SUBROUTINES.agc:28
//#	16:27 JULY 14, 1969
// SINGLE_PRECISION_SUBROUTINES.agc:29
//
// SINGLE_PRECISION_SUBROUTINES.agc:30
//# Page 1102
// SINGLE_PRECISION_SUBROUTINES.agc:31
//		BLOCK	02
// SINGLE_PRECISION_SUBROUTINES.agc:32
//
// SINGLE_PRECISION_SUBROUTINES.agc:33
//# SINGLE PRECISION SINE AND COSINE
// SINGLE_PRECISION_SUBROUTINES.agc:34
//
// SINGLE_PRECISION_SUBROUTINES.agc:35
//		COUNT*	$$/INTER
// SINGLE_PRECISION_SUBROUTINES.agc:36
//SPCOS		AD	HALF		# ARGUMENTS SCALED AT PI
// slot 4634
                if slot <> 4634 or instruction <> 27102 { return choose false if checkOnly else -1. }
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
// SINGLE_PRECISION_SUBROUTINES.agc:37
//SPSIN		TS	TEMK
// slot 4635
                if slot <> 4635 or instruction <> 23102 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23102, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4636 {
// SINGLE_PRECISION_SUBROUTINES.agc:38
//		TCF	SPT
// slot 4636
                if slot <> 4636 or instruction <> 6686 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6686, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// SINGLE_PRECISION_SUBROUTINES.agc:39
//		CS	TEMK
// slot 4637
                if slot <> 4637 or instruction <> 16958 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreCS(words, 574).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 4639 {
            if slot <= 4638 {
// SINGLE_PRECISION_SUBROUTINES.agc:40
//SPT		DOUBLE
// slot 4638
                if slot <> 4638 or instruction <> 24576 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreAD(words, 0).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// SINGLE_PRECISION_SUBROUTINES.agc:41
//		TS	TEMK
// slot 4639
                if slot <> 4639 or instruction <> 23102 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 23102, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4640 {
// SINGLE_PRECISION_SUBROUTINES.agc:42
//		TCF	POLLEY
// slot 4640
                if slot <> 4640 or instruction <> 6697 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6697, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4641 {
// SINGLE_PRECISION_SUBROUTINES.agc:43
//		XCH	TEMK
// slot 4641
                    if slot <> 4641 or instruction <> 24126 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 574, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SINGLE_PRECISION_SUBROUTINES.agc:44
//		INDEX	TEMK
// slot 4642
                    if slot <> 4642 or instruction <> 21054 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21054, words[0], readEffective).
                    }
                    if extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 21054, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    }
}
set agcAotRoutes[183] to agcAotUnit183@.

agcAotInstallSourceRope(list(
// SINGLE_PRECISION_SUBROUTINES.agc:45
//		AD 	LIMITS
// slot 4643
    4643, 54200
)).

// bank 02, slots 4644-4663
function agcAotUnit184 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4653 {
        if slot <= 4648 {
            if slot <= 4645 {
                if slot <= 4644 {
// SINGLE_PRECISION_SUBROUTINES.agc:46
//		COM
// slot 4644
                    if slot <> 4644 or instruction <> 16384 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreCS(words, 0).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SINGLE_PRECISION_SUBROUTINES.agc:47
//		AD	TEMK
// slot 4645
                    if slot <> 4645 or instruction <> 25150 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 574).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4646 {
// SINGLE_PRECISION_SUBROUTINES.agc:48
//		TS	TEMK
// slot 4646
                    if slot <> 4646 or instruction <> 23102 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23102, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4647 {
// SINGLE_PRECISION_SUBROUTINES.agc:49
//		TCF	POLLEY
// slot 4647
                        if slot <> 4647 or instruction <> 6697 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6697, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SINGLE_PRECISION_SUBROUTINES.agc:50
//		TCF	ARG90
// slot 4648
                        if slot <> 4648 or instruction <> 6711 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6711, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 4650 {
                if slot <= 4649 {
// SINGLE_PRECISION_SUBROUTINES.agc:51
//POLLEY		EXTEND
// slot 4649
                    if slot <> 4649 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SINGLE_PRECISION_SUBROUTINES.agc:52
//		MP	TEMK
// slot 4650
                    if slot <> 4650 or instruction <> 29246 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 574, readEffective:call(words, 574)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4651 {
// SINGLE_PRECISION_SUBROUTINES.agc:53
//		TS	SQ
// slot 4651
                    if slot <> 4651 or instruction <> 23103 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23103, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4652 {
// SINGLE_PRECISION_SUBROUTINES.agc:54
//		EXTEND
// slot 4652
                        if slot <> 4652 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SINGLE_PRECISION_SUBROUTINES.agc:55
//		MP	C5/2
// slot 4653
                        if slot <> 4653 or instruction <> 31237 { return choose false if checkOnly else -1. }
                        if extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            agcCoreMp(words, 2565, readEffective:call(words, 2565)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        }
    } else {
        if slot <= 4658 {
            if slot <= 4655 {
                if slot <= 4654 {
// SINGLE_PRECISION_SUBROUTINES.agc:56
//		AD	C3/2
// slot 4654
                    if slot <> 4654 or instruction <> 28639 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        local entryA is words[0].
                        local fixedOperand is mod(readEffective:call(words, 4063), 32768).
                        set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SINGLE_PRECISION_SUBROUTINES.agc:57
//		EXTEND
// slot 4655
                    if slot <> 4655 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4656 {
// SINGLE_PRECISION_SUBROUTINES.agc:58
//		MP	SQ
// slot 4656
                    if slot <> 4656 or instruction <> 29247 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 575, readEffective:call(words, 575)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4657 {
// SINGLE_PRECISION_SUBROUTINES.agc:59
//		AD	C1/2
// slot 4657
                        if slot <> 4657 or instruction <> 28623 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local entryA is words[0].
                            local fixedOperand is mod(readEffective:call(words, 4047), 32768).
                            set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SINGLE_PRECISION_SUBROUTINES.agc:60
//		EXTEND
// slot 4658
                        if slot <> 4658 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                }
            }
        } else {
            if slot <= 4660 {
                if slot <= 4659 {
// SINGLE_PRECISION_SUBROUTINES.agc:61
//		MP	TEMK
// slot 4659
                    if slot <> 4659 or instruction <> 29246 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMp(words, 574, readEffective:call(words, 574)).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// SINGLE_PRECISION_SUBROUTINES.agc:62
//		DDOUBL
// slot 4660
                    if slot <> 4660 or instruction <> 8193 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        if not agcCoreDas(words, 1) { return -1. }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4661 {
// SINGLE_PRECISION_SUBROUTINES.agc:63
//		TS	TEMK
// slot 4661
                    if slot <> 4661 or instruction <> 23102 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 23102, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
                    if slot <= 4662 {
// SINGLE_PRECISION_SUBROUTINES.agc:64
//		TC	Q
// slot 4662
                        if slot <> 4662 or instruction <> 2 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 2, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// SINGLE_PRECISION_SUBROUTINES.agc:65
//ARG90		INDEX	A
// slot 4663
                        if slot <> 4663 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
// SINGLE_PRECISION_SUBROUTINES.agc:66
//		CS	LIMITS
// slot 4664
    4664, 37816
)).

// bank 02, slots 4665-4665
function agcAotUnit185 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
// SINGLE_PRECISION_SUBROUTINES.agc:67
//		TC	Q		# RESULT SCALED AT 1
// slot 4665
    if slot <> 4665 or instruction <> 2 { return choose false if checkOnly else -1. }
    if not extended {
        if checkOnly { return true. }
        return agcCoreControlExecute(words, 2, words[0], readEffective).
    }
    return choose false if checkOnly else -1.
}
set agcAotRoutes[185] to agcAotUnit185@.

// no code for the lines below
// SINGLE_PRECISION_SUBROUTINES.agc:68
//
// SINGLE_PRECISION_SUBROUTINES.agc:69
//
