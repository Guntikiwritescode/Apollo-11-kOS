// INTERRUPT_LEAD_INS.agc
// bank 02, slots 4096-4139
function agcAotUnit140 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4117 {
        if slot <= 4106 {
            if slot <= 4100 {
                if slot <= 4097 {
                    if slot <= 4096 {
// INTERRUPT_LEAD_INS.agc:1
//# Copyright:	Public domain.
// INTERRUPT_LEAD_INS.agc:2
//# Filename:	INTERRUPT_LEAD_INS.agc
// INTERRUPT_LEAD_INS.agc:3
//# Purpose:	Part of the source code for Comanche, build 055.
// INTERRUPT_LEAD_INS.agc:4
//#		It is part of the source code for the Command Module's (CM)
// INTERRUPT_LEAD_INS.agc:5
//#		Apollo Guidance Computer (AGC), Apollo 11.
// INTERRUPT_LEAD_INS.agc:6
//# Assembler:	yaYUL
// INTERRUPT_LEAD_INS.agc:7
//# Reference:	pp. 131-132
// INTERRUPT_LEAD_INS.agc:8
//# Contact:	Ron Burkey <info@sandroid.org>,
// INTERRUPT_LEAD_INS.agc:9
//#  		Fabrizio Bernardini <fabrizio@spacecraft.it>
// INTERRUPT_LEAD_INS.agc:10
//# Website:	http://www.ibiblio.org/apollo.
// INTERRUPT_LEAD_INS.agc:11
//# Mod history:	09/05/09 FB	Transcription of Batch FB-1 Assignment.
// INTERRUPT_LEAD_INS.agc:12
//#
// INTERRUPT_LEAD_INS.agc:13
//# The contents of the "Comanche055" files, in general, are transcribed
// INTERRUPT_LEAD_INS.agc:14
//# from scanned documents.
// INTERRUPT_LEAD_INS.agc:15
//#
// INTERRUPT_LEAD_INS.agc:16
//#	Assemble revision 055 of AGC program Comanche by NASA
// INTERRUPT_LEAD_INS.agc:17
//#	2021113-051.  April 1, 1969.
// INTERRUPT_LEAD_INS.agc:18
//#
// INTERRUPT_LEAD_INS.agc:19
//#	This AGC program shall also be referred to as Colossus 2A
// INTERRUPT_LEAD_INS.agc:20
//#
// INTERRUPT_LEAD_INS.agc:21
//#	Prepared by
// INTERRUPT_LEAD_INS.agc:22
//#			Massachusetts Institute of Technology
// INTERRUPT_LEAD_INS.agc:23
//#			75 Cambridge Parkway
// INTERRUPT_LEAD_INS.agc:24
//#			Cambridge, Massachusetts
// INTERRUPT_LEAD_INS.agc:25
//#
// INTERRUPT_LEAD_INS.agc:26
//#	under NASA contract NAS 9-4065.
// INTERRUPT_LEAD_INS.agc:27
//#
// INTERRUPT_LEAD_INS.agc:28
//# Refer directly to the online document mentioned above for further
// INTERRUPT_LEAD_INS.agc:29
//# information.  Please report any errors to info@sandroid.org.
// INTERRUPT_LEAD_INS.agc:30
//
// INTERRUPT_LEAD_INS.agc:31
//# Page 131
// INTERRUPT_LEAD_INS.agc:32
//		SETLOC	4000
// INTERRUPT_LEAD_INS.agc:33
//
// INTERRUPT_LEAD_INS.agc:34
//		COUNT	02/RUPTS
// INTERRUPT_LEAD_INS.agc:35
//
// INTERRUPT_LEAD_INS.agc:36
//		INHINT			# GO
// slot 4096
                        if slot <> 4096 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// INTERRUPT_LEAD_INS.agc:37
//		CAF	GOBB
// slot 4097
                        if slot <> 4097 or instruction <> 14380 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2092), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 4098 {
// INTERRUPT_LEAD_INS.agc:38
//		XCH	BBANK
// slot 4098
                        if slot <> 4098 or instruction <> 23558 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 6, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4099 {
// INTERRUPT_LEAD_INS.agc:39
//		TCF	GOPROG
// slot 4099
                            if slot <> 4099 or instruction <> 5462 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5462, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// INTERRUPT_LEAD_INS.agc:40
//
// INTERRUPT_LEAD_INS.agc:41
//		DXCH	ARUPT		# T6RUPT
// slot 4100
                            if slot <> 4100 or instruction <> 21513 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 9, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 4103 {
                    if slot <= 4101 {
// INTERRUPT_LEAD_INS.agc:42
//		EXTEND
// slot 4101
                        if slot <> 4101 or instruction <> 6 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4102 {
// INTERRUPT_LEAD_INS.agc:43
//		DCA	T6LOC
// slot 4102
                            if slot <> 4102 or instruction <> 13001 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 713, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// INTERRUPT_LEAD_INS.agc:44
//		DTCB
// slot 4103
                            if slot <> 4103 or instruction <> 21510 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 4104 {
// INTERRUPT_LEAD_INS.agc:45
//
// INTERRUPT_LEAD_INS.agc:46
//		DXCH	ARUPT		# T5RUPT
// slot 4104
                        if slot <> 4104 or instruction <> 21513 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 9, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4105 {
// INTERRUPT_LEAD_INS.agc:47
//		CS	TIME5
// slot 4105
                            if slot <> 4105 or instruction <> 16408 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreCS(words, 24).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// INTERRUPT_LEAD_INS.agc:48
//		AD	.5SEC
// slot 4106
                            if slot <> 4106 or instruction <> 27166 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local entryA is words[0].
                                local fixedOperand is mod(readEffective:call(words, 2590), 32768).
                                set words[0] to agcAddSP16(entryA, agcSignExtend(fixedOperand)).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 4111 {
                if slot <= 4108 {
                    if slot <= 4107 {
// INTERRUPT_LEAD_INS.agc:49
//		TCF	T5RUPT
// slot 4107
                        if slot <> 4107 or instruction <> 6197 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6197, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// INTERRUPT_LEAD_INS.agc:50
//
// INTERRUPT_LEAD_INS.agc:51
//		DXCH	ARUPT		# T3RUPT
// slot 4108
                        if slot <> 4108 or instruction <> 21513 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 9, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 4109 {
// INTERRUPT_LEAD_INS.agc:52
//		CAF	T3RPTBB
// slot 4109
                        if slot <> 4109 or instruction <> 14381 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2093), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4110 {
// INTERRUPT_LEAD_INS.agc:53
//		XCH	BBANK
// slot 4110
                            if slot <> 4110 or instruction <> 23558 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 6, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// INTERRUPT_LEAD_INS.agc:54
//		TCF	T3RUPT
// slot 4111
                            if slot <> 4111 or instruction <> 5902 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5902, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 4114 {
                    if slot <= 4112 {
// INTERRUPT_LEAD_INS.agc:55
//
// INTERRUPT_LEAD_INS.agc:56
//		DXCH	ARUPT		# T4RUPT
// slot 4112
                        if slot <> 4112 or instruction <> 21513 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 9, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4113 {
// INTERRUPT_LEAD_INS.agc:57
//		CAF	T4RPTBB
// slot 4113
                            if slot <> 4113 or instruction <> 14387 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2099), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// INTERRUPT_LEAD_INS.agc:58
//		XCH	BBANK
// slot 4114
                            if slot <> 4114 or instruction <> 23558 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 6, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 4115 {
// INTERRUPT_LEAD_INS.agc:59
//		TCF	T4RUPT
// slot 4115
                        if slot <> 4115 or instruction <> 5120 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5120, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4116 {
// INTERRUPT_LEAD_INS.agc:60
//
// INTERRUPT_LEAD_INS.agc:61
//		DXCH	ARUPT		# KEYRUPT1
// slot 4116
                            if slot <> 4116 or instruction <> 21513 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 9, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// INTERRUPT_LEAD_INS.agc:62
//		CAF	KEYRPTBB
// slot 4117
                            if slot <> 4117 or instruction <> 14382 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2094), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 4128 {
            if slot <= 4122 {
                if slot <= 4119 {
                    if slot <= 4118 {
// INTERRUPT_LEAD_INS.agc:63
//		XCH	BBANK
// slot 4118
                        if slot <> 4118 or instruction <> 23558 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 6, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// INTERRUPT_LEAD_INS.agc:64
//		TCF	KEYRUPT1
// slot 4119
                        if slot <> 4119 or instruction <> 6075 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 6075, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 4120 {
// INTERRUPT_LEAD_INS.agc:65
//
// INTERRUPT_LEAD_INS.agc:66
//		DXCH	ARUPT		# KEYRUPT2
// slot 4120
                        if slot <> 4120 or instruction <> 21513 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 9, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4121 {
// INTERRUPT_LEAD_INS.agc:67
//		CAF	MKRUPTBB
// slot 4121
                            if slot <> 4121 or instruction <> 14383 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2095), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// INTERRUPT_LEAD_INS.agc:68
//		XCH	BBANK
// slot 4122
                            if slot <> 4122 or instruction <> 23558 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 6, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 4125 {
                    if slot <= 4123 {
// INTERRUPT_LEAD_INS.agc:69
//		TCF	MARKRUPT
// slot 4123
                        if slot <> 4123 or instruction <> 5188 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5188, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4124 {
// INTERRUPT_LEAD_INS.agc:70
//
// INTERRUPT_LEAD_INS.agc:71
//		DXCH	ARUPT		# UPRUPT
// slot 4124
                            if slot <> 4124 or instruction <> 21513 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 9, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// INTERRUPT_LEAD_INS.agc:72
//		CAF	UPRPTBB
// slot 4125
                            if slot <> 4125 or instruction <> 14382 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2094), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 4126 {
// INTERRUPT_LEAD_INS.agc:73
//		XCH	BBANK
// slot 4126
                        if slot <> 4126 or instruction <> 23558 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 6, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4127 {
// INTERRUPT_LEAD_INS.agc:74
//		TCF	UPRUPT
// slot 4127
                            if slot <> 4127 or instruction <> 6094 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6094, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// INTERRUPT_LEAD_INS.agc:75
//
// INTERRUPT_LEAD_INS.agc:76
//		DXCH	ARUPT		# DOWNRUPT
// slot 4128
                            if slot <> 4128 or instruction <> 21513 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 9, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        } else {
            if slot <= 4133 {
                if slot <= 4130 {
                    if slot <= 4129 {
// INTERRUPT_LEAD_INS.agc:77
//		CAF	DWNRPTBB
// slot 4129
                        if slot <> 4129 or instruction <> 14384 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2096), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// INTERRUPT_LEAD_INS.agc:78
//		XCH	BBANK
// slot 4130
                        if slot <> 4130 or instruction <> 23558 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 6, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 4131 {
// INTERRUPT_LEAD_INS.agc:79
//		TCF	DODOWNTM
// slot 4131
                        if slot <> 4131 or instruction <> 5969 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5969, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4132 {
// INTERRUPT_LEAD_INS.agc:80
//
// INTERRUPT_LEAD_INS.agc:81
//		DXCH	ARUPT		# RADAR RUPT
// slot 4132
                            if slot <> 4132 or instruction <> 21513 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 9, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// INTERRUPT_LEAD_INS.agc:82
//# Page 132
// INTERRUPT_LEAD_INS.agc:83
//		CAF	RDRPTBB
// slot 4133
                            if slot <> 4133 or instruction <> 14385 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2097), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 4136 {
                    if slot <= 4134 {
// INTERRUPT_LEAD_INS.agc:84
//		XCH	BBANK
// slot 4134
                        if slot <> 4134 or instruction <> 23558 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            agcCoreExchange(words, 0, 6, readPhysical).
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4135 {
// INTERRUPT_LEAD_INS.agc:85
//		TCF	VHFREAD
// slot 4135
                            if slot <> 4135 or instruction <> 5444 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5444, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// INTERRUPT_LEAD_INS.agc:86
//
// INTERRUPT_LEAD_INS.agc:87
//		DXCH	ARUPT		# HAND CONTROL RUPT
// slot 4136
                            if slot <> 4136 or instruction <> 21513 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                if not agcCoreDoubleExchange(words, "DXCH", 9, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 4137 {
// INTERRUPT_LEAD_INS.agc:88
//		CAF	HCRUPTBB
// slot 4137
                        if slot <> 4137 or instruction <> 14386 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2098), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4138 {
// INTERRUPT_LEAD_INS.agc:89
//		XCH	BBANK
// slot 4138
                            if slot <> 4138 or instruction <> 23558 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                agcCoreExchange(words, 0, 6, readPhysical).
                                return list(false, false, true, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// INTERRUPT_LEAD_INS.agc:90
//		TCF	RESUME +3	# NOT USED
// slot 4139
                            if slot <> 4139 or instruction <> 6878 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6878, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[140] to agcAotUnit140@.

agcAotInstallSourceRope(list(
// INTERRUPT_LEAD_INS.agc:91
//		EBANK=	LST1		# RESTART USES E0,E3
// INTERRUPT_LEAD_INS.agc:92
//GOBB		BBCON	GOPROG
// slot 4140
    4140, 10342,
// INTERRUPT_LEAD_INS.agc:93
//
// INTERRUPT_LEAD_INS.agc:94
//		EBANK=	LST1
// INTERRUPT_LEAD_INS.agc:95
//T3RPTBB		BBCON	T3RUPT
// slot 4141
    4141, 2150,
// INTERRUPT_LEAD_INS.agc:96
//
// INTERRUPT_LEAD_INS.agc:97
//		EBANK=	KEYTEMP1
// INTERRUPT_LEAD_INS.agc:98
//KEYRPTBB	BBCON	KEYRUPT1
// slot 4142
    4142, 14432,
// INTERRUPT_LEAD_INS.agc:99
//
// INTERRUPT_LEAD_INS.agc:100
//		EBANK=	MRKBUF1
// INTERRUPT_LEAD_INS.agc:101
//MKRUPTBB	BBCON	MARKRUPT
// slot 4143
    4143, 14446,
// INTERRUPT_LEAD_INS.agc:102
//
// INTERRUPT_LEAD_INS.agc:103
//UPRPTBB		=	KEYRPTBB
// INTERRUPT_LEAD_INS.agc:104
//
// INTERRUPT_LEAD_INS.agc:105
//		EBANK=	DNTMBUFF
// INTERRUPT_LEAD_INS.agc:106
//DWNRPTBB	BBCON	DODOWNTM
// slot 4144
    4144, 10336,
// INTERRUPT_LEAD_INS.agc:107
//
// INTERRUPT_LEAD_INS.agc:108
//		EBANK=	DATATEST
// INTERRUPT_LEAD_INS.agc:109
//RDRPTBB		BBCON	VHFREAD
// slot 4145
    4145, 47214,
// INTERRUPT_LEAD_INS.agc:110
//		EBANK=	TIME1
// INTERRUPT_LEAD_INS.agc:111
//HCRUPTBB	BBCON	RESUME		# NOT USED
// slot 4146
    4146, 4192,
// INTERRUPT_LEAD_INS.agc:112
//		EBANK=	DSRUPTSW
// INTERRUPT_LEAD_INS.agc:113
//T4RPTBB		BBCON	T4RUPT
// slot 4147
    4147, 12388,
// INTERRUPT_LEAD_INS.agc:114
//		EBANK=	TIME1
// INTERRUPT_LEAD_INS.agc:115
//T5RPTBB		BBCON	T5RUPT
// slot 4148
    4148, 4192
)).

// bank 02, slots 4149-4153
function agcAotUnit141 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4150 {
        if slot <= 4149 {
// INTERRUPT_LEAD_INS.agc:116
//
// INTERRUPT_LEAD_INS.agc:117
//T5RUPT		EXTEND
// slot 4149
            if slot <> 4149 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
// INTERRUPT_LEAD_INS.agc:118
//		BZMF	NOQBRSM
// slot 4150
            if slot <> 4150 or instruction <> 27359 { return choose false if checkOnly else -1. }
            if extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 27359, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        }
    } else {
        if slot <= 4151 {
// INTERRUPT_LEAD_INS.agc:119
//		EXTEND
// slot 4151
            if slot <> 4151 or instruction <> 6 { return choose false if checkOnly else -1. }
            if not extended {
                if checkOnly { return true. }
                return agcCoreControlExecute(words, 6, words[0], readEffective).
            }
            return choose false if checkOnly else -1.
        } else {
            if slot <= 4152 {
// INTERRUPT_LEAD_INS.agc:120
//		DCA	T5LOC
// slot 4152
                if slot <> 4152 or instruction <> 13003 { return choose false if checkOnly else -1. }
                if extended {
                    if checkOnly { return true. }
                    local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                    if not agcCoreDoubleExchange(words, "DCA", 715, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, inheritedTransient, false, false).
                }
                return choose false if checkOnly else -1.
            } else {
// INTERRUPT_LEAD_INS.agc:121
//		DTCB
// slot 4153
                if slot <> 4153 or instruction <> 21510 { return choose false if checkOnly else -1. }
                if not extended {
                    if checkOnly { return true. }
                    if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                    return list(false, false, true, false, false).
                }
                return choose false if checkOnly else -1.
            }
        }
    }
}
set agcAotRoutes[141] to agcAotUnit141@.

// no code for the lines below
// INTERRUPT_LEAD_INS.agc:122
//
