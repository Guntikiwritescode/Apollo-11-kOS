// INTERRUPT_LEAD_INS.agc
// bank 02, slots 4096-4139
function agcAotUnit148 {
    parameter words, slot, instruction, extended, checkOnly, readPhysical, readAdjacent, readEffective, channelAdapter.
    if slot <= 4117 {
        if slot <= 4106 {
            if slot <= 4100 {
                if slot <= 4097 {
                    if slot <= 4096 {
// INTERRUPT_LEAD_INS.agc:1
//# Copyright:	Public domain.
// INTERRUPT_LEAD_INS.agc:2
//# Filename:	INTERRUT_LEAD_INS.agc
// INTERRUPT_LEAD_INS.agc:3
//# Purpose: 	Part of the source code for Luminary 1A build 099.
// INTERRUPT_LEAD_INS.agc:4
//#		It is part of the source code for the Lunar Module's (LM)
// INTERRUPT_LEAD_INS.agc:5
//#		Apollo Guidance Computer (AGC), for Apollo 11.
// INTERRUPT_LEAD_INS.agc:6
//# Assembler:	yaYUL
// INTERRUPT_LEAD_INS.agc:7
//# Contact:	Onno Hommes <ohommes@cmu.edu>.
// INTERRUPT_LEAD_INS.agc:8
//# Website:	www.ibiblio.org/apollo.
// INTERRUPT_LEAD_INS.agc:9
//# Pages:	0153-0154
// INTERRUPT_LEAD_INS.agc:10
//# Mod history:	2009-05-14 OH	Transcribed from page images.
// INTERRUPT_LEAD_INS.agc:11
//#
// INTERRUPT_LEAD_INS.agc:12
//# This source code has been transcribed or otherwise adapted from
// INTERRUPT_LEAD_INS.agc:13
//# digitized images of a hardcopy from the MIT Museum.  The digitization
// INTERRUPT_LEAD_INS.agc:14
//# was performed by Paul Fjeld, and arranged for by Deborah Douglas of
// INTERRUPT_LEAD_INS.agc:15
//# the Museum.  Many thanks to both.  The images (with suitable reduction
// INTERRUPT_LEAD_INS.agc:16
//# in storage size and consequent reduction in image quality as well) are
// INTERRUPT_LEAD_INS.agc:17
//# available online at www.ibiblio.org/apollo.  If for some reason you
// INTERRUPT_LEAD_INS.agc:18
//# find that the images are illegible, contact me at info@sandroid.org
// INTERRUPT_LEAD_INS.agc:19
//# about getting access to the (much) higher-quality images which Paul
// INTERRUPT_LEAD_INS.agc:20
//# actually created.
// INTERRUPT_LEAD_INS.agc:21
//#
// INTERRUPT_LEAD_INS.agc:22
//# Notations on the hardcopy document read, in part:
// INTERRUPT_LEAD_INS.agc:23
//#
// INTERRUPT_LEAD_INS.agc:24
//#	Assemble revision 001 of AGC program LMY99 by NASA 2021112-061
// INTERRUPT_LEAD_INS.agc:25
//#	16:27 JULY 14, 1969
// INTERRUPT_LEAD_INS.agc:26
//
// INTERRUPT_LEAD_INS.agc:27
//
// INTERRUPT_LEAD_INS.agc:28
//# Page 153
// INTERRUPT_LEAD_INS.agc:29
//		SETLOC	4000
// INTERRUPT_LEAD_INS.agc:30
//
// INTERRUPT_LEAD_INS.agc:31
//		COUNT*	$$/RUPTS	# FIX-FIX LEAD INS
// INTERRUPT_LEAD_INS.agc:32
//		INHINT			# GO
// slot 4096
                        if slot <> 4096 or instruction <> 4 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 4, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// INTERRUPT_LEAD_INS.agc:33
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
// INTERRUPT_LEAD_INS.agc:34
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
// INTERRUPT_LEAD_INS.agc:35
//		TCF	GOPROG
// slot 4099
                            if slot <> 4099 or instruction <> 5559 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5559, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// INTERRUPT_LEAD_INS.agc:36
//
// INTERRUPT_LEAD_INS.agc:37
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
// INTERRUPT_LEAD_INS.agc:38
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
// INTERRUPT_LEAD_INS.agc:39
//		DCA	T6ADR
// slot 4102
                            if slot <> 4102 or instruction <> 14382 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 2094, readPhysical, readAdjacent) { return -1. }
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// INTERRUPT_LEAD_INS.agc:40
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
// INTERRUPT_LEAD_INS.agc:41
//
// INTERRUPT_LEAD_INS.agc:42
//		DXCH	ARUPT		# T5RUPT - AUTOPILOT
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
// INTERRUPT_LEAD_INS.agc:43
//		EXTEND
// slot 4105
                            if slot <> 4105 or instruction <> 6 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 6, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// INTERRUPT_LEAD_INS.agc:44
//		DCA	T5ADR
// slot 4106
                            if slot <> 4106 or instruction <> 12989 { return choose false if checkOnly else -1. }
                            if extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                if not agcCoreDoubleExchange(words, "DCA", 701, readPhysical, readAdjacent) { return -1. }
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
// INTERRUPT_LEAD_INS.agc:45
//		DTCB
// slot 4107
                        if slot <> 4107 or instruction <> 21510 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            if not agcCoreDoubleExchange(words, "DXCH", 6, readPhysical, readAdjacent) { return -1. }
                            return list(false, false, true, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// INTERRUPT_LEAD_INS.agc:46
//
// INTERRUPT_LEAD_INS.agc:47
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
// INTERRUPT_LEAD_INS.agc:48
//		CAF	T3RPTBB
// slot 4109
                        if slot <> 4109 or instruction <> 14383 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2095), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4110 {
// INTERRUPT_LEAD_INS.agc:49
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
// INTERRUPT_LEAD_INS.agc:50
//		TCF	T3RUPT
// slot 4111
                            if slot <> 4111 or instruction <> 5895 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5895, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            } else {
                if slot <= 4114 {
                    if slot <= 4112 {
// INTERRUPT_LEAD_INS.agc:51
//
// INTERRUPT_LEAD_INS.agc:52
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
// INTERRUPT_LEAD_INS.agc:53
//		CAF	T4RPTBB
// slot 4113
                            if slot <> 4113 or instruction <> 14388 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2100), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// INTERRUPT_LEAD_INS.agc:54
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
// INTERRUPT_LEAD_INS.agc:55
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
// INTERRUPT_LEAD_INS.agc:56
//
// INTERRUPT_LEAD_INS.agc:57
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
// INTERRUPT_LEAD_INS.agc:58
//		CAF	KEYRPTBB
// slot 4117
                            if slot <> 4117 or instruction <> 14384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2096), 32768).
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
// INTERRUPT_LEAD_INS.agc:59
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
// INTERRUPT_LEAD_INS.agc:60
//		TCF	KEYRUPT1
// slot 4119
                        if slot <> 4119 or instruction <> 5820 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5820, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    }
                } else {
                    if slot <= 4120 {
// INTERRUPT_LEAD_INS.agc:61
//
// INTERRUPT_LEAD_INS.agc:62
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
// INTERRUPT_LEAD_INS.agc:63
//		CAF	MKRUPTBB
// slot 4121
                            if slot <> 4121 or instruction <> 14385 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2097), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// INTERRUPT_LEAD_INS.agc:64
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
// INTERRUPT_LEAD_INS.agc:65
//		TCF	MARKRUPT
// slot 4123
                        if slot <> 4123 or instruction <> 5338 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5338, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4124 {
// INTERRUPT_LEAD_INS.agc:66
//
// INTERRUPT_LEAD_INS.agc:67
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
// INTERRUPT_LEAD_INS.agc:68
//		CAF	UPRPTBB
// slot 4125
                            if slot <> 4125 or instruction <> 14384 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2096), 32768).
                                set words[0] to agcSignExtend(fixedOperand).
                                return list(false, false, inheritedTransient, false, false).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                } else {
                    if slot <= 4126 {
// INTERRUPT_LEAD_INS.agc:69
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
// INTERRUPT_LEAD_INS.agc:70
//		TCF	UPRUPT
// slot 4127
                            if slot <> 4127 or instruction <> 5839 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5839, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// INTERRUPT_LEAD_INS.agc:71
//
// INTERRUPT_LEAD_INS.agc:72
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
// INTERRUPT_LEAD_INS.agc:73
//		CAF	DWNRPTBB
// slot 4129
                        if slot <> 4129 or instruction <> 14386 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2098), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
// INTERRUPT_LEAD_INS.agc:74
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
// INTERRUPT_LEAD_INS.agc:75
//		TCF	DODOWNTM
// slot 4131
                        if slot <> 4131 or instruction <> 5958 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            return agcCoreControlExecute(words, 5958, words[0], readEffective).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4132 {
// INTERRUPT_LEAD_INS.agc:76
//
// INTERRUPT_LEAD_INS.agc:77
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
// INTERRUPT_LEAD_INS.agc:78
//		CAF	RDRPTBB
// slot 4133
                            if slot <> 4133 or instruction <> 14387 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                                local fixedOperand is mod(readEffective:call(words, 2099), 32768).
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
// INTERRUPT_LEAD_INS.agc:79
//# Page 154
// INTERRUPT_LEAD_INS.agc:80
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
// INTERRUPT_LEAD_INS.agc:81
//		TCF	RADAREAD
// slot 4135
                            if slot <> 4135 or instruction <> 5736 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5736, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        } else {
// INTERRUPT_LEAD_INS.agc:82
//
// INTERRUPT_LEAD_INS.agc:83
//		DXCH	ARUPT		# RUPT10 IS USED ONLY BY LANDING GUIDANCE
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
// INTERRUPT_LEAD_INS.agc:84
//		CA	RUPT10BB
// slot 4137
                        if slot <> 4137 or instruction <> 14389 { return choose false if checkOnly else -1. }
                        if not extended {
                            if checkOnly { return true. }
                            local inheritedTransient is agcCoreInheritedTCTransient(words, instruction).
                            local fixedOperand is mod(readEffective:call(words, 2101), 32768).
                            set words[0] to agcSignExtend(fixedOperand).
                            return list(false, false, inheritedTransient, false, false).
                        }
                        return choose false if checkOnly else -1.
                    } else {
                        if slot <= 4138 {
// INTERRUPT_LEAD_INS.agc:85
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
// INTERRUPT_LEAD_INS.agc:86
//		TCF	PITFALL
// slot 4139
                            if slot <> 4139 or instruction <> 5309 { return choose false if checkOnly else -1. }
                            if not extended {
                                if checkOnly { return true. }
                                return agcCoreControlExecute(words, 5309, words[0], readEffective).
                            }
                            return choose false if checkOnly else -1.
                        }
                    }
                }
            }
        }
    }
}
set agcAotRoutes[148] to agcAotUnit148@.

agcAotInstallSourceRope(list(
// INTERRUPT_LEAD_INS.agc:87
//
// INTERRUPT_LEAD_INS.agc:88
//
// INTERRUPT_LEAD_INS.agc:89
//		EBANK=	LST1		# RESTART USES E0, E3
// INTERRUPT_LEAD_INS.agc:90
//GOBB		BBCON	GOPROG
// slot 4140
    4140, 10374,
// INTERRUPT_LEAD_INS.agc:91
//
// INTERRUPT_LEAD_INS.agc:92
//		EBANK=	PERROR
// INTERRUPT_LEAD_INS.agc:93
//T6ADR		2CADR	DOT6RUPT
// slot 4141 4142
    4141, 2154, 4142, 30860,
// INTERRUPT_LEAD_INS.agc:94
//
// INTERRUPT_LEAD_INS.agc:95
//		EBANK=	LST1
// INTERRUPT_LEAD_INS.agc:96
//T3RPTBB		BBCON	T3RUPT
// slot 4143
    4143, 2182,
// INTERRUPT_LEAD_INS.agc:97
//
// INTERRUPT_LEAD_INS.agc:98
//		EBANK=	KEYTEMP1
// INTERRUPT_LEAD_INS.agc:99
//KEYRPTBB	BBCON	KEYRUPT1
// slot 4144
    4144, 8320,
// INTERRUPT_LEAD_INS.agc:100
//
// INTERRUPT_LEAD_INS.agc:101
//		EBANK=	AOTAZ
// INTERRUPT_LEAD_INS.agc:102
//MKRUPTBB	BBCON	MARKRUPT
// slot 4145
    4145, 14478,
// INTERRUPT_LEAD_INS.agc:103
//
// INTERRUPT_LEAD_INS.agc:104
//UPRPTBB		=	KEYRPTBB
// INTERRUPT_LEAD_INS.agc:105
//
// INTERRUPT_LEAD_INS.agc:106
//		EBANK=	DNTMBUFF
// INTERRUPT_LEAD_INS.agc:107
//DWNRPTBB	BBCON	DODOWNTM
// slot 4146
    4146, 10368,
// INTERRUPT_LEAD_INS.agc:108
//
// INTERRUPT_LEAD_INS.agc:109
//		EBANK=	RADMODES
// INTERRUPT_LEAD_INS.agc:110
//RDRPTBB		BBCON	RADAREAD
// slot 4147
    4147, 43136,
// INTERRUPT_LEAD_INS.agc:111
//
// INTERRUPT_LEAD_INS.agc:112
//		EBANK=	M11
// INTERRUPT_LEAD_INS.agc:113
//T4RPTBB		BBCON	T4RUPT
// slot 4148
    4148, 12428,
// INTERRUPT_LEAD_INS.agc:114
//
// INTERRUPT_LEAD_INS.agc:115
//		EBANK=	ELVIRA
// INTERRUPT_LEAD_INS.agc:116
//RUPT10BB	BBCON	PITFALL
// slot 4149
    4149, 18564
)).

// no code for the lines below
// INTERRUPT_LEAD_INS.agc:117
//
