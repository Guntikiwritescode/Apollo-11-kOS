// INTER-BANK_COMMUNICATION.agc
// bank 02, slots 4494-4495
function agcAotUnit174 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4494 {
// INTER-BANK_COMMUNICATION.agc:1
//# Copyright:	Public domain.
// INTER-BANK_COMMUNICATION.agc:2
//# Filename:	INTER-BANK_COMMUNICATION.agc
// INTER-BANK_COMMUNICATION.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// INTER-BANK_COMMUNICATION.agc:4
//#		It is part of the source code for the Munar Excursion Module's (LM)
// INTER-BANK_COMMUNICATION.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// INTER-BANK_COMMUNICATION.agc:6
//# Assembler:	yaYUL
// INTER-BANK_COMMUNICATION.agc:7
//# Contact:	Burkey Kerman <info@sandroid.org>.
// INTER-BANK_COMMUNICATION.agc:8
//# Website:	www.ibiblio.org/apollo.
// INTER-BANK_COMMUNICATION.agc:9
//# Pages:	998-1001
// INTER-BANK_COMMUNICATION.agc:10
//# Mod history:	2009-05-24 RSB	Adapted from the corresponding
// INTER-BANK_COMMUNICATION.agc:11
//#				Luminary131 file, using page
// INTER-BANK_COMMUNICATION.agc:12
//#				images from Luminary 1A.
// INTER-BANK_COMMUNICATION.agc:13
//#		2011-05-08 JL	Removed workaround.
// INTER-BANK_COMMUNICATION.agc:14
//
// INTER-BANK_COMMUNICATION.agc:15
//# This source code has been transcribed or otherwise adapted from
// INTER-BANK_COMMUNICATION.agc:16
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// INTER-BANK_COMMUNICATION.agc:17
//# was performed by Fjeld Kerman, and arranged for by Douglas Kerman of
// INTER-BANK_COMMUNICATION.agc:18
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// INTER-BANK_COMMUNICATION.agc:19
//# in storage size and consequent reduction in image quality as well) are
// INTER-BANK_COMMUNICATION.agc:20
//# available online at www.ibiblio.org/apollo.  If for some reason you
// INTER-BANK_COMMUNICATION.agc:21
//# find that the images are illegible, contact me at info@sandroid.org
// INTER-BANK_COMMUNICATION.agc:22
//# about getting access to the (much) higher-quality images which Fjeld Kerman
// INTER-BANK_COMMUNICATION.agc:23
//# actually created.
// INTER-BANK_COMMUNICATION.agc:24
//#
// INTER-BANK_COMMUNICATION.agc:25
//# Notations on the hardcopy document read, in part:
// INTER-BANK_COMMUNICATION.agc:26
//#
// INTER-BANK_COMMUNICATION.agc:27
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// INTER-BANK_COMMUNICATION.agc:28
//#	16:27 JULY 14, 1969
// INTER-BANK_COMMUNICATION.agc:29
//
// INTER-BANK_COMMUNICATION.agc:30
//# Page 998
// INTER-BANK_COMMUNICATION.agc:31
//# 	   THE FOLLOWING ROUTINE CAN BE USED TO CALL A SUBROUTINE IN ANOTHER BANK. IN THE BANKCALL VERSION, THE
// INTER-BANK_COMMUNICATION.agc:32
//# CADR OF THE SUBROUTINE IMMEDIATELY FOLLOWS THE  TC BANKCALL  INSTRUCTION, WITH C(A) AND C(L) PRESERVED.
// INTER-BANK_COMMUNICATION.agc:33
//
// INTER-BANK_COMMUNICATION.agc:34
//		BLOCK	02
// INTER-BANK_COMMUNICATION.agc:35
//		COUNT*	$$/BANK
// INTER-BANK_COMMUNICATION.agc:36
//BANKCALL	DXCH	BUF2		# SAVE INCOMING A,L.
// slot 4494
        if slot <> 4494 or instruction <> 21596 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 92, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// INTER-BANK_COMMUNICATION.agc:37
//		INDEX	Q		# PICK UP CADR.
// slot 4495
        if slot <> 4495 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[174] to agcAotUnit174@.

agcAotInstallSourceRope(list(
// INTER-BANK_COMMUNICATION.agc:38
//		CA	0
// slot 4496
    4496, 24576
)).

// bank 02, slots 4497-4503
function agcAotUnit175 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4499 {
        if slot <= 4497 {
// INTER-BANK_COMMUNICATION.agc:39
//		INCR	Q		# SO WE RETURN TO THE LOC. AFTER THE CADR.
// slot 4497
            if slot <> 4497 or instruction <> 10242 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4498 {
// INTER-BANK_COMMUNICATION.agc:40
//
// INTER-BANK_COMMUNICATION.agc:41
//# 	   SWCALL IS IDENTICAL TO BANKCALL, EXCEPT THAT THE CADR ARRIVES IN A.
// INTER-BANK_COMMUNICATION.agc:42
//
// INTER-BANK_COMMUNICATION.agc:43
//SWCALL		TS	L
// slot 4498
                if slot <> 4498 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// INTER-BANK_COMMUNICATION.agc:44
//		LXCH	FBANK		# SWITCH BANKS, SAVING RETURN.
// slot 4499
                if slot <> 4499 or instruction <> 9220 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 4, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 4501 {
            if slot <= 4500 {
// INTER-BANK_COMMUNICATION.agc:45
//		MASK	LOW10		# GET SUB-ADDRESS OF CADR.
// slot 4500
                if slot <> 4500 or instruction <> 31242 { return choose false if checkOnly else -1. }
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
            } else {
// INTER-BANK_COMMUNICATION.agc:46
//		XCH	Q		# A,L NOW CONTAINS DP RETURN.
// slot 4501
                if slot <> 4501 or instruction <> 23554 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 2, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4502 {
// INTER-BANK_COMMUNICATION.agc:47
//		DXCH	BUF2		# RESTORING INPUTS IF THIS IS A BANKCALL.
// slot 4502
                if slot <> 4502 or instruction <> 21596 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 92, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// INTER-BANK_COMMUNICATION.agc:48
//		INDEX	Q
// slot 4503
                if slot <> 4503 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[175] to agcAotUnit175@.

agcAotInstallSourceRope(list(
// INTER-BANK_COMMUNICATION.agc:49
//		TC	10000		# SETTING Q TO SWRETURN.
// slot 4504
    4504, 2048
)).

// bank 02, slots 4505-4510
function agcAotUnit176 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4507 {
        if slot <= 4505 {
// INTER-BANK_COMMUNICATION.agc:50
//
// INTER-BANK_COMMUNICATION.agc:51
//SWRETURN	XCH	BUF2 	+1	# COMES HERE TO RETURN TO CALLER. C(A,L)
// slot 4505
            if slot <> 4505 or instruction <> 23644 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreExchange(words, 0, 92, readPhysical).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4506 {
// INTER-BANK_COMMUNICATION.agc:52
//		XCH	FBANK		# ARE PRESERVED FOR RETURN.
// slot 4506
                if slot <> 4506 or instruction <> 23556 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 4, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// INTER-BANK_COMMUNICATION.agc:53
//		XCH	BUF2 	+1
// slot 4507
                if slot <> 4507 or instruction <> 23644 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 92, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 4508 {
// INTER-BANK_COMMUNICATION.agc:54
//		TC	BUF2
// slot 4508
            if slot <> 4508 or instruction <> 91 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 91, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4509 {
// INTER-BANK_COMMUNICATION.agc:55
//
// INTER-BANK_COMMUNICATION.agc:56
//# 	   THE FOLLOWING ROUTINE CAN BE USED AS A UNILATERAL JUMP WITH C(A,L) PRESERVED AND THE CADR IMMEDIATELY
// INTER-BANK_COMMUNICATION.agc:57
//# FOLLOWING THE TC POSTJUMP INSTRUCTION.
// INTER-BANK_COMMUNICATION.agc:58
//
// INTER-BANK_COMMUNICATION.agc:59
//POSTJUMP	XCH	Q		# SAVE INCOMING C(A).
// slot 4509
                if slot <> 4509 or instruction <> 23554 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 2, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// INTER-BANK_COMMUNICATION.agc:60
//		INDEX	A		# GET CADR.
// slot 4510
                if slot <> 4510 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[176] to agcAotUnit176@.

agcAotInstallSourceRope(list(
// INTER-BANK_COMMUNICATION.agc:61
//		CA	0
// slot 4511
    4511, 24576
)).

// bank 02, slots 4512-4515
function agcAotUnit177 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4513 {
        if slot <= 4512 {
// INTER-BANK_COMMUNICATION.agc:62
//
// INTER-BANK_COMMUNICATION.agc:63
//# 	   BANKJUMP IS THE SAME AS POSTJUMP, EXCEPT THAT THE CADR ARRIVES IN A.
// INTER-BANK_COMMUNICATION.agc:64
//
// INTER-BANK_COMMUNICATION.agc:65
//BANKJUMP	TS	FBANK
// slot 4512
            if slot <> 4512 or instruction <> 22532 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22532, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// INTER-BANK_COMMUNICATION.agc:66
//		MASK	LOW10
// slot 4513
            if slot <> 4513 or instruction <> 31242 { return choose false if checkOnly else -1. }
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
    } else {
        if slot <= 4514 {
// INTER-BANK_COMMUNICATION.agc:67
//		XCH	Q		# RESTORING INPUT C(A) IF THIS WAS A
// slot 4514
            if slot <> 4514 or instruction <> 23554 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreExchange(words, 0, 2, readPhysical).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// INTER-BANK_COMMUNICATION.agc:68
//Q+10000		INDEX	Q		# POSTJUMP.
// slot 4515
            if slot <> 4515 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[177] to agcAotUnit177@.

agcAotInstallSourceRope(list(
// INTER-BANK_COMMUNICATION.agc:69
//PRIO12		TCF	10000		# PRIO12 = TCF	 10000 = 12000
// slot 4516
    4516, 10240
)).

// bank 02, slots 4517-4531
function agcAotUnit178 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4523 {
        if slot <= 4519 {
            if slot <= 4517 {
// INTER-BANK_COMMUNICATION.agc:70
//
// INTER-BANK_COMMUNICATION.agc:71
//# Page 999
// INTER-BANK_COMMUNICATION.agc:72
//# 	   THE FOLLOWING ROUTINE GETS THE RETURN CADR SAVED BY SWCALL OR BANKCALL AND LEAVES IT IN A.
// INTER-BANK_COMMUNICATION.agc:73
//
// INTER-BANK_COMMUNICATION.agc:74
//MAKECADR	CAF	LOW10
// slot 4517
                if slot <> 4517 or instruction <> 14858 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2570), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4518 {
// INTER-BANK_COMMUNICATION.agc:75
//		MASK	BUF2
// slot 4518
                    if slot <> 4518 or instruction <> 28763 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 91).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// INTER-BANK_COMMUNICATION.agc:76
//		AD	BUF2 	+1
// slot 4519
                    if slot <> 4519 or instruction <> 24668 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreAD(words, 92).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4521 {
                if slot <= 4520 {
// INTER-BANK_COMMUNICATION.agc:77
//		TC	Q
// slot 4520
                    if slot <> 4520 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// INTER-BANK_COMMUNICATION.agc:78
//
// INTER-BANK_COMMUNICATION.agc:79
//SUPDACAL	TS	MPTEMP
// slot 4521
                    if slot <> 4521 or instruction <> 22621 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22621, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4522 {
// INTER-BANK_COMMUNICATION.agc:80
//		XCH	FBANK		# SET FBANK FOR DATA.
// slot 4522
                    if slot <> 4522 or instruction <> 23556 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 4, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// INTER-BANK_COMMUNICATION.agc:81
//		EXTEND
// slot 4523
                    if slot <> 4523 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 4527 {
            if slot <= 4525 {
                if slot <= 4524 {
// INTER-BANK_COMMUNICATION.agc:82
//		ROR	SUPERBNK	# SAVE FBANK IN BITS 15-11, AND
// slot 4524
                    if slot <> 4524 or instruction <> 2055 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 4, 7, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// INTER-BANK_COMMUNICATION.agc:83
//		XCH	MPTEMP		#  SUPERBANK IN BITS  7-5.
// slot 4525
                    if slot <> 4525 or instruction <> 23645 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 93, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4526 {
// INTER-BANK_COMMUNICATION.agc:84
//		MASK	LOW10
// slot 4526
                    if slot <> 4526 or instruction <> 31242 { return choose false if checkOnly else -1. }
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
                } else {
// INTER-BANK_COMMUNICATION.agc:85
//		XCH	L		# SAVE REL. ADR. IN BANK, FETCH SUPERBITS.
// slot 4527
                    if slot <> 4527 or instruction <> 23553 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 1, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4529 {
                if slot <= 4528 {
// INTER-BANK_COMMUNICATION.agc:86
//		INHINT			# BECAUSE RUPT DOES NOT SAVE SUPERBANK.
// slot 4528
                    if slot <> 4528 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// INTER-BANK_COMMUNICATION.agc:87
//		EXTEND
// slot 4529
                    if slot <> 4529 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4530 {
// INTER-BANK_COMMUNICATION.agc:88
//		WRITE	SUPERBNK	# SET SUPERBANK FOR DATA.
// slot 4530
                    if slot <> 4530 or instruction <> 519 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 1, 7, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// INTER-BANK_COMMUNICATION.agc:89
//		INDEX	L
// slot 4531
                    if slot <> 4531 or instruction <> 20481 { return choose false if checkOnly else -1. }
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
set agcAotRoutes[178] to agcAotUnit178@.

agcAotInstallSourceRope(list(
// INTER-BANK_COMMUNICATION.agc:90
//		CA	10000		# PINBALL (FIX MEM DISP) PREVENTS DCA HERE
// slot 4532
    4532, 26624
)).

// bank 02, slots 4533-4541
function agcAotUnit179 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4536 {
        if slot <= 4534 {
            if slot <= 4533 {
// INTER-BANK_COMMUNICATION.agc:91
//		XCH	MPTEMP		# SAVE 1ST WD, FETCH OLD FBANK AND SBANK.
// slot 4533
                if slot <> 4533 or instruction <> 23645 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 93, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// INTER-BANK_COMMUNICATION.agc:92
//		EXTEND
// slot 4534
                if slot <> 4534 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4535 {
// INTER-BANK_COMMUNICATION.agc:93
//		WRITE	SUPERBNK	# RESTORE SUPERBANK.
// slot 4535
                if slot <> 4535 or instruction <> 519 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 1, 7, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// INTER-BANK_COMMUNICATION.agc:94
//		RELINT
// slot 4536
                if slot <> 4536 or instruction <> 3 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 4538 {
            if slot <= 4537 {
// INTER-BANK_COMMUNICATION.agc:95
//		TS	FBANK		# RESTORE FBANK.
// slot 4537
                if slot <> 4537 or instruction <> 22532 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22532, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// INTER-BANK_COMMUNICATION.agc:96
//		CA	MPTEMP		# RECOVER FIRST WORD OF DATA.
// slot 4538
                if slot <> 4538 or instruction <> 12381 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 93).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4539 {
// INTER-BANK_COMMUNICATION.agc:97
//		RETURN			# 24 WDS. DATACALL 516 MU, SUPDACAL 432 MU
// slot 4539
                if slot <> 4539 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4540 {
// INTER-BANK_COMMUNICATION.agc:98
//
// INTER-BANK_COMMUNICATION.agc:99
//# Page 1000
// INTER-BANK_COMMUNICATION.agc:100
//# 	   THE FOLLOWING ROUTINES ARE IDENTICAL TO BANKCALL AND SWCALL EXCEPT THAT THEY ARE USED IN INTERRUPT.
// INTER-BANK_COMMUNICATION.agc:101
//
// INTER-BANK_COMMUNICATION.agc:102
//IBNKCALL	DXCH	RUPTREG3	# USES RUPTREG3,4 FOR DP RETURN ADDRESS.
// slot 4540
                    if slot <> 4540 or instruction <> 21563 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 59, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// INTER-BANK_COMMUNICATION.agc:103
//		INDEX	Q
// slot 4541
                    if slot <> 4541 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
    }
}
set agcAotRoutes[179] to agcAotUnit179@.

agcAotInstallSourceRope(list(
// INTER-BANK_COMMUNICATION.agc:104
//		CAF	0
// slot 4542
    4542, 24576
)).

// bank 02, slots 4543-4549
function agcAotUnit180 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4545 {
        if slot <= 4543 {
// INTER-BANK_COMMUNICATION.agc:105
//		INCR	Q
// slot 4543
            if slot <> 4543 or instruction <> 10242 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4544 {
// INTER-BANK_COMMUNICATION.agc:106
//
// INTER-BANK_COMMUNICATION.agc:107
//ISWCALLL	TS	L
// slot 4544
                if slot <> 4544 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// INTER-BANK_COMMUNICATION.agc:108
//		LXCH	FBANK
// slot 4545
                if slot <> 4545 or instruction <> 9220 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreExchange(words, 1, 4, readPhysical).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 4547 {
            if slot <= 4546 {
// INTER-BANK_COMMUNICATION.agc:109
//		MASK	LOW10
// slot 4546
                if slot <> 4546 or instruction <> 31242 { return choose false if checkOnly else -1. }
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
            } else {
// INTER-BANK_COMMUNICATION.agc:110
//		XCH	Q
// slot 4547
                if slot <> 4547 or instruction <> 23554 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 2, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4548 {
// INTER-BANK_COMMUNICATION.agc:111
//		DXCH	RUPTREG3
// slot 4548
                if slot <> 4548 or instruction <> 21563 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 59, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// INTER-BANK_COMMUNICATION.agc:112
//		INDEX	Q
// slot 4549
                if slot <> 4549 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
}
set agcAotRoutes[180] to agcAotUnit180@.

agcAotInstallSourceRope(list(
// INTER-BANK_COMMUNICATION.agc:113
//		TC	10000
// slot 4550
    4550, 2048
)).

// bank 02, slots 4551-4560
function agcAotUnit181 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4555 {
        if slot <= 4552 {
            if slot <= 4551 {
// INTER-BANK_COMMUNICATION.agc:114
//
// INTER-BANK_COMMUNICATION.agc:115
//ISWRETRN	XCH	RUPTREG4
// slot 4551
                if slot <> 4551 or instruction <> 23611 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 59, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// INTER-BANK_COMMUNICATION.agc:116
//		XCH	FBANK
// slot 4552
                if slot <> 4552 or instruction <> 23556 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 4, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4553 {
// INTER-BANK_COMMUNICATION.agc:117
//		XCH	RUPTREG4
// slot 4553
                if slot <> 4553 or instruction <> 23611 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 59, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4554 {
// INTER-BANK_COMMUNICATION.agc:118
//		TC	RUPTREG3
// slot 4554
                    if slot <> 4554 or instruction <> 58 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 58, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// INTER-BANK_COMMUNICATION.agc:119
//
// INTER-BANK_COMMUNICATION.agc:120
//# 2. USPRCADR ACCESSES INTERPRETIVE CODING IN OTHER THAN THE USER'S FBANK.  THE CALLING SEQUENCE IS AS FOLLOWS:
// INTER-BANK_COMMUNICATION.agc:121
//
// INTER-BANK_COMMUNICATION.agc:122
//# L		TC	USPRCADR
// INTER-BANK_COMMUNICATION.agc:123
//# L+1		CADR	INTPRETX	  INTPRETX IS THE INTERPRETIVE CODING
// INTER-BANK_COMMUNICATION.agc:124
//#					  RETURN IS TO L+2
// INTER-BANK_COMMUNICATION.agc:125
//
// INTER-BANK_COMMUNICATION.agc:126
//USPRCADR	TS	LOC		# SAVE A
// slot 4555
                    if slot <> 4555 or instruction <> 22644 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22644, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 4557 {
            if slot <= 4556 {
// INTER-BANK_COMMUNICATION.agc:127
//		CA	BIT8
// slot 4556
                if slot <> 4556 or instruction <> 14820 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2532), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// INTER-BANK_COMMUNICATION.agc:128
//		TS	EDOP		# EXIT INSTRUCTION TO EDOP
// slot 4557
                if slot <> 4557 or instruction <> 22547 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22547, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4558 {
// INTER-BANK_COMMUNICATION.agc:129
//		CA	BBANK
// slot 4558
                if slot <> 4558 or instruction <> 12294 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 6).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4559 {
// INTER-BANK_COMMUNICATION.agc:130
//		TS	BANKSET		# USER'S BBANK TO BANKSET
// slot 4559
                    if slot <> 4559 or instruction <> 22645 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22645, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// INTER-BANK_COMMUNICATION.agc:131
//		INDEX	Q
// slot 4560
                    if slot <> 4560 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
    }
}
set agcAotRoutes[181] to agcAotUnit181@.

agcAotInstallSourceRope(list(
// INTER-BANK_COMMUNICATION.agc:132
//		CA	0
// slot 4561
    4561, 24576
)).

// bank 02, slots 4562-4569
function agcAotUnit182 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4565 {
        if slot <= 4563 {
            if slot <= 4562 {
// INTER-BANK_COMMUNICATION.agc:133
//		TS	FBANK		# INTERPRETIVE BANK TO FBANK
// slot 4562
                if slot <> 4562 or instruction <> 22532 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22532, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// INTER-BANK_COMMUNICATION.agc:134
//		MASK	LOW10		# YIELDS INTERPRETIVE RELATIVE ADDRESS
// slot 4563
                if slot <> 4563 or instruction <> 31242 { return choose false if checkOnly else -1. }
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
        } else {
            if slot <= 4564 {
// INTER-BANK_COMMUNICATION.agc:135
//		XCH	Q		# INTERPRETIVE ADDRESS TO Q, FETCHING L+1
// slot 4564
                if slot <> 4564 or instruction <> 23554 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 2, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// INTER-BANK_COMMUNICATION.agc:136
//		XCH	LOC		# L+1 TO LOC, RETRIEVING ORIGINAL A
// slot 4565
                if slot <> 4565 or instruction <> 23668 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 116, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 4567 {
            if slot <= 4566 {
// INTER-BANK_COMMUNICATION.agc:137
//		TCF	Q+10000
// slot 4566
                if slot <> 4566 or instruction <> 6563 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6563, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// INTER-BANK_COMMUNICATION.agc:138
//
// INTER-BANK_COMMUNICATION.agc:139
//# Page 1001
// INTER-BANK_COMMUNICATION.agc:140
//# THERE ARE FOUR POSSIBLE SETTINGS FOR CHANNEL 07. (CHANNEL 07 CONTAINS SUPERBANK SETTING.)
// INTER-BANK_COMMUNICATION.agc:141
//#					    PSEUDO-FIXED      OCTAL PSEUDO
// INTER-BANK_COMMUNICATION.agc:142
//# SUPERBANK	SETTING	    S-REG. VALUE    BANK NUMBERS      ADDRESSES
// INTER-BANK_COMMUNICATION.agc:143
//# ----------	-------	    ------------     ------------      ------------
// INTER-BANK_COMMUNICATION.agc:144
//#
// INTER-BANK_COMMUNICATION.agc:145
//# SUPERBANK 3	  OXX	    2000 - 3777	       30 - 37	      70000 - 107777	(WHERE XX CAN BE ANYTHING AND
// INTER-BANK_COMMUNICATION.agc:146
//#										WILL USUALLY BE SEEN AS 11)
// INTER-BANK_COMMUNICATION.agc:147
//# SUPERBANK 4	  100	    2000 - 3777        40 - 47	      110000 - 127777	(AS FAR AS IT CAN BE SEEN,
// INTER-BANK_COMMUNICATION.agc:148
//#										ONLY BANKS 40-43 WILL EVER BE
// INTER-BANK_COMMUNICATION.agc:149
//#										AND ARE PRESENTLY AVAILABLE)
// INTER-BANK_COMMUNICATION.agc:150
//# SUPERBANK 5	  101	    2000 - 3777	       50 - 57	      130000 - 147777	(PRESENTLY NOT AVAILABLE TO
// INTER-BANK_COMMUNICATION.agc:151
//#										THE USER)
// INTER-BANK_COMMUNICATION.agc:152
//# SUPERBANK 6	  110	    2000 - 3777	       60 - 67	      150000 - 167777	(PRESENTLY NOT AVAILABLE TO
// INTER-BANK_COMMUNICATION.agc:153
//#										THE USER)
// INTER-BANK_COMMUNICATION.agc:154
//# ***  THIS ROUTINE MAYBE CALLED BY ANY PROGRAM LOCATED IN BANKS 00 - 27.  I.E., NO PROGRAM LIVING IN ANY
// INTER-BANK_COMMUNICATION.agc:155
//# SUPERBANK SHOULD USE SUPERSW.  ***
// INTER-BANK_COMMUNICATION.agc:156
//#
// INTER-BANK_COMMUNICATION.agc:157
//# SUPERSW MAYBE CALLED IN THIS FASHION:
// INTER-BANK_COMMUNICATION.agc:158
//#
// INTER-BANK_COMMUNICATION.agc:159
//#	   CAF	  ABBCON	  WHERE  --  ABBCON   BBCON  SOMETHIN  --
// INTER-BANK_COMMUNICATION.agc:160
//#	   TCR	  SUPERSW	  (THE SUPERBNK BITS ARE IN THE BBCON)
// INTER-BANK_COMMUNICATION.agc:161
//#	   ...	    ...
// INTER-BANK_COMMUNICATION.agc:162
//#	    .	     .
// INTER-BANK_COMMUNICATION.agc:163
//#	    .	     .
// INTER-BANK_COMMUNICATION.agc:164
//# OR IN THIS FASHION :
// INTER-BANK_COMMUNICATION.agc:165
//#	   CAF	  SUPERSET	  WHERE SUPERSET IS ONE OF THE FOUR AVAILABLE
// INTER-BANK_COMMUNICATION.agc:166
//#	   TCR	  SUPERSW	  SUPERBANK BIT CONSTANTS:
// INTER-BANK_COMMUNICATION.agc:167
//#	   ...	    ...					  SUPER011 OCTAL  60
// INTER-BANK_COMMUNICATION.agc:168
//#	    .	     .					  SUPER100 OCTAL 100
// INTER-BANK_COMMUNICATION.agc:169
//#	    .	     .					  SUPER101 OCTAL 120
// INTER-BANK_COMMUNICATION.agc:170
//#							  SUPER110 OCTAL 140
// INTER-BANK_COMMUNICATION.agc:171
//
// INTER-BANK_COMMUNICATION.agc:172
//SUPERSW		EXTEND
// slot 4567
                if slot <> 4567 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4568 {
// INTER-BANK_COMMUNICATION.agc:173
//		WRITE	SUPERBNK	# WRITE BITS 7-6-5 OF THE ACCUMULATOR INTO
// slot 4568
                if slot <> 4568 or instruction <> 519 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 1, 7, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// INTER-BANK_COMMUNICATION.agc:174
//					# CHANNEL 07
// INTER-BANK_COMMUNICATION.agc:175
//		TC	Q		# TC TO INSTRUCTION FOLLOWING
// slot 4569
                if slot <> 4569 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[182] to agcAotUnit182@.

// no code for the lines below
// INTER-BANK_COMMUNICATION.agc:176
//					#   TC  SUPERSW
// INTER-BANK_COMMUNICATION.agc:177
//
