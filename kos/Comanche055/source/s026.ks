// PORT: Original source unit INTER-BANK_COMMUNICATION.agc.
// PORT: Physical bank 02. Shared continuation entries, slots 4530–4531.
function agcAotUnit174 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4530 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:1
//# Copyright:    Public domain.
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:2
//# Filename:     INTER-BANK_COMMUNICATION.agc
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:3
//# Purpose:      Part of the source code for Comanche, build 055. It
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:4
//#               is part of the source code for the Command Module's
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:5
//#               (CM) Apollo Guidance Computer (AGC), Apollo 11.
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:6
//# Assembler:    yaYUL
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:7
//# Reference:    pp. 1103-1106
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:8
//# Contact:      Ron Burkey <info@sandroid.org>
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:9
//# Website:      http://www.ibiblio.org/apollo.
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:10
//# Mod history:  2009-05-08 RSB	Adapted from Colossus249/ file of same name
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:11
//#				and page images. Corrected various typos
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:12
//#				in the transcription of program comments,
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:13
//#				and these should be back-ported to
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:14
//#				Colossus249.
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:15
//#
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:16
//# The contents of the "Comanche055" files, in general, are transcribed
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:17
//# from scanned documents.
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:18
//#
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:19
//#       Assemble revision 055 of AGC program Comanche by NASA
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:20
//#       2021113-051.  April 1, 1969.
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:21
//#
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:22
//#       This AGC program shall also be referred to as Colossus 2A
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:23
//#
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:24
//#       Prepared by
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:25
//#                       Massachusetts Institute of Technology
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:26
//#                       75 Cambridge Parkway
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:27
//#                       Cambridge, Massachusetts
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:28
//#
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:29
//#       under NASA contract NAS 9-4065.
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:30
//#
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:31
//# Refer directly to the online document mentioned above for further
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:32
//# information.  Please report any errors to info@sandroid.org.
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:33
//
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:34
//# Page 1103
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:35
//# THE FOLLOWING ROUTINE CAN BE USED TO CALL A SUBROUTINE IN ANOTHER BANK. IN THE BANKCALL VERSION, THE
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:36
//# CADR OF THE SUBROUTINE IMMEDIATELY FOLLOWS THE TC BANKCALL INSTRUCTION, WITH C(A) AND C(L) PRESERVED.
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:37
//
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:38
//		BLOCK	02
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:39
//		COUNT	02/BANK
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:40
//
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:41
//BANKCALL	DXCH	BUF2		# SAVE INCOMING A,L.
// PORT: Fixed ROM slots 4530.
        if slot <> 4530 or instruction <> 21596 { return choose false if checkOnly else -1. }
        if not extended {
            if checkOnly { return true. }
            if not agcCoreDoubleExchange(words, "DXCH", 92, readPhysical, readAdjacent) { return -1. }
            return list(false, false, true, false, false).
        }
        return choose false if checkOnly else -1.
    } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:42
//		INDEX	Q		# PICK UP CADR.
// PORT: Fixed ROM slots 4531.
        if slot <> 4531 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:43
//		CA	0
// PORT: Fixed ROM slots 4532.
    4532, 24576
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4533–4539.
function agcAotUnit175 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4535 {
        if slot <= 4533 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:44
//		INCR	Q		# SO WE RETURN TO THE LOC. AFTER THE CADR.
// PORT: Fixed ROM slots 4533.
            if slot <> 4533 or instruction <> 10242 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4534 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:45
//
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:46
//# SWCALL IS  IDENTICAL TO BANKCALL, EXCEPT THAT THE CADR ARRIVES IN A.
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:47
//
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:48
//SWCALL		TS	L
// PORT: Fixed ROM slots 4534.
                if slot <> 4534 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:49
//		LXCH	FBANK		# SWITCH BANKS, SAVING RETURN.
// PORT: Fixed ROM slots 4535.
                if slot <> 4535 or instruction <> 9220 { return choose false if checkOnly else -1. }
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
        if slot <= 4537 {
            if slot <= 4536 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:50
//		MASK	LOW10		# GET SUB-ADDRESS OF CADR.
// PORT: Fixed ROM slots 4536.
                if slot <> 4536 or instruction <> 31276 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2604), 32768).
                    if fixedOperand = 1023 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 1), 1024) * 1).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:51
//		XCH	Q		# A,L NOW CONTAINS DP RETURN.
// PORT: Fixed ROM slots 4537.
                if slot <> 4537 or instruction <> 23554 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 2, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4538 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:52
//		DXCH	BUF2		# RESTORING INPUTS IF THIS IS A BANKCALL.
// PORT: Fixed ROM slots 4538.
                if slot <> 4538 or instruction <> 21596 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 92, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:53
//		INDEX	Q
// PORT: Fixed ROM slots 4539.
                if slot <> 4539 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:54
//		TC	10000		# SETTING Q TO SWRETURN
// PORT: Fixed ROM slots 4540.
    4540, 2048
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4541–4546.
function agcAotUnit176 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4543 {
        if slot <= 4541 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:55
//
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:56
//SWRETURN	XCH	BUF2 +1		# COMES HERE TO RETURN TO CALLER. C(A,L)
// PORT: Fixed ROM slots 4541.
            if slot <> 4541 or instruction <> 23644 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreExchange(words, 0, 92, readPhysical).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4542 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:57
//		XCH	FBANK		# ARE PRESERVED FOR RETURN.
// PORT: Fixed ROM slots 4542.
                if slot <> 4542 or instruction <> 23556 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 4, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:58
//		XCH	BUF2 +1
// PORT: Fixed ROM slots 4543.
                if slot <> 4543 or instruction <> 23644 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 92, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 4544 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:59
//		TC	BUF2
// PORT: Fixed ROM slots 4544.
            if slot <> 4544 or instruction <> 91 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 91, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4545 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:60
//
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:61
//# THE FOLLOWING ROUTINE CAN BE USED AS A UNILATERAL JUMP WITH C(A,L) PRESERVED AND THE CADR IMMEDIATELY
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:62
//# FOLLOWING THE TC POSTJUMP INSTRUCTION.
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:63
//
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:64
//POSTJUMP	XCH	Q		# SAVE INCOMING C(A).
// PORT: Fixed ROM slots 4545.
                if slot <> 4545 or instruction <> 23554 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 2, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:65
//		INDEX	A		# GET CADR.
// PORT: Fixed ROM slots 4546.
                if slot <> 4546 or instruction <> 20480 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:66
//		CA	0
// PORT: Fixed ROM slots 4547.
    4547, 24576
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4548–4551.
function agcAotUnit177 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4549 {
        if slot <= 4548 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:67
//
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:68
//# BANKJUMP IS THE SAME AS POSTJUMP, EXCEPT THAT THE CADR ARRIVES IN A.
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:69
//
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:70
//BANKJUMP	TS	FBANK
// PORT: Fixed ROM slots 4548.
            if slot <> 4548 or instruction <> 22532 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 22532, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:71
//		MASK	LOW10
// PORT: Fixed ROM slots 4549.
            if slot <> 4549 or instruction <> 31276 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                set words[0] to agcOverflowCorrected(words[0]).
                local fixedOperand is mod(readEffective:call(words, 2604), 32768).
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
        if slot <= 4550 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:72
//		XCH	Q		# RESTORING INPUT C(A) IF THIS WAS A
// PORT: Fixed ROM slots 4550.
            if slot <> 4550 or instruction <> 23554 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                agcCoreExchange(words, 0, 2, readPhysical).
                return list(false, false, true, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:73
//Q+10000		INDEX	Q		# POSTJUMP.
// PORT: Fixed ROM slots 4551.
            if slot <> 4551 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:74
//PRIO12		TCF	10000		# PRIO12 = TCF	10000 = 12000
// PORT: Fixed ROM slots 4552.
    4552, 10240
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4553–4567.
function agcAotUnit178 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4559 {
        if slot <= 4555 {
            if slot <= 4553 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:75
//
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:76
//# Page 1104
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:77
//# THE FOLLOWING ROUTINE GETS THE RETURN CADR SAVED BY SWCALL OR BANKCALL AND LEAVES IT IN A.
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:78
//
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:79
//MAKECADR	CAF	LOW10
// PORT: Fixed ROM slots 4553.
                if slot <> 4553 or instruction <> 14892 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2604), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4554 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:80
//		MASK	BUF2
// PORT: Fixed ROM slots 4554.
                    if slot <> 4554 or instruction <> 28763 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreMASK(words, 91).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:81
//		AD	BUF2 +1
// PORT: Fixed ROM slots 4555.
                    if slot <> 4555 or instruction <> 24668 { return choose false if checkOnly else -1. }
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
            if slot <= 4557 {
                if slot <= 4556 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:82
//		TC	Q
// PORT: Fixed ROM slots 4556.
                    if slot <> 4556 or instruction <> 2 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 2, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:83
//
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:84
//SUPDACAL	TS	MPTEMP
// PORT: Fixed ROM slots 4557.
                    if slot <> 4557 or instruction <> 22621 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22621, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4558 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:85
//		XCH	FBANK		# SET FBANK FOR DATA.
// PORT: Fixed ROM slots 4558.
                    if slot <> 4558 or instruction <> 23556 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 4, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:86
//		EXTEND
// PORT: Fixed ROM slots 4559.
                    if slot <> 4559 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 4563 {
            if slot <= 4561 {
                if slot <= 4560 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:87
//		ROR	SUPERBNK	# SAVE FBANK IN BITS 15-11, AND
// PORT: Fixed ROM slots 4560.
                    if slot <> 4560 or instruction <> 2055 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 4, 7, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:88
//		XCH	MPTEMP		# SUPERBANK IN BITS 7-5.
// PORT: Fixed ROM slots 4561.
                    if slot <> 4561 or instruction <> 23645 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 93, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4562 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:89
//		MASK	LOW10
// PORT: Fixed ROM slots 4562.
                    if slot <> 4562 or instruction <> 31276 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        set words[0] to agcOverflowCorrected(words[0]).
                        local fixedOperand is mod(readEffective:call(words, 2604), 32768).
                        if fixedOperand = 1023 {
                            set words[0] to agcSignExtend(mod(floor(words[0] / 1), 1024) * 1).
                        } else {
                            set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                        }
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:90
//		XCH	L		# SAVE REL. ADR. IN BANK, FETCH SUPERBITS.
// PORT: Fixed ROM slots 4563.
                    if slot <> 4563 or instruction <> 23553 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        agcCoreExchange(words, 0, 1, readPhysical).
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        } else {
            if slot <= 4565 {
                if slot <= 4564 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:91
//		INHINT			# BECAUSE RUPT DOES NOT SAVE SUPERBANK.
// PORT: Fixed ROM slots 4564.
                    if slot <> 4564 or instruction <> 4 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 4, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:92
//		EXTEND
// PORT: Fixed ROM slots 4565.
                    if slot <> 4565 or instruction <> 6 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 6, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            } else {
                if slot <= 4566 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:93
//		WRITE	SUPERBNK	# SET SUPERBANK FOR DATA.
// PORT: Fixed ROM slots 4566.
                    if slot <> 4566 or instruction <> 519 { return choose false if checkOnly else -1. }
                    if extended {
                        if checkOnly { return true. }
                        local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                        agcCoreChannelInstruction(words, 1, 7, channelAdapter).
                        return list(false, false, inheritedTransient, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:94
//		INDEX	L
// PORT: Fixed ROM slots 4567.
                    if slot <> 4567 or instruction <> 20481 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:95
//		CA	10000		# PINBALL (FIX MEM DISP) PREVENTS DCA HERE
// PORT: Fixed ROM slots 4568.
    4568, 26624
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4569–4577.
function agcAotUnit179 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4572 {
        if slot <= 4570 {
            if slot <= 4569 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:96
//		XCH	MPTEMP		# SAVE 1ST WD, FETCH OLD FBANK AND SBANK.
// PORT: Fixed ROM slots 4569.
                if slot <> 4569 or instruction <> 23645 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 93, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:97
//		EXTEND
// PORT: Fixed ROM slots 4570.
                if slot <> 4570 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4571 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:98
//		WRITE	SUPERBNK	# RESTORE SUPERBANK.
// PORT: Fixed ROM slots 4571.
                if slot <> 4571 or instruction <> 519 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 1, 7, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:99
//		RELINT
// PORT: Fixed ROM slots 4572.
                if slot <> 4572 or instruction <> 3 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 3, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 4574 {
            if slot <= 4573 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:100
//		TS	FBANK		# RESTORE FBANK.
// PORT: Fixed ROM slots 4573.
                if slot <> 4573 or instruction <> 22532 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22532, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:101
//		CA	MPTEMP		# RECOVER FIRST WORD OF DATA.
// PORT: Fixed ROM slots 4574.
                if slot <> 4574 or instruction <> 12381 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 93).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4575 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:102
//		RETURN			# 24 WDS. DATACALL 516 MU, SUPDACAL 432 MU
// PORT: Fixed ROM slots 4575.
                if slot <> 4575 or instruction <> 2 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 2, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4576 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:103
//
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:104
//# Page 1105
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:105
//# THE FOLLOWING ROUTINES ARE IDENTICAL TO BANKCALL AND SWCALL EXCEPT THAT THEY ARE USED IN INTERRUPT.
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:106
//
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:107
//IBNKCALL	DXCH	RUPTREG3	# USES RUPTREG3,4 FOR DP RETURN ADDRESS.
// PORT: Fixed ROM slots 4576.
                    if slot <> 4576 or instruction <> 21563 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        if not agcCoreDoubleExchange(words, "DXCH", 59, readPhysical, readAdjacent) { return -1. }
                        return list(false, false, true, false, false).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:108
//		INDEX	Q
// PORT: Fixed ROM slots 4577.
                    if slot <> 4577 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:109
//		# Was CAF --- RSB 2009
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:110
//		CA	0
// PORT: Fixed ROM slots 4578.
    4578, 24576
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4579–4585.
function agcAotUnit180 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4581 {
        if slot <= 4579 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:111
//		INCR	Q
// PORT: Fixed ROM slots 4579.
            if slot <> 4579 or instruction <> 10242 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                agcCoreINCR(words, 2).
                return list(false, false, inheritedTransient, false, false).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4580 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:112
//
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:113
//ISWCALL		TS	L
// PORT: Fixed ROM slots 4580.
                if slot <> 4580 or instruction <> 22529 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22529, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:114
//		LXCH	FBANK
// PORT: Fixed ROM slots 4581.
                if slot <> 4581 or instruction <> 9220 { return choose false if checkOnly else -1. }
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
        if slot <= 4583 {
            if slot <= 4582 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:115
//		MASK	LOW10
// PORT: Fixed ROM slots 4582.
                if slot <> 4582 or instruction <> 31276 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2604), 32768).
                    if fixedOperand = 1023 {
                        set words[0] to agcSignExtend(mod(floor(words[0] / 1), 1024) * 1).
                    } else {
                        set words[0] to agcSignExtend(agcAnd16(words[0], fixedOperand)).
                    }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:116
//		XCH	Q
// PORT: Fixed ROM slots 4583.
                if slot <> 4583 or instruction <> 23554 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 2, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4584 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:117
//		DXCH	RUPTREG3
// PORT: Fixed ROM slots 4584.
                if slot <> 4584 or instruction <> 21563 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 59, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:118
//		INDEX	Q
// PORT: Fixed ROM slots 4585.
                if slot <> 4585 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:119
//		TC	10000
// PORT: Fixed ROM slots 4586.
    4586, 2048
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4587–4596.
function agcAotUnit181 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4591 {
        if slot <= 4588 {
            if slot <= 4587 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:120
//
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:121
//ISWRETRN	XCH	RUPTREG4
// PORT: Fixed ROM slots 4587.
                if slot <> 4587 or instruction <> 23611 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 59, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:122
//		XCH	FBANK
// PORT: Fixed ROM slots 4588.
                if slot <> 4588 or instruction <> 23556 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 4, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4589 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:123
//		XCH	RUPTREG4
// PORT: Fixed ROM slots 4589.
                if slot <> 4589 or instruction <> 23611 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 59, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4590 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:124
//		TC	RUPTREG3
// PORT: Fixed ROM slots 4590.
                    if slot <> 4590 or instruction <> 58 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 58, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:125
//
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:126
//# 2. USPRCADR ACCESSES INTERPRETIVE CODING IN OTHER THAN THE USER'S FBANK.  THE CALLING SEQUENCE IS AS FOLLOWS:
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:127
//#	L	TC	USPRCADR
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:128
//#	L+1	CADR	INTPRETX	# INTPRETX IS THE INTERPRETIVE CODING
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:129
//#					# RETURN IS TO L+2
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:130
//
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:131
//USPRCADR	TS	LOC		# SAVE A
// PORT: Fixed ROM slots 4591.
                    if slot <> 4591 or instruction <> 22644 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22644, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                }
            }
        }
    } else {
        if slot <= 4593 {
            if slot <= 4592 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:132
//		CA	BIT8
// PORT: Fixed ROM slots 4592.
                if slot <> 4592 or instruction <> 14856 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    local fixedOperand is mod(readEffective:call(words, 2568), 32768).
                    set words[0] to agcSignExtend(fixedOperand).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:133
//		TS	EDOP		# EXIT INSTRUCTION TO EDOP
// PORT: Fixed ROM slots 4593.
                if slot <> 4593 or instruction <> 22547 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22547, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4594 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:134
//		CA	BBANK
// PORT: Fixed ROM slots 4594.
                if slot <> 4594 or instruction <> 12294 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreCA(words, 6).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
                if slot <= 4595 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:135
//		TS	BANKSET		# USER'S BBANK TO BANKSET
// PORT: Fixed ROM slots 4595.
                    if slot <> 4595 or instruction <> 22645 { return choose false if checkOnly else -1. }
                    if not extended {
                        if checkOnly { return true. }
                        return agcCoreControlExecute(words, 22645, words[0], readEffective).
                    }
                    return choose false if checkOnly else -1.
                } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:136
//		INDEX	Q
// PORT: Fixed ROM slots 4596.
                    if slot <> 4596 or instruction <> 20482 { return choose false if checkOnly else -1. }
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
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:137
//		CA	0
// PORT: Fixed ROM slots 4597.
    4597, 24576
)).

// PORT: Physical bank 02. Shared continuation entries, slots 4598–4605.
function agcAotUnit182 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4601 {
        if slot <= 4599 {
            if slot <= 4598 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:138
//		TS	FBANK		# INTERPRETIVE BANK TO FBANK
// PORT: Fixed ROM slots 4598.
                if slot <> 4598 or instruction <> 22532 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 22532, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:139
//		MASK	LOW10		# YIELDS INTERPRETIVE RELATIVE ADDRESS
// PORT: Fixed ROM slots 4599.
                if slot <> 4599 or instruction <> 31276 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    set words[0] to agcOverflowCorrected(words[0]).
                    local fixedOperand is mod(readEffective:call(words, 2604), 32768).
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
            if slot <= 4600 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:140
//		XCH	Q		# INTERPRETIVE ADDRESS TO Q, FETCHING L+1
// PORT: Fixed ROM slots 4600.
                if slot <> 4600 or instruction <> 23554 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 2, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:141
//		XCH	LOC		# L+1 TO LOC, RETRIEVING ORIGINAL A
// PORT: Fixed ROM slots 4601.
                if slot <> 4601 or instruction <> 23668 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    agcCoreExchange(words, 0, 116, readPhysical).
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    } else {
        if slot <= 4603 {
            if slot <= 4602 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:142
//		TCF	Q+10000
// PORT: Fixed ROM slots 4602.
                if slot <> 4602 or instruction <> 6599 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6599, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:143
//
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:144
//# Page 1106
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:145
//# THERE ARE FOUR POSSIBLE SETTINGS FOR CHANNEL 07.  (CHANNEL 07 CONTAINS SUPERBANK SETTING.)
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:146
//#
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:147
//#					PSEUDO-FIXED	 OCTAL PSEUDO
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:148
//# SUPERBANK	SETTING	S-REG. VALUE	BANK NUMBERS	 ADDRESSES
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:149
//# ----------	-------	------------	------------ 	  ------------
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:150
//# SUPERBANK 3	  0XX	2000 - 3777	   30 - 37	 70000 - 107777		(WHERE XX CAN BE ANYTHING AND
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:151
//#										WILL USUALLY BE SEEN AS 11)
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:152
//# SUPERBANK 4	  100	2000 - 3777	   40 - 47	 110000 - 127777	(AS FAR AS IT CAN BE SEEN,
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:153
//#										ONLY BANKS 40-43 WILL EVER BE
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:154
//#										AND ARE PRESENTLY AVAILABLE)
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:155
//# SUPERBANK 5	  101	2000 - 3777	   50 - 57	 130000 - 147777	(PRESENTLY NOT AVAILABLE TO
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:156
//#										THE USER)
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:157
//# SUPERBANK 6	  110	2000 - 3777	   60 - 67	 150000 - 167777	(PRESENTLY NOT AVAILABLE TO
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:158
//#										THE USER)
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:159
//# ***  THIS ROUTINE MAYBE CALLED BY ANY PROGRAM LOCATED IN BANKS 00 - 27.  I.E., NO PROGRAM LIVING IN ANY
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:160
//# SUPERBANK SHOULD USE SUPERSW.  ***
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:161
//#
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:162
//# SUPERSW MAYBE CALLED IN THIS FASHION:
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:163
//#	CAF	ABBCON		WHERE  --  ABBCON   BBCON  SOMETHIN  --
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:164
//#	TCR	SUPERSW		(THE SUPERBNK BITS ARE IN THE BBCON)
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:165
//#	...	  ...
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:166
//#	 .	   .
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:167
//#	 .	   .
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:168
//# OR IN THIS FASHION :
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:169
//#	CAF	SUPERSET	WHERE SUPERSET IS ONE OF THE FOUR AVAILABLE
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:170
//#	TCR	SUPERSW		SUPERBANK BIT CONSTANTS:
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:171
//#	...	  ...			SUPER011 OCTAL  60
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:172
//#	 .	   .			SUPER100 OCTAL 100
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:173
//#	 .	   .			SUPER101 OCTAL 120
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:174
//#					SUPER110 OCTAL 140
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:175
//
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:176
//SUPERSW		EXTEND
// PORT: Fixed ROM slots 4603.
                if slot <> 4603 or instruction <> 6 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    return agcCoreControlExecute(words, 6, words[0], readEffective).
                }
                return choose false if checkOnly else -1.
            }
        } else {
            if slot <= 4604 {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:177
//		WRITE	SUPERBNK	# WRITE BITS 7-6-5 OF THE ACCUMULATOR INTO
// PORT: Fixed ROM slots 4604.
                if slot <> 4604 or instruction <> 519 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    agcCoreChannelInstruction(words, 1, 7, channelAdapter).
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:178
//					# CHANNEL 07
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:179
//		TC	Q		# TC TO INSTRUCTION FOLLOWING
// PORT: Fixed ROM slots 4605.
                if slot <> 4605 or instruction <> 2 { return choose false if checkOnly else -1. }
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

// PORT: Source-only text without a subsequent generated declaration.
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:180
//					# 	TC SUPERSW
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:181
//
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:182
//
// PORT: SOURCE INTER-BANK_COMMUNICATION.agc:183
//
