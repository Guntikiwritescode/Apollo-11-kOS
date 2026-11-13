global agcAotRoutes is lexicon().
global agcAotRomBanks is lexicon().

// PORT: Load-time assembly of source-owned physical ROM literals.
function agcAotInstallSourceRope {
    parameter pairs.
    from { local i is 0. } until i >= pairs:length step { set i to i + 2. } do {
        local slot is pairs[i] - 2048.
        local offset is mod(slot, 1024).
        local cells is agcAotRomBanks[floor(slot / 1024)][floor(offset / 64)].
        set cells[mod(offset, 64)] to pairs[i + 1].
    }
}

function agcAotRopeBank {
    parameter bank.
    if not agcAotRomBanks:haskey(bank) { return -1. }
    return agcAotRomBanks[bank].
}

function agcAotInvoke {
    parameter words, slot, instruction, extended, checkOnly,
        readPhysical, readAdjacent, readEffective, channelAdapter.
    local route is agcAotFindUnit(slot).
    if route < 0 or not agcAotRoutes:haskey(route) { return choose false if checkOnly else -1. }
    local action is agcAotRoutes[route].
    return action:call(words, slot, instruction, extended, checkOnly,
        readPhysical, readAdjacent, readEffective, channelAdapter).
}

function agcAotCanExecute {
    parameter words, slot, instruction, extended.
    if words["indexValue"] <> 0 or words["substituteInstruction"] { return false. }
    return agcAotInvoke(words, slot, instruction, extended, true, 0, 0, 0, 0).
}

function agcAotExecute {
    parameter words, slot, instruction, extended, readPhysical, readAdjacent, readEffective, channelAdapter.
    return agcAotInvoke(words, slot, instruction, extended, false,
        readPhysical, readAdjacent, readEffective, channelAdapter).
}

function agcAotFindUnit {
    parameter slot.
    if slot <= 19982 {
        if slot <= 9688 {
            if slot <= 5460 {
                if slot <= 4175 {
                    if slot <= 3464 {
                        if slot <= 2819 {
                            if slot <= 2573 {
                                if slot <= 2252 {
                                    if slot <= 2134 {
                                        if slot <= 2068 {
                                            if slot <= 2062 {
                                                if slot < 2048 or slot > 2062 { return -1. }
                                                return 0.
                                            } else {
                                                if slot < 2063 or slot > 2068 { return -1. }
                                                return 1.
                                            }
                                        } else {
                                            if slot <= 2070 {
                                                if slot < 2069 or slot > 2070 { return -1. }
                                                return 2.
                                            } else {
                                                if slot < 2071 or slot > 2134 { return -1. }
                                                return 3.
                                            }
                                        }
                                    } else {
                                        if slot <= 2179 {
                                            if slot <= 2136 {
                                                if slot < 2135 or slot > 2136 { return -1. }
                                                return 4.
                                            } else {
                                                if slot < 2137 or slot > 2179 { return -1. }
                                                return 5.
                                            }
                                        } else {
                                            if slot <= 2202 {
                                                if slot < 2180 or slot > 2202 { return -1. }
                                                return 6.
                                            } else {
                                                if slot <= 2232 {
                                                    if slot < 2203 or slot > 2232 { return -1. }
                                                    return 7.
                                                } else {
                                                    if slot < 2233 or slot > 2252 { return -1. }
                                                    return 8.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 2360 {
                                        if slot <= 2311 {
                                            if slot <= 2259 {
                                                if slot < 2253 or slot > 2259 { return -1. }
                                                return 9.
                                            } else {
                                                if slot < 2260 or slot > 2311 { return -1. }
                                                return 10.
                                            }
                                        } else {
                                            if slot <= 2340 {
                                                if slot < 2312 or slot > 2340 { return -1. }
                                                return 11.
                                            } else {
                                                if slot < 2341 or slot > 2360 { return -1. }
                                                return 12.
                                            }
                                        }
                                    } else {
                                        if slot <= 2422 {
                                            if slot <= 2379 {
                                                if slot < 2361 or slot > 2379 { return -1. }
                                                return 13.
                                            } else {
                                                if slot < 2380 or slot > 2422 { return -1. }
                                                return 14.
                                            }
                                        } else {
                                            if slot <= 2443 {
                                                if slot < 2423 or slot > 2443 { return -1. }
                                                return 15.
                                            } else {
                                                if slot <= 2567 {
                                                    if slot < 2444 or slot > 2567 { return -1. }
                                                    return 16.
                                                } else {
                                                    if slot < 2568 or slot > 2573 { return -1. }
                                                    return 17.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 2706 {
                                    if slot <= 2635 {
                                        if slot <= 2599 {
                                            if slot <= 2593 {
                                                if slot < 2574 or slot > 2593 { return -1. }
                                                return 18.
                                            } else {
                                                if slot < 2594 or slot > 2599 { return -1. }
                                                return 19.
                                            }
                                        } else {
                                            if slot <= 2624 {
                                                if slot < 2600 or slot > 2624 { return -1. }
                                                return 20.
                                            } else {
                                                if slot < 2625 or slot > 2635 { return -1. }
                                                return 21.
                                            }
                                        }
                                    } else {
                                        if slot <= 2679 {
                                            if slot <= 2661 {
                                                if slot < 2636 or slot > 2661 { return -1. }
                                                return 22.
                                            } else {
                                                if slot < 2662 or slot > 2679 { return -1. }
                                                return 23.
                                            }
                                        } else {
                                            if slot <= 2683 {
                                                if slot < 2680 or slot > 2683 { return -1. }
                                                return 24.
                                            } else {
                                                if slot <= 2694 {
                                                    if slot < 2684 or slot > 2694 { return -1. }
                                                    return 25.
                                                } else {
                                                    if slot < 2695 or slot > 2706 { return -1. }
                                                    return 26.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 2730 {
                                        if slot <= 2718 {
                                            if slot <= 2710 {
                                                if slot < 2707 or slot > 2710 { return -1. }
                                                return 27.
                                            } else {
                                                if slot < 2711 or slot > 2718 { return -1. }
                                                return 28.
                                            }
                                        } else {
                                            if slot <= 2722 {
                                                if slot < 2719 or slot > 2722 { return -1. }
                                                return 29.
                                            } else {
                                                if slot < 2723 or slot > 2730 { return -1. }
                                                return 30.
                                            }
                                        }
                                    } else {
                                        if slot <= 2740 {
                                            if slot <= 2732 {
                                                if slot < 2731 or slot > 2732 { return -1. }
                                                return 31.
                                            } else {
                                                if slot < 2733 or slot > 2740 { return -1. }
                                                return 32.
                                            }
                                        } else {
                                            if slot <= 2744 {
                                                if slot < 2741 or slot > 2744 { return -1. }
                                                return 33.
                                            } else {
                                                if slot <= 2749 {
                                                    if slot < 2745 or slot > 2749 { return -1. }
                                                    return 34.
                                                } else {
                                                    if slot < 2750 or slot > 2819 { return -1. }
                                                    return 35.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 3335 {
                                if slot <= 3033 {
                                    if slot <= 2986 {
                                        if slot <= 2915 {
                                            if slot <= 2846 {
                                                if slot < 2820 or slot > 2846 { return -1. }
                                                return 36.
                                            } else {
                                                if slot < 2847 or slot > 2915 { return -1. }
                                                return 37.
                                            }
                                        } else {
                                            if slot <= 2937 {
                                                if slot < 2916 or slot > 2937 { return -1. }
                                                return 38.
                                            } else {
                                                if slot < 2938 or slot > 2986 { return -1. }
                                                return 39.
                                            }
                                        }
                                    } else {
                                        if slot <= 3020 {
                                            if slot <= 3005 {
                                                if slot < 2987 or slot > 3005 { return -1. }
                                                return 40.
                                            } else {
                                                if slot < 3006 or slot > 3020 { return -1. }
                                                return 41.
                                            }
                                        } else {
                                            if slot <= 3027 {
                                                if slot < 3021 or slot > 3027 { return -1. }
                                                return 42.
                                            } else {
                                                if slot <= 3032 {
                                                    if slot < 3028 or slot > 3032 { return -1. }
                                                    return 43.
                                                } else {
                                                    if slot < 3033 or slot > 3033 { return -1. }
                                                    return 44.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 3059 {
                                        if slot <= 3045 {
                                            if slot <= 3039 {
                                                if slot < 3034 or slot > 3039 { return -1. }
                                                return 45.
                                            } else {
                                                if slot < 3040 or slot > 3045 { return -1. }
                                                return 46.
                                            }
                                        } else {
                                            if slot <= 3055 {
                                                if slot < 3046 or slot > 3055 { return -1. }
                                                return 47.
                                            } else {
                                                if slot < 3056 or slot > 3059 { return -1. }
                                                return 48.
                                            }
                                        }
                                    } else {
                                        if slot <= 3083 {
                                            if slot <= 3061 {
                                                if slot < 3060 or slot > 3061 { return -1. }
                                                return 49.
                                            } else {
                                                if slot < 3072 or slot > 3083 { return -1. }
                                                return 50.
                                            }
                                        } else {
                                            if slot <= 3324 {
                                                if slot < 3321 or slot > 3324 { return -1. }
                                                return 51.
                                            } else {
                                                if slot <= 3331 {
                                                    if slot < 3325 or slot > 3331 { return -1. }
                                                    return 52.
                                                } else {
                                                    if slot < 3332 or slot > 3335 { return -1. }
                                                    return 53.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 3366 {
                                    if slot <= 3347 {
                                        if slot <= 3341 {
                                            if slot <= 3339 {
                                                if slot < 3336 or slot > 3339 { return -1. }
                                                return 54.
                                            } else {
                                                if slot < 3340 or slot > 3341 { return -1. }
                                                return 55.
                                            }
                                        } else {
                                            if slot <= 3345 {
                                                if slot < 3342 or slot > 3345 { return -1. }
                                                return 56.
                                            } else {
                                                if slot < 3346 or slot > 3347 { return -1. }
                                                return 57.
                                            }
                                        }
                                    } else {
                                        if slot <= 3353 {
                                            if slot <= 3351 {
                                                if slot < 3348 or slot > 3351 { return -1. }
                                                return 58.
                                            } else {
                                                if slot < 3352 or slot > 3353 { return -1. }
                                                return 59.
                                            }
                                        } else {
                                            if slot <= 3360 {
                                                if slot < 3354 or slot > 3360 { return -1. }
                                                return 60.
                                            } else {
                                                if slot <= 3364 {
                                                    if slot < 3361 or slot > 3364 { return -1. }
                                                    return 61.
                                                } else {
                                                    if slot < 3365 or slot > 3366 { return -1. }
                                                    return 62.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 3425 {
                                        if slot <= 3402 {
                                            if slot <= 3370 {
                                                if slot < 3367 or slot > 3370 { return -1. }
                                                return 63.
                                            } else {
                                                if slot < 3371 or slot > 3402 { return -1. }
                                                return 64.
                                            }
                                        } else {
                                            if slot <= 3411 {
                                                if slot < 3403 or slot > 3411 { return -1. }
                                                return 65.
                                            } else {
                                                if slot < 3412 or slot > 3425 { return -1. }
                                                return 66.
                                            }
                                        }
                                    } else {
                                        if slot <= 3438 {
                                            if slot <= 3430 {
                                                if slot < 3426 or slot > 3430 { return -1. }
                                                return 67.
                                            } else {
                                                if slot < 3431 or slot > 3438 { return -1. }
                                                return 68.
                                            }
                                        } else {
                                            if slot <= 3445 {
                                                if slot < 3439 or slot > 3445 { return -1. }
                                                return 69.
                                            } else {
                                                if slot <= 3457 {
                                                    if slot < 3446 or slot > 3457 { return -1. }
                                                    return 70.
                                                } else {
                                                    if slot < 3458 or slot > 3464 { return -1. }
                                                    return 71.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 3811 {
                            if slot <= 3577 {
                                if slot <= 3510 {
                                    if slot <= 3490 {
                                        if slot <= 3475 {
                                            if slot <= 3469 {
                                                if slot < 3465 or slot > 3469 { return -1. }
                                                return 72.
                                            } else {
                                                if slot < 3470 or slot > 3475 { return -1. }
                                                return 73.
                                            }
                                        } else {
                                            if slot <= 3477 {
                                                if slot < 3476 or slot > 3477 { return -1. }
                                                return 74.
                                            } else {
                                                if slot < 3478 or slot > 3490 { return -1. }
                                                return 75.
                                            }
                                        }
                                    } else {
                                        if slot <= 3501 {
                                            if slot <= 3494 {
                                                if slot < 3491 or slot > 3494 { return -1. }
                                                return 76.
                                            } else {
                                                if slot < 3495 or slot > 3501 { return -1. }
                                                return 77.
                                            }
                                        } else {
                                            if slot <= 3503 {
                                                if slot < 3502 or slot > 3503 { return -1. }
                                                return 78.
                                            } else {
                                                if slot <= 3507 {
                                                    if slot < 3504 or slot > 3507 { return -1. }
                                                    return 79.
                                                } else {
                                                    if slot < 3508 or slot > 3510 { return -1. }
                                                    return 80.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 3548 {
                                        if slot <= 3528 {
                                            if slot <= 3526 {
                                                if slot < 3511 or slot > 3526 { return -1. }
                                                return 81.
                                            } else {
                                                if slot < 3527 or slot > 3528 { return -1. }
                                                return 82.
                                            }
                                        } else {
                                            if slot <= 3540 {
                                                if slot < 3529 or slot > 3540 { return -1. }
                                                return 83.
                                            } else {
                                                if slot < 3541 or slot > 3548 { return -1. }
                                                return 84.
                                            }
                                        }
                                    } else {
                                        if slot <= 3559 {
                                            if slot <= 3555 {
                                                if slot < 3549 or slot > 3555 { return -1. }
                                                return 85.
                                            } else {
                                                if slot < 3556 or slot > 3559 { return -1. }
                                                return 86.
                                            }
                                        } else {
                                            if slot <= 3563 {
                                                if slot < 3560 or slot > 3563 { return -1. }
                                                return 87.
                                            } else {
                                                if slot <= 3567 {
                                                    if slot < 3564 or slot > 3567 { return -1. }
                                                    return 88.
                                                } else {
                                                    if slot < 3568 or slot > 3577 { return -1. }
                                                    return 89.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 3691 {
                                    if slot <= 3639 {
                                        if slot <= 3626 {
                                            if slot <= 3620 {
                                                if slot < 3578 or slot > 3620 { return -1. }
                                                return 90.
                                            } else {
                                                if slot < 3621 or slot > 3626 { return -1. }
                                                return 91.
                                            }
                                        } else {
                                            if slot <= 3628 {
                                                if slot < 3627 or slot > 3628 { return -1. }
                                                return 92.
                                            } else {
                                                if slot < 3629 or slot > 3639 { return -1. }
                                                return 93.
                                            }
                                        }
                                    } else {
                                        if slot <= 3647 {
                                            if slot <= 3644 {
                                                if slot < 3640 or slot > 3644 { return -1. }
                                                return 94.
                                            } else {
                                                if slot < 3645 or slot > 3647 { return -1. }
                                                return 95.
                                            }
                                        } else {
                                            if slot <= 3654 {
                                                if slot < 3648 or slot > 3654 { return -1. }
                                                return 96.
                                            } else {
                                                if slot <= 3680 {
                                                    if slot < 3655 or slot > 3680 { return -1. }
                                                    return 97.
                                                } else {
                                                    if slot < 3681 or slot > 3691 { return -1. }
                                                    return 98.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 3745 {
                                        if slot <= 3725 {
                                            if slot <= 3714 {
                                                if slot < 3692 or slot > 3714 { return -1. }
                                                return 99.
                                            } else {
                                                if slot < 3715 or slot > 3725 { return -1. }
                                                return 100.
                                            }
                                        } else {
                                            if slot <= 3730 {
                                                if slot < 3726 or slot > 3730 { return -1. }
                                                return 101.
                                            } else {
                                                if slot < 3731 or slot > 3745 { return -1. }
                                                return 102.
                                            }
                                        }
                                    } else {
                                        if slot <= 3780 {
                                            if slot <= 3749 {
                                                if slot < 3746 or slot > 3749 { return -1. }
                                                return 103.
                                            } else {
                                                if slot < 3750 or slot > 3780 { return -1. }
                                                return 104.
                                            }
                                        } else {
                                            if slot <= 3799 {
                                                if slot < 3781 or slot > 3799 { return -1. }
                                                return 105.
                                            } else {
                                                if slot <= 3805 {
                                                    if slot < 3800 or slot > 3805 { return -1. }
                                                    return 106.
                                                } else {
                                                    if slot < 3806 or slot > 3811 { return -1. }
                                                    return 107.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 3957 {
                                if slot <= 3853 {
                                    if slot <= 3835 {
                                        if slot <= 3823 {
                                            if slot <= 3817 {
                                                if slot < 3812 or slot > 3817 { return -1. }
                                                return 108.
                                            } else {
                                                if slot < 3818 or slot > 3823 { return -1. }
                                                return 109.
                                            }
                                        } else {
                                            if slot <= 3829 {
                                                if slot < 3824 or slot > 3829 { return -1. }
                                                return 110.
                                            } else {
                                                if slot < 3830 or slot > 3835 { return -1. }
                                                return 111.
                                            }
                                        }
                                    } else {
                                        if slot <= 3842 {
                                            if slot <= 3838 {
                                                if slot < 3836 or slot > 3838 { return -1. }
                                                return 112.
                                            } else {
                                                if slot < 3839 or slot > 3842 { return -1. }
                                                return 113.
                                            }
                                        } else {
                                            if slot <= 3845 {
                                                if slot < 3843 or slot > 3845 { return -1. }
                                                return 114.
                                            } else {
                                                if slot <= 3850 {
                                                    if slot < 3846 or slot > 3850 { return -1. }
                                                    return 115.
                                                } else {
                                                    if slot < 3851 or slot > 3853 { return -1. }
                                                    return 116.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 3908 {
                                        if slot <= 3891 {
                                            if slot <= 3888 {
                                                if slot < 3854 or slot > 3888 { return -1. }
                                                return 117.
                                            } else {
                                                if slot < 3889 or slot > 3891 { return -1. }
                                                return 118.
                                            }
                                        } else {
                                            if slot <= 3903 {
                                                if slot < 3892 or slot > 3903 { return -1. }
                                                return 119.
                                            } else {
                                                if slot < 3904 or slot > 3908 { return -1. }
                                                return 120.
                                            }
                                        }
                                    } else {
                                        if slot <= 3918 {
                                            if slot <= 3915 {
                                                if slot < 3909 or slot > 3915 { return -1. }
                                                return 121.
                                            } else {
                                                if slot < 3916 or slot > 3918 { return -1. }
                                                return 122.
                                            }
                                        } else {
                                            if slot <= 3937 {
                                                if slot < 3920 or slot > 3937 { return -1. }
                                                return 123.
                                            } else {
                                                if slot <= 3944 {
                                                    if slot < 3938 or slot > 3944 { return -1. }
                                                    return 124.
                                                } else {
                                                    if slot < 3945 or slot > 3957 { return -1. }
                                                    return 125.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 4057 {
                                    if slot <= 3992 {
                                        if slot <= 3966 {
                                            if slot <= 3962 {
                                                if slot < 3958 or slot > 3962 { return -1. }
                                                return 126.
                                            } else {
                                                if slot < 3963 or slot > 3966 { return -1. }
                                                return 127.
                                            }
                                        } else {
                                            if slot <= 3989 {
                                                if slot < 3967 or slot > 3989 { return -1. }
                                                return 128.
                                            } else {
                                                if slot < 3990 or slot > 3992 { return -1. }
                                                return 129.
                                            }
                                        }
                                    } else {
                                        if slot <= 4017 {
                                            if slot <= 4013 {
                                                if slot < 3993 or slot > 4013 { return -1. }
                                                return 130.
                                            } else {
                                                if slot < 4014 or slot > 4017 { return -1. }
                                                return 131.
                                            }
                                        } else {
                                            if slot <= 4031 {
                                                if slot < 4018 or slot > 4031 { return -1. }
                                                return 132.
                                            } else {
                                                if slot <= 4032 {
                                                    if slot < 4032 or slot > 4032 { return -1. }
                                                    return 133.
                                                } else {
                                                    if slot < 4033 or slot > 4057 { return -1. }
                                                    return 134.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 4081 {
                                        if slot <= 4062 {
                                            if slot <= 4058 {
                                                if slot < 4058 or slot > 4058 { return -1. }
                                                return 135.
                                            } else {
                                                if slot < 4059 or slot > 4062 { return -1. }
                                                return 136.
                                            }
                                        } else {
                                            if slot <= 4066 {
                                                if slot < 4063 or slot > 4066 { return -1. }
                                                return 137.
                                            } else {
                                                if slot <= 4071 {
                                                    if slot < 4067 or slot > 4071 { return -1. }
                                                    return 138.
                                                } else {
                                                    if slot < 4072 or slot > 4081 { return -1. }
                                                    return 139.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 4153 {
                                            if slot <= 4148 {
                                                if slot < 4096 or slot > 4148 { return -1. }
                                                return 140.
                                            } else {
                                                if slot < 4149 or slot > 4153 { return -1. }
                                                return 141.
                                            }
                                        } else {
                                            if slot <= 4167 {
                                                if slot < 4166 or slot > 4167 { return -1. }
                                                return 142.
                                            } else {
                                                if slot <= 4168 {
                                                    if slot < 4168 or slot > 4168 { return -1. }
                                                    return 143.
                                                } else {
                                                    if slot < 4172 or slot > 4175 { return -1. }
                                                    return 144.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    if slot <= 4954 {
                        if slot <= 4586 {
                            if slot <= 4400 {
                                if slot <= 4239 {
                                    if slot <= 4201 {
                                        if slot <= 4189 {
                                            if slot <= 4186 {
                                                if slot < 4176 or slot > 4186 { return -1. }
                                                return 145.
                                            } else {
                                                if slot < 4187 or slot > 4189 { return -1. }
                                                return 146.
                                            }
                                        } else {
                                            if slot <= 4191 {
                                                if slot < 4190 or slot > 4191 { return -1. }
                                                return 147.
                                            } else {
                                                if slot < 4192 or slot > 4201 { return -1. }
                                                return 148.
                                            }
                                        }
                                    } else {
                                        if slot <= 4213 {
                                            if slot <= 4208 {
                                                if slot < 4202 or slot > 4208 { return -1. }
                                                return 149.
                                            } else {
                                                if slot < 4209 or slot > 4213 { return -1. }
                                                return 150.
                                            }
                                        } else {
                                            if slot <= 4215 {
                                                if slot < 4214 or slot > 4215 { return -1. }
                                                return 151.
                                            } else {
                                                if slot <= 4237 {
                                                    if slot < 4216 or slot > 4237 { return -1. }
                                                    return 152.
                                                } else {
                                                    if slot < 4238 or slot > 4239 { return -1. }
                                                    return 153.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 4302 {
                                        if slot <= 4270 {
                                            if slot <= 4260 {
                                                if slot < 4240 or slot > 4260 { return -1. }
                                                return 154.
                                            } else {
                                                if slot < 4261 or slot > 4270 { return -1. }
                                                return 155.
                                            }
                                        } else {
                                            if slot <= 4280 {
                                                if slot < 4271 or slot > 4280 { return -1. }
                                                return 156.
                                            } else {
                                                if slot < 4281 or slot > 4302 { return -1. }
                                                return 157.
                                            }
                                        }
                                    } else {
                                        if slot <= 4333 {
                                            if slot <= 4317 {
                                                if slot < 4303 or slot > 4317 { return -1. }
                                                return 158.
                                            } else {
                                                if slot < 4318 or slot > 4333 { return -1. }
                                                return 159.
                                            }
                                        } else {
                                            if slot <= 4340 {
                                                if slot < 4334 or slot > 4340 { return -1. }
                                                return 160.
                                            } else {
                                                if slot <= 4351 {
                                                    if slot < 4341 or slot > 4351 { return -1. }
                                                    return 161.
                                                } else {
                                                    if slot < 4352 or slot > 4400 { return -1. }
                                                    return 162.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 4522 {
                                    if slot <= 4485 {
                                        if slot <= 4458 {
                                            if slot <= 4437 {
                                                if slot < 4401 or slot > 4437 { return -1. }
                                                return 163.
                                            } else {
                                                if slot < 4438 or slot > 4458 { return -1. }
                                                return 164.
                                            }
                                        } else {
                                            if slot <= 4476 {
                                                if slot < 4459 or slot > 4476 { return -1. }
                                                return 165.
                                            } else {
                                                if slot < 4477 or slot > 4485 { return -1. }
                                                return 166.
                                            }
                                        }
                                    } else {
                                        if slot <= 4500 {
                                            if slot <= 4491 {
                                                if slot < 4486 or slot > 4491 { return -1. }
                                                return 167.
                                            } else {
                                                if slot < 4498 or slot > 4500 { return -1. }
                                                return 168.
                                            }
                                        } else {
                                            if slot <= 4506 {
                                                if slot < 4503 or slot > 4506 { return -1. }
                                                return 169.
                                            } else {
                                                if slot <= 4517 {
                                                    if slot < 4507 or slot > 4517 { return -1. }
                                                    return 170.
                                                } else {
                                                    if slot < 4518 or slot > 4522 { return -1. }
                                                    return 171.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 4540 {
                                        if slot <= 4525 {
                                            if slot <= 4524 {
                                                if slot < 4523 or slot > 4524 { return -1. }
                                                return 172.
                                            } else {
                                                if slot < 4525 or slot > 4525 { return -1. }
                                                return 173.
                                            }
                                        } else {
                                            if slot <= 4532 {
                                                if slot < 4530 or slot > 4532 { return -1. }
                                                return 174.
                                            } else {
                                                if slot < 4533 or slot > 4540 { return -1. }
                                                return 175.
                                            }
                                        }
                                    } else {
                                        if slot <= 4552 {
                                            if slot <= 4547 {
                                                if slot < 4541 or slot > 4547 { return -1. }
                                                return 176.
                                            } else {
                                                if slot < 4548 or slot > 4552 { return -1. }
                                                return 177.
                                            }
                                        } else {
                                            if slot <= 4568 {
                                                if slot < 4553 or slot > 4568 { return -1. }
                                                return 178.
                                            } else {
                                                if slot <= 4578 {
                                                    if slot < 4569 or slot > 4578 { return -1. }
                                                    return 179.
                                                } else {
                                                    if slot < 4579 or slot > 4586 { return -1. }
                                                    return 180.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 4841 {
                                if slot <= 4763 {
                                    if slot <= 4698 {
                                        if slot <= 4605 {
                                            if slot <= 4597 {
                                                if slot < 4587 or slot > 4597 { return -1. }
                                                return 181.
                                            } else {
                                                if slot < 4598 or slot > 4605 { return -1. }
                                                return 182.
                                            }
                                        } else {
                                            if slot <= 4677 {
                                                if slot < 4668 or slot > 4677 { return -1. }
                                                return 183.
                                            } else {
                                                if slot < 4678 or slot > 4698 { return -1. }
                                                return 184.
                                            }
                                        }
                                    } else {
                                        if slot <= 4705 {
                                            if slot <= 4699 {
                                                if slot < 4699 or slot > 4699 { return -1. }
                                                return 185.
                                            } else {
                                                if slot < 4700 or slot > 4705 { return -1. }
                                                return 186.
                                            }
                                        } else {
                                            if slot <= 4715 {
                                                if slot < 4706 or slot > 4715 { return -1. }
                                                return 187.
                                            } else {
                                                if slot <= 4758 {
                                                    if slot < 4716 or slot > 4758 { return -1. }
                                                    return 188.
                                                } else {
                                                    if slot < 4759 or slot > 4763 { return -1. }
                                                    return 189.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 4792 {
                                        if slot <= 4786 {
                                            if slot <= 4780 {
                                                if slot < 4765 or slot > 4780 { return -1. }
                                                return 190.
                                            } else {
                                                if slot < 4781 or slot > 4786 { return -1. }
                                                return 191.
                                            }
                                        } else {
                                            if slot <= 4790 {
                                                if slot < 4787 or slot > 4790 { return -1. }
                                                return 192.
                                            } else {
                                                if slot < 4791 or slot > 4792 { return -1. }
                                                return 193.
                                            }
                                        }
                                    } else {
                                        if slot <= 4818 {
                                            if slot <= 4805 {
                                                if slot < 4793 or slot > 4805 { return -1. }
                                                return 194.
                                            } else {
                                                if slot < 4806 or slot > 4818 { return -1. }
                                                return 195.
                                            }
                                        } else {
                                            if slot <= 4819 {
                                                if slot < 4819 or slot > 4819 { return -1. }
                                                return 196.
                                            } else {
                                                if slot <= 4837 {
                                                    if slot < 4820 or slot > 4837 { return -1. }
                                                    return 197.
                                                } else {
                                                    if slot < 4838 or slot > 4841 { return -1. }
                                                    return 198.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 4912 {
                                    if slot <= 4857 {
                                        if slot <= 4851 {
                                            if slot <= 4845 {
                                                if slot < 4844 or slot > 4845 { return -1. }
                                                return 199.
                                            } else {
                                                if slot < 4846 or slot > 4851 { return -1. }
                                                return 200.
                                            }
                                        } else {
                                            if slot <= 4853 {
                                                if slot < 4852 or slot > 4853 { return -1. }
                                                return 201.
                                            } else {
                                                if slot < 4854 or slot > 4857 { return -1. }
                                                return 202.
                                            }
                                        }
                                    } else {
                                        if slot <= 4878 {
                                            if slot <= 4860 {
                                                if slot < 4858 or slot > 4860 { return -1. }
                                                return 203.
                                            } else {
                                                if slot < 4861 or slot > 4878 { return -1. }
                                                return 204.
                                            }
                                        } else {
                                            if slot <= 4885 {
                                                if slot < 4879 or slot > 4885 { return -1. }
                                                return 205.
                                            } else {
                                                if slot <= 4897 {
                                                    if slot < 4886 or slot > 4897 { return -1. }
                                                    return 206.
                                                } else {
                                                    if slot < 4898 or slot > 4912 { return -1. }
                                                    return 207.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 4931 {
                                        if slot <= 4919 {
                                            if slot <= 4914 {
                                                if slot < 4913 or slot > 4914 { return -1. }
                                                return 208.
                                            } else {
                                                if slot < 4915 or slot > 4919 { return -1. }
                                                return 209.
                                            }
                                        } else {
                                            if slot <= 4923 {
                                                if slot < 4920 or slot > 4923 { return -1. }
                                                return 210.
                                            } else {
                                                if slot <= 4927 {
                                                    if slot < 4924 or slot > 4927 { return -1. }
                                                    return 211.
                                                } else {
                                                    if slot < 4928 or slot > 4931 { return -1. }
                                                    return 212.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 4940 {
                                            if slot <= 4934 {
                                                if slot < 4932 or slot > 4934 { return -1. }
                                                return 213.
                                            } else {
                                                if slot < 4935 or slot > 4940 { return -1. }
                                                return 214.
                                            }
                                        } else {
                                            if slot <= 4944 {
                                                if slot < 4941 or slot > 4944 { return -1. }
                                                return 215.
                                            } else {
                                                if slot <= 4949 {
                                                    if slot < 4945 or slot > 4949 { return -1. }
                                                    return 216.
                                                } else {
                                                    if slot < 4950 or slot > 4954 { return -1. }
                                                    return 217.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 5194 {
                            if slot <= 5081 {
                                if slot <= 5003 {
                                    if slot <= 4986 {
                                        if slot <= 4965 {
                                            if slot <= 4957 {
                                                if slot < 4955 or slot > 4957 { return -1. }
                                                return 218.
                                            } else {
                                                if slot < 4958 or slot > 4965 { return -1. }
                                                return 219.
                                            }
                                        } else {
                                            if slot <= 4972 {
                                                if slot < 4966 or slot > 4972 { return -1. }
                                                return 220.
                                            } else {
                                                if slot < 4973 or slot > 4986 { return -1. }
                                                return 221.
                                            }
                                        }
                                    } else {
                                        if slot <= 4996 {
                                            if slot <= 4993 {
                                                if slot < 4987 or slot > 4993 { return -1. }
                                                return 222.
                                            } else {
                                                if slot < 4994 or slot > 4996 { return -1. }
                                                return 223.
                                            }
                                        } else {
                                            if slot <= 4997 {
                                                if slot < 4997 or slot > 4997 { return -1. }
                                                return 224.
                                            } else {
                                                if slot <= 5001 {
                                                    if slot < 4998 or slot > 5001 { return -1. }
                                                    return 225.
                                                } else {
                                                    if slot < 5002 or slot > 5003 { return -1. }
                                                    return 226.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 5036 {
                                        if slot <= 5009 {
                                            if slot <= 5007 {
                                                if slot < 5004 or slot > 5007 { return -1. }
                                                return 227.
                                            } else {
                                                if slot < 5008 or slot > 5009 { return -1. }
                                                return 228.
                                            }
                                        } else {
                                            if slot <= 5031 {
                                                if slot < 5010 or slot > 5031 { return -1. }
                                                return 229.
                                            } else {
                                                if slot < 5032 or slot > 5036 { return -1. }
                                                return 230.
                                            }
                                        }
                                    } else {
                                        if slot <= 5072 {
                                            if slot <= 5068 {
                                                if slot < 5037 or slot > 5068 { return -1. }
                                                return 231.
                                            } else {
                                                if slot < 5069 or slot > 5072 { return -1. }
                                                return 232.
                                            }
                                        } else {
                                            if slot <= 5077 {
                                                if slot < 5073 or slot > 5077 { return -1. }
                                                return 233.
                                            } else {
                                                if slot <= 5079 {
                                                    if slot < 5078 or slot > 5079 { return -1. }
                                                    return 234.
                                                } else {
                                                    if slot < 5080 or slot > 5081 { return -1. }
                                                    return 235.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 5114 {
                                    if slot <= 5093 {
                                        if slot <= 5089 {
                                            if slot <= 5087 {
                                                if slot < 5082 or slot > 5087 { return -1. }
                                                return 236.
                                            } else {
                                                if slot < 5088 or slot > 5089 { return -1. }
                                                return 237.
                                            }
                                        } else {
                                            if slot <= 5091 {
                                                if slot < 5090 or slot > 5091 { return -1. }
                                                return 238.
                                            } else {
                                                if slot < 5092 or slot > 5093 { return -1. }
                                                return 239.
                                            }
                                        }
                                    } else {
                                        if slot <= 5102 {
                                            if slot <= 5099 {
                                                if slot < 5094 or slot > 5099 { return -1. }
                                                return 240.
                                            } else {
                                                if slot < 5100 or slot > 5102 { return -1. }
                                                return 241.
                                            }
                                        } else {
                                            if slot <= 5106 {
                                                if slot < 5103 or slot > 5106 { return -1. }
                                                return 242.
                                            } else {
                                                if slot <= 5113 {
                                                    if slot < 5107 or slot > 5113 { return -1. }
                                                    return 243.
                                                } else {
                                                    if slot < 5114 or slot > 5114 { return -1. }
                                                    return 244.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 5155 {
                                        if slot <= 5139 {
                                            if slot <= 5125 {
                                                if slot < 5120 or slot > 5125 { return -1. }
                                                return 245.
                                            } else {
                                                if slot < 5126 or slot > 5139 { return -1. }
                                                return 246.
                                            }
                                        } else {
                                            if slot <= 5152 {
                                                if slot < 5140 or slot > 5152 { return -1. }
                                                return 247.
                                            } else {
                                                if slot < 5153 or slot > 5155 { return -1. }
                                                return 248.
                                            }
                                        }
                                    } else {
                                        if slot <= 5169 {
                                            if slot <= 5166 {
                                                if slot < 5156 or slot > 5166 { return -1. }
                                                return 249.
                                            } else {
                                                if slot < 5167 or slot > 5169 { return -1. }
                                                return 250.
                                            }
                                        } else {
                                            if slot <= 5179 {
                                                if slot < 5170 or slot > 5179 { return -1. }
                                                return 251.
                                            } else {
                                                if slot <= 5188 {
                                                    if slot < 5180 or slot > 5188 { return -1. }
                                                    return 252.
                                                } else {
                                                    if slot < 5189 or slot > 5194 { return -1. }
                                                    return 253.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 5344 {
                                if slot <= 5261 {
                                    if slot <= 5235 {
                                        if slot <= 5212 {
                                            if slot <= 5201 {
                                                if slot < 5195 or slot > 5201 { return -1. }
                                                return 254.
                                            } else {
                                                if slot < 5202 or slot > 5212 { return -1. }
                                                return 255.
                                            }
                                        } else {
                                            if slot <= 5226 {
                                                if slot < 5213 or slot > 5226 { return -1. }
                                                return 256.
                                            } else {
                                                if slot < 5227 or slot > 5235 { return -1. }
                                                return 257.
                                            }
                                        }
                                    } else {
                                        if slot <= 5245 {
                                            if slot <= 5241 {
                                                if slot < 5236 or slot > 5241 { return -1. }
                                                return 258.
                                            } else {
                                                if slot < 5242 or slot > 5245 { return -1. }
                                                return 259.
                                            }
                                        } else {
                                            if slot <= 5248 {
                                                if slot < 5246 or slot > 5248 { return -1. }
                                                return 260.
                                            } else {
                                                if slot <= 5251 {
                                                    if slot < 5249 or slot > 5251 { return -1. }
                                                    return 261.
                                                } else {
                                                    if slot < 5252 or slot > 5261 { return -1. }
                                                    return 262.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 5277 {
                                        if slot <= 5267 {
                                            if slot <= 5264 {
                                                if slot < 5262 or slot > 5264 { return -1. }
                                                return 263.
                                            } else {
                                                if slot < 5265 or slot > 5267 { return -1. }
                                                return 264.
                                            }
                                        } else {
                                            if slot <= 5273 {
                                                if slot < 5268 or slot > 5273 { return -1. }
                                                return 265.
                                            } else {
                                                if slot < 5274 or slot > 5277 { return -1. }
                                                return 266.
                                            }
                                        }
                                    } else {
                                        if slot <= 5282 {
                                            if slot <= 5280 {
                                                if slot < 5278 or slot > 5280 { return -1. }
                                                return 267.
                                            } else {
                                                if slot < 5281 or slot > 5282 { return -1. }
                                                return 268.
                                            }
                                        } else {
                                            if slot <= 5330 {
                                                if slot < 5283 or slot > 5330 { return -1. }
                                                return 269.
                                            } else {
                                                if slot <= 5335 {
                                                    if slot < 5331 or slot > 5335 { return -1. }
                                                    return 270.
                                                } else {
                                                    if slot < 5336 or slot > 5344 { return -1. }
                                                    return 271.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 5418 {
                                    if slot <= 5389 {
                                        if slot <= 5367 {
                                            if slot <= 5364 {
                                                if slot < 5345 or slot > 5364 { return -1. }
                                                return 272.
                                            } else {
                                                if slot < 5365 or slot > 5367 { return -1. }
                                                return 273.
                                            }
                                        } else {
                                            if slot <= 5382 {
                                                if slot < 5368 or slot > 5382 { return -1. }
                                                return 274.
                                            } else {
                                                if slot < 5383 or slot > 5389 { return -1. }
                                                return 275.
                                            }
                                        }
                                    } else {
                                        if slot <= 5397 {
                                            if slot <= 5393 {
                                                if slot < 5390 or slot > 5393 { return -1. }
                                                return 276.
                                            } else {
                                                if slot < 5394 or slot > 5397 { return -1. }
                                                return 277.
                                            }
                                        } else {
                                            if slot <= 5408 {
                                                if slot < 5398 or slot > 5408 { return -1. }
                                                return 278.
                                            } else {
                                                if slot <= 5412 {
                                                    if slot < 5409 or slot > 5412 { return -1. }
                                                    return 279.
                                                } else {
                                                    if slot < 5413 or slot > 5418 { return -1. }
                                                    return 280.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 5436 {
                                        if slot <= 5422 {
                                            if slot <= 5420 {
                                                if slot < 5419 or slot > 5420 { return -1. }
                                                return 281.
                                            } else {
                                                if slot < 5421 or slot > 5422 { return -1. }
                                                return 282.
                                            }
                                        } else {
                                            if slot <= 5426 {
                                                if slot < 5423 or slot > 5426 { return -1. }
                                                return 283.
                                            } else {
                                                if slot <= 5430 {
                                                    if slot < 5427 or slot > 5430 { return -1. }
                                                    return 284.
                                                } else {
                                                    if slot < 5431 or slot > 5436 { return -1. }
                                                    return 285.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 5441 {
                                            if slot <= 5439 {
                                                if slot < 5437 or slot > 5439 { return -1. }
                                                return 286.
                                            } else {
                                                if slot < 5440 or slot > 5441 { return -1. }
                                                return 287.
                                            }
                                        } else {
                                            if slot <= 5450 {
                                                if slot < 5442 or slot > 5450 { return -1. }
                                                return 288.
                                            } else {
                                                if slot <= 5453 {
                                                    if slot < 5451 or slot > 5453 { return -1. }
                                                    return 289.
                                                } else {
                                                    if slot < 5454 or slot > 5460 { return -1. }
                                                    return 290.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                if slot <= 7939 {
                    if slot <= 6188 {
                        if slot <= 5666 {
                            if slot <= 5547 {
                                if slot <= 5493 {
                                    if slot <= 5476 {
                                        if slot <= 5467 {
                                            if slot <= 5464 {
                                                if slot < 5461 or slot > 5464 { return -1. }
                                                return 291.
                                            } else {
                                                if slot < 5465 or slot > 5467 { return -1. }
                                                return 292.
                                            }
                                        } else {
                                            if slot <= 5469 {
                                                if slot < 5468 or slot > 5469 { return -1. }
                                                return 293.
                                            } else {
                                                if slot < 5470 or slot > 5476 { return -1. }
                                                return 294.
                                            }
                                        }
                                    } else {
                                        if slot <= 5482 {
                                            if slot <= 5479 {
                                                if slot < 5477 or slot > 5479 { return -1. }
                                                return 295.
                                            } else {
                                                if slot < 5480 or slot > 5482 { return -1. }
                                                return 296.
                                            }
                                        } else {
                                            if slot <= 5485 {
                                                if slot < 5483 or slot > 5485 { return -1. }
                                                return 297.
                                            } else {
                                                if slot <= 5489 {
                                                    if slot < 5486 or slot > 5489 { return -1. }
                                                    return 298.
                                                } else {
                                                    if slot < 5490 or slot > 5493 { return -1. }
                                                    return 299.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 5505 {
                                        if slot <= 5499 {
                                            if slot <= 5497 {
                                                if slot < 5494 or slot > 5497 { return -1. }
                                                return 300.
                                            } else {
                                                if slot < 5498 or slot > 5499 { return -1. }
                                                return 301.
                                            }
                                        } else {
                                            if slot <= 5503 {
                                                if slot < 5500 or slot > 5503 { return -1. }
                                                return 302.
                                            } else {
                                                if slot < 5504 or slot > 5505 { return -1. }
                                                return 303.
                                            }
                                        }
                                    } else {
                                        if slot <= 5516 {
                                            if slot <= 5509 {
                                                if slot < 5506 or slot > 5509 { return -1. }
                                                return 304.
                                            } else {
                                                if slot < 5510 or slot > 5516 { return -1. }
                                                return 305.
                                            }
                                        } else {
                                            if slot <= 5537 {
                                                if slot < 5517 or slot > 5537 { return -1. }
                                                return 306.
                                            } else {
                                                if slot <= 5543 {
                                                    if slot < 5538 or slot > 5543 { return -1. }
                                                    return 307.
                                                } else {
                                                    if slot < 5544 or slot > 5547 { return -1. }
                                                    return 308.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 5602 {
                                    if slot <= 5575 {
                                        if slot <= 5553 {
                                            if slot <= 5549 {
                                                if slot < 5548 or slot > 5549 { return -1. }
                                                return 309.
                                            } else {
                                                if slot < 5550 or slot > 5553 { return -1. }
                                                return 310.
                                            }
                                        } else {
                                            if slot <= 5559 {
                                                if slot < 5554 or slot > 5559 { return -1. }
                                                return 311.
                                            } else {
                                                if slot < 5560 or slot > 5575 { return -1. }
                                                return 312.
                                            }
                                        }
                                    } else {
                                        if slot <= 5580 {
                                            if slot <= 5577 {
                                                if slot < 5576 or slot > 5577 { return -1. }
                                                return 313.
                                            } else {
                                                if slot < 5578 or slot > 5580 { return -1. }
                                                return 314.
                                            }
                                        } else {
                                            if slot <= 5588 {
                                                if slot < 5582 or slot > 5588 { return -1. }
                                                return 315.
                                            } else {
                                                if slot <= 5595 {
                                                    if slot < 5589 or slot > 5595 { return -1. }
                                                    return 316.
                                                } else {
                                                    if slot < 5596 or slot > 5602 { return -1. }
                                                    return 317.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 5628 {
                                        if slot <= 5614 {
                                            if slot <= 5606 {
                                                if slot < 5603 or slot > 5606 { return -1. }
                                                return 318.
                                            } else {
                                                if slot < 5607 or slot > 5614 { return -1. }
                                                return 319.
                                            }
                                        } else {
                                            if slot <= 5623 {
                                                if slot < 5615 or slot > 5623 { return -1. }
                                                return 320.
                                            } else {
                                                if slot < 5624 or slot > 5628 { return -1. }
                                                return 321.
                                            }
                                        }
                                    } else {
                                        if slot <= 5639 {
                                            if slot <= 5633 {
                                                if slot < 5629 or slot > 5633 { return -1. }
                                                return 322.
                                            } else {
                                                if slot < 5634 or slot > 5639 { return -1. }
                                                return 323.
                                            }
                                        } else {
                                            if slot <= 5649 {
                                                if slot < 5640 or slot > 5649 { return -1. }
                                                return 324.
                                            } else {
                                                if slot <= 5659 {
                                                    if slot < 5650 or slot > 5659 { return -1. }
                                                    return 325.
                                                } else {
                                                    if slot < 5660 or slot > 5666 { return -1. }
                                                    return 326.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 6042 {
                                if slot <= 5856 {
                                    if slot <= 5691 {
                                        if slot <= 5675 {
                                            if slot <= 5669 {
                                                if slot < 5667 or slot > 5669 { return -1. }
                                                return 327.
                                            } else {
                                                if slot < 5670 or slot > 5675 { return -1. }
                                                return 328.
                                            }
                                        } else {
                                            if slot <= 5679 {
                                                if slot < 5676 or slot > 5679 { return -1. }
                                                return 329.
                                            } else {
                                                if slot < 5680 or slot > 5691 { return -1. }
                                                return 330.
                                            }
                                        }
                                    } else {
                                        if slot <= 5754 {
                                            if slot <= 5725 {
                                                if slot < 5692 or slot > 5725 { return -1. }
                                                return 331.
                                            } else {
                                                if slot < 5726 or slot > 5754 { return -1. }
                                                return 332.
                                            }
                                        } else {
                                            if slot <= 5765 {
                                                if slot < 5755 or slot > 5765 { return -1. }
                                                return 333.
                                            } else {
                                                if slot <= 5775 {
                                                    if slot < 5766 or slot > 5775 { return -1. }
                                                    return 334.
                                                } else {
                                                    if slot < 5776 or slot > 5856 { return -1. }
                                                    return 335.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 6016 {
                                        if slot <= 5992 {
                                            if slot <= 5984 {
                                                if slot < 5857 or slot > 5984 { return -1. }
                                                return 336.
                                            } else {
                                                if slot < 5985 or slot > 5992 { return -1. }
                                                return 337.
                                            }
                                        } else {
                                            if slot <= 5996 {
                                                if slot < 5993 or slot > 5996 { return -1. }
                                                return 338.
                                            } else {
                                                if slot < 5997 or slot > 6016 { return -1. }
                                                return 339.
                                            }
                                        }
                                    } else {
                                        if slot <= 6027 {
                                            if slot <= 6023 {
                                                if slot < 6017 or slot > 6023 { return -1. }
                                                return 340.
                                            } else {
                                                if slot < 6024 or slot > 6027 { return -1. }
                                                return 341.
                                            }
                                        } else {
                                            if slot <= 6033 {
                                                if slot < 6028 or slot > 6033 { return -1. }
                                                return 342.
                                            } else {
                                                if slot <= 6037 {
                                                    if slot < 6034 or slot > 6037 { return -1. }
                                                    return 343.
                                                } else {
                                                    if slot < 6038 or slot > 6042 { return -1. }
                                                    return 344.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 6129 {
                                    if slot <= 6105 {
                                        if slot <= 6096 {
                                            if slot <= 6062 {
                                                if slot < 6043 or slot > 6062 { return -1. }
                                                return 345.
                                            } else {
                                                if slot < 6095 or slot > 6096 { return -1. }
                                                return 346.
                                            }
                                        } else {
                                            if slot <= 6097 {
                                                if slot < 6097 or slot > 6097 { return -1. }
                                                return 347.
                                            } else {
                                                if slot < 6098 or slot > 6105 { return -1. }
                                                return 348.
                                            }
                                        }
                                    } else {
                                        if slot <= 6119 {
                                            if slot <= 6108 {
                                                if slot < 6106 or slot > 6108 { return -1. }
                                                return 349.
                                            } else {
                                                if slot < 6109 or slot > 6119 { return -1. }
                                                return 350.
                                            }
                                        } else {
                                            if slot <= 6121 {
                                                if slot < 6120 or slot > 6121 { return -1. }
                                                return 351.
                                            } else {
                                                if slot <= 6124 {
                                                    if slot < 6122 or slot > 6124 { return -1. }
                                                    return 352.
                                                } else {
                                                    if slot < 6125 or slot > 6129 { return -1. }
                                                    return 353.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 6152 {
                                        if slot <= 6133 {
                                            if slot <= 6131 {
                                                if slot < 6130 or slot > 6131 { return -1. }
                                                return 354.
                                            } else {
                                                if slot < 6132 or slot > 6133 { return -1. }
                                                return 355.
                                            }
                                        } else {
                                            if slot <= 6139 {
                                                if slot < 6134 or slot > 6139 { return -1. }
                                                return 356.
                                            } else {
                                                if slot <= 6148 {
                                                    if slot < 6144 or slot > 6148 { return -1. }
                                                    return 357.
                                                } else {
                                                    if slot < 6149 or slot > 6152 { return -1. }
                                                    return 358.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 6177 {
                                            if slot <= 6175 {
                                                if slot < 6153 or slot > 6175 { return -1. }
                                                return 359.
                                            } else {
                                                if slot < 6176 or slot > 6177 { return -1. }
                                                return 360.
                                            }
                                        } else {
                                            if slot <= 6180 {
                                                if slot < 6178 or slot > 6180 { return -1. }
                                                return 361.
                                            } else {
                                                if slot <= 6182 {
                                                    if slot < 6181 or slot > 6182 { return -1. }
                                                    return 362.
                                                } else {
                                                    if slot < 6183 or slot > 6188 { return -1. }
                                                    return 363.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 6680 {
                            if slot <= 6371 {
                                if slot <= 6254 {
                                    if slot <= 6231 {
                                        if slot <= 6205 {
                                            if slot <= 6202 {
                                                if slot < 6189 or slot > 6202 { return -1. }
                                                return 364.
                                            } else {
                                                if slot < 6203 or slot > 6205 { return -1. }
                                                return 365.
                                            }
                                        } else {
                                            if slot <= 6209 {
                                                if slot < 6206 or slot > 6209 { return -1. }
                                                return 366.
                                            } else {
                                                if slot < 6210 or slot > 6231 { return -1. }
                                                return 367.
                                            }
                                        }
                                    } else {
                                        if slot <= 6248 {
                                            if slot <= 6235 {
                                                if slot < 6232 or slot > 6235 { return -1. }
                                                return 368.
                                            } else {
                                                if slot < 6236 or slot > 6248 { return -1. }
                                                return 369.
                                            }
                                        } else {
                                            if slot <= 6250 {
                                                if slot < 6249 or slot > 6250 { return -1. }
                                                return 370.
                                            } else {
                                                if slot <= 6252 {
                                                    if slot < 6251 or slot > 6252 { return -1. }
                                                    return 371.
                                                } else {
                                                    if slot < 6253 or slot > 6254 { return -1. }
                                                    return 372.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 6292 {
                                        if slot <= 6282 {
                                            if slot <= 6278 {
                                                if slot < 6255 or slot > 6278 { return -1. }
                                                return 373.
                                            } else {
                                                if slot < 6279 or slot > 6282 { return -1. }
                                                return 374.
                                            }
                                        } else {
                                            if slot <= 6286 {
                                                if slot < 6283 or slot > 6286 { return -1. }
                                                return 375.
                                            } else {
                                                if slot < 6287 or slot > 6292 { return -1. }
                                                return 376.
                                            }
                                        }
                                    } else {
                                        if slot <= 6327 {
                                            if slot <= 6325 {
                                                if slot < 6293 or slot > 6325 { return -1. }
                                                return 377.
                                            } else {
                                                if slot < 6326 or slot > 6327 { return -1. }
                                                return 378.
                                            }
                                        } else {
                                            if slot <= 6334 {
                                                if slot < 6328 or slot > 6334 { return -1. }
                                                return 379.
                                            } else {
                                                if slot <= 6347 {
                                                    if slot < 6335 or slot > 6347 { return -1. }
                                                    return 380.
                                                } else {
                                                    if slot < 6348 or slot > 6371 { return -1. }
                                                    return 381.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 6533 {
                                    if slot <= 6382 {
                                        if slot <= 6378 {
                                            if slot <= 6374 {
                                                if slot < 6372 or slot > 6374 { return -1. }
                                                return 382.
                                            } else {
                                                if slot < 6375 or slot > 6378 { return -1. }
                                                return 383.
                                            }
                                        } else {
                                            if slot <= 6380 {
                                                if slot < 6379 or slot > 6380 { return -1. }
                                                return 384.
                                            } else {
                                                if slot < 6381 or slot > 6382 { return -1. }
                                                return 385.
                                            }
                                        }
                                    } else {
                                        if slot <= 6390 {
                                            if slot <= 6387 {
                                                if slot < 6383 or slot > 6387 { return -1. }
                                                return 386.
                                            } else {
                                                if slot < 6388 or slot > 6390 { return -1. }
                                                return 387.
                                            }
                                        } else {
                                            if slot <= 6524 {
                                                if slot < 6518 or slot > 6524 { return -1. }
                                                return 388.
                                            } else {
                                                if slot <= 6526 {
                                                    if slot < 6525 or slot > 6526 { return -1. }
                                                    return 389.
                                                } else {
                                                    if slot < 6527 or slot > 6533 { return -1. }
                                                    return 390.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 6551 {
                                        if slot <= 6538 {
                                            if slot <= 6537 {
                                                if slot < 6534 or slot > 6537 { return -1. }
                                                return 391.
                                            } else {
                                                if slot < 6538 or slot > 6538 { return -1. }
                                                return 392.
                                            }
                                        } else {
                                            if slot <= 6548 {
                                                if slot < 6545 or slot > 6548 { return -1. }
                                                return 393.
                                            } else {
                                                if slot < 6549 or slot > 6551 { return -1. }
                                                return 394.
                                            }
                                        }
                                    } else {
                                        if slot <= 6634 {
                                            if slot <= 6555 {
                                                if slot < 6552 or slot > 6555 { return -1. }
                                                return 395.
                                            } else {
                                                if slot < 6626 or slot > 6634 { return -1. }
                                                return 396.
                                            }
                                        } else {
                                            if slot <= 6647 {
                                                if slot < 6635 or slot > 6647 { return -1. }
                                                return 397.
                                            } else {
                                                if slot <= 6677 {
                                                    if slot < 6648 or slot > 6677 { return -1. }
                                                    return 398.
                                                } else {
                                                    if slot < 6678 or slot > 6680 { return -1. }
                                                    return 399.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 7015 {
                                if slot <= 6870 {
                                    if slot <= 6834 {
                                        if slot <= 6759 {
                                            if slot <= 6739 {
                                                if slot < 6681 or slot > 6739 { return -1. }
                                                return 400.
                                            } else {
                                                if slot < 6740 or slot > 6759 { return -1. }
                                                return 401.
                                            }
                                        } else {
                                            if slot <= 6773 {
                                                if slot < 6760 or slot > 6773 { return -1. }
                                                return 402.
                                            } else {
                                                if slot < 6774 or slot > 6834 { return -1. }
                                                return 403.
                                            }
                                        }
                                    } else {
                                        if slot <= 6843 {
                                            if slot <= 6840 {
                                                if slot < 6835 or slot > 6840 { return -1. }
                                                return 404.
                                            } else {
                                                if slot < 6841 or slot > 6843 { return -1. }
                                                return 405.
                                            }
                                        } else {
                                            if slot <= 6858 {
                                                if slot < 6851 or slot > 6858 { return -1. }
                                                return 406.
                                            } else {
                                                if slot <= 6865 {
                                                    if slot < 6859 or slot > 6865 { return -1. }
                                                    return 407.
                                                } else {
                                                    if slot < 6866 or slot > 6870 { return -1. }
                                                    return 408.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 6942 {
                                        if slot <= 6883 {
                                            if slot <= 6878 {
                                                if slot < 6871 or slot > 6878 { return -1. }
                                                return 409.
                                            } else {
                                                if slot < 6879 or slot > 6883 { return -1. }
                                                return 410.
                                            }
                                        } else {
                                            if slot <= 6923 {
                                                if slot < 6884 or slot > 6923 { return -1. }
                                                return 411.
                                            } else {
                                                if slot < 6924 or slot > 6942 { return -1. }
                                                return 412.
                                            }
                                        }
                                    } else {
                                        if slot <= 6984 {
                                            if slot <= 6982 {
                                                if slot < 6943 or slot > 6982 { return -1. }
                                                return 413.
                                            } else {
                                                if slot < 6983 or slot > 6984 { return -1. }
                                                return 414.
                                            }
                                        } else {
                                            if slot <= 6987 {
                                                if slot < 6985 or slot > 6987 { return -1. }
                                                return 415.
                                            } else {
                                                if slot <= 7012 {
                                                    if slot < 6988 or slot > 7012 { return -1. }
                                                    return 416.
                                                } else {
                                                    if slot < 7013 or slot > 7015 { return -1. }
                                                    return 417.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 7580 {
                                    if slot <= 7516 {
                                        if slot <= 7488 {
                                            if slot <= 7400 {
                                                if slot < 7394 or slot > 7400 { return -1. }
                                                return 418.
                                            } else {
                                                if slot < 7401 or slot > 7488 { return -1. }
                                                return 419.
                                            }
                                        } else {
                                            if slot <= 7509 {
                                                if slot < 7489 or slot > 7509 { return -1. }
                                                return 420.
                                            } else {
                                                if slot < 7510 or slot > 7516 { return -1. }
                                                return 421.
                                            }
                                        }
                                    } else {
                                        if slot <= 7545 {
                                            if slot <= 7526 {
                                                if slot < 7517 or slot > 7526 { return -1. }
                                                return 422.
                                            } else {
                                                if slot < 7527 or slot > 7545 { return -1. }
                                                return 423.
                                            }
                                        } else {
                                            if slot <= 7555 {
                                                if slot < 7546 or slot > 7555 { return -1. }
                                                return 424.
                                            } else {
                                                if slot <= 7576 {
                                                    if slot < 7556 or slot > 7576 { return -1. }
                                                    return 425.
                                                } else {
                                                    if slot < 7577 or slot > 7580 { return -1. }
                                                    return 426.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 7658 {
                                        if slot <= 7612 {
                                            if slot <= 7606 {
                                                if slot < 7581 or slot > 7606 { return -1. }
                                                return 427.
                                            } else {
                                                if slot < 7607 or slot > 7612 { return -1. }
                                                return 428.
                                            }
                                        } else {
                                            if slot <= 7637 {
                                                if slot < 7613 or slot > 7637 { return -1. }
                                                return 429.
                                            } else {
                                                if slot <= 7655 {
                                                    if slot < 7638 or slot > 7655 { return -1. }
                                                    return 430.
                                                } else {
                                                    if slot < 7656 or slot > 7658 { return -1. }
                                                    return 431.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 7751 {
                                            if slot <= 7666 {
                                                if slot < 7659 or slot > 7666 { return -1. }
                                                return 432.
                                            } else {
                                                if slot < 7667 or slot > 7751 { return -1. }
                                                return 433.
                                            }
                                        } else {
                                            if slot <= 7788 {
                                                if slot < 7752 or slot > 7788 { return -1. }
                                                return 434.
                                            } else {
                                                if slot <= 7933 {
                                                    if slot < 7926 or slot > 7933 { return -1. }
                                                    return 435.
                                                } else {
                                                    if slot < 7934 or slot > 7939 { return -1. }
                                                    return 436.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    if slot <= 8909 {
                        if slot <= 8308 {
                            if slot <= 8107 {
                                if slot <= 8042 {
                                    if slot <= 7971 {
                                        if slot <= 7944 {
                                            if slot <= 7942 {
                                                if slot < 7940 or slot > 7942 { return -1. }
                                                return 437.
                                            } else {
                                                if slot < 7943 or slot > 7944 { return -1. }
                                                return 438.
                                            }
                                        } else {
                                            if slot <= 7966 {
                                                if slot < 7945 or slot > 7966 { return -1. }
                                                return 439.
                                            } else {
                                                if slot < 7967 or slot > 7971 { return -1. }
                                                return 440.
                                            }
                                        }
                                    } else {
                                        if slot <= 7986 {
                                            if slot <= 7973 {
                                                if slot < 7972 or slot > 7973 { return -1. }
                                                return 441.
                                            } else {
                                                if slot < 7974 or slot > 7986 { return -1. }
                                                return 442.
                                            }
                                        } else {
                                            if slot <= 8032 {
                                                if slot < 8017 or slot > 8032 { return -1. }
                                                return 443.
                                            } else {
                                                if slot <= 8036 {
                                                    if slot < 8033 or slot > 8036 { return -1. }
                                                    return 444.
                                                } else {
                                                    if slot < 8037 or slot > 8042 { return -1. }
                                                    return 445.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 8076 {
                                        if slot <= 8059 {
                                            if slot <= 8047 {
                                                if slot < 8043 or slot > 8047 { return -1. }
                                                return 446.
                                            } else {
                                                if slot < 8048 or slot > 8059 { return -1. }
                                                return 447.
                                            }
                                        } else {
                                            if slot <= 8072 {
                                                if slot < 8060 or slot > 8072 { return -1. }
                                                return 448.
                                            } else {
                                                if slot < 8073 or slot > 8076 { return -1. }
                                                return 449.
                                            }
                                        }
                                    } else {
                                        if slot <= 8097 {
                                            if slot <= 8085 {
                                                if slot < 8077 or slot > 8085 { return -1. }
                                                return 450.
                                            } else {
                                                if slot < 8086 or slot > 8097 { return -1. }
                                                return 451.
                                            }
                                        } else {
                                            if slot <= 8099 {
                                                if slot < 8098 or slot > 8099 { return -1. }
                                                return 452.
                                            } else {
                                                if slot <= 8104 {
                                                    if slot < 8100 or slot > 8104 { return -1. }
                                                    return 453.
                                                } else {
                                                    if slot < 8105 or slot > 8107 { return -1. }
                                                    return 454.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 8201 {
                                    if slot <= 8156 {
                                        if slot <= 8126 {
                                            if slot <= 8116 {
                                                if slot < 8108 or slot > 8116 { return -1. }
                                                return 455.
                                            } else {
                                                if slot < 8117 or slot > 8126 { return -1. }
                                                return 456.
                                            }
                                        } else {
                                            if slot <= 8130 {
                                                if slot < 8127 or slot > 8130 { return -1. }
                                                return 457.
                                            } else {
                                                if slot < 8131 or slot > 8156 { return -1. }
                                                return 458.
                                            }
                                        }
                                    } else {
                                        if slot <= 8177 {
                                            if slot <= 8163 {
                                                if slot < 8157 or slot > 8163 { return -1. }
                                                return 459.
                                            } else {
                                                if slot < 8164 or slot > 8177 { return -1. }
                                                return 460.
                                            }
                                        } else {
                                            if slot <= 8180 {
                                                if slot < 8178 or slot > 8180 { return -1. }
                                                return 461.
                                            } else {
                                                if slot <= 8189 {
                                                    if slot < 8181 or slot > 8189 { return -1. }
                                                    return 462.
                                                } else {
                                                    if slot < 8192 or slot > 8201 { return -1. }
                                                    return 463.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 8233 {
                                        if slot <= 8223 {
                                            if slot <= 8219 {
                                                if slot < 8202 or slot > 8219 { return -1. }
                                                return 464.
                                            } else {
                                                if slot < 8220 or slot > 8223 { return -1. }
                                                return 465.
                                            }
                                        } else {
                                            if slot <= 8225 {
                                                if slot < 8224 or slot > 8225 { return -1. }
                                                return 466.
                                            } else {
                                                if slot < 8226 or slot > 8233 { return -1. }
                                                return 467.
                                            }
                                        }
                                    } else {
                                        if slot <= 8269 {
                                            if slot <= 8238 {
                                                if slot < 8234 or slot > 8238 { return -1. }
                                                return 468.
                                            } else {
                                                if slot < 8239 or slot > 8269 { return -1. }
                                                return 469.
                                            }
                                        } else {
                                            if slot <= 8271 {
                                                if slot < 8270 or slot > 8271 { return -1. }
                                                return 470.
                                            } else {
                                                if slot <= 8281 {
                                                    if slot < 8272 or slot > 8281 { return -1. }
                                                    return 471.
                                                } else {
                                                    if slot < 8282 or slot > 8308 { return -1. }
                                                    return 472.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 8551 {
                                if slot <= 8416 {
                                    if slot <= 8342 {
                                        if slot <= 8330 {
                                            if slot <= 8315 {
                                                if slot < 8309 or slot > 8315 { return -1. }
                                                return 473.
                                            } else {
                                                if slot < 8316 or slot > 8330 { return -1. }
                                                return 474.
                                            }
                                        } else {
                                            if slot <= 8339 {
                                                if slot < 8331 or slot > 8339 { return -1. }
                                                return 475.
                                            } else {
                                                if slot < 8340 or slot > 8342 { return -1. }
                                                return 476.
                                            }
                                        }
                                    } else {
                                        if slot <= 8372 {
                                            if slot <= 8367 {
                                                if slot < 8343 or slot > 8367 { return -1. }
                                                return 477.
                                            } else {
                                                if slot < 8368 or slot > 8372 { return -1. }
                                                return 478.
                                            }
                                        } else {
                                            if slot <= 8391 {
                                                if slot < 8373 or slot > 8391 { return -1. }
                                                return 479.
                                            } else {
                                                if slot <= 8396 {
                                                    if slot < 8392 or slot > 8396 { return -1. }
                                                    return 480.
                                                } else {
                                                    if slot < 8397 or slot > 8416 { return -1. }
                                                    return 481.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 8468 {
                                        if slot <= 8437 {
                                            if slot <= 8429 {
                                                if slot < 8417 or slot > 8429 { return -1. }
                                                return 482.
                                            } else {
                                                if slot < 8430 or slot > 8437 { return -1. }
                                                return 483.
                                            }
                                        } else {
                                            if slot <= 8465 {
                                                if slot < 8438 or slot > 8465 { return -1. }
                                                return 484.
                                            } else {
                                                if slot < 8466 or slot > 8468 { return -1. }
                                                return 485.
                                            }
                                        }
                                    } else {
                                        if slot <= 8488 {
                                            if slot <= 8472 {
                                                if slot < 8469 or slot > 8472 { return -1. }
                                                return 486.
                                            } else {
                                                if slot < 8473 or slot > 8488 { return -1. }
                                                return 487.
                                            }
                                        } else {
                                            if slot <= 8492 {
                                                if slot < 8489 or slot > 8492 { return -1. }
                                                return 488.
                                            } else {
                                                if slot <= 8518 {
                                                    if slot < 8493 or slot > 8518 { return -1. }
                                                    return 489.
                                                } else {
                                                    if slot < 8519 or slot > 8551 { return -1. }
                                                    return 490.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 8692 {
                                    if slot <= 8609 {
                                        if slot <= 8586 {
                                            if slot <= 8570 {
                                                if slot < 8552 or slot > 8570 { return -1. }
                                                return 491.
                                            } else {
                                                if slot < 8571 or slot > 8586 { return -1. }
                                                return 492.
                                            }
                                        } else {
                                            if slot <= 8595 {
                                                if slot < 8587 or slot > 8595 { return -1. }
                                                return 493.
                                            } else {
                                                if slot < 8596 or slot > 8609 { return -1. }
                                                return 494.
                                            }
                                        }
                                    } else {
                                        if slot <= 8622 {
                                            if slot <= 8617 {
                                                if slot < 8610 or slot > 8617 { return -1. }
                                                return 495.
                                            } else {
                                                if slot < 8618 or slot > 8622 { return -1. }
                                                return 496.
                                            }
                                        } else {
                                            if slot <= 8627 {
                                                if slot < 8623 or slot > 8627 { return -1. }
                                                return 497.
                                            } else {
                                                if slot <= 8675 {
                                                    if slot < 8628 or slot > 8675 { return -1. }
                                                    return 498.
                                                } else {
                                                    if slot < 8676 or slot > 8692 { return -1. }
                                                    return 499.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 8880 {
                                        if slot <= 8746 {
                                            if slot <= 8738 {
                                                if slot < 8693 or slot > 8738 { return -1. }
                                                return 500.
                                            } else {
                                                if slot < 8739 or slot > 8746 { return -1. }
                                                return 501.
                                            }
                                        } else {
                                            if slot <= 8753 {
                                                if slot < 8747 or slot > 8753 { return -1. }
                                                return 502.
                                            } else {
                                                if slot <= 8821 {
                                                    if slot < 8754 or slot > 8821 { return -1. }
                                                    return 503.
                                                } else {
                                                    if slot < 8822 or slot > 8880 { return -1. }
                                                    return 504.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 8896 {
                                            if slot <= 8893 {
                                                if slot < 8882 or slot > 8893 { return -1. }
                                                return 505.
                                            } else {
                                                if slot < 8894 or slot > 8896 { return -1. }
                                                return 506.
                                            }
                                        } else {
                                            if slot <= 8902 {
                                                if slot < 8897 or slot > 8902 { return -1. }
                                                return 507.
                                            } else {
                                                if slot <= 8907 {
                                                    if slot < 8903 or slot > 8907 { return -1. }
                                                    return 508.
                                                } else {
                                                    if slot < 8908 or slot > 8909 { return -1. }
                                                    return 509.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 9357 {
                            if slot <= 9109 {
                                if slot <= 9027 {
                                    if slot <= 8991 {
                                        if slot <= 8965 {
                                            if slot <= 8915 {
                                                if slot < 8910 or slot > 8915 { return -1. }
                                                return 510.
                                            } else {
                                                if slot < 8916 or slot > 8965 { return -1. }
                                                return 511.
                                            }
                                        } else {
                                            if slot <= 8984 {
                                                if slot < 8966 or slot > 8984 { return -1. }
                                                return 512.
                                            } else {
                                                if slot < 8985 or slot > 8991 { return -1. }
                                                return 513.
                                            }
                                        }
                                    } else {
                                        if slot <= 9008 {
                                            if slot <= 9001 {
                                                if slot < 8992 or slot > 9001 { return -1. }
                                                return 514.
                                            } else {
                                                if slot < 9002 or slot > 9008 { return -1. }
                                                return 515.
                                            }
                                        } else {
                                            if slot <= 9013 {
                                                if slot < 9009 or slot > 9013 { return -1. }
                                                return 516.
                                            } else {
                                                if slot <= 9022 {
                                                    if slot < 9014 or slot > 9022 { return -1. }
                                                    return 517.
                                                } else {
                                                    if slot < 9024 or slot > 9027 { return -1. }
                                                    return 518.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 9041 {
                                        if slot <= 9034 {
                                            if slot <= 9030 {
                                                if slot < 9028 or slot > 9030 { return -1. }
                                                return 519.
                                            } else {
                                                if slot < 9031 or slot > 9034 { return -1. }
                                                return 520.
                                            }
                                        } else {
                                            if slot <= 9038 {
                                                if slot < 9035 or slot > 9038 { return -1. }
                                                return 521.
                                            } else {
                                                if slot < 9039 or slot > 9041 { return -1. }
                                                return 522.
                                            }
                                        }
                                    } else {
                                        if slot <= 9048 {
                                            if slot <= 9043 {
                                                if slot < 9042 or slot > 9043 { return -1. }
                                                return 523.
                                            } else {
                                                if slot < 9044 or slot > 9048 { return -1. }
                                                return 524.
                                            }
                                        } else {
                                            if slot <= 9052 {
                                                if slot < 9049 or slot > 9052 { return -1. }
                                                return 525.
                                            } else {
                                                if slot <= 9056 {
                                                    if slot < 9053 or slot > 9056 { return -1. }
                                                    return 526.
                                                } else {
                                                    if slot < 9057 or slot > 9109 { return -1. }
                                                    return 527.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 9253 {
                                    if slot <= 9228 {
                                        if slot <= 9119 {
                                            if slot <= 9116 {
                                                if slot < 9110 or slot > 9116 { return -1. }
                                                return 528.
                                            } else {
                                                if slot < 9117 or slot > 9119 { return -1. }
                                                return 529.
                                            }
                                        } else {
                                            if slot <= 9128 {
                                                if slot < 9120 or slot > 9128 { return -1. }
                                                return 530.
                                            } else {
                                                if slot < 9218 or slot > 9228 { return -1. }
                                                return 531.
                                            }
                                        }
                                    } else {
                                        if slot <= 9244 {
                                            if slot <= 9240 {
                                                if slot < 9229 or slot > 9240 { return -1. }
                                                return 532.
                                            } else {
                                                if slot < 9241 or slot > 9244 { return -1. }
                                                return 533.
                                            }
                                        } else {
                                            if slot <= 9247 {
                                                if slot < 9245 or slot > 9247 { return -1. }
                                                return 534.
                                            } else {
                                                if slot <= 9249 {
                                                    if slot < 9248 or slot > 9249 { return -1. }
                                                    return 535.
                                                } else {
                                                    if slot < 9250 or slot > 9253 { return -1. }
                                                    return 536.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 9321 {
                                        if slot <= 9272 {
                                            if slot <= 9264 {
                                                if slot < 9254 or slot > 9264 { return -1. }
                                                return 537.
                                            } else {
                                                if slot < 9265 or slot > 9272 { return -1. }
                                                return 538.
                                            }
                                        } else {
                                            if slot <= 9319 {
                                                if slot < 9273 or slot > 9319 { return -1. }
                                                return 539.
                                            } else {
                                                if slot < 9320 or slot > 9321 { return -1. }
                                                return 540.
                                            }
                                        }
                                    } else {
                                        if slot <= 9334 {
                                            if slot <= 9330 {
                                                if slot < 9322 or slot > 9330 { return -1. }
                                                return 541.
                                            } else {
                                                if slot < 9331 or slot > 9334 { return -1. }
                                                return 542.
                                            }
                                        } else {
                                            if slot <= 9349 {
                                                if slot < 9335 or slot > 9349 { return -1. }
                                                return 543.
                                            } else {
                                                if slot <= 9353 {
                                                    if slot < 9350 or slot > 9353 { return -1. }
                                                    return 544.
                                                } else {
                                                    if slot < 9354 or slot > 9357 { return -1. }
                                                    return 545.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 9451 {
                                if slot <= 9392 {
                                    if slot <= 9375 {
                                        if slot <= 9363 {
                                            if slot <= 9360 {
                                                if slot < 9358 or slot > 9360 { return -1. }
                                                return 546.
                                            } else {
                                                if slot < 9361 or slot > 9363 { return -1. }
                                                return 547.
                                            }
                                        } else {
                                            if slot <= 9368 {
                                                if slot < 9364 or slot > 9368 { return -1. }
                                                return 548.
                                            } else {
                                                if slot < 9369 or slot > 9375 { return -1. }
                                                return 549.
                                            }
                                        }
                                    } else {
                                        if slot <= 9383 {
                                            if slot <= 9379 {
                                                if slot < 9376 or slot > 9379 { return -1. }
                                                return 550.
                                            } else {
                                                if slot < 9380 or slot > 9383 { return -1. }
                                                return 551.
                                            }
                                        } else {
                                            if slot <= 9386 {
                                                if slot < 9384 or slot > 9386 { return -1. }
                                                return 552.
                                            } else {
                                                if slot <= 9389 {
                                                    if slot < 9387 or slot > 9389 { return -1. }
                                                    return 553.
                                                } else {
                                                    if slot < 9390 or slot > 9392 { return -1. }
                                                    return 554.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 9419 {
                                        if slot <= 9398 {
                                            if slot <= 9395 {
                                                if slot < 9393 or slot > 9395 { return -1. }
                                                return 555.
                                            } else {
                                                if slot < 9396 or slot > 9398 { return -1. }
                                                return 556.
                                            }
                                        } else {
                                            if slot <= 9407 {
                                                if slot < 9399 or slot > 9407 { return -1. }
                                                return 557.
                                            } else {
                                                if slot < 9408 or slot > 9419 { return -1. }
                                                return 558.
                                            }
                                        }
                                    } else {
                                        if slot <= 9435 {
                                            if slot <= 9428 {
                                                if slot < 9420 or slot > 9428 { return -1. }
                                                return 559.
                                            } else {
                                                if slot < 9429 or slot > 9435 { return -1. }
                                                return 560.
                                            }
                                        } else {
                                            if slot <= 9445 {
                                                if slot < 9436 or slot > 9445 { return -1. }
                                                return 561.
                                            } else {
                                                if slot <= 9448 {
                                                    if slot < 9446 or slot > 9448 { return -1. }
                                                    return 562.
                                                } else {
                                                    if slot < 9449 or slot > 9451 { return -1. }
                                                    return 563.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 9503 {
                                    if slot <= 9469 {
                                        if slot <= 9461 {
                                            if slot <= 9457 {
                                                if slot < 9452 or slot > 9457 { return -1. }
                                                return 564.
                                            } else {
                                                if slot < 9458 or slot > 9461 { return -1. }
                                                return 565.
                                            }
                                        } else {
                                            if slot <= 9463 {
                                                if slot < 9462 or slot > 9463 { return -1. }
                                                return 566.
                                            } else {
                                                if slot < 9464 or slot > 9469 { return -1. }
                                                return 567.
                                            }
                                        }
                                    } else {
                                        if slot <= 9481 {
                                            if slot <= 9476 {
                                                if slot < 9470 or slot > 9476 { return -1. }
                                                return 568.
                                            } else {
                                                if slot < 9477 or slot > 9481 { return -1. }
                                                return 569.
                                            }
                                        } else {
                                            if slot <= 9485 {
                                                if slot < 9482 or slot > 9485 { return -1. }
                                                return 570.
                                            } else {
                                                if slot <= 9495 {
                                                    if slot < 9486 or slot > 9495 { return -1. }
                                                    return 571.
                                                } else {
                                                    if slot < 9496 or slot > 9503 { return -1. }
                                                    return 572.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 9649 {
                                        if slot <= 9605 {
                                            if slot <= 9504 {
                                                if slot < 9504 or slot > 9504 { return -1. }
                                                return 573.
                                            } else {
                                                if slot < 9599 or slot > 9605 { return -1. }
                                                return 574.
                                            }
                                        } else {
                                            if slot <= 9625 {
                                                if slot < 9606 or slot > 9625 { return -1. }
                                                return 575.
                                            } else {
                                                if slot <= 9631 {
                                                    if slot < 9626 or slot > 9631 { return -1. }
                                                    return 576.
                                                } else {
                                                    if slot < 9632 or slot > 9649 { return -1. }
                                                    return 577.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 9666 {
                                            if slot <= 9657 {
                                                if slot < 9650 or slot > 9657 { return -1. }
                                                return 578.
                                            } else {
                                                if slot < 9658 or slot > 9666 { return -1. }
                                                return 579.
                                            }
                                        } else {
                                            if slot <= 9669 {
                                                if slot < 9667 or slot > 9669 { return -1. }
                                                return 580.
                                            } else {
                                                if slot <= 9678 {
                                                    if slot < 9670 or slot > 9678 { return -1. }
                                                    return 581.
                                                } else {
                                                    if slot < 9679 or slot > 9688 { return -1. }
                                                    return 582.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 15388 {
                if slot <= 13359 {
                    if slot <= 10594 {
                        if slot <= 10092 {
                            if slot <= 9884 {
                                if slot <= 9740 {
                                    if slot <= 9712 {
                                        if slot <= 9702 {
                                            if slot <= 9697 {
                                                if slot < 9689 or slot > 9697 { return -1. }
                                                return 583.
                                            } else {
                                                if slot < 9698 or slot > 9702 { return -1. }
                                                return 584.
                                            }
                                        } else {
                                            if slot <= 9708 {
                                                if slot < 9703 or slot > 9708 { return -1. }
                                                return 585.
                                            } else {
                                                if slot < 9709 or slot > 9712 { return -1. }
                                                return 586.
                                            }
                                        }
                                    } else {
                                        if slot <= 9727 {
                                            if slot <= 9715 {
                                                if slot < 9713 or slot > 9715 { return -1. }
                                                return 587.
                                            } else {
                                                if slot < 9716 or slot > 9727 { return -1. }
                                                return 588.
                                            }
                                        } else {
                                            if slot <= 9729 {
                                                if slot < 9728 or slot > 9729 { return -1. }
                                                return 589.
                                            } else {
                                                if slot <= 9735 {
                                                    if slot < 9730 or slot > 9735 { return -1. }
                                                    return 590.
                                                } else {
                                                    if slot < 9736 or slot > 9740 { return -1. }
                                                    return 591.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 9803 {
                                        if slot <= 9786 {
                                            if slot <= 9746 {
                                                if slot < 9741 or slot > 9746 { return -1. }
                                                return 592.
                                            } else {
                                                if slot < 9747 or slot > 9786 { return -1. }
                                                return 593.
                                            }
                                        } else {
                                            if slot <= 9799 {
                                                if slot < 9787 or slot > 9799 { return -1. }
                                                return 594.
                                            } else {
                                                if slot < 9800 or slot > 9803 { return -1. }
                                                return 595.
                                            }
                                        }
                                    } else {
                                        if slot <= 9849 {
                                            if slot <= 9821 {
                                                if slot < 9804 or slot > 9821 { return -1. }
                                                return 596.
                                            } else {
                                                if slot < 9822 or slot > 9849 { return -1. }
                                                return 597.
                                            }
                                        } else {
                                            if slot <= 9859 {
                                                if slot < 9850 or slot > 9859 { return -1. }
                                                return 598.
                                            } else {
                                                if slot <= 9873 {
                                                    if slot < 9860 or slot > 9873 { return -1. }
                                                    return 599.
                                                } else {
                                                    if slot < 9874 or slot > 9884 { return -1. }
                                                    return 600.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 9948 {
                                    if slot <= 9920 {
                                        if slot <= 9892 {
                                            if slot <= 9887 {
                                                if slot < 9885 or slot > 9887 { return -1. }
                                                return 601.
                                            } else {
                                                if slot < 9888 or slot > 9892 { return -1. }
                                                return 602.
                                            }
                                        } else {
                                            if slot <= 9911 {
                                                if slot < 9893 or slot > 9911 { return -1. }
                                                return 603.
                                            } else {
                                                if slot < 9912 or slot > 9920 { return -1. }
                                                return 604.
                                            }
                                        }
                                    } else {
                                        if slot <= 9924 {
                                            if slot <= 9922 {
                                                if slot < 9921 or slot > 9922 { return -1. }
                                                return 605.
                                            } else {
                                                if slot < 9923 or slot > 9924 { return -1. }
                                                return 606.
                                            }
                                        } else {
                                            if slot <= 9926 {
                                                if slot < 9925 or slot > 9926 { return -1. }
                                                return 607.
                                            } else {
                                                if slot <= 9935 {
                                                    if slot < 9927 or slot > 9935 { return -1. }
                                                    return 608.
                                                } else {
                                                    if slot < 9936 or slot > 9948 { return -1. }
                                                    return 609.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 10007 {
                                        if slot <= 9993 {
                                            if slot <= 9987 {
                                                if slot < 9949 or slot > 9987 { return -1. }
                                                return 610.
                                            } else {
                                                if slot < 9988 or slot > 9993 { return -1. }
                                                return 611.
                                            }
                                        } else {
                                            if slot <= 10001 {
                                                if slot < 9994 or slot > 10001 { return -1. }
                                                return 612.
                                            } else {
                                                if slot < 10002 or slot > 10007 { return -1. }
                                                return 613.
                                            }
                                        }
                                    } else {
                                        if slot <= 10028 {
                                            if slot <= 10016 {
                                                if slot < 10008 or slot > 10016 { return -1. }
                                                return 614.
                                            } else {
                                                if slot < 10017 or slot > 10028 { return -1. }
                                                return 615.
                                            }
                                        } else {
                                            if slot <= 10035 {
                                                if slot < 10030 or slot > 10035 { return -1. }
                                                return 616.
                                            } else {
                                                if slot <= 10059 {
                                                    if slot < 10036 or slot > 10059 { return -1. }
                                                    return 617.
                                                } else {
                                                    if slot < 10060 or slot > 10092 { return -1. }
                                                    return 618.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 10283 {
                                if slot <= 10154 {
                                    if slot <= 10115 {
                                        if slot <= 10101 {
                                            if slot <= 10097 {
                                                if slot < 10093 or slot > 10097 { return -1. }
                                                return 619.
                                            } else {
                                                if slot < 10098 or slot > 10101 { return -1. }
                                                return 620.
                                            }
                                        } else {
                                            if slot <= 10105 {
                                                if slot < 10102 or slot > 10105 { return -1. }
                                                return 621.
                                            } else {
                                                if slot < 10106 or slot > 10115 { return -1. }
                                                return 622.
                                            }
                                        }
                                    } else {
                                        if slot <= 10128 {
                                            if slot <= 10120 {
                                                if slot < 10116 or slot > 10120 { return -1. }
                                                return 623.
                                            } else {
                                                if slot < 10121 or slot > 10128 { return -1. }
                                                return 624.
                                            }
                                        } else {
                                            if slot <= 10134 {
                                                if slot < 10129 or slot > 10134 { return -1. }
                                                return 625.
                                            } else {
                                                if slot <= 10139 {
                                                    if slot < 10135 or slot > 10139 { return -1. }
                                                    return 626.
                                                } else {
                                                    if slot < 10140 or slot > 10154 { return -1. }
                                                    return 627.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 10188 {
                                        if slot <= 10169 {
                                            if slot <= 10168 {
                                                if slot < 10155 or slot > 10168 { return -1. }
                                                return 628.
                                            } else {
                                                if slot < 10169 or slot > 10169 { return -1. }
                                                return 629.
                                            }
                                        } else {
                                            if slot <= 10185 {
                                                if slot < 10171 or slot > 10185 { return -1. }
                                                return 630.
                                            } else {
                                                if slot < 10186 or slot > 10188 { return -1. }
                                                return 631.
                                            }
                                        }
                                    } else {
                                        if slot <= 10237 {
                                            if slot <= 10235 {
                                                if slot < 10189 or slot > 10235 { return -1. }
                                                return 632.
                                            } else {
                                                if slot < 10236 or slot > 10237 { return -1. }
                                                return 633.
                                            }
                                        } else {
                                            if slot <= 10269 {
                                                if slot < 10240 or slot > 10269 { return -1. }
                                                return 634.
                                            } else {
                                                if slot <= 10280 {
                                                    if slot < 10270 or slot > 10280 { return -1. }
                                                    return 635.
                                                } else {
                                                    if slot < 10281 or slot > 10283 { return -1. }
                                                    return 636.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 10398 {
                                    if slot <= 10359 {
                                        if slot <= 10325 {
                                            if slot <= 10292 {
                                                if slot < 10284 or slot > 10292 { return -1. }
                                                return 637.
                                            } else {
                                                if slot < 10293 or slot > 10325 { return -1. }
                                                return 638.
                                            }
                                        } else {
                                            if slot <= 10347 {
                                                if slot < 10326 or slot > 10347 { return -1. }
                                                return 639.
                                            } else {
                                                if slot < 10348 or slot > 10359 { return -1. }
                                                return 640.
                                            }
                                        }
                                    } else {
                                        if slot <= 10383 {
                                            if slot <= 10368 {
                                                if slot < 10360 or slot > 10368 { return -1. }
                                                return 641.
                                            } else {
                                                if slot < 10371 or slot > 10383 { return -1. }
                                                return 642.
                                            }
                                        } else {
                                            if slot <= 10387 {
                                                if slot < 10384 or slot > 10387 { return -1. }
                                                return 643.
                                            } else {
                                                if slot <= 10397 {
                                                    if slot < 10388 or slot > 10397 { return -1. }
                                                    return 644.
                                                } else {
                                                    if slot < 10398 or slot > 10398 { return -1. }
                                                    return 645.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 10562 {
                                        if slot <= 10536 {
                                            if slot <= 10533 {
                                                if slot < 10528 or slot > 10533 { return -1. }
                                                return 646.
                                            } else {
                                                if slot < 10534 or slot > 10536 { return -1. }
                                                return 647.
                                            }
                                        } else {
                                            if slot <= 10555 {
                                                if slot < 10537 or slot > 10555 { return -1. }
                                                return 648.
                                            } else {
                                                if slot < 10556 or slot > 10562 { return -1. }
                                                return 649.
                                            }
                                        }
                                    } else {
                                        if slot <= 10574 {
                                            if slot <= 10568 {
                                                if slot < 10563 or slot > 10568 { return -1. }
                                                return 650.
                                            } else {
                                                if slot < 10569 or slot > 10574 { return -1. }
                                                return 651.
                                            }
                                        } else {
                                            if slot <= 10579 {
                                                if slot < 10575 or slot > 10579 { return -1. }
                                                return 652.
                                            } else {
                                                if slot <= 10586 {
                                                    if slot < 10580 or slot > 10586 { return -1. }
                                                    return 653.
                                                } else {
                                                    if slot < 10587 or slot > 10594 { return -1. }
                                                    return 654.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 11017 {
                            if slot <= 10892 {
                                if slot <= 10827 {
                                    if slot <= 10661 {
                                        if slot <= 10601 {
                                            if slot <= 10597 {
                                                if slot < 10595 or slot > 10597 { return -1. }
                                                return 655.
                                            } else {
                                                if slot < 10598 or slot > 10601 { return -1. }
                                                return 656.
                                            }
                                        } else {
                                            if slot <= 10602 {
                                                if slot < 10602 or slot > 10602 { return -1. }
                                                return 657.
                                            } else {
                                                if slot < 10603 or slot > 10661 { return -1. }
                                                return 658.
                                            }
                                        }
                                    } else {
                                        if slot <= 10732 {
                                            if slot <= 10664 {
                                                if slot < 10662 or slot > 10664 { return -1. }
                                                return 659.
                                            } else {
                                                if slot < 10665 or slot > 10732 { return -1. }
                                                return 660.
                                            }
                                        } else {
                                            if slot <= 10768 {
                                                if slot < 10733 or slot > 10768 { return -1. }
                                                return 661.
                                            } else {
                                                if slot <= 10815 {
                                                    if slot < 10769 or slot > 10815 { return -1. }
                                                    return 662.
                                                } else {
                                                    if slot < 10816 or slot > 10827 { return -1. }
                                                    return 663.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 10873 {
                                        if slot <= 10865 {
                                            if slot <= 10831 {
                                                if slot < 10828 or slot > 10831 { return -1. }
                                                return 664.
                                            } else {
                                                if slot < 10832 or slot > 10865 { return -1. }
                                                return 665.
                                            }
                                        } else {
                                            if slot <= 10867 {
                                                if slot < 10866 or slot > 10867 { return -1. }
                                                return 666.
                                            } else {
                                                if slot < 10868 or slot > 10873 { return -1. }
                                                return 667.
                                            }
                                        }
                                    } else {
                                        if slot <= 10879 {
                                            if slot <= 10876 {
                                                if slot < 10874 or slot > 10876 { return -1. }
                                                return 668.
                                            } else {
                                                if slot < 10877 or slot > 10879 { return -1. }
                                                return 669.
                                            }
                                        } else {
                                            if slot <= 10882 {
                                                if slot < 10880 or slot > 10882 { return -1. }
                                                return 670.
                                            } else {
                                                if slot <= 10887 {
                                                    if slot < 10883 or slot > 10887 { return -1. }
                                                    return 671.
                                                } else {
                                                    if slot < 10888 or slot > 10892 { return -1. }
                                                    return 672.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 10948 {
                                    if slot <= 10908 {
                                        if slot <= 10903 {
                                            if slot <= 10899 {
                                                if slot < 10893 or slot > 10899 { return -1. }
                                                return 673.
                                            } else {
                                                if slot < 10900 or slot > 10903 { return -1. }
                                                return 674.
                                            }
                                        } else {
                                            if slot <= 10906 {
                                                if slot < 10904 or slot > 10906 { return -1. }
                                                return 675.
                                            } else {
                                                if slot < 10907 or slot > 10908 { return -1. }
                                                return 676.
                                            }
                                        }
                                    } else {
                                        if slot <= 10920 {
                                            if slot <= 10911 {
                                                if slot < 10909 or slot > 10911 { return -1. }
                                                return 677.
                                            } else {
                                                if slot < 10912 or slot > 10920 { return -1. }
                                                return 678.
                                            }
                                        } else {
                                            if slot <= 10923 {
                                                if slot < 10921 or slot > 10923 { return -1. }
                                                return 679.
                                            } else {
                                                if slot <= 10925 {
                                                    if slot < 10924 or slot > 10925 { return -1. }
                                                    return 680.
                                                } else {
                                                    if slot < 10926 or slot > 10948 { return -1. }
                                                    return 681.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 10983 {
                                        if slot <= 10962 {
                                            if slot <= 10960 {
                                                if slot < 10949 or slot > 10960 { return -1. }
                                                return 682.
                                            } else {
                                                if slot < 10961 or slot > 10962 { return -1. }
                                                return 683.
                                            }
                                        } else {
                                            if slot <= 10969 {
                                                if slot < 10963 or slot > 10969 { return -1. }
                                                return 684.
                                            } else {
                                                if slot < 10970 or slot > 10983 { return -1. }
                                                return 685.
                                            }
                                        }
                                    } else {
                                        if slot <= 10987 {
                                            if slot <= 10985 {
                                                if slot < 10984 or slot > 10985 { return -1. }
                                                return 686.
                                            } else {
                                                if slot < 10986 or slot > 10987 { return -1. }
                                                return 687.
                                            }
                                        } else {
                                            if slot <= 11004 {
                                                if slot < 10988 or slot > 11004 { return -1. }
                                                return 688.
                                            } else {
                                                if slot <= 11008 {
                                                    if slot < 11005 or slot > 11008 { return -1. }
                                                    return 689.
                                                } else {
                                                    if slot < 11009 or slot > 11017 { return -1. }
                                                    return 690.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 11260 {
                                if slot <= 11124 {
                                    if slot <= 11056 {
                                        if slot <= 11041 {
                                            if slot <= 11019 {
                                                if slot < 11018 or slot > 11019 { return -1. }
                                                return 691.
                                            } else {
                                                if slot < 11020 or slot > 11041 { return -1. }
                                                return 692.
                                            }
                                        } else {
                                            if slot <= 11050 {
                                                if slot < 11042 or slot > 11050 { return -1. }
                                                return 693.
                                            } else {
                                                if slot < 11051 or slot > 11056 { return -1. }
                                                return 694.
                                            }
                                        }
                                    } else {
                                        if slot <= 11072 {
                                            if slot <= 11070 {
                                                if slot < 11057 or slot > 11070 { return -1. }
                                                return 695.
                                            } else {
                                                if slot < 11071 or slot > 11072 { return -1. }
                                                return 696.
                                            }
                                        } else {
                                            if slot <= 11080 {
                                                if slot < 11073 or slot > 11080 { return -1. }
                                                return 697.
                                            } else {
                                                if slot <= 11083 {
                                                    if slot < 11081 or slot > 11083 { return -1. }
                                                    return 698.
                                                } else {
                                                    if slot < 11084 or slot > 11124 { return -1. }
                                                    return 699.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 11156 {
                                        if slot <= 11139 {
                                            if slot <= 11129 {
                                                if slot < 11125 or slot > 11129 { return -1. }
                                                return 700.
                                            } else {
                                                if slot < 11130 or slot > 11139 { return -1. }
                                                return 701.
                                            }
                                        } else {
                                            if slot <= 11146 {
                                                if slot < 11140 or slot > 11146 { return -1. }
                                                return 702.
                                            } else {
                                                if slot < 11147 or slot > 11156 { return -1. }
                                                return 703.
                                            }
                                        }
                                    } else {
                                        if slot <= 11196 {
                                            if slot <= 11159 {
                                                if slot < 11157 or slot > 11159 { return -1. }
                                                return 704.
                                            } else {
                                                if slot < 11160 or slot > 11196 { return -1. }
                                                return 705.
                                            }
                                        } else {
                                            if slot <= 11204 {
                                                if slot < 11197 or slot > 11204 { return -1. }
                                                return 706.
                                            } else {
                                                if slot <= 11214 {
                                                    if slot < 11205 or slot > 11214 { return -1. }
                                                    return 707.
                                                } else {
                                                    if slot < 11254 or slot > 11260 { return -1. }
                                                    return 708.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 12597 {
                                    if slot <= 12158 {
                                        if slot <= 12154 {
                                            if slot <= 11262 {
                                                if slot < 11261 or slot > 11262 { return -1. }
                                                return 709.
                                            } else {
                                                if slot < 11782 or slot > 12154 { return -1. }
                                                return 710.
                                            }
                                        } else {
                                            if slot <= 12156 {
                                                if slot < 12155 or slot > 12156 { return -1. }
                                                return 711.
                                            } else {
                                                if slot < 12157 or slot > 12158 { return -1. }
                                                return 712.
                                            }
                                        }
                                    } else {
                                        if slot <= 12209 {
                                            if slot <= 12207 {
                                                if slot < 12159 or slot > 12207 { return -1. }
                                                return 713.
                                            } else {
                                                if slot < 12208 or slot > 12209 { return -1. }
                                                return 714.
                                            }
                                        } else {
                                            if slot <= 12210 {
                                                if slot < 12210 or slot > 12210 { return -1. }
                                                return 715.
                                            } else {
                                                if slot <= 12593 {
                                                    if slot < 12572 or slot > 12593 { return -1. }
                                                    return 716.
                                                } else {
                                                    if slot < 12594 or slot > 12597 { return -1. }
                                                    return 717.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 12842 {
                                        if slot <= 12717 {
                                            if slot <= 12619 {
                                                if slot < 12598 or slot > 12619 { return -1. }
                                                return 718.
                                            } else {
                                                if slot < 12620 or slot > 12717 { return -1. }
                                                return 719.
                                            }
                                        } else {
                                            if slot <= 12720 {
                                                if slot < 12718 or slot > 12720 { return -1. }
                                                return 720.
                                            } else {
                                                if slot <= 12722 {
                                                    if slot < 12721 or slot > 12722 { return -1. }
                                                    return 721.
                                                } else {
                                                    if slot < 12723 or slot > 12842 { return -1. }
                                                    return 722.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 13289 {
                                            if slot <= 12858 {
                                                if slot < 12843 or slot > 12858 { return -1. }
                                                return 723.
                                            } else {
                                                if slot < 12859 or slot > 13289 { return -1. }
                                                return 724.
                                            }
                                        } else {
                                            if slot <= 13290 {
                                                if slot < 13290 or slot > 13290 { return -1. }
                                                return 725.
                                            } else {
                                                if slot <= 13349 {
                                                    if slot < 13342 or slot > 13349 { return -1. }
                                                    return 726.
                                                } else {
                                                    if slot < 13350 or slot > 13359 { return -1. }
                                                    return 727.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    if slot <= 14468 {
                        if slot <= 13875 {
                            if slot <= 13743 {
                                if slot <= 13446 {
                                    if slot <= 13373 {
                                        if slot <= 13368 {
                                            if slot <= 13366 {
                                                if slot < 13360 or slot > 13366 { return -1. }
                                                return 728.
                                            } else {
                                                if slot < 13367 or slot > 13368 { return -1. }
                                                return 729.
                                            }
                                        } else {
                                            if slot <= 13370 {
                                                if slot < 13369 or slot > 13370 { return -1. }
                                                return 730.
                                            } else {
                                                if slot < 13371 or slot > 13373 { return -1. }
                                                return 731.
                                            }
                                        }
                                    } else {
                                        if slot <= 13436 {
                                            if slot <= 13379 {
                                                if slot < 13374 or slot > 13379 { return -1. }
                                                return 732.
                                            } else {
                                                if slot < 13380 or slot > 13436 { return -1. }
                                                return 733.
                                            }
                                        } else {
                                            if slot <= 13438 {
                                                if slot < 13437 or slot > 13438 { return -1. }
                                                return 734.
                                            } else {
                                                if slot <= 13440 {
                                                    if slot < 13439 or slot > 13440 { return -1. }
                                                    return 735.
                                                } else {
                                                    if slot < 13441 or slot > 13446 { return -1. }
                                                    return 736.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 13547 {
                                        if slot <= 13455 {
                                            if slot <= 13449 {
                                                if slot < 13447 or slot > 13449 { return -1. }
                                                return 737.
                                            } else {
                                                if slot < 13450 or slot > 13455 { return -1. }
                                                return 738.
                                            }
                                        } else {
                                            if slot <= 13536 {
                                                if slot < 13476 or slot > 13536 { return -1. }
                                                return 739.
                                            } else {
                                                if slot < 13537 or slot > 13547 { return -1. }
                                                return 740.
                                            }
                                        }
                                    } else {
                                        if slot <= 13553 {
                                            if slot <= 13549 {
                                                if slot < 13548 or slot > 13549 { return -1. }
                                                return 741.
                                            } else {
                                                if slot < 13550 or slot > 13553 { return -1. }
                                                return 742.
                                            }
                                        } else {
                                            if slot <= 13720 {
                                                if slot < 13719 or slot > 13720 { return -1. }
                                                return 743.
                                            } else {
                                                if slot <= 13724 {
                                                    if slot < 13721 or slot > 13724 { return -1. }
                                                    return 744.
                                                } else {
                                                    if slot < 13725 or slot > 13743 { return -1. }
                                                    return 745.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 13798 {
                                    if slot <= 13761 {
                                        if slot <= 13750 {
                                            if slot <= 13745 {
                                                if slot < 13744 or slot > 13745 { return -1. }
                                                return 746.
                                            } else {
                                                if slot < 13746 or slot > 13750 { return -1. }
                                                return 747.
                                            }
                                        } else {
                                            if slot <= 13759 {
                                                if slot < 13751 or slot > 13759 { return -1. }
                                                return 748.
                                            } else {
                                                if slot < 13760 or slot > 13761 { return -1. }
                                                return 749.
                                            }
                                        }
                                    } else {
                                        if slot <= 13775 {
                                            if slot <= 13763 {
                                                if slot < 13762 or slot > 13763 { return -1. }
                                                return 750.
                                            } else {
                                                if slot < 13764 or slot > 13775 { return -1. }
                                                return 751.
                                            }
                                        } else {
                                            if slot <= 13779 {
                                                if slot < 13776 or slot > 13779 { return -1. }
                                                return 752.
                                            } else {
                                                if slot <= 13781 {
                                                    if slot < 13780 or slot > 13781 { return -1. }
                                                    return 753.
                                                } else {
                                                    if slot < 13782 or slot > 13798 { return -1. }
                                                    return 754.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 13822 {
                                        if slot <= 13804 {
                                            if slot <= 13802 {
                                                if slot < 13799 or slot > 13802 { return -1. }
                                                return 755.
                                            } else {
                                                if slot < 13803 or slot > 13804 { return -1. }
                                                return 756.
                                            }
                                        } else {
                                            if slot <= 13818 {
                                                if slot < 13805 or slot > 13818 { return -1. }
                                                return 757.
                                            } else {
                                                if slot < 13819 or slot > 13822 { return -1. }
                                                return 758.
                                            }
                                        }
                                    } else {
                                        if slot <= 13835 {
                                            if slot <= 13824 {
                                                if slot < 13823 or slot > 13824 { return -1. }
                                                return 759.
                                            } else {
                                                if slot < 13825 or slot > 13835 { return -1. }
                                                return 760.
                                            }
                                        } else {
                                            if slot <= 13839 {
                                                if slot < 13836 or slot > 13839 { return -1. }
                                                return 761.
                                            } else {
                                                if slot <= 13841 {
                                                    if slot < 13840 or slot > 13841 { return -1. }
                                                    return 762.
                                                } else {
                                                    if slot < 13842 or slot > 13875 { return -1. }
                                                    return 763.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 14166 {
                                if slot <= 14125 {
                                    if slot <= 14004 {
                                        if slot <= 13961 {
                                            if slot <= 13959 {
                                                if slot < 13876 or slot > 13959 { return -1. }
                                                return 764.
                                            } else {
                                                if slot < 13960 or slot > 13961 { return -1. }
                                                return 765.
                                            }
                                        } else {
                                            if slot <= 13963 {
                                                if slot < 13962 or slot > 13963 { return -1. }
                                                return 766.
                                            } else {
                                                if slot < 13964 or slot > 14004 { return -1. }
                                                return 767.
                                            }
                                        }
                                    } else {
                                        if slot <= 14114 {
                                            if slot <= 14007 {
                                                if slot < 14005 or slot > 14007 { return -1. }
                                                return 768.
                                            } else {
                                                if slot < 14008 or slot > 14114 { return -1. }
                                                return 769.
                                            }
                                        } else {
                                            if slot <= 14119 {
                                                if slot < 14115 or slot > 14119 { return -1. }
                                                return 770.
                                            } else {
                                                if slot <= 14123 {
                                                    if slot < 14120 or slot > 14123 { return -1. }
                                                    return 771.
                                                } else {
                                                    if slot < 14124 or slot > 14125 { return -1. }
                                                    return 772.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 14146 {
                                        if slot <= 14135 {
                                            if slot <= 14132 {
                                                if slot < 14126 or slot > 14132 { return -1. }
                                                return 773.
                                            } else {
                                                if slot < 14133 or slot > 14135 { return -1. }
                                                return 774.
                                            }
                                        } else {
                                            if slot <= 14138 {
                                                if slot < 14136 or slot > 14138 { return -1. }
                                                return 775.
                                            } else {
                                                if slot < 14139 or slot > 14146 { return -1. }
                                                return 776.
                                            }
                                        }
                                    } else {
                                        if slot <= 14153 {
                                            if slot <= 14151 {
                                                if slot < 14147 or slot > 14151 { return -1. }
                                                return 777.
                                            } else {
                                                if slot < 14152 or slot > 14153 { return -1. }
                                                return 778.
                                            }
                                        } else {
                                            if slot <= 14159 {
                                                if slot < 14154 or slot > 14159 { return -1. }
                                                return 779.
                                            } else {
                                                if slot <= 14163 {
                                                    if slot < 14160 or slot > 14163 { return -1. }
                                                    return 780.
                                                } else {
                                                    if slot < 14164 or slot > 14166 { return -1. }
                                                    return 781.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 14384 {
                                    if slot <= 14273 {
                                        if slot <= 14269 {
                                            if slot <= 14227 {
                                                if slot < 14167 or slot > 14227 { return -1. }
                                                return 782.
                                            } else {
                                                if slot < 14228 or slot > 14269 { return -1. }
                                                return 783.
                                            }
                                        } else {
                                            if slot <= 14272 {
                                                if slot < 14270 or slot > 14272 { return -1. }
                                                return 784.
                                            } else {
                                                if slot < 14273 or slot > 14273 { return -1. }
                                                return 785.
                                            }
                                        }
                                    } else {
                                        if slot <= 14364 {
                                            if slot <= 14357 {
                                                if slot < 14349 or slot > 14357 { return -1. }
                                                return 786.
                                            } else {
                                                if slot < 14358 or slot > 14364 { return -1. }
                                                return 787.
                                            }
                                        } else {
                                            if slot <= 14369 {
                                                if slot < 14365 or slot > 14369 { return -1. }
                                                return 788.
                                            } else {
                                                if slot <= 14373 {
                                                    if slot < 14370 or slot > 14373 { return -1. }
                                                    return 789.
                                                } else {
                                                    if slot < 14374 or slot > 14384 { return -1. }
                                                    return 790.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 14430 {
                                        if slot <= 14410 {
                                            if slot <= 14398 {
                                                if slot < 14385 or slot > 14398 { return -1. }
                                                return 791.
                                            } else {
                                                if slot < 14399 or slot > 14410 { return -1. }
                                                return 792.
                                            }
                                        } else {
                                            if slot <= 14412 {
                                                if slot < 14411 or slot > 14412 { return -1. }
                                                return 793.
                                            } else {
                                                if slot <= 14428 {
                                                    if slot < 14413 or slot > 14428 { return -1. }
                                                    return 794.
                                                } else {
                                                    if slot < 14429 or slot > 14430 { return -1. }
                                                    return 795.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 14446 {
                                            if slot <= 14440 {
                                                if slot < 14431 or slot > 14440 { return -1. }
                                                return 796.
                                            } else {
                                                if slot < 14441 or slot > 14446 { return -1. }
                                                return 797.
                                            }
                                        } else {
                                            if slot <= 14455 {
                                                if slot < 14447 or slot > 14455 { return -1. }
                                                return 798.
                                            } else {
                                                if slot <= 14462 {
                                                    if slot < 14456 or slot > 14462 { return -1. }
                                                    return 799.
                                                } else {
                                                    if slot < 14463 or slot > 14468 { return -1. }
                                                    return 800.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 14926 {
                            if slot <= 14773 {
                                if slot <= 14695 {
                                    if slot <= 14676 {
                                        if slot <= 14475 {
                                            if slot <= 14471 {
                                                if slot < 14469 or slot > 14471 { return -1. }
                                                return 801.
                                            } else {
                                                if slot < 14472 or slot > 14475 { return -1. }
                                                return 802.
                                            }
                                        } else {
                                            if slot <= 14554 {
                                                if slot < 14476 or slot > 14554 { return -1. }
                                                return 803.
                                            } else {
                                                if slot < 14555 or slot > 14676 { return -1. }
                                                return 804.
                                            }
                                        }
                                    } else {
                                        if slot <= 14682 {
                                            if slot <= 14678 {
                                                if slot < 14677 or slot > 14678 { return -1. }
                                                return 805.
                                            } else {
                                                if slot < 14679 or slot > 14682 { return -1. }
                                                return 806.
                                            }
                                        } else {
                                            if slot <= 14690 {
                                                if slot < 14683 or slot > 14690 { return -1. }
                                                return 807.
                                            } else {
                                                if slot <= 14693 {
                                                    if slot < 14691 or slot > 14693 { return -1. }
                                                    return 808.
                                                } else {
                                                    if slot < 14694 or slot > 14695 { return -1. }
                                                    return 809.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 14737 {
                                        if slot <= 14724 {
                                            if slot <= 14701 {
                                                if slot < 14696 or slot > 14701 { return -1. }
                                                return 810.
                                            } else {
                                                if slot < 14702 or slot > 14724 { return -1. }
                                                return 811.
                                            }
                                        } else {
                                            if slot <= 14735 {
                                                if slot < 14725 or slot > 14735 { return -1. }
                                                return 812.
                                            } else {
                                                if slot < 14736 or slot > 14737 { return -1. }
                                                return 813.
                                            }
                                        }
                                    } else {
                                        if slot <= 14765 {
                                            if slot <= 14742 {
                                                if slot < 14738 or slot > 14742 { return -1. }
                                                return 814.
                                            } else {
                                                if slot < 14743 or slot > 14765 { return -1. }
                                                return 815.
                                            }
                                        } else {
                                            if slot <= 14766 {
                                                if slot < 14766 or slot > 14766 { return -1. }
                                                return 816.
                                            } else {
                                                if slot <= 14768 {
                                                    if slot < 14767 or slot > 14768 { return -1. }
                                                    return 817.
                                                } else {
                                                    if slot < 14769 or slot > 14773 { return -1. }
                                                    return 818.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 14865 {
                                    if slot <= 14826 {
                                        if slot <= 14787 {
                                            if slot <= 14776 {
                                                if slot < 14774 or slot > 14776 { return -1. }
                                                return 819.
                                            } else {
                                                if slot < 14777 or slot > 14787 { return -1. }
                                                return 820.
                                            }
                                        } else {
                                            if slot <= 14823 {
                                                if slot < 14788 or slot > 14823 { return -1. }
                                                return 821.
                                            } else {
                                                if slot < 14824 or slot > 14826 { return -1. }
                                                return 822.
                                            }
                                        }
                                    } else {
                                        if slot <= 14835 {
                                            if slot <= 14829 {
                                                if slot < 14827 or slot > 14829 { return -1. }
                                                return 823.
                                            } else {
                                                if slot < 14830 or slot > 14835 { return -1. }
                                                return 824.
                                            }
                                        } else {
                                            if slot <= 14861 {
                                                if slot < 14836 or slot > 14861 { return -1. }
                                                return 825.
                                            } else {
                                                if slot <= 14863 {
                                                    if slot < 14862 or slot > 14863 { return -1. }
                                                    return 826.
                                                } else {
                                                    if slot < 14864 or slot > 14865 { return -1. }
                                                    return 827.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 14902 {
                                        if slot <= 14870 {
                                            if slot <= 14867 {
                                                if slot < 14866 or slot > 14867 { return -1. }
                                                return 828.
                                            } else {
                                                if slot < 14868 or slot > 14870 { return -1. }
                                                return 829.
                                            }
                                        } else {
                                            if slot <= 14872 {
                                                if slot < 14871 or slot > 14872 { return -1. }
                                                return 830.
                                            } else {
                                                if slot < 14873 or slot > 14902 { return -1. }
                                                return 831.
                                            }
                                        }
                                    } else {
                                        if slot <= 14911 {
                                            if slot <= 14908 {
                                                if slot < 14903 or slot > 14908 { return -1. }
                                                return 832.
                                            } else {
                                                if slot < 14909 or slot > 14911 { return -1. }
                                                return 833.
                                            }
                                        } else {
                                            if slot <= 14914 {
                                                if slot < 14912 or slot > 14914 { return -1. }
                                                return 834.
                                            } else {
                                                if slot <= 14919 {
                                                    if slot < 14915 or slot > 14919 { return -1. }
                                                    return 835.
                                                } else {
                                                    if slot < 14920 or slot > 14926 { return -1. }
                                                    return 836.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 15036 {
                                if slot <= 14963 {
                                    if slot <= 14936 {
                                        if slot <= 14931 {
                                            if slot <= 14929 {
                                                if slot < 14927 or slot > 14929 { return -1. }
                                                return 837.
                                            } else {
                                                if slot < 14930 or slot > 14931 { return -1. }
                                                return 838.
                                            }
                                        } else {
                                            if slot <= 14933 {
                                                if slot < 14932 or slot > 14933 { return -1. }
                                                return 839.
                                            } else {
                                                if slot < 14934 or slot > 14936 { return -1. }
                                                return 840.
                                            }
                                        }
                                    } else {
                                        if slot <= 14942 {
                                            if slot <= 14938 {
                                                if slot < 14937 or slot > 14938 { return -1. }
                                                return 841.
                                            } else {
                                                if slot < 14939 or slot > 14942 { return -1. }
                                                return 842.
                                            }
                                        } else {
                                            if slot <= 14945 {
                                                if slot < 14943 or slot > 14945 { return -1. }
                                                return 843.
                                            } else {
                                                if slot <= 14958 {
                                                    if slot < 14946 or slot > 14958 { return -1. }
                                                    return 844.
                                                } else {
                                                    if slot < 14959 or slot > 14963 { return -1. }
                                                    return 845.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 14994 {
                                        if slot <= 14971 {
                                            if slot <= 14965 {
                                                if slot < 14964 or slot > 14965 { return -1. }
                                                return 846.
                                            } else {
                                                if slot < 14966 or slot > 14971 { return -1. }
                                                return 847.
                                            }
                                        } else {
                                            if slot <= 14991 {
                                                if slot < 14972 or slot > 14991 { return -1. }
                                                return 848.
                                            } else {
                                                if slot < 14992 or slot > 14994 { return -1. }
                                                return 849.
                                            }
                                        }
                                    } else {
                                        if slot <= 15001 {
                                            if slot <= 14996 {
                                                if slot < 14995 or slot > 14996 { return -1. }
                                                return 850.
                                            } else {
                                                if slot < 14997 or slot > 15001 { return -1. }
                                                return 851.
                                            }
                                        } else {
                                            if slot <= 15007 {
                                                if slot < 15002 or slot > 15007 { return -1. }
                                                return 852.
                                            } else {
                                                if slot <= 15022 {
                                                    if slot < 15008 or slot > 15022 { return -1. }
                                                    return 853.
                                                } else {
                                                    if slot < 15023 or slot > 15036 { return -1. }
                                                    return 854.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 15075 {
                                    if slot <= 15052 {
                                        if slot <= 15047 {
                                            if slot <= 15043 {
                                                if slot < 15037 or slot > 15043 { return -1. }
                                                return 855.
                                            } else {
                                                if slot < 15044 or slot > 15047 { return -1. }
                                                return 856.
                                            }
                                        } else {
                                            if slot <= 15049 {
                                                if slot < 15048 or slot > 15049 { return -1. }
                                                return 857.
                                            } else {
                                                if slot < 15050 or slot > 15052 { return -1. }
                                                return 858.
                                            }
                                        }
                                    } else {
                                        if slot <= 15063 {
                                            if slot <= 15060 {
                                                if slot < 15053 or slot > 15060 { return -1. }
                                                return 859.
                                            } else {
                                                if slot < 15061 or slot > 15063 { return -1. }
                                                return 860.
                                            }
                                        } else {
                                            if slot <= 15067 {
                                                if slot < 15064 or slot > 15067 { return -1. }
                                                return 861.
                                            } else {
                                                if slot <= 15072 {
                                                    if slot < 15068 or slot > 15072 { return -1. }
                                                    return 862.
                                                } else {
                                                    if slot < 15073 or slot > 15075 { return -1. }
                                                    return 863.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 15363 {
                                        if slot <= 15093 {
                                            if slot <= 15088 {
                                                if slot < 15076 or slot > 15088 { return -1. }
                                                return 864.
                                            } else {
                                                if slot < 15089 or slot > 15093 { return -1. }
                                                return 865.
                                            }
                                        } else {
                                            if slot <= 15100 {
                                                if slot < 15094 or slot > 15100 { return -1. }
                                                return 866.
                                            } else {
                                                if slot <= 15361 {
                                                    if slot < 15360 or slot > 15361 { return -1. }
                                                    return 867.
                                                } else {
                                                    if slot < 15362 or slot > 15363 { return -1. }
                                                    return 868.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 15367 {
                                            if slot <= 15365 {
                                                if slot < 15364 or slot > 15365 { return -1. }
                                                return 869.
                                            } else {
                                                if slot < 15366 or slot > 15367 { return -1. }
                                                return 870.
                                            }
                                        } else {
                                            if slot <= 15378 {
                                                if slot < 15368 or slot > 15378 { return -1. }
                                                return 871.
                                            } else {
                                                if slot <= 15383 {
                                                    if slot < 15379 or slot > 15383 { return -1. }
                                                    return 872.
                                                } else {
                                                    if slot < 15384 or slot > 15388 { return -1. }
                                                    return 873.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                if slot <= 17688 {
                    if slot <= 16519 {
                        if slot <= 15624 {
                            if slot <= 15502 {
                                if slot <= 15454 {
                                    if slot <= 15429 {
                                        if slot <= 15418 {
                                            if slot <= 15398 {
                                                if slot < 15389 or slot > 15398 { return -1. }
                                                return 874.
                                            } else {
                                                if slot < 15399 or slot > 15418 { return -1. }
                                                return 875.
                                            }
                                        } else {
                                            if slot <= 15426 {
                                                if slot < 15419 or slot > 15426 { return -1. }
                                                return 876.
                                            } else {
                                                if slot < 15427 or slot > 15429 { return -1. }
                                                return 877.
                                            }
                                        }
                                    } else {
                                        if slot <= 15439 {
                                            if slot <= 15434 {
                                                if slot < 15430 or slot > 15434 { return -1. }
                                                return 878.
                                            } else {
                                                if slot < 15435 or slot > 15439 { return -1. }
                                                return 879.
                                            }
                                        } else {
                                            if slot <= 15441 {
                                                if slot < 15440 or slot > 15441 { return -1. }
                                                return 880.
                                            } else {
                                                if slot <= 15444 {
                                                    if slot < 15442 or slot > 15444 { return -1. }
                                                    return 881.
                                                } else {
                                                    if slot < 15445 or slot > 15454 { return -1. }
                                                    return 882.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 15467 {
                                        if slot <= 15461 {
                                            if slot <= 15456 {
                                                if slot < 15455 or slot > 15456 { return -1. }
                                                return 883.
                                            } else {
                                                if slot < 15457 or slot > 15461 { return -1. }
                                                return 884.
                                            }
                                        } else {
                                            if slot <= 15464 {
                                                if slot < 15462 or slot > 15464 { return -1. }
                                                return 885.
                                            } else {
                                                if slot < 15465 or slot > 15467 { return -1. }
                                                return 886.
                                            }
                                        }
                                    } else {
                                        if slot <= 15475 {
                                            if slot <= 15472 {
                                                if slot < 15468 or slot > 15472 { return -1. }
                                                return 887.
                                            } else {
                                                if slot < 15473 or slot > 15475 { return -1. }
                                                return 888.
                                            }
                                        } else {
                                            if slot <= 15496 {
                                                if slot < 15476 or slot > 15496 { return -1. }
                                                return 889.
                                            } else {
                                                if slot <= 15499 {
                                                    if slot < 15497 or slot > 15499 { return -1. }
                                                    return 890.
                                                } else {
                                                    if slot < 15500 or slot > 15502 { return -1. }
                                                    return 891.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 15571 {
                                    if slot <= 15552 {
                                        if slot <= 15507 {
                                            if slot <= 15504 {
                                                if slot < 15503 or slot > 15504 { return -1. }
                                                return 892.
                                            } else {
                                                if slot < 15505 or slot > 15507 { return -1. }
                                                return 893.
                                            }
                                        } else {
                                            if slot <= 15549 {
                                                if slot < 15508 or slot > 15549 { return -1. }
                                                return 894.
                                            } else {
                                                if slot < 15550 or slot > 15552 { return -1. }
                                                return 895.
                                            }
                                        }
                                    } else {
                                        if slot <= 15560 {
                                            if slot <= 15557 {
                                                if slot < 15553 or slot > 15557 { return -1. }
                                                return 896.
                                            } else {
                                                if slot < 15558 or slot > 15560 { return -1. }
                                                return 897.
                                            }
                                        } else {
                                            if slot <= 15562 {
                                                if slot < 15561 or slot > 15562 { return -1. }
                                                return 898.
                                            } else {
                                                if slot <= 15566 {
                                                    if slot < 15563 or slot > 15566 { return -1. }
                                                    return 899.
                                                } else {
                                                    if slot < 15567 or slot > 15571 { return -1. }
                                                    return 900.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 15595 {
                                        if slot <= 15578 {
                                            if slot <= 15575 {
                                                if slot < 15572 or slot > 15575 { return -1. }
                                                return 901.
                                            } else {
                                                if slot < 15576 or slot > 15578 { return -1. }
                                                return 902.
                                            }
                                        } else {
                                            if slot <= 15581 {
                                                if slot < 15579 or slot > 15581 { return -1. }
                                                return 903.
                                            } else {
                                                if slot < 15582 or slot > 15595 { return -1. }
                                                return 904.
                                            }
                                        }
                                    } else {
                                        if slot <= 15607 {
                                            if slot <= 15602 {
                                                if slot < 15596 or slot > 15602 { return -1. }
                                                return 905.
                                            } else {
                                                if slot < 15603 or slot > 15607 { return -1. }
                                                return 906.
                                            }
                                        } else {
                                            if slot <= 15616 {
                                                if slot < 15608 or slot > 15616 { return -1. }
                                                return 907.
                                            } else {
                                                if slot <= 15622 {
                                                    if slot < 15617 or slot > 15622 { return -1. }
                                                    return 908.
                                                } else {
                                                    if slot < 15623 or slot > 15624 { return -1. }
                                                    return 909.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 15981 {
                                if slot <= 15776 {
                                    if slot <= 15679 {
                                        if slot <= 15629 {
                                            if slot <= 15628 {
                                                if slot < 15625 or slot > 15628 { return -1. }
                                                return 910.
                                            } else {
                                                if slot < 15629 or slot > 15629 { return -1. }
                                                return 911.
                                            }
                                        } else {
                                            if slot <= 15673 {
                                                if slot < 15644 or slot > 15673 { return -1. }
                                                return 912.
                                            } else {
                                                if slot < 15674 or slot > 15679 { return -1. }
                                                return 913.
                                            }
                                        }
                                    } else {
                                        if slot <= 15701 {
                                            if slot <= 15686 {
                                                if slot < 15680 or slot > 15686 { return -1. }
                                                return 914.
                                            } else {
                                                if slot < 15687 or slot > 15701 { return -1. }
                                                return 915.
                                            }
                                        } else {
                                            if slot <= 15703 {
                                                if slot < 15702 or slot > 15703 { return -1. }
                                                return 916.
                                            } else {
                                                if slot <= 15709 {
                                                    if slot < 15704 or slot > 15709 { return -1. }
                                                    return 917.
                                                } else {
                                                    if slot < 15710 or slot > 15776 { return -1. }
                                                    return 918.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 15908 {
                                        if slot <= 15860 {
                                            if slot <= 15796 {
                                                if slot < 15777 or slot > 15796 { return -1. }
                                                return 919.
                                            } else {
                                                if slot < 15797 or slot > 15860 { return -1. }
                                                return 920.
                                            }
                                        } else {
                                            if slot <= 15865 {
                                                if slot < 15861 or slot > 15865 { return -1. }
                                                return 921.
                                            } else {
                                                if slot < 15866 or slot > 15908 { return -1. }
                                                return 922.
                                            }
                                        }
                                    } else {
                                        if slot <= 15923 {
                                            if slot <= 15917 {
                                                if slot < 15909 or slot > 15917 { return -1. }
                                                return 923.
                                            } else {
                                                if slot < 15918 or slot > 15923 { return -1. }
                                                return 924.
                                            }
                                        } else {
                                            if slot <= 15944 {
                                                if slot < 15924 or slot > 15944 { return -1. }
                                                return 925.
                                            } else {
                                                if slot <= 15949 {
                                                    if slot < 15945 or slot > 15949 { return -1. }
                                                    return 926.
                                                } else {
                                                    if slot < 15950 or slot > 15981 { return -1. }
                                                    return 927.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 16307 {
                                    if slot <= 16061 {
                                        if slot <= 16012 {
                                            if slot <= 16006 {
                                                if slot < 15982 or slot > 16006 { return -1. }
                                                return 928.
                                            } else {
                                                if slot < 16007 or slot > 16012 { return -1. }
                                                return 929.
                                            }
                                        } else {
                                            if slot <= 16057 {
                                                if slot < 16013 or slot > 16057 { return -1. }
                                                return 930.
                                            } else {
                                                if slot < 16058 or slot > 16061 { return -1. }
                                                return 931.
                                            }
                                        }
                                    } else {
                                        if slot <= 16224 {
                                            if slot <= 16186 {
                                                if slot < 16062 or slot > 16186 { return -1. }
                                                return 932.
                                            } else {
                                                if slot < 16187 or slot > 16224 { return -1. }
                                                return 933.
                                            }
                                        } else {
                                            if slot <= 16251 {
                                                if slot < 16225 or slot > 16251 { return -1. }
                                                return 934.
                                            } else {
                                                if slot <= 16289 {
                                                    if slot < 16252 or slot > 16289 { return -1. }
                                                    return 935.
                                                } else {
                                                    if slot < 16290 or slot > 16307 { return -1. }
                                                    return 936.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 16349 {
                                        if slot <= 16320 {
                                            if slot <= 16309 {
                                                if slot < 16308 or slot > 16309 { return -1. }
                                                return 937.
                                            } else {
                                                if slot < 16310 or slot > 16320 { return -1. }
                                                return 938.
                                            }
                                        } else {
                                            if slot <= 16334 {
                                                if slot < 16321 or slot > 16334 { return -1. }
                                                return 939.
                                            } else {
                                                if slot <= 16346 {
                                                    if slot < 16335 or slot > 16346 { return -1. }
                                                    return 940.
                                                } else {
                                                    if slot < 16347 or slot > 16349 { return -1. }
                                                    return 941.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 16387 {
                                            if slot <= 16355 {
                                                if slot < 16350 or slot > 16355 { return -1. }
                                                return 942.
                                            } else {
                                                if slot < 16385 or slot > 16387 { return -1. }
                                                return 943.
                                            }
                                        } else {
                                            if slot <= 16391 {
                                                if slot < 16388 or slot > 16391 { return -1. }
                                                return 944.
                                            } else {
                                                if slot <= 16504 {
                                                    if slot < 16503 or slot > 16504 { return -1. }
                                                    return 945.
                                                } else {
                                                    if slot < 16505 or slot > 16519 { return -1. }
                                                    return 946.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 17170 {
                            if slot <= 16855 {
                                if slot <= 16653 {
                                    if slot <= 16595 {
                                        if slot <= 16577 {
                                            if slot <= 16525 {
                                                if slot < 16520 or slot > 16525 { return -1. }
                                                return 947.
                                            } else {
                                                if slot < 16526 or slot > 16577 { return -1. }
                                                return 948.
                                            }
                                        } else {
                                            if slot <= 16592 {
                                                if slot < 16578 or slot > 16592 { return -1. }
                                                return 949.
                                            } else {
                                                if slot < 16593 or slot > 16595 { return -1. }
                                                return 950.
                                            }
                                        }
                                    } else {
                                        if slot <= 16631 {
                                            if slot <= 16629 {
                                                if slot < 16596 or slot > 16629 { return -1. }
                                                return 951.
                                            } else {
                                                if slot < 16630 or slot > 16631 { return -1. }
                                                return 952.
                                            }
                                        } else {
                                            if slot <= 16639 {
                                                if slot < 16632 or slot > 16639 { return -1. }
                                                return 953.
                                            } else {
                                                if slot <= 16643 {
                                                    if slot < 16640 or slot > 16643 { return -1. }
                                                    return 954.
                                                } else {
                                                    if slot < 16644 or slot > 16653 { return -1. }
                                                    return 955.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 16721 {
                                        if slot <= 16669 {
                                            if slot <= 16662 {
                                                if slot < 16654 or slot > 16662 { return -1. }
                                                return 956.
                                            } else {
                                                if slot < 16663 or slot > 16669 { return -1. }
                                                return 957.
                                            }
                                        } else {
                                            if slot <= 16713 {
                                                if slot < 16670 or slot > 16713 { return -1. }
                                                return 958.
                                            } else {
                                                if slot < 16714 or slot > 16721 { return -1. }
                                                return 959.
                                            }
                                        }
                                    } else {
                                        if slot <= 16725 {
                                            if slot <= 16723 {
                                                if slot < 16722 or slot > 16723 { return -1. }
                                                return 960.
                                            } else {
                                                if slot < 16724 or slot > 16725 { return -1. }
                                                return 961.
                                            }
                                        } else {
                                            if slot <= 16752 {
                                                if slot < 16750 or slot > 16752 { return -1. }
                                                return 962.
                                            } else {
                                                if slot <= 16756 {
                                                    if slot < 16753 or slot > 16756 { return -1. }
                                                    return 963.
                                                } else {
                                                    if slot < 16848 or slot > 16855 { return -1. }
                                                    return 964.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 17049 {
                                    if slot <= 16892 {
                                        if slot <= 16871 {
                                            if slot <= 16869 {
                                                if slot < 16856 or slot > 16869 { return -1. }
                                                return 965.
                                            } else {
                                                if slot < 16870 or slot > 16871 { return -1. }
                                                return 966.
                                            }
                                        } else {
                                            if slot <= 16890 {
                                                if slot < 16872 or slot > 16890 { return -1. }
                                                return 967.
                                            } else {
                                                if slot < 16891 or slot > 16892 { return -1. }
                                                return 968.
                                            }
                                        }
                                    } else {
                                        if slot <= 16990 {
                                            if slot <= 16982 {
                                                if slot < 16893 or slot > 16982 { return -1. }
                                                return 969.
                                            } else {
                                                if slot < 16983 or slot > 16990 { return -1. }
                                                return 970.
                                            }
                                        } else {
                                            if slot <= 17001 {
                                                if slot < 16992 or slot > 17001 { return -1. }
                                                return 971.
                                            } else {
                                                if slot <= 17047 {
                                                    if slot < 17002 or slot > 17047 { return -1. }
                                                    return 972.
                                                } else {
                                                    if slot < 17048 or slot > 17049 { return -1. }
                                                    return 973.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 17069 {
                                        if slot <= 17057 {
                                            if slot <= 17055 {
                                                if slot < 17050 or slot > 17055 { return -1. }
                                                return 974.
                                            } else {
                                                if slot < 17056 or slot > 17057 { return -1. }
                                                return 975.
                                            }
                                        } else {
                                            if slot <= 17068 {
                                                if slot < 17058 or slot > 17068 { return -1. }
                                                return 976.
                                            } else {
                                                if slot < 17069 or slot > 17069 { return -1. }
                                                return 977.
                                            }
                                        }
                                    } else {
                                        if slot <= 17130 {
                                            if slot <= 17125 {
                                                if slot < 17082 or slot > 17125 { return -1. }
                                                return 978.
                                            } else {
                                                if slot < 17126 or slot > 17130 { return -1. }
                                                return 979.
                                            }
                                        } else {
                                            if slot <= 17147 {
                                                if slot < 17131 or slot > 17147 { return -1. }
                                                return 980.
                                            } else {
                                                if slot <= 17158 {
                                                    if slot < 17148 or slot > 17158 { return -1. }
                                                    return 981.
                                                } else {
                                                    if slot < 17159 or slot > 17170 { return -1. }
                                                    return 982.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 17498 {
                                if slot <= 17463 {
                                    if slot <= 17217 {
                                        if slot <= 17187 {
                                            if slot <= 17174 {
                                                if slot < 17171 or slot > 17174 { return -1. }
                                                return 983.
                                            } else {
                                                if slot < 17175 or slot > 17187 { return -1. }
                                                return 984.
                                            }
                                        } else {
                                            if slot <= 17190 {
                                                if slot < 17188 or slot > 17190 { return -1. }
                                                return 985.
                                            } else {
                                                if slot < 17191 or slot > 17217 { return -1. }
                                                return 986.
                                            }
                                        }
                                    } else {
                                        if slot <= 17235 {
                                            if slot <= 17225 {
                                                if slot < 17219 or slot > 17225 { return -1. }
                                                return 987.
                                            } else {
                                                if slot < 17226 or slot > 17235 { return -1. }
                                                return 988.
                                            }
                                        } else {
                                            if slot <= 17347 {
                                                if slot < 17236 or slot > 17347 { return -1. }
                                                return 989.
                                            } else {
                                                if slot <= 17458 {
                                                    if slot < 17456 or slot > 17458 { return -1. }
                                                    return 990.
                                                } else {
                                                    if slot < 17459 or slot > 17463 { return -1. }
                                                    return 991.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 17483 {
                                        if slot <= 17469 {
                                            if slot <= 17466 {
                                                if slot < 17464 or slot > 17466 { return -1. }
                                                return 992.
                                            } else {
                                                if slot < 17467 or slot > 17469 { return -1. }
                                                return 993.
                                            }
                                        } else {
                                            if slot <= 17478 {
                                                if slot < 17470 or slot > 17478 { return -1. }
                                                return 994.
                                            } else {
                                                if slot < 17479 or slot > 17483 { return -1. }
                                                return 995.
                                            }
                                        }
                                    } else {
                                        if slot <= 17489 {
                                            if slot <= 17486 {
                                                if slot < 17484 or slot > 17486 { return -1. }
                                                return 996.
                                            } else {
                                                if slot < 17487 or slot > 17489 { return -1. }
                                                return 997.
                                            }
                                        } else {
                                            if slot <= 17492 {
                                                if slot < 17490 or slot > 17492 { return -1. }
                                                return 998.
                                            } else {
                                                if slot <= 17495 {
                                                    if slot < 17493 or slot > 17495 { return -1. }
                                                    return 999.
                                                } else {
                                                    if slot < 17496 or slot > 17498 { return -1. }
                                                    return 1000.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 17572 {
                                    if slot <= 17533 {
                                        if slot <= 17507 {
                                            if slot <= 17503 {
                                                if slot < 17499 or slot > 17503 { return -1. }
                                                return 1001.
                                            } else {
                                                if slot < 17504 or slot > 17507 { return -1. }
                                                return 1002.
                                            }
                                        } else {
                                            if slot <= 17520 {
                                                if slot < 17511 or slot > 17520 { return -1. }
                                                return 1003.
                                            } else {
                                                if slot < 17521 or slot > 17533 { return -1. }
                                                return 1004.
                                            }
                                        }
                                    } else {
                                        if slot <= 17551 {
                                            if slot <= 17547 {
                                                if slot < 17534 or slot > 17547 { return -1. }
                                                return 1005.
                                            } else {
                                                if slot < 17548 or slot > 17551 { return -1. }
                                                return 1006.
                                            }
                                        } else {
                                            if slot <= 17556 {
                                                if slot < 17552 or slot > 17556 { return -1. }
                                                return 1007.
                                            } else {
                                                if slot <= 17566 {
                                                    if slot < 17557 or slot > 17566 { return -1. }
                                                    return 1008.
                                                } else {
                                                    if slot < 17567 or slot > 17572 { return -1. }
                                                    return 1009.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 17634 {
                                        if slot <= 17597 {
                                            if slot <= 17575 {
                                                if slot < 17573 or slot > 17575 { return -1. }
                                                return 1010.
                                            } else {
                                                if slot < 17576 or slot > 17597 { return -1. }
                                                return 1011.
                                            }
                                        } else {
                                            if slot <= 17608 {
                                                if slot < 17598 or slot > 17608 { return -1. }
                                                return 1012.
                                            } else {
                                                if slot <= 17619 {
                                                    if slot < 17609 or slot > 17619 { return -1. }
                                                    return 1013.
                                                } else {
                                                    if slot < 17620 or slot > 17634 { return -1. }
                                                    return 1014.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 17652 {
                                            if slot <= 17643 {
                                                if slot < 17635 or slot > 17643 { return -1. }
                                                return 1015.
                                            } else {
                                                if slot < 17644 or slot > 17652 { return -1. }
                                                return 1016.
                                            }
                                        } else {
                                            if slot <= 17656 {
                                                if slot < 17653 or slot > 17656 { return -1. }
                                                return 1017.
                                            } else {
                                                if slot <= 17684 {
                                                    if slot < 17657 or slot > 17684 { return -1. }
                                                    return 1018.
                                                } else {
                                                    if slot < 17685 or slot > 17688 { return -1. }
                                                    return 1019.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    if slot <= 18611 {
                        if slot <= 18166 {
                            if slot <= 17931 {
                                if slot <= 17843 {
                                    if slot <= 17704 {
                                        if slot <= 17696 {
                                            if slot <= 17692 {
                                                if slot < 17689 or slot > 17692 { return -1. }
                                                return 1020.
                                            } else {
                                                if slot < 17693 or slot > 17696 { return -1. }
                                                return 1021.
                                            }
                                        } else {
                                            if slot <= 17700 {
                                                if slot < 17697 or slot > 17700 { return -1. }
                                                return 1022.
                                            } else {
                                                if slot < 17701 or slot > 17704 { return -1. }
                                                return 1023.
                                            }
                                        }
                                    } else {
                                        if slot <= 17711 {
                                            if slot <= 17708 {
                                                if slot < 17705 or slot > 17708 { return -1. }
                                                return 1024.
                                            } else {
                                                if slot < 17709 or slot > 17711 { return -1. }
                                                return 1025.
                                            }
                                        } else {
                                            if slot <= 17727 {
                                                if slot < 17712 or slot > 17727 { return -1. }
                                                return 1026.
                                            } else {
                                                if slot <= 17821 {
                                                    if slot < 17770 or slot > 17821 { return -1. }
                                                    return 1027.
                                                } else {
                                                    if slot < 17822 or slot > 17843 { return -1. }
                                                    return 1028.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 17886 {
                                        if slot <= 17848 {
                                            if slot <= 17845 {
                                                if slot < 17844 or slot > 17845 { return -1. }
                                                return 1029.
                                            } else {
                                                if slot < 17846 or slot > 17848 { return -1. }
                                                return 1030.
                                            }
                                        } else {
                                            if slot <= 17884 {
                                                if slot < 17849 or slot > 17884 { return -1. }
                                                return 1031.
                                            } else {
                                                if slot < 17885 or slot > 17886 { return -1. }
                                                return 1032.
                                            }
                                        }
                                    } else {
                                        if slot <= 17916 {
                                            if slot <= 17889 {
                                                if slot < 17887 or slot > 17889 { return -1. }
                                                return 1033.
                                            } else {
                                                if slot < 17890 or slot > 17916 { return -1. }
                                                return 1034.
                                            }
                                        } else {
                                            if slot <= 17918 {
                                                if slot < 17917 or slot > 17918 { return -1. }
                                                return 1035.
                                            } else {
                                                if slot <= 17921 {
                                                    if slot < 17919 or slot > 17921 { return -1. }
                                                    return 1036.
                                                } else {
                                                    if slot < 17922 or slot > 17931 { return -1. }
                                                    return 1037.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 18083 {
                                    if slot <= 17982 {
                                        if slot <= 17968 {
                                            if slot <= 17934 {
                                                if slot < 17933 or slot > 17934 { return -1. }
                                                return 1038.
                                            } else {
                                                if slot < 17935 or slot > 17968 { return -1. }
                                                return 1039.
                                            }
                                        } else {
                                            if slot <= 17971 {
                                                if slot < 17969 or slot > 17971 { return -1. }
                                                return 1040.
                                            } else {
                                                if slot < 17972 or slot > 17982 { return -1. }
                                                return 1041.
                                            }
                                        }
                                    } else {
                                        if slot <= 18035 {
                                            if slot <= 17984 {
                                                if slot < 17983 or slot > 17984 { return -1. }
                                                return 1042.
                                            } else {
                                                if slot < 17985 or slot > 18035 { return -1. }
                                                return 1043.
                                            }
                                        } else {
                                            if slot <= 18047 {
                                                if slot < 18036 or slot > 18047 { return -1. }
                                                return 1044.
                                            } else {
                                                if slot <= 18053 {
                                                    if slot < 18048 or slot > 18053 { return -1. }
                                                    return 1045.
                                                } else {
                                                    if slot < 18054 or slot > 18083 { return -1. }
                                                    return 1046.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 18123 {
                                        if slot <= 18097 {
                                            if slot <= 18089 {
                                                if slot < 18084 or slot > 18089 { return -1. }
                                                return 1047.
                                            } else {
                                                if slot < 18090 or slot > 18097 { return -1. }
                                                return 1048.
                                            }
                                        } else {
                                            if slot <= 18113 {
                                                if slot < 18098 or slot > 18113 { return -1. }
                                                return 1049.
                                            } else {
                                                if slot < 18114 or slot > 18123 { return -1. }
                                                return 1050.
                                            }
                                        }
                                    } else {
                                        if slot <= 18133 {
                                            if slot <= 18127 {
                                                if slot < 18124 or slot > 18127 { return -1. }
                                                return 1051.
                                            } else {
                                                if slot < 18128 or slot > 18133 { return -1. }
                                                return 1052.
                                            }
                                        } else {
                                            if slot <= 18158 {
                                                if slot < 18134 or slot > 18158 { return -1. }
                                                return 1053.
                                            } else {
                                                if slot <= 18164 {
                                                    if slot < 18159 or slot > 18164 { return -1. }
                                                    return 1054.
                                                } else {
                                                    if slot < 18165 or slot > 18166 { return -1. }
                                                    return 1055.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 18437 {
                                if slot <= 18253 {
                                    if slot <= 18205 {
                                        if slot <= 18195 {
                                            if slot <= 18193 {
                                                if slot < 18167 or slot > 18193 { return -1. }
                                                return 1056.
                                            } else {
                                                if slot < 18194 or slot > 18195 { return -1. }
                                                return 1057.
                                            }
                                        } else {
                                            if slot <= 18203 {
                                                if slot < 18196 or slot > 18203 { return -1. }
                                                return 1058.
                                            } else {
                                                if slot < 18204 or slot > 18205 { return -1. }
                                                return 1059.
                                            }
                                        }
                                    } else {
                                        if slot <= 18230 {
                                            if slot <= 18228 {
                                                if slot < 18206 or slot > 18228 { return -1. }
                                                return 1060.
                                            } else {
                                                if slot < 18229 or slot > 18230 { return -1. }
                                                return 1061.
                                            }
                                        } else {
                                            if slot <= 18249 {
                                                if slot < 18231 or slot > 18249 { return -1. }
                                                return 1062.
                                            } else {
                                                if slot <= 18251 {
                                                    if slot < 18250 or slot > 18251 { return -1. }
                                                    return 1063.
                                                } else {
                                                    if slot < 18252 or slot > 18253 { return -1. }
                                                    return 1064.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 18354 {
                                        if slot <= 18266 {
                                            if slot <= 18264 {
                                                if slot < 18254 or slot > 18264 { return -1. }
                                                return 1065.
                                            } else {
                                                if slot < 18265 or slot > 18266 { return -1. }
                                                return 1066.
                                            }
                                        } else {
                                            if slot <= 18302 {
                                                if slot < 18267 or slot > 18302 { return -1. }
                                                return 1067.
                                            } else {
                                                if slot < 18303 or slot > 18354 { return -1. }
                                                return 1068.
                                            }
                                        }
                                    } else {
                                        if slot <= 18364 {
                                            if slot <= 18359 {
                                                if slot < 18355 or slot > 18359 { return -1. }
                                                return 1069.
                                            } else {
                                                if slot < 18360 or slot > 18364 { return -1. }
                                                return 1070.
                                            }
                                        } else {
                                            if slot <= 18388 {
                                                if slot < 18365 or slot > 18388 { return -1. }
                                                return 1071.
                                            } else {
                                                if slot <= 18398 {
                                                    if slot < 18389 or slot > 18398 { return -1. }
                                                    return 1072.
                                                } else {
                                                    if slot < 18432 or slot > 18437 { return -1. }
                                                    return 1073.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 18531 {
                                    if slot <= 18458 {
                                        if slot <= 18441 {
                                            if slot <= 18439 {
                                                if slot < 18438 or slot > 18439 { return -1. }
                                                return 1074.
                                            } else {
                                                if slot < 18440 or slot > 18441 { return -1. }
                                                return 1075.
                                            }
                                        } else {
                                            if slot <= 18443 {
                                                if slot < 18442 or slot > 18443 { return -1. }
                                                return 1076.
                                            } else {
                                                if slot < 18444 or slot > 18458 { return -1. }
                                                return 1077.
                                            }
                                        }
                                    } else {
                                        if slot <= 18465 {
                                            if slot <= 18463 {
                                                if slot < 18459 or slot > 18463 { return -1. }
                                                return 1078.
                                            } else {
                                                if slot < 18464 or slot > 18465 { return -1. }
                                                return 1079.
                                            }
                                        } else {
                                            if slot <= 18483 {
                                                if slot < 18466 or slot > 18483 { return -1. }
                                                return 1080.
                                            } else {
                                                if slot <= 18520 {
                                                    if slot < 18486 or slot > 18520 { return -1. }
                                                    return 1081.
                                                } else {
                                                    if slot < 18521 or slot > 18531 { return -1. }
                                                    return 1082.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 18558 {
                                        if slot <= 18540 {
                                            if slot <= 18539 {
                                                if slot < 18532 or slot > 18539 { return -1. }
                                                return 1083.
                                            } else {
                                                if slot < 18540 or slot > 18540 { return -1. }
                                                return 1084.
                                            }
                                        } else {
                                            if slot <= 18547 {
                                                if slot < 18541 or slot > 18547 { return -1. }
                                                return 1085.
                                            } else {
                                                if slot <= 18554 {
                                                    if slot < 18548 or slot > 18554 { return -1. }
                                                    return 1086.
                                                } else {
                                                    if slot < 18555 or slot > 18558 { return -1. }
                                                    return 1087.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 18574 {
                                            if slot <= 18572 {
                                                if slot < 18566 or slot > 18572 { return -1. }
                                                return 1088.
                                            } else {
                                                if slot < 18573 or slot > 18574 { return -1. }
                                                return 1089.
                                            }
                                        } else {
                                            if slot <= 18583 {
                                                if slot < 18575 or slot > 18583 { return -1. }
                                                return 1090.
                                            } else {
                                                if slot <= 18592 {
                                                    if slot < 18584 or slot > 18592 { return -1. }
                                                    return 1091.
                                                } else {
                                                    if slot < 18593 or slot > 18611 { return -1. }
                                                    return 1092.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 19607 {
                            if slot <= 19337 {
                                if slot <= 18772 {
                                    if slot <= 18646 {
                                        if slot <= 18640 {
                                            if slot <= 18616 {
                                                if slot < 18612 or slot > 18616 { return -1. }
                                                return 1093.
                                            } else {
                                                if slot < 18617 or slot > 18640 { return -1. }
                                                return 1094.
                                            }
                                        } else {
                                            if slot <= 18642 {
                                                if slot < 18641 or slot > 18642 { return -1. }
                                                return 1095.
                                            } else {
                                                if slot < 18643 or slot > 18646 { return -1. }
                                                return 1096.
                                            }
                                        }
                                    } else {
                                        if slot <= 18662 {
                                            if slot <= 18649 {
                                                if slot < 18647 or slot > 18649 { return -1. }
                                                return 1097.
                                            } else {
                                                if slot < 18650 or slot > 18662 { return -1. }
                                                return 1098.
                                            }
                                        } else {
                                            if slot <= 18718 {
                                                if slot < 18663 or slot > 18718 { return -1. }
                                                return 1099.
                                            } else {
                                                if slot <= 18751 {
                                                    if slot < 18719 or slot > 18751 { return -1. }
                                                    return 1100.
                                                } else {
                                                    if slot < 18752 or slot > 18772 { return -1. }
                                                    return 1101.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 19256 {
                                        if slot <= 19031 {
                                            if slot <= 18903 {
                                                if slot < 18776 or slot > 18903 { return -1. }
                                                return 1102.
                                            } else {
                                                if slot < 18904 or slot > 19031 { return -1. }
                                                return 1103.
                                            }
                                        } else {
                                            if slot <= 19159 {
                                                if slot < 19032 or slot > 19159 { return -1. }
                                                return 1104.
                                            } else {
                                                if slot < 19160 or slot > 19256 { return -1. }
                                                return 1105.
                                            }
                                        }
                                    } else {
                                        if slot <= 19296 {
                                            if slot <= 19290 {
                                                if slot < 19265 or slot > 19290 { return -1. }
                                                return 1106.
                                            } else {
                                                if slot < 19291 or slot > 19296 { return -1. }
                                                return 1107.
                                            }
                                        } else {
                                            if slot <= 19318 {
                                                if slot < 19297 or slot > 19318 { return -1. }
                                                return 1108.
                                            } else {
                                                if slot <= 19321 {
                                                    if slot < 19319 or slot > 19321 { return -1. }
                                                    return 1109.
                                                } else {
                                                    if slot < 19322 or slot > 19337 { return -1. }
                                                    return 1110.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 19467 {
                                    if slot <= 19385 {
                                        if slot <= 19343 {
                                            if slot <= 19341 {
                                                if slot < 19338 or slot > 19341 { return -1. }
                                                return 1111.
                                            } else {
                                                if slot < 19342 or slot > 19343 { return -1. }
                                                return 1112.
                                            }
                                        } else {
                                            if slot <= 19357 {
                                                if slot < 19344 or slot > 19357 { return -1. }
                                                return 1113.
                                            } else {
                                                if slot < 19358 or slot > 19385 { return -1. }
                                                return 1114.
                                            }
                                        }
                                    } else {
                                        if slot <= 19417 {
                                            if slot <= 19405 {
                                                if slot < 19386 or slot > 19405 { return -1. }
                                                return 1115.
                                            } else {
                                                if slot < 19406 or slot > 19417 { return -1. }
                                                return 1116.
                                            }
                                        } else {
                                            if slot <= 19418 {
                                                if slot < 19418 or slot > 19418 { return -1. }
                                                return 1117.
                                            } else {
                                                if slot <= 19458 {
                                                    if slot < 19456 or slot > 19458 { return -1. }
                                                    return 1118.
                                                } else {
                                                    if slot < 19459 or slot > 19467 { return -1. }
                                                    return 1119.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 19537 {
                                        if slot <= 19489 {
                                            if slot <= 19475 {
                                                if slot < 19468 or slot > 19475 { return -1. }
                                                return 1120.
                                            } else {
                                                if slot < 19476 or slot > 19489 { return -1. }
                                                return 1121.
                                            }
                                        } else {
                                            if slot <= 19524 {
                                                if slot < 19490 or slot > 19524 { return -1. }
                                                return 1122.
                                            } else {
                                                if slot < 19525 or slot > 19537 { return -1. }
                                                return 1123.
                                            }
                                        }
                                    } else {
                                        if slot <= 19591 {
                                            if slot <= 19567 {
                                                if slot < 19538 or slot > 19567 { return -1. }
                                                return 1124.
                                            } else {
                                                if slot < 19568 or slot > 19591 { return -1. }
                                                return 1125.
                                            }
                                        } else {
                                            if slot <= 19602 {
                                                if slot < 19592 or slot > 19602 { return -1. }
                                                return 1126.
                                            } else {
                                                if slot <= 19605 {
                                                    if slot < 19603 or slot > 19605 { return -1. }
                                                    return 1127.
                                                } else {
                                                    if slot < 19606 or slot > 19607 { return -1. }
                                                    return 1128.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 19718 {
                                if slot <= 19676 {
                                    if slot <= 19664 {
                                        if slot <= 19616 {
                                            if slot <= 19610 {
                                                if slot < 19608 or slot > 19610 { return -1. }
                                                return 1129.
                                            } else {
                                                if slot < 19611 or slot > 19616 { return -1. }
                                                return 1130.
                                            }
                                        } else {
                                            if slot <= 19662 {
                                                if slot < 19617 or slot > 19662 { return -1. }
                                                return 1131.
                                            } else {
                                                if slot < 19663 or slot > 19664 { return -1. }
                                                return 1132.
                                            }
                                        }
                                    } else {
                                        if slot <= 19667 {
                                            if slot <= 19665 {
                                                if slot < 19665 or slot > 19665 { return -1. }
                                                return 1133.
                                            } else {
                                                if slot < 19666 or slot > 19667 { return -1. }
                                                return 1134.
                                            }
                                        } else {
                                            if slot <= 19669 {
                                                if slot < 19668 or slot > 19669 { return -1. }
                                                return 1135.
                                            } else {
                                                if slot <= 19671 {
                                                    if slot < 19670 or slot > 19671 { return -1. }
                                                    return 1136.
                                                } else {
                                                    if slot < 19672 or slot > 19676 { return -1. }
                                                    return 1137.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 19685 {
                                        if slot <= 19680 {
                                            if slot <= 19678 {
                                                if slot < 19677 or slot > 19678 { return -1. }
                                                return 1138.
                                            } else {
                                                if slot < 19679 or slot > 19680 { return -1. }
                                                return 1139.
                                            }
                                        } else {
                                            if slot <= 19683 {
                                                if slot < 19681 or slot > 19683 { return -1. }
                                                return 1140.
                                            } else {
                                                if slot < 19684 or slot > 19685 { return -1. }
                                                return 1141.
                                            }
                                        }
                                    } else {
                                        if slot <= 19707 {
                                            if slot <= 19695 {
                                                if slot < 19686 or slot > 19695 { return -1. }
                                                return 1142.
                                            } else {
                                                if slot < 19696 or slot > 19707 { return -1. }
                                                return 1143.
                                            }
                                        } else {
                                            if slot <= 19711 {
                                                if slot < 19708 or slot > 19711 { return -1. }
                                                return 1144.
                                            } else {
                                                if slot <= 19716 {
                                                    if slot < 19712 or slot > 19716 { return -1. }
                                                    return 1145.
                                                } else {
                                                    if slot < 19717 or slot > 19718 { return -1. }
                                                    return 1146.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 19818 {
                                    if slot <= 19795 {
                                        if slot <= 19789 {
                                            if slot <= 19779 {
                                                if slot < 19719 or slot > 19779 { return -1. }
                                                return 1147.
                                            } else {
                                                if slot < 19780 or slot > 19789 { return -1. }
                                                return 1148.
                                            }
                                        } else {
                                            if slot <= 19792 {
                                                if slot < 19790 or slot > 19792 { return -1. }
                                                return 1149.
                                            } else {
                                                if slot < 19793 or slot > 19795 { return -1. }
                                                return 1150.
                                            }
                                        }
                                    } else {
                                        if slot <= 19811 {
                                            if slot <= 19797 {
                                                if slot < 19796 or slot > 19797 { return -1. }
                                                return 1151.
                                            } else {
                                                if slot < 19798 or slot > 19811 { return -1. }
                                                return 1152.
                                            }
                                        } else {
                                            if slot <= 19815 {
                                                if slot < 19812 or slot > 19815 { return -1. }
                                                return 1153.
                                            } else {
                                                if slot <= 19817 {
                                                    if slot < 19816 or slot > 19817 { return -1. }
                                                    return 1154.
                                                } else {
                                                    if slot < 19818 or slot > 19818 { return -1. }
                                                    return 1155.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 19953 {
                                        if slot <= 19853 {
                                            if slot <= 19822 {
                                                if slot < 19819 or slot > 19822 { return -1. }
                                                return 1156.
                                            } else {
                                                if slot < 19823 or slot > 19853 { return -1. }
                                                return 1157.
                                            }
                                        } else {
                                            if slot <= 19865 {
                                                if slot < 19854 or slot > 19865 { return -1. }
                                                return 1158.
                                            } else {
                                                if slot <= 19870 {
                                                    if slot < 19866 or slot > 19870 { return -1. }
                                                    return 1159.
                                                } else {
                                                    if slot < 19871 or slot > 19953 { return -1. }
                                                    return 1160.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 19963 {
                                            if slot <= 19958 {
                                                if slot < 19954 or slot > 19958 { return -1. }
                                                return 1161.
                                            } else {
                                                if slot < 19960 or slot > 19963 { return -1. }
                                                return 1162.
                                            }
                                        } else {
                                            if slot <= 19971 {
                                                if slot < 19964 or slot > 19971 { return -1. }
                                                return 1163.
                                            } else {
                                                if slot <= 19975 {
                                                    if slot < 19972 or slot > 19975 { return -1. }
                                                    return 1164.
                                                } else {
                                                    if slot < 19976 or slot > 19982 { return -1. }
                                                    return 1165.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        if slot <= 30779 {
            if slot <= 24901 {
                if slot <= 22773 {
                    if slot <= 21845 {
                        if slot <= 21052 {
                            if slot <= 20276 {
                                if slot <= 20055 {
                                    if slot <= 20008 {
                                        if slot <= 19988 {
                                            if slot <= 19986 {
                                                if slot < 19983 or slot > 19986 { return -1. }
                                                return 1166.
                                            } else {
                                                if slot < 19987 or slot > 19988 { return -1. }
                                                return 1167.
                                            }
                                        } else {
                                            if slot <= 19990 {
                                                if slot < 19989 or slot > 19990 { return -1. }
                                                return 1168.
                                            } else {
                                                if slot < 19991 or slot > 20008 { return -1. }
                                                return 1169.
                                            }
                                        }
                                    } else {
                                        if slot <= 20013 {
                                            if slot <= 20010 {
                                                if slot < 20009 or slot > 20010 { return -1. }
                                                return 1170.
                                            } else {
                                                if slot < 20011 or slot > 20013 { return -1. }
                                                return 1171.
                                            }
                                        } else {
                                            if slot <= 20016 {
                                                if slot < 20014 or slot > 20016 { return -1. }
                                                return 1172.
                                            } else {
                                                if slot <= 20022 {
                                                    if slot < 20017 or slot > 20022 { return -1. }
                                                    return 1173.
                                                } else {
                                                    if slot < 20023 or slot > 20055 { return -1. }
                                                    return 1174.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 20171 {
                                        if slot <= 20165 {
                                            if slot <= 20135 {
                                                if slot < 20056 or slot > 20135 { return -1. }
                                                return 1175.
                                            } else {
                                                if slot < 20136 or slot > 20165 { return -1. }
                                                return 1176.
                                            }
                                        } else {
                                            if slot <= 20168 {
                                                if slot < 20166 or slot > 20168 { return -1. }
                                                return 1177.
                                            } else {
                                                if slot < 20169 or slot > 20171 { return -1. }
                                                return 1178.
                                            }
                                        }
                                    } else {
                                        if slot <= 20256 {
                                            if slot <= 20177 {
                                                if slot < 20172 or slot > 20177 { return -1. }
                                                return 1179.
                                            } else {
                                                if slot < 20178 or slot > 20256 { return -1. }
                                                return 1180.
                                            }
                                        } else {
                                            if slot <= 20266 {
                                                if slot < 20257 or slot > 20266 { return -1. }
                                                return 1181.
                                            } else {
                                                if slot <= 20273 {
                                                    if slot < 20267 or slot > 20273 { return -1. }
                                                    return 1182.
                                                } else {
                                                    if slot < 20274 or slot > 20276 { return -1. }
                                                    return 1183.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 20733 {
                                    if slot <= 20425 {
                                        if slot <= 20410 {
                                            if slot <= 20282 {
                                                if slot < 20277 or slot > 20282 { return -1. }
                                                return 1184.
                                            } else {
                                                if slot < 20283 or slot > 20410 { return -1. }
                                                return 1185.
                                            }
                                        } else {
                                            if slot <= 20421 {
                                                if slot < 20411 or slot > 20421 { return -1. }
                                                return 1186.
                                            } else {
                                                if slot < 20422 or slot > 20425 { return -1. }
                                                return 1187.
                                            }
                                        }
                                    } else {
                                        if slot <= 20455 {
                                            if slot <= 20440 {
                                                if slot < 20426 or slot > 20440 { return -1. }
                                                return 1188.
                                            } else {
                                                if slot < 20441 or slot > 20455 { return -1. }
                                                return 1189.
                                            }
                                        } else {
                                            if slot <= 20466 {
                                                if slot < 20456 or slot > 20466 { return -1. }
                                                return 1190.
                                            } else {
                                                if slot <= 20547 {
                                                    if slot < 20480 or slot > 20547 { return -1. }
                                                    return 1191.
                                                } else {
                                                    if slot < 20548 or slot > 20733 { return -1. }
                                                    return 1192.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 20958 {
                                        if slot <= 20951 {
                                            if slot <= 20948 {
                                                if slot < 20734 or slot > 20948 { return -1. }
                                                return 1193.
                                            } else {
                                                if slot < 20949 or slot > 20951 { return -1. }
                                                return 1194.
                                            }
                                        } else {
                                            if slot <= 20957 {
                                                if slot < 20952 or slot > 20957 { return -1. }
                                                return 1195.
                                            } else {
                                                if slot < 20958 or slot > 20958 { return -1. }
                                                return 1196.
                                            }
                                        }
                                    } else {
                                        if slot <= 21043 {
                                            if slot <= 21037 {
                                                if slot < 21014 or slot > 21037 { return -1. }
                                                return 1197.
                                            } else {
                                                if slot < 21038 or slot > 21043 { return -1. }
                                                return 1198.
                                            }
                                        } else {
                                            if slot <= 21046 {
                                                if slot < 21044 or slot > 21046 { return -1. }
                                                return 1199.
                                            } else {
                                                if slot <= 21050 {
                                                    if slot < 21047 or slot > 21050 { return -1. }
                                                    return 1200.
                                                } else {
                                                    if slot < 21051 or slot > 21052 { return -1. }
                                                    return 1201.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 21493 {
                                if slot <= 21397 {
                                    if slot <= 21066 {
                                        if slot <= 21056 {
                                            if slot <= 21054 {
                                                if slot < 21053 or slot > 21054 { return -1. }
                                                return 1202.
                                            } else {
                                                if slot < 21055 or slot > 21056 { return -1. }
                                                return 1203.
                                            }
                                        } else {
                                            if slot <= 21062 {
                                                if slot < 21057 or slot > 21062 { return -1. }
                                                return 1204.
                                            } else {
                                                if slot < 21063 or slot > 21066 { return -1. }
                                                return 1205.
                                            }
                                        }
                                    } else {
                                        if slot <= 21096 {
                                            if slot <= 21089 {
                                                if slot < 21067 or slot > 21089 { return -1. }
                                                return 1206.
                                            } else {
                                                if slot < 21090 or slot > 21096 { return -1. }
                                                return 1207.
                                            }
                                        } else {
                                            if slot <= 21318 {
                                                if slot < 21287 or slot > 21318 { return -1. }
                                                return 1208.
                                            } else {
                                                if slot <= 21383 {
                                                    if slot < 21320 or slot > 21383 { return -1. }
                                                    return 1209.
                                                } else {
                                                    if slot < 21384 or slot > 21397 { return -1. }
                                                    return 1210.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 21420 {
                                        if slot <= 21414 {
                                            if slot <= 21400 {
                                                if slot < 21398 or slot > 21400 { return -1. }
                                                return 1211.
                                            } else {
                                                if slot < 21401 or slot > 21414 { return -1. }
                                                return 1212.
                                            }
                                        } else {
                                            if slot <= 21417 {
                                                if slot < 21415 or slot > 21417 { return -1. }
                                                return 1213.
                                            } else {
                                                if slot < 21418 or slot > 21420 { return -1. }
                                                return 1214.
                                            }
                                        }
                                    } else {
                                        if slot <= 21425 {
                                            if slot <= 21422 {
                                                if slot < 21421 or slot > 21422 { return -1. }
                                                return 1215.
                                            } else {
                                                if slot < 21423 or slot > 21425 { return -1. }
                                                return 1216.
                                            }
                                        } else {
                                            if slot <= 21456 {
                                                if slot < 21426 or slot > 21456 { return -1. }
                                                return 1217.
                                            } else {
                                                if slot <= 21466 {
                                                    if slot < 21457 or slot > 21466 { return -1. }
                                                    return 1218.
                                                } else {
                                                    if slot < 21467 or slot > 21493 { return -1. }
                                                    return 1219.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 21741 {
                                    if slot <= 21616 {
                                        if slot <= 21499 {
                                            if slot <= 21495 {
                                                if slot < 21494 or slot > 21495 { return -1. }
                                                return 1220.
                                            } else {
                                                if slot < 21496 or slot > 21499 { return -1. }
                                                return 1221.
                                            }
                                        } else {
                                            if slot <= 21500 {
                                                if slot < 21500 or slot > 21500 { return -1. }
                                                return 1222.
                                            } else {
                                                if slot < 21527 or slot > 21616 { return -1. }
                                                return 1223.
                                            }
                                        }
                                    } else {
                                        if slot <= 21639 {
                                            if slot <= 21626 {
                                                if slot < 21617 or slot > 21626 { return -1. }
                                                return 1224.
                                            } else {
                                                if slot < 21627 or slot > 21639 { return -1. }
                                                return 1225.
                                            }
                                        } else {
                                            if slot <= 21727 {
                                                if slot < 21722 or slot > 21727 { return -1. }
                                                return 1226.
                                            } else {
                                                if slot <= 21734 {
                                                    if slot < 21728 or slot > 21734 { return -1. }
                                                    return 1227.
                                                } else {
                                                    if slot < 21735 or slot > 21741 { return -1. }
                                                    return 1228.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 21768 {
                                        if slot <= 21758 {
                                            if slot <= 21750 {
                                                if slot < 21742 or slot > 21750 { return -1. }
                                                return 1229.
                                            } else {
                                                if slot < 21751 or slot > 21758 { return -1. }
                                                return 1230.
                                            }
                                        } else {
                                            if slot <= 21762 {
                                                if slot < 21759 or slot > 21762 { return -1. }
                                                return 1231.
                                            } else {
                                                if slot < 21763 or slot > 21768 { return -1. }
                                                return 1232.
                                            }
                                        }
                                    } else {
                                        if slot <= 21797 {
                                            if slot <= 21774 {
                                                if slot < 21769 or slot > 21774 { return -1. }
                                                return 1233.
                                            } else {
                                                if slot < 21775 or slot > 21797 { return -1. }
                                                return 1234.
                                            }
                                        } else {
                                            if slot <= 21821 {
                                                if slot < 21798 or slot > 21821 { return -1. }
                                                return 1235.
                                            } else {
                                                if slot <= 21837 {
                                                    if slot < 21822 or slot > 21837 { return -1. }
                                                    return 1236.
                                                } else {
                                                    if slot < 21838 or slot > 21845 { return -1. }
                                                    return 1237.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 22417 {
                            if slot <= 22046 {
                                if slot <= 21931 {
                                    if slot <= 21878 {
                                        if slot <= 21861 {
                                            if slot <= 21856 {
                                                if slot < 21846 or slot > 21856 { return -1. }
                                                return 1238.
                                            } else {
                                                if slot < 21857 or slot > 21861 { return -1. }
                                                return 1239.
                                            }
                                        } else {
                                            if slot <= 21865 {
                                                if slot < 21862 or slot > 21865 { return -1. }
                                                return 1240.
                                            } else {
                                                if slot < 21866 or slot > 21878 { return -1. }
                                                return 1241.
                                            }
                                        }
                                    } else {
                                        if slot <= 21888 {
                                            if slot <= 21882 {
                                                if slot < 21879 or slot > 21882 { return -1. }
                                                return 1242.
                                            } else {
                                                if slot < 21883 or slot > 21888 { return -1. }
                                                return 1243.
                                            }
                                        } else {
                                            if slot <= 21921 {
                                                if slot < 21889 or slot > 21921 { return -1. }
                                                return 1244.
                                            } else {
                                                if slot <= 21923 {
                                                    if slot < 21922 or slot > 21923 { return -1. }
                                                    return 1245.
                                                } else {
                                                    if slot < 21924 or slot > 21931 { return -1. }
                                                    return 1246.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 22034 {
                                        if slot <= 21942 {
                                            if slot <= 21941 {
                                                if slot < 21932 or slot > 21941 { return -1. }
                                                return 1247.
                                            } else {
                                                if slot < 21942 or slot > 21942 { return -1. }
                                                return 1248.
                                            }
                                        } else {
                                            if slot <= 22012 {
                                                if slot < 22005 or slot > 22012 { return -1. }
                                                return 1249.
                                            } else {
                                                if slot < 22013 or slot > 22034 { return -1. }
                                                return 1250.
                                            }
                                        }
                                    } else {
                                        if slot <= 22039 {
                                            if slot <= 22036 {
                                                if slot < 22035 or slot > 22036 { return -1. }
                                                return 1251.
                                            } else {
                                                if slot < 22037 or slot > 22039 { return -1. }
                                                return 1252.
                                            }
                                        } else {
                                            if slot <= 22042 {
                                                if slot < 22040 or slot > 22042 { return -1. }
                                                return 1253.
                                            } else {
                                                if slot <= 22045 {
                                                    if slot < 22043 or slot > 22045 { return -1. }
                                                    return 1254.
                                                } else {
                                                    if slot < 22046 or slot > 22046 { return -1. }
                                                    return 1255.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 22365 {
                                    if slot <= 22339 {
                                        if slot <= 22269 {
                                            if slot <= 22267 {
                                                if slot < 22266 or slot > 22267 { return -1. }
                                                return 1256.
                                            } else {
                                                if slot < 22268 or slot > 22269 { return -1. }
                                                return 1257.
                                            }
                                        } else {
                                            if slot <= 22270 {
                                                if slot < 22270 or slot > 22270 { return -1. }
                                                return 1258.
                                            } else {
                                                if slot < 22336 or slot > 22339 { return -1. }
                                                return 1259.
                                            }
                                        }
                                    } else {
                                        if slot <= 22355 {
                                            if slot <= 22342 {
                                                if slot < 22340 or slot > 22342 { return -1. }
                                                return 1260.
                                            } else {
                                                if slot < 22343 or slot > 22355 { return -1. }
                                                return 1261.
                                            }
                                        } else {
                                            if slot <= 22359 {
                                                if slot < 22356 or slot > 22359 { return -1. }
                                                return 1262.
                                            } else {
                                                if slot <= 22363 {
                                                    if slot < 22360 or slot > 22363 { return -1. }
                                                    return 1263.
                                                } else {
                                                    if slot < 22364 or slot > 22365 { return -1. }
                                                    return 1264.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 22377 {
                                        if slot <= 22371 {
                                            if slot <= 22368 {
                                                if slot < 22366 or slot > 22368 { return -1. }
                                                return 1265.
                                            } else {
                                                if slot < 22369 or slot > 22371 { return -1. }
                                                return 1266.
                                            }
                                        } else {
                                            if slot <= 22373 {
                                                if slot < 22372 or slot > 22373 { return -1. }
                                                return 1267.
                                            } else {
                                                if slot < 22374 or slot > 22377 { return -1. }
                                                return 1268.
                                            }
                                        }
                                    } else {
                                        if slot <= 22393 {
                                            if slot <= 22388 {
                                                if slot < 22378 or slot > 22388 { return -1. }
                                                return 1269.
                                            } else {
                                                if slot < 22389 or slot > 22393 { return -1. }
                                                return 1270.
                                            }
                                        } else {
                                            if slot <= 22395 {
                                                if slot < 22394 or slot > 22395 { return -1. }
                                                return 1271.
                                            } else {
                                                if slot <= 22400 {
                                                    if slot < 22396 or slot > 22400 { return -1. }
                                                    return 1272.
                                                } else {
                                                    if slot < 22401 or slot > 22417 { return -1. }
                                                    return 1273.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 22635 {
                                if slot <= 22482 {
                                    if slot <= 22436 {
                                        if slot <= 22428 {
                                            if slot <= 22420 {
                                                if slot < 22418 or slot > 22420 { return -1. }
                                                return 1274.
                                            } else {
                                                if slot < 22421 or slot > 22428 { return -1. }
                                                return 1275.
                                            }
                                        } else {
                                            if slot <= 22431 {
                                                if slot < 22429 or slot > 22431 { return -1. }
                                                return 1276.
                                            } else {
                                                if slot < 22432 or slot > 22436 { return -1. }
                                                return 1277.
                                            }
                                        }
                                    } else {
                                        if slot <= 22448 {
                                            if slot <= 22438 {
                                                if slot < 22437 or slot > 22438 { return -1. }
                                                return 1278.
                                            } else {
                                                if slot < 22439 or slot > 22448 { return -1. }
                                                return 1279.
                                            }
                                        } else {
                                            if slot <= 22454 {
                                                if slot < 22449 or slot > 22454 { return -1. }
                                                return 1280.
                                            } else {
                                                if slot <= 22473 {
                                                    if slot < 22455 or slot > 22473 { return -1. }
                                                    return 1281.
                                                } else {
                                                    if slot < 22474 or slot > 22482 { return -1. }
                                                    return 1282.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 22603 {
                                        if slot <= 22588 {
                                            if slot <= 22492 {
                                                if slot < 22483 or slot > 22492 { return -1. }
                                                return 1283.
                                            } else {
                                                if slot < 22587 or slot > 22588 { return -1. }
                                                return 1284.
                                            }
                                        } else {
                                            if slot <= 22601 {
                                                if slot < 22589 or slot > 22601 { return -1. }
                                                return 1285.
                                            } else {
                                                if slot < 22602 or slot > 22603 { return -1. }
                                                return 1286.
                                            }
                                        }
                                    } else {
                                        if slot <= 22614 {
                                            if slot <= 22610 {
                                                if slot < 22604 or slot > 22610 { return -1. }
                                                return 1287.
                                            } else {
                                                if slot < 22611 or slot > 22614 { return -1. }
                                                return 1288.
                                            }
                                        } else {
                                            if slot <= 22618 {
                                                if slot < 22615 or slot > 22618 { return -1. }
                                                return 1289.
                                            } else {
                                                if slot <= 22629 {
                                                    if slot < 22619 or slot > 22629 { return -1. }
                                                    return 1290.
                                                } else {
                                                    if slot < 22630 or slot > 22635 { return -1. }
                                                    return 1291.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 22696 {
                                    if slot <= 22658 {
                                        if slot <= 22651 {
                                            if slot <= 22645 {
                                                if slot < 22636 or slot > 22645 { return -1. }
                                                return 1292.
                                            } else {
                                                if slot < 22646 or slot > 22651 { return -1. }
                                                return 1293.
                                            }
                                        } else {
                                            if slot <= 22654 {
                                                if slot < 22652 or slot > 22654 { return -1. }
                                                return 1294.
                                            } else {
                                                if slot < 22655 or slot > 22658 { return -1. }
                                                return 1295.
                                            }
                                        }
                                    } else {
                                        if slot <= 22680 {
                                            if slot <= 22667 {
                                                if slot < 22659 or slot > 22667 { return -1. }
                                                return 1296.
                                            } else {
                                                if slot < 22668 or slot > 22680 { return -1. }
                                                return 1297.
                                            }
                                        } else {
                                            if slot <= 22682 {
                                                if slot < 22681 or slot > 22682 { return -1. }
                                                return 1298.
                                            } else {
                                                if slot <= 22685 {
                                                    if slot < 22683 or slot > 22685 { return -1. }
                                                    return 1299.
                                                } else {
                                                    if slot < 22686 or slot > 22696 { return -1. }
                                                    return 1300.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 22741 {
                                        if slot <= 22710 {
                                            if slot <= 22705 {
                                                if slot < 22697 or slot > 22705 { return -1. }
                                                return 1301.
                                            } else {
                                                if slot < 22706 or slot > 22710 { return -1. }
                                                return 1302.
                                            }
                                        } else {
                                            if slot <= 22713 {
                                                if slot < 22711 or slot > 22713 { return -1. }
                                                return 1303.
                                            } else {
                                                if slot <= 22722 {
                                                    if slot < 22714 or slot > 22722 { return -1. }
                                                    return 1304.
                                                } else {
                                                    if slot < 22723 or slot > 22741 { return -1. }
                                                    return 1305.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 22753 {
                                            if slot <= 22751 {
                                                if slot < 22742 or slot > 22751 { return -1. }
                                                return 1306.
                                            } else {
                                                if slot < 22752 or slot > 22753 { return -1. }
                                                return 1307.
                                            }
                                        } else {
                                            if slot <= 22760 {
                                                if slot < 22754 or slot > 22760 { return -1. }
                                                return 1308.
                                            } else {
                                                if slot <= 22766 {
                                                    if slot < 22761 or slot > 22766 { return -1. }
                                                    return 1309.
                                                } else {
                                                    if slot < 22767 or slot > 22773 { return -1. }
                                                    return 1310.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    if slot <= 23353 {
                        if slot <= 23044 {
                            if slot <= 22889 {
                                if slot <= 22839 {
                                    if slot <= 22818 {
                                        if slot <= 22790 {
                                            if slot <= 22784 {
                                                if slot < 22774 or slot > 22784 { return -1. }
                                                return 1311.
                                            } else {
                                                if slot < 22785 or slot > 22790 { return -1. }
                                                return 1312.
                                            }
                                        } else {
                                            if slot <= 22791 {
                                                if slot < 22791 or slot > 22791 { return -1. }
                                                return 1313.
                                            } else {
                                                if slot < 22813 or slot > 22818 { return -1. }
                                                return 1314.
                                            }
                                        }
                                    } else {
                                        if slot <= 22827 {
                                            if slot <= 22824 {
                                                if slot < 22819 or slot > 22824 { return -1. }
                                                return 1315.
                                            } else {
                                                if slot < 22825 or slot > 22827 { return -1. }
                                                return 1316.
                                            }
                                        } else {
                                            if slot <= 22834 {
                                                if slot < 22828 or slot > 22834 { return -1. }
                                                return 1317.
                                            } else {
                                                if slot <= 22836 {
                                                    if slot < 22835 or slot > 22836 { return -1. }
                                                    return 1318.
                                                } else {
                                                    if slot < 22837 or slot > 22839 { return -1. }
                                                    return 1319.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 22868 {
                                        if slot <= 22846 {
                                            if slot <= 22844 {
                                                if slot < 22840 or slot > 22844 { return -1. }
                                                return 1320.
                                            } else {
                                                if slot < 22845 or slot > 22846 { return -1. }
                                                return 1321.
                                            }
                                        } else {
                                            if slot <= 22854 {
                                                if slot < 22847 or slot > 22854 { return -1. }
                                                return 1322.
                                            } else {
                                                if slot < 22855 or slot > 22868 { return -1. }
                                                return 1323.
                                            }
                                        }
                                    } else {
                                        if slot <= 22874 {
                                            if slot <= 22870 {
                                                if slot < 22869 or slot > 22870 { return -1. }
                                                return 1324.
                                            } else {
                                                if slot < 22871 or slot > 22874 { return -1. }
                                                return 1325.
                                            }
                                        } else {
                                            if slot <= 22881 {
                                                if slot < 22875 or slot > 22881 { return -1. }
                                                return 1326.
                                            } else {
                                                if slot <= 22886 {
                                                    if slot < 22882 or slot > 22886 { return -1. }
                                                    return 1327.
                                                } else {
                                                    if slot < 22887 or slot > 22889 { return -1. }
                                                    return 1328.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 22961 {
                                    if slot <= 22911 {
                                        if slot <= 22903 {
                                            if slot <= 22900 {
                                                if slot < 22890 or slot > 22900 { return -1. }
                                                return 1329.
                                            } else {
                                                if slot < 22901 or slot > 22903 { return -1. }
                                                return 1330.
                                            }
                                        } else {
                                            if slot <= 22907 {
                                                if slot < 22904 or slot > 22907 { return -1. }
                                                return 1331.
                                            } else {
                                                if slot < 22908 or slot > 22911 { return -1. }
                                                return 1332.
                                            }
                                        }
                                    } else {
                                        if slot <= 22920 {
                                            if slot <= 22916 {
                                                if slot < 22912 or slot > 22916 { return -1. }
                                                return 1333.
                                            } else {
                                                if slot < 22917 or slot > 22920 { return -1. }
                                                return 1334.
                                            }
                                        } else {
                                            if slot <= 22932 {
                                                if slot < 22921 or slot > 22932 { return -1. }
                                                return 1335.
                                            } else {
                                                if slot <= 22959 {
                                                    if slot < 22933 or slot > 22959 { return -1. }
                                                    return 1336.
                                                } else {
                                                    if slot < 22960 or slot > 22961 { return -1. }
                                                    return 1337.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 23018 {
                                        if slot <= 22986 {
                                            if slot <= 22979 {
                                                if slot < 22962 or slot > 22979 { return -1. }
                                                return 1338.
                                            } else {
                                                if slot < 22980 or slot > 22986 { return -1. }
                                                return 1339.
                                            }
                                        } else {
                                            if slot <= 22996 {
                                                if slot < 22987 or slot > 22996 { return -1. }
                                                return 1340.
                                            } else {
                                                if slot < 22997 or slot > 23018 { return -1. }
                                                return 1341.
                                            }
                                        }
                                    } else {
                                        if slot <= 23035 {
                                            if slot <= 23022 {
                                                if slot < 23019 or slot > 23022 { return -1. }
                                                return 1342.
                                            } else {
                                                if slot < 23023 or slot > 23035 { return -1. }
                                                return 1343.
                                            }
                                        } else {
                                            if slot <= 23039 {
                                                if slot < 23036 or slot > 23039 { return -1. }
                                                return 1344.
                                            } else {
                                                if slot <= 23041 {
                                                    if slot < 23040 or slot > 23041 { return -1. }
                                                    return 1345.
                                                } else {
                                                    if slot < 23042 or slot > 23044 { return -1. }
                                                    return 1346.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 23232 {
                                if slot <= 23155 {
                                    if slot <= 23095 {
                                        if slot <= 23049 {
                                            if slot <= 23046 {
                                                if slot < 23045 or slot > 23046 { return -1. }
                                                return 1347.
                                            } else {
                                                if slot < 23047 or slot > 23049 { return -1. }
                                                return 1348.
                                            }
                                        } else {
                                            if slot <= 23053 {
                                                if slot < 23050 or slot > 23053 { return -1. }
                                                return 1349.
                                            } else {
                                                if slot < 23054 or slot > 23095 { return -1. }
                                                return 1350.
                                            }
                                        }
                                    } else {
                                        if slot <= 23124 {
                                            if slot <= 23119 {
                                                if slot < 23096 or slot > 23119 { return -1. }
                                                return 1351.
                                            } else {
                                                if slot < 23120 or slot > 23124 { return -1. }
                                                return 1352.
                                            }
                                        } else {
                                            if slot <= 23148 {
                                                if slot < 23125 or slot > 23148 { return -1. }
                                                return 1353.
                                            } else {
                                                if slot <= 23152 {
                                                    if slot < 23149 or slot > 23152 { return -1. }
                                                    return 1354.
                                                } else {
                                                    if slot < 23153 or slot > 23155 { return -1. }
                                                    return 1355.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 23206 {
                                        if slot <= 23176 {
                                            if slot <= 23172 {
                                                if slot < 23156 or slot > 23172 { return -1. }
                                                return 1356.
                                            } else {
                                                if slot < 23173 or slot > 23176 { return -1. }
                                                return 1357.
                                            }
                                        } else {
                                            if slot <= 23182 {
                                                if slot < 23177 or slot > 23182 { return -1. }
                                                return 1358.
                                            } else {
                                                if slot < 23183 or slot > 23206 { return -1. }
                                                return 1359.
                                            }
                                        }
                                    } else {
                                        if slot <= 23212 {
                                            if slot <= 23209 {
                                                if slot < 23207 or slot > 23209 { return -1. }
                                                return 1360.
                                            } else {
                                                if slot < 23210 or slot > 23212 { return -1. }
                                                return 1361.
                                            }
                                        } else {
                                            if slot <= 23214 {
                                                if slot < 23213 or slot > 23214 { return -1. }
                                                return 1362.
                                            } else {
                                                if slot <= 23221 {
                                                    if slot < 23215 or slot > 23221 { return -1. }
                                                    return 1363.
                                                } else {
                                                    if slot < 23222 or slot > 23232 { return -1. }
                                                    return 1364.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 23301 {
                                    if slot <= 23265 {
                                        if slot <= 23251 {
                                            if slot <= 23244 {
                                                if slot < 23233 or slot > 23244 { return -1. }
                                                return 1365.
                                            } else {
                                                if slot < 23245 or slot > 23251 { return -1. }
                                                return 1366.
                                            }
                                        } else {
                                            if slot <= 23256 {
                                                if slot < 23252 or slot > 23256 { return -1. }
                                                return 1367.
                                            } else {
                                                if slot < 23257 or slot > 23265 { return -1. }
                                                return 1368.
                                            }
                                        }
                                    } else {
                                        if slot <= 23279 {
                                            if slot <= 23273 {
                                                if slot < 23266 or slot > 23273 { return -1. }
                                                return 1369.
                                            } else {
                                                if slot < 23274 or slot > 23279 { return -1. }
                                                return 1370.
                                            }
                                        } else {
                                            if slot <= 23285 {
                                                if slot < 23280 or slot > 23285 { return -1. }
                                                return 1371.
                                            } else {
                                                if slot <= 23295 {
                                                    if slot < 23286 or slot > 23295 { return -1. }
                                                    return 1372.
                                                } else {
                                                    if slot < 23296 or slot > 23301 { return -1. }
                                                    return 1373.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 23339 {
                                        if slot <= 23324 {
                                            if slot <= 23318 {
                                                if slot < 23302 or slot > 23318 { return -1. }
                                                return 1374.
                                            } else {
                                                if slot < 23319 or slot > 23324 { return -1. }
                                                return 1375.
                                            }
                                        } else {
                                            if slot <= 23327 {
                                                if slot < 23325 or slot > 23327 { return -1. }
                                                return 1376.
                                            } else {
                                                if slot <= 23336 {
                                                    if slot < 23328 or slot > 23336 { return -1. }
                                                    return 1377.
                                                } else {
                                                    if slot < 23337 or slot > 23339 { return -1. }
                                                    return 1378.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 23343 {
                                            if slot <= 23341 {
                                                if slot < 23340 or slot > 23341 { return -1. }
                                                return 1379.
                                            } else {
                                                if slot < 23342 or slot > 23343 { return -1. }
                                                return 1380.
                                            }
                                        } else {
                                            if slot <= 23347 {
                                                if slot < 23344 or slot > 23347 { return -1. }
                                                return 1381.
                                            } else {
                                                if slot <= 23350 {
                                                    if slot < 23348 or slot > 23350 { return -1. }
                                                    return 1382.
                                                } else {
                                                    if slot < 23351 or slot > 23353 { return -1. }
                                                    return 1383.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 24465 {
                            if slot <= 23418 {
                                if slot <= 23382 {
                                    if slot <= 23366 {
                                        if slot <= 23362 {
                                            if slot <= 23360 {
                                                if slot < 23354 or slot > 23360 { return -1. }
                                                return 1384.
                                            } else {
                                                if slot < 23361 or slot > 23362 { return -1. }
                                                return 1385.
                                            }
                                        } else {
                                            if slot <= 23364 {
                                                if slot < 23363 or slot > 23364 { return -1. }
                                                return 1386.
                                            } else {
                                                if slot < 23365 or slot > 23366 { return -1. }
                                                return 1387.
                                            }
                                        }
                                    } else {
                                        if slot <= 23370 {
                                            if slot <= 23368 {
                                                if slot < 23367 or slot > 23368 { return -1. }
                                                return 1388.
                                            } else {
                                                if slot < 23369 or slot > 23370 { return -1. }
                                                return 1389.
                                            }
                                        } else {
                                            if slot <= 23373 {
                                                if slot < 23371 or slot > 23373 { return -1. }
                                                return 1390.
                                            } else {
                                                if slot <= 23377 {
                                                    if slot < 23374 or slot > 23377 { return -1. }
                                                    return 1391.
                                                } else {
                                                    if slot < 23378 or slot > 23382 { return -1. }
                                                    return 1392.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 23397 {
                                        if slot <= 23391 {
                                            if slot <= 23388 {
                                                if slot < 23383 or slot > 23388 { return -1. }
                                                return 1393.
                                            } else {
                                                if slot < 23389 or slot > 23391 { return -1. }
                                                return 1394.
                                            }
                                        } else {
                                            if slot <= 23393 {
                                                if slot < 23392 or slot > 23393 { return -1. }
                                                return 1395.
                                            } else {
                                                if slot < 23394 or slot > 23397 { return -1. }
                                                return 1396.
                                            }
                                        }
                                    } else {
                                        if slot <= 23403 {
                                            if slot <= 23399 {
                                                if slot < 23398 or slot > 23399 { return -1. }
                                                return 1397.
                                            } else {
                                                if slot < 23400 or slot > 23403 { return -1. }
                                                return 1398.
                                            }
                                        } else {
                                            if slot <= 23409 {
                                                if slot < 23404 or slot > 23409 { return -1. }
                                                return 1399.
                                            } else {
                                                if slot <= 23414 {
                                                    if slot < 23410 or slot > 23414 { return -1. }
                                                    return 1400.
                                                } else {
                                                    if slot < 23415 or slot > 23418 { return -1. }
                                                    return 1401.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 24309 {
                                    if slot <= 24014 {
                                        if slot <= 23631 {
                                            if slot <= 23419 {
                                                if slot < 23419 or slot > 23419 { return -1. }
                                                return 1402.
                                            } else {
                                                if slot < 23553 or slot > 23631 { return -1. }
                                                return 1403.
                                            }
                                        } else {
                                            if slot <= 23633 {
                                                if slot < 23632 or slot > 23633 { return -1. }
                                                return 1404.
                                            } else {
                                                if slot < 23634 or slot > 24014 { return -1. }
                                                return 1405.
                                            }
                                        }
                                    } else {
                                        if slot <= 24075 {
                                            if slot <= 24020 {
                                                if slot < 24015 or slot > 24020 { return -1. }
                                                return 1406.
                                            } else {
                                                if slot < 24021 or slot > 24075 { return -1. }
                                                return 1407.
                                            }
                                        } else {
                                            if slot <= 24295 {
                                                if slot < 24076 or slot > 24295 { return -1. }
                                                return 1408.
                                            } else {
                                                if slot <= 24302 {
                                                    if slot < 24296 or slot > 24302 { return -1. }
                                                    return 1409.
                                                } else {
                                                    if slot < 24303 or slot > 24309 { return -1. }
                                                    return 1410.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 24328 {
                                        if slot <= 24322 {
                                            if slot <= 24311 {
                                                if slot < 24310 or slot > 24311 { return -1. }
                                                return 1411.
                                            } else {
                                                if slot < 24312 or slot > 24322 { return -1. }
                                                return 1412.
                                            }
                                        } else {
                                            if slot <= 24324 {
                                                if slot < 24323 or slot > 24324 { return -1. }
                                                return 1413.
                                            } else {
                                                if slot < 24325 or slot > 24328 { return -1. }
                                                return 1414.
                                            }
                                        }
                                    } else {
                                        if slot <= 24446 {
                                            if slot <= 24330 {
                                                if slot < 24329 or slot > 24330 { return -1. }
                                                return 1415.
                                            } else {
                                                if slot < 24331 or slot > 24446 { return -1. }
                                                return 1416.
                                            }
                                        } else {
                                            if slot <= 24453 {
                                                if slot < 24447 or slot > 24453 { return -1. }
                                                return 1417.
                                            } else {
                                                if slot <= 24459 {
                                                    if slot < 24454 or slot > 24459 { return -1. }
                                                    return 1418.
                                                } else {
                                                    if slot < 24460 or slot > 24465 { return -1. }
                                                    return 1419.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 24831 {
                                if slot <= 24773 {
                                    if slot <= 24605 {
                                        if slot <= 24471 {
                                            if slot <= 24468 {
                                                if slot < 24466 or slot > 24468 { return -1. }
                                                return 1420.
                                            } else {
                                                if slot < 24469 or slot > 24471 { return -1. }
                                                return 1421.
                                            }
                                        } else {
                                            if slot <= 24604 {
                                                if slot < 24598 or slot > 24604 { return -1. }
                                                return 1422.
                                            } else {
                                                if slot < 24605 or slot > 24605 { return -1. }
                                                return 1423.
                                            }
                                        }
                                    } else {
                                        if slot <= 24731 {
                                            if slot <= 24726 {
                                                if slot < 24719 or slot > 24726 { return -1. }
                                                return 1424.
                                            } else {
                                                if slot < 24727 or slot > 24731 { return -1. }
                                                return 1425.
                                            }
                                        } else {
                                            if slot <= 24758 {
                                                if slot < 24732 or slot > 24758 { return -1. }
                                                return 1426.
                                            } else {
                                                if slot <= 24762 {
                                                    if slot < 24759 or slot > 24762 { return -1. }
                                                    return 1427.
                                                } else {
                                                    if slot < 24763 or slot > 24773 { return -1. }
                                                    return 1428.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 24795 {
                                        if slot <= 24781 {
                                            if slot <= 24776 {
                                                if slot < 24774 or slot > 24776 { return -1. }
                                                return 1429.
                                            } else {
                                                if slot < 24777 or slot > 24781 { return -1. }
                                                return 1430.
                                            }
                                        } else {
                                            if slot <= 24789 {
                                                if slot < 24782 or slot > 24789 { return -1. }
                                                return 1431.
                                            } else {
                                                if slot < 24790 or slot > 24795 { return -1. }
                                                return 1432.
                                            }
                                        }
                                    } else {
                                        if slot <= 24804 {
                                            if slot <= 24801 {
                                                if slot < 24796 or slot > 24801 { return -1. }
                                                return 1433.
                                            } else {
                                                if slot < 24802 or slot > 24804 { return -1. }
                                                return 1434.
                                            }
                                        } else {
                                            if slot <= 24809 {
                                                if slot < 24805 or slot > 24809 { return -1. }
                                                return 1435.
                                            } else {
                                                if slot <= 24822 {
                                                    if slot < 24810 or slot > 24822 { return -1. }
                                                    return 1436.
                                                } else {
                                                    if slot < 24823 or slot > 24831 { return -1. }
                                                    return 1437.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 24866 {
                                    if slot <= 24848 {
                                        if slot <= 24838 {
                                            if slot <= 24836 {
                                                if slot < 24832 or slot > 24836 { return -1. }
                                                return 1438.
                                            } else {
                                                if slot < 24837 or slot > 24838 { return -1. }
                                                return 1439.
                                            }
                                        } else {
                                            if slot <= 24846 {
                                                if slot < 24839 or slot > 24846 { return -1. }
                                                return 1440.
                                            } else {
                                                if slot < 24847 or slot > 24848 { return -1. }
                                                return 1441.
                                            }
                                        }
                                    } else {
                                        if slot <= 24858 {
                                            if slot <= 24850 {
                                                if slot < 24849 or slot > 24850 { return -1. }
                                                return 1442.
                                            } else {
                                                if slot < 24851 or slot > 24858 { return -1. }
                                                return 1443.
                                            }
                                        } else {
                                            if slot <= 24860 {
                                                if slot < 24859 or slot > 24860 { return -1. }
                                                return 1444.
                                            } else {
                                                if slot <= 24864 {
                                                    if slot < 24861 or slot > 24864 { return -1. }
                                                    return 1445.
                                                } else {
                                                    if slot < 24865 or slot > 24866 { return -1. }
                                                    return 1446.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 24883 {
                                        if slot <= 24873 {
                                            if slot <= 24870 {
                                                if slot < 24867 or slot > 24870 { return -1. }
                                                return 1447.
                                            } else {
                                                if slot < 24871 or slot > 24873 { return -1. }
                                                return 1448.
                                            }
                                        } else {
                                            if slot <= 24878 {
                                                if slot < 24874 or slot > 24878 { return -1. }
                                                return 1449.
                                            } else {
                                                if slot <= 24880 {
                                                    if slot < 24879 or slot > 24880 { return -1. }
                                                    return 1450.
                                                } else {
                                                    if slot < 24881 or slot > 24883 { return -1. }
                                                    return 1451.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 24891 {
                                            if slot <= 24889 {
                                                if slot < 24884 or slot > 24889 { return -1. }
                                                return 1452.
                                            } else {
                                                if slot < 24890 or slot > 24891 { return -1. }
                                                return 1453.
                                            }
                                        } else {
                                            if slot <= 24893 {
                                                if slot < 24892 or slot > 24893 { return -1. }
                                                return 1454.
                                            } else {
                                                if slot <= 24897 {
                                                    if slot < 24894 or slot > 24897 { return -1. }
                                                    return 1455.
                                                } else {
                                                    if slot < 24898 or slot > 24901 { return -1. }
                                                    return 1456.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                if slot <= 28021 {
                    if slot <= 26474 {
                        if slot <= 25674 {
                            if slot <= 24993 {
                                if slot <= 24947 {
                                    if slot <= 24931 {
                                        if slot <= 24905 {
                                            if slot <= 24903 {
                                                if slot < 24902 or slot > 24903 { return -1. }
                                                return 1457.
                                            } else {
                                                if slot < 24904 or slot > 24905 { return -1. }
                                                return 1458.
                                            }
                                        } else {
                                            if slot <= 24908 {
                                                if slot < 24906 or slot > 24908 { return -1. }
                                                return 1459.
                                            } else {
                                                if slot < 24909 or slot > 24931 { return -1. }
                                                return 1460.
                                            }
                                        }
                                    } else {
                                        if slot <= 24940 {
                                            if slot <= 24935 {
                                                if slot < 24932 or slot > 24935 { return -1. }
                                                return 1461.
                                            } else {
                                                if slot < 24936 or slot > 24940 { return -1. }
                                                return 1462.
                                            }
                                        } else {
                                            if slot <= 24941 {
                                                if slot < 24941 or slot > 24941 { return -1. }
                                                return 1463.
                                            } else {
                                                if slot <= 24945 {
                                                    if slot < 24942 or slot > 24945 { return -1. }
                                                    return 1464.
                                                } else {
                                                    if slot < 24946 or slot > 24947 { return -1. }
                                                    return 1465.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 24981 {
                                        if slot <= 24958 {
                                            if slot <= 24952 {
                                                if slot < 24948 or slot > 24952 { return -1. }
                                                return 1466.
                                            } else {
                                                if slot < 24953 or slot > 24958 { return -1. }
                                                return 1467.
                                            }
                                        } else {
                                            if slot <= 24962 {
                                                if slot < 24959 or slot > 24962 { return -1. }
                                                return 1468.
                                            } else {
                                                if slot < 24963 or slot > 24981 { return -1. }
                                                return 1469.
                                            }
                                        }
                                    } else {
                                        if slot <= 24986 {
                                            if slot <= 24983 {
                                                if slot < 24982 or slot > 24983 { return -1. }
                                                return 1470.
                                            } else {
                                                if slot < 24984 or slot > 24986 { return -1. }
                                                return 1471.
                                            }
                                        } else {
                                            if slot <= 24989 {
                                                if slot < 24987 or slot > 24989 { return -1. }
                                                return 1472.
                                            } else {
                                                if slot <= 24992 {
                                                    if slot < 24990 or slot > 24992 { return -1. }
                                                    return 1473.
                                                } else {
                                                    if slot < 24993 or slot > 24993 { return -1. }
                                                    return 1474.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 25610 {
                                    if slot <= 25536 {
                                        if slot <= 25532 {
                                            if slot <= 25521 {
                                                if slot < 25520 or slot > 25521 { return -1. }
                                                return 1475.
                                            } else {
                                                if slot < 25522 or slot > 25532 { return -1. }
                                                return 1476.
                                            }
                                        } else {
                                            if slot <= 25534 {
                                                if slot < 25533 or slot > 25534 { return -1. }
                                                return 1477.
                                            } else {
                                                if slot < 25535 or slot > 25536 { return -1. }
                                                return 1478.
                                            }
                                        }
                                    } else {
                                        if slot <= 25547 {
                                            if slot <= 25544 {
                                                if slot < 25537 or slot > 25544 { return -1. }
                                                return 1479.
                                            } else {
                                                if slot < 25545 or slot > 25547 { return -1. }
                                                return 1480.
                                            }
                                        } else {
                                            if slot <= 25597 {
                                                if slot < 25548 or slot > 25597 { return -1. }
                                                return 1481.
                                            } else {
                                                if slot <= 25598 {
                                                    if slot < 25598 or slot > 25598 { return -1. }
                                                    return 1482.
                                                } else {
                                                    if slot < 25600 or slot > 25610 { return -1. }
                                                    return 1483.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 25640 {
                                        if slot <= 25627 {
                                            if slot <= 25613 {
                                                if slot < 25611 or slot > 25613 { return -1. }
                                                return 1484.
                                            } else {
                                                if slot < 25614 or slot > 25627 { return -1. }
                                                return 1485.
                                            }
                                        } else {
                                            if slot <= 25637 {
                                                if slot < 25628 or slot > 25637 { return -1. }
                                                return 1486.
                                            } else {
                                                if slot < 25638 or slot > 25640 { return -1. }
                                                return 1487.
                                            }
                                        }
                                    } else {
                                        if slot <= 25656 {
                                            if slot <= 25643 {
                                                if slot < 25641 or slot > 25643 { return -1. }
                                                return 1488.
                                            } else {
                                                if slot < 25644 or slot > 25656 { return -1. }
                                                return 1489.
                                            }
                                        } else {
                                            if slot <= 25665 {
                                                if slot < 25657 or slot > 25665 { return -1. }
                                                return 1490.
                                            } else {
                                                if slot <= 25667 {
                                                    if slot < 25666 or slot > 25667 { return -1. }
                                                    return 1491.
                                                } else {
                                                    if slot < 25668 or slot > 25674 { return -1. }
                                                    return 1492.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 25998 {
                                if slot <= 25869 {
                                    if slot <= 25825 {
                                        if slot <= 25818 {
                                            if slot <= 25815 {
                                                if slot < 25675 or slot > 25815 { return -1. }
                                                return 1493.
                                            } else {
                                                if slot < 25816 or slot > 25818 { return -1. }
                                                return 1494.
                                            }
                                        } else {
                                            if slot <= 25823 {
                                                if slot < 25819 or slot > 25823 { return -1. }
                                                return 1495.
                                            } else {
                                                if slot < 25824 or slot > 25825 { return -1. }
                                                return 1496.
                                            }
                                        }
                                    } else {
                                        if slot <= 25856 {
                                            if slot <= 25826 {
                                                if slot < 25826 or slot > 25826 { return -1. }
                                                return 1497.
                                            } else {
                                                if slot < 25855 or slot > 25856 { return -1. }
                                                return 1498.
                                            }
                                        } else {
                                            if slot <= 25862 {
                                                if slot < 25857 or slot > 25862 { return -1. }
                                                return 1499.
                                            } else {
                                                if slot <= 25865 {
                                                    if slot < 25863 or slot > 25865 { return -1. }
                                                    return 1500.
                                                } else {
                                                    if slot < 25866 or slot > 25869 { return -1. }
                                                    return 1501.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 25907 {
                                        if slot <= 25884 {
                                            if slot <= 25882 {
                                                if slot < 25870 or slot > 25882 { return -1. }
                                                return 1502.
                                            } else {
                                                if slot < 25883 or slot > 25884 { return -1. }
                                                return 1503.
                                            }
                                        } else {
                                            if slot <= 25898 {
                                                if slot < 25885 or slot > 25898 { return -1. }
                                                return 1504.
                                            } else {
                                                if slot < 25899 or slot > 25907 { return -1. }
                                                return 1505.
                                            }
                                        }
                                    } else {
                                        if slot <= 25953 {
                                            if slot <= 25923 {
                                                if slot < 25908 or slot > 25923 { return -1. }
                                                return 1506.
                                            } else {
                                                if slot < 25924 or slot > 25953 { return -1. }
                                                return 1507.
                                            }
                                        } else {
                                            if slot <= 25957 {
                                                if slot < 25954 or slot > 25957 { return -1. }
                                                return 1508.
                                            } else {
                                                if slot <= 25997 {
                                                    if slot < 25996 or slot > 25997 { return -1. }
                                                    return 1509.
                                                } else {
                                                    if slot < 25998 or slot > 25998 { return -1. }
                                                    return 1510.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 26371 {
                                    if slot <= 26091 {
                                        if slot <= 26084 {
                                            if slot <= 26082 {
                                                if slot < 26041 or slot > 26082 { return -1. }
                                                return 1511.
                                            } else {
                                                if slot < 26083 or slot > 26084 { return -1. }
                                                return 1512.
                                            }
                                        } else {
                                            if slot <= 26089 {
                                                if slot < 26085 or slot > 26089 { return -1. }
                                                return 1513.
                                            } else {
                                                if slot < 26090 or slot > 26091 { return -1. }
                                                return 1514.
                                            }
                                        }
                                    } else {
                                        if slot <= 26345 {
                                            if slot <= 26092 {
                                                if slot < 26092 or slot > 26092 { return -1. }
                                                return 1515.
                                            } else {
                                                if slot < 26332 or slot > 26345 { return -1. }
                                                return 1516.
                                            }
                                        } else {
                                            if slot <= 26346 {
                                                if slot < 26346 or slot > 26346 { return -1. }
                                                return 1517.
                                            } else {
                                                if slot <= 26367 {
                                                    if slot < 26363 or slot > 26367 { return -1. }
                                                    return 1518.
                                                } else {
                                                    if slot < 26368 or slot > 26371 { return -1. }
                                                    return 1519.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 26441 {
                                        if slot <= 26384 {
                                            if slot <= 26373 {
                                                if slot < 26372 or slot > 26373 { return -1. }
                                                return 1520.
                                            } else {
                                                if slot < 26374 or slot > 26384 { return -1. }
                                                return 1521.
                                            }
                                        } else {
                                            if slot <= 26404 {
                                                if slot < 26385 or slot > 26404 { return -1. }
                                                return 1522.
                                            } else {
                                                if slot <= 26417 {
                                                    if slot < 26405 or slot > 26417 { return -1. }
                                                    return 1523.
                                                } else {
                                                    if slot < 26418 or slot > 26441 { return -1. }
                                                    return 1524.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 26465 {
                                            if slot <= 26450 {
                                                if slot < 26442 or slot > 26450 { return -1. }
                                                return 1525.
                                            } else {
                                                if slot < 26451 or slot > 26465 { return -1. }
                                                return 1526.
                                            }
                                        } else {
                                            if slot <= 26470 {
                                                if slot < 26466 or slot > 26470 { return -1. }
                                                return 1527.
                                            } else {
                                                if slot <= 26472 {
                                                    if slot < 26471 or slot > 26472 { return -1. }
                                                    return 1528.
                                                } else {
                                                    if slot < 26473 or slot > 26474 { return -1. }
                                                    return 1529.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 26845 {
                            if slot <= 26645 {
                                if slot <= 26551 {
                                    if slot <= 26515 {
                                        if slot <= 26506 {
                                            if slot <= 26477 {
                                                if slot < 26475 or slot > 26477 { return -1. }
                                                return 1530.
                                            } else {
                                                if slot < 26478 or slot > 26506 { return -1. }
                                                return 1531.
                                            }
                                        } else {
                                            if slot <= 26512 {
                                                if slot < 26507 or slot > 26512 { return -1. }
                                                return 1532.
                                            } else {
                                                if slot < 26513 or slot > 26515 { return -1. }
                                                return 1533.
                                            }
                                        }
                                    } else {
                                        if slot <= 26531 {
                                            if slot <= 26516 {
                                                if slot < 26516 or slot > 26516 { return -1. }
                                                return 1534.
                                            } else {
                                                if slot < 26517 or slot > 26531 { return -1. }
                                                return 1535.
                                            }
                                        } else {
                                            if slot <= 26536 {
                                                if slot < 26532 or slot > 26536 { return -1. }
                                                return 1536.
                                            } else {
                                                if slot <= 26540 {
                                                    if slot < 26537 or slot > 26540 { return -1. }
                                                    return 1537.
                                                } else {
                                                    if slot < 26541 or slot > 26551 { return -1. }
                                                    return 1538.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 26600 {
                                        if slot <= 26560 {
                                            if slot <= 26556 {
                                                if slot < 26552 or slot > 26556 { return -1. }
                                                return 1539.
                                            } else {
                                                if slot < 26557 or slot > 26560 { return -1. }
                                                return 1540.
                                            }
                                        } else {
                                            if slot <= 26585 {
                                                if slot < 26561 or slot > 26585 { return -1. }
                                                return 1541.
                                            } else {
                                                if slot < 26586 or slot > 26600 { return -1. }
                                                return 1542.
                                            }
                                        }
                                    } else {
                                        if slot <= 26625 {
                                            if slot <= 26610 {
                                                if slot < 26601 or slot > 26610 { return -1. }
                                                return 1543.
                                            } else {
                                                if slot < 26624 or slot > 26625 { return -1. }
                                                return 1544.
                                            }
                                        } else {
                                            if slot <= 26627 {
                                                if slot < 26626 or slot > 26627 { return -1. }
                                                return 1545.
                                            } else {
                                                if slot <= 26642 {
                                                    if slot < 26628 or slot > 26642 { return -1. }
                                                    return 1546.
                                                } else {
                                                    if slot < 26643 or slot > 26645 { return -1. }
                                                    return 1547.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 26742 {
                                    if slot <= 26684 {
                                        if slot <= 26678 {
                                            if slot <= 26674 {
                                                if slot < 26646 or slot > 26674 { return -1. }
                                                return 1548.
                                            } else {
                                                if slot < 26675 or slot > 26678 { return -1. }
                                                return 1549.
                                            }
                                        } else {
                                            if slot <= 26682 {
                                                if slot < 26679 or slot > 26682 { return -1. }
                                                return 1550.
                                            } else {
                                                if slot < 26683 or slot > 26684 { return -1. }
                                                return 1551.
                                            }
                                        }
                                    } else {
                                        if slot <= 26698 {
                                            if slot <= 26696 {
                                                if slot < 26685 or slot > 26696 { return -1. }
                                                return 1552.
                                            } else {
                                                if slot < 26697 or slot > 26698 { return -1. }
                                                return 1553.
                                            }
                                        } else {
                                            if slot <= 26724 {
                                                if slot < 26699 or slot > 26724 { return -1. }
                                                return 1554.
                                            } else {
                                                if slot <= 26727 {
                                                    if slot < 26725 or slot > 26727 { return -1. }
                                                    return 1555.
                                                } else {
                                                    if slot < 26728 or slot > 26742 { return -1. }
                                                    return 1556.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 26784 {
                                        if slot <= 26754 {
                                            if slot <= 26751 {
                                                if slot < 26743 or slot > 26751 { return -1. }
                                                return 1557.
                                            } else {
                                                if slot < 26752 or slot > 26754 { return -1. }
                                                return 1558.
                                            }
                                        } else {
                                            if slot <= 26770 {
                                                if slot < 26755 or slot > 26770 { return -1. }
                                                return 1559.
                                            } else {
                                                if slot < 26771 or slot > 26784 { return -1. }
                                                return 1560.
                                            }
                                        }
                                    } else {
                                        if slot <= 26814 {
                                            if slot <= 26810 {
                                                if slot < 26785 or slot > 26810 { return -1. }
                                                return 1561.
                                            } else {
                                                if slot < 26811 or slot > 26814 { return -1. }
                                                return 1562.
                                            }
                                        } else {
                                            if slot <= 26818 {
                                                if slot < 26815 or slot > 26818 { return -1. }
                                                return 1563.
                                            } else {
                                                if slot <= 26820 {
                                                    if slot < 26819 or slot > 26820 { return -1. }
                                                    return 1564.
                                                } else {
                                                    if slot < 26821 or slot > 26845 { return -1. }
                                                    return 1565.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 27667 {
                                if slot <= 27297 {
                                    if slot <= 27084 {
                                        if slot <= 26851 {
                                            if slot <= 26847 {
                                                if slot < 26846 or slot > 26847 { return -1. }
                                                return 1566.
                                            } else {
                                                if slot < 26848 or slot > 26851 { return -1. }
                                                return 1567.
                                            }
                                        } else {
                                            if slot <= 27082 {
                                                if slot < 26852 or slot > 27082 { return -1. }
                                                return 1568.
                                            } else {
                                                if slot < 27083 or slot > 27084 { return -1. }
                                                return 1569.
                                            }
                                        }
                                    } else {
                                        if slot <= 27193 {
                                            if slot <= 27096 {
                                                if slot < 27085 or slot > 27096 { return -1. }
                                                return 1570.
                                            } else {
                                                if slot < 27097 or slot > 27193 { return -1. }
                                                return 1571.
                                            }
                                        } else {
                                            if slot <= 27196 {
                                                if slot < 27194 or slot > 27196 { return -1. }
                                                return 1572.
                                            } else {
                                                if slot <= 27248 {
                                                    if slot < 27197 or slot > 27248 { return -1. }
                                                    return 1573.
                                                } else {
                                                    if slot < 27249 or slot > 27297 { return -1. }
                                                    return 1574.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 27321 {
                                        if slot <= 27314 {
                                            if slot <= 27300 {
                                                if slot < 27298 or slot > 27300 { return -1. }
                                                return 1575.
                                            } else {
                                                if slot < 27301 or slot > 27314 { return -1. }
                                                return 1576.
                                            }
                                        } else {
                                            if slot <= 27318 {
                                                if slot < 27315 or slot > 27318 { return -1. }
                                                return 1577.
                                            } else {
                                                if slot < 27319 or slot > 27321 { return -1. }
                                                return 1578.
                                            }
                                        }
                                    } else {
                                        if slot <= 27326 {
                                            if slot <= 27325 {
                                                if slot < 27322 or slot > 27325 { return -1. }
                                                return 1579.
                                            } else {
                                                if slot < 27326 or slot > 27326 { return -1. }
                                                return 1580.
                                            }
                                        } else {
                                            if slot <= 27651 {
                                                if slot < 27648 or slot > 27651 { return -1. }
                                                return 1581.
                                            } else {
                                                if slot <= 27654 {
                                                    if slot < 27652 or slot > 27654 { return -1. }
                                                    return 1582.
                                                } else {
                                                    if slot < 27655 or slot > 27667 { return -1. }
                                                    return 1583.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 27911 {
                                    if slot <= 27852 {
                                        if slot <= 27733 {
                                            if slot <= 27673 {
                                                if slot < 27668 or slot > 27673 { return -1. }
                                                return 1584.
                                            } else {
                                                if slot < 27674 or slot > 27733 { return -1. }
                                                return 1585.
                                            }
                                        } else {
                                            if slot <= 27849 {
                                                if slot < 27734 or slot > 27849 { return -1. }
                                                return 1586.
                                            } else {
                                                if slot < 27850 or slot > 27852 { return -1. }
                                                return 1587.
                                            }
                                        }
                                    } else {
                                        if slot <= 27860 {
                                            if slot <= 27855 {
                                                if slot < 27853 or slot > 27855 { return -1. }
                                                return 1588.
                                            } else {
                                                if slot < 27856 or slot > 27860 { return -1. }
                                                return 1589.
                                            }
                                        } else {
                                            if slot <= 27861 {
                                                if slot < 27861 or slot > 27861 { return -1. }
                                                return 1590.
                                            } else {
                                                if slot <= 27908 {
                                                    if slot < 27907 or slot > 27908 { return -1. }
                                                    return 1591.
                                                } else {
                                                    if slot < 27909 or slot > 27911 { return -1. }
                                                    return 1592.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 27970 {
                                        if slot <= 27939 {
                                            if slot <= 27928 {
                                                if slot < 27912 or slot > 27928 { return -1. }
                                                return 1593.
                                            } else {
                                                if slot < 27929 or slot > 27939 { return -1. }
                                                return 1594.
                                            }
                                        } else {
                                            if slot <= 27942 {
                                                if slot < 27940 or slot > 27942 { return -1. }
                                                return 1595.
                                            } else {
                                                if slot <= 27967 {
                                                    if slot < 27943 or slot > 27967 { return -1. }
                                                    return 1596.
                                                } else {
                                                    if slot < 27968 or slot > 27970 { return -1. }
                                                    return 1597.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 28006 {
                                            if slot <= 27993 {
                                                if slot < 27971 or slot > 27993 { return -1. }
                                                return 1598.
                                            } else {
                                                if slot < 27994 or slot > 28006 { return -1. }
                                                return 1599.
                                            }
                                        } else {
                                            if slot <= 28009 {
                                                if slot < 28007 or slot > 28009 { return -1. }
                                                return 1600.
                                            } else {
                                                if slot <= 28014 {
                                                    if slot < 28010 or slot > 28014 { return -1. }
                                                    return 1601.
                                                } else {
                                                    if slot < 28015 or slot > 28021 { return -1. }
                                                    return 1602.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    if slot <= 30072 {
                        if slot <= 29783 {
                            if slot <= 28237 {
                                if slot <= 28072 {
                                    if slot <= 28042 {
                                        if slot <= 28029 {
                                            if slot <= 28024 {
                                                if slot < 28022 or slot > 28024 { return -1. }
                                                return 1603.
                                            } else {
                                                if slot < 28025 or slot > 28029 { return -1. }
                                                return 1604.
                                            }
                                        } else {
                                            if slot <= 28040 {
                                                if slot < 28030 or slot > 28040 { return -1. }
                                                return 1605.
                                            } else {
                                                if slot < 28041 or slot > 28042 { return -1. }
                                                return 1606.
                                            }
                                        }
                                    } else {
                                        if slot <= 28048 {
                                            if slot <= 28046 {
                                                if slot < 28043 or slot > 28046 { return -1. }
                                                return 1607.
                                            } else {
                                                if slot < 28047 or slot > 28048 { return -1. }
                                                return 1608.
                                            }
                                        } else {
                                            if slot <= 28050 {
                                                if slot < 28049 or slot > 28050 { return -1. }
                                                return 1609.
                                            } else {
                                                if slot <= 28065 {
                                                    if slot < 28051 or slot > 28065 { return -1. }
                                                    return 1610.
                                                } else {
                                                    if slot < 28066 or slot > 28072 { return -1. }
                                                    return 1611.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 28094 {
                                        if slot <= 28085 {
                                            if slot <= 28075 {
                                                if slot < 28073 or slot > 28075 { return -1. }
                                                return 1612.
                                            } else {
                                                if slot < 28076 or slot > 28085 { return -1. }
                                                return 1613.
                                            }
                                        } else {
                                            if slot <= 28088 {
                                                if slot < 28086 or slot > 28088 { return -1. }
                                                return 1614.
                                            } else {
                                                if slot < 28089 or slot > 28094 { return -1. }
                                                return 1615.
                                            }
                                        }
                                    } else {
                                        if slot <= 28120 {
                                            if slot <= 28118 {
                                                if slot < 28095 or slot > 28118 { return -1. }
                                                return 1616.
                                            } else {
                                                if slot < 28119 or slot > 28120 { return -1. }
                                                return 1617.
                                            }
                                        } else {
                                            if slot <= 28189 {
                                                if slot < 28121 or slot > 28189 { return -1. }
                                                return 1618.
                                            } else {
                                                if slot <= 28234 {
                                                    if slot < 28190 or slot > 28234 { return -1. }
                                                    return 1619.
                                                } else {
                                                    if slot < 28235 or slot > 28237 { return -1. }
                                                    return 1620.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 29721 {
                                    if slot <= 28856 {
                                        if slot <= 28250 {
                                            if slot <= 28244 {
                                                if slot < 28238 or slot > 28244 { return -1. }
                                                return 1621.
                                            } else {
                                                if slot < 28245 or slot > 28250 { return -1. }
                                                return 1622.
                                            }
                                        } else {
                                            if slot <= 28253 {
                                                if slot < 28251 or slot > 28253 { return -1. }
                                                return 1623.
                                            } else {
                                                if slot < 28852 or slot > 28856 { return -1. }
                                                return 1624.
                                            }
                                        }
                                    } else {
                                        if slot <= 29254 {
                                            if slot <= 29253 {
                                                if slot < 28857 or slot > 29253 { return -1. }
                                                return 1625.
                                            } else {
                                                if slot < 29254 or slot > 29254 { return -1. }
                                                return 1626.
                                            }
                                        } else {
                                            if slot <= 29698 {
                                                if slot < 29696 or slot > 29698 { return -1. }
                                                return 1627.
                                            } else {
                                                if slot <= 29719 {
                                                    if slot < 29700 or slot > 29719 { return -1. }
                                                    return 1628.
                                                } else {
                                                    if slot < 29720 or slot > 29721 { return -1. }
                                                    return 1629.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 29753 {
                                        if slot <= 29745 {
                                            if slot <= 29743 {
                                                if slot < 29722 or slot > 29743 { return -1. }
                                                return 1630.
                                            } else {
                                                if slot < 29744 or slot > 29745 { return -1. }
                                                return 1631.
                                            }
                                        } else {
                                            if slot <= 29751 {
                                                if slot < 29746 or slot > 29751 { return -1. }
                                                return 1632.
                                            } else {
                                                if slot < 29752 or slot > 29753 { return -1. }
                                                return 1633.
                                            }
                                        }
                                    } else {
                                        if slot <= 29765 {
                                            if slot <= 29760 {
                                                if slot < 29754 or slot > 29760 { return -1. }
                                                return 1634.
                                            } else {
                                                if slot < 29761 or slot > 29765 { return -1. }
                                                return 1635.
                                            }
                                        } else {
                                            if slot <= 29771 {
                                                if slot < 29766 or slot > 29771 { return -1. }
                                                return 1636.
                                            } else {
                                                if slot <= 29777 {
                                                    if slot < 29772 or slot > 29777 { return -1. }
                                                    return 1637.
                                                } else {
                                                    if slot < 29778 or slot > 29783 { return -1. }
                                                    return 1638.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 29926 {
                                if slot <= 29880 {
                                    if slot <= 29810 {
                                        if slot <= 29794 {
                                            if slot <= 29786 {
                                                if slot < 29784 or slot > 29786 { return -1. }
                                                return 1639.
                                            } else {
                                                if slot < 29787 or slot > 29794 { return -1. }
                                                return 1640.
                                            }
                                        } else {
                                            if slot <= 29801 {
                                                if slot < 29795 or slot > 29801 { return -1. }
                                                return 1641.
                                            } else {
                                                if slot < 29802 or slot > 29810 { return -1. }
                                                return 1642.
                                            }
                                        }
                                    } else {
                                        if slot <= 29817 {
                                            if slot <= 29814 {
                                                if slot < 29811 or slot > 29814 { return -1. }
                                                return 1643.
                                            } else {
                                                if slot < 29815 or slot > 29817 { return -1. }
                                                return 1644.
                                            }
                                        } else {
                                            if slot <= 29843 {
                                                if slot < 29818 or slot > 29843 { return -1. }
                                                return 1645.
                                            } else {
                                                if slot <= 29850 {
                                                    if slot < 29844 or slot > 29850 { return -1. }
                                                    return 1646.
                                                } else {
                                                    if slot < 29851 or slot > 29880 { return -1. }
                                                    return 1647.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 29897 {
                                        if slot <= 29884 {
                                            if slot <= 29881 {
                                                if slot < 29881 or slot > 29881 { return -1. }
                                                return 1648.
                                            } else {
                                                if slot < 29882 or slot > 29884 { return -1. }
                                                return 1649.
                                            }
                                        } else {
                                            if slot <= 29889 {
                                                if slot < 29885 or slot > 29889 { return -1. }
                                                return 1650.
                                            } else {
                                                if slot < 29890 or slot > 29897 { return -1. }
                                                return 1651.
                                            }
                                        }
                                    } else {
                                        if slot <= 29915 {
                                            if slot <= 29899 {
                                                if slot < 29898 or slot > 29899 { return -1. }
                                                return 1652.
                                            } else {
                                                if slot < 29900 or slot > 29915 { return -1. }
                                                return 1653.
                                            }
                                        } else {
                                            if slot <= 29919 {
                                                if slot < 29916 or slot > 29919 { return -1. }
                                                return 1654.
                                            } else {
                                                if slot <= 29924 {
                                                    if slot < 29920 or slot > 29924 { return -1. }
                                                    return 1655.
                                                } else {
                                                    if slot < 29925 or slot > 29926 { return -1. }
                                                    return 1656.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 29997 {
                                    if slot <= 29966 {
                                        if slot <= 29931 {
                                            if slot <= 29929 {
                                                if slot < 29927 or slot > 29929 { return -1. }
                                                return 1657.
                                            } else {
                                                if slot < 29930 or slot > 29931 { return -1. }
                                                return 1658.
                                            }
                                        } else {
                                            if slot <= 29939 {
                                                if slot < 29932 or slot > 29939 { return -1. }
                                                return 1659.
                                            } else {
                                                if slot < 29940 or slot > 29966 { return -1. }
                                                return 1660.
                                            }
                                        }
                                    } else {
                                        if slot <= 29981 {
                                            if slot <= 29972 {
                                                if slot < 29967 or slot > 29972 { return -1. }
                                                return 1661.
                                            } else {
                                                if slot < 29973 or slot > 29981 { return -1. }
                                                return 1662.
                                            }
                                        } else {
                                            if slot <= 29992 {
                                                if slot < 29982 or slot > 29992 { return -1. }
                                                return 1663.
                                            } else {
                                                if slot <= 29994 {
                                                    if slot < 29993 or slot > 29994 { return -1. }
                                                    return 1664.
                                                } else {
                                                    if slot < 29995 or slot > 29997 { return -1. }
                                                    return 1665.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 30036 {
                                        if slot <= 30026 {
                                            if slot <= 30019 {
                                                if slot < 29998 or slot > 30019 { return -1. }
                                                return 1666.
                                            } else {
                                                if slot < 30020 or slot > 30026 { return -1. }
                                                return 1667.
                                            }
                                        } else {
                                            if slot <= 30030 {
                                                if slot < 30027 or slot > 30030 { return -1. }
                                                return 1668.
                                            } else {
                                                if slot <= 30032 {
                                                    if slot < 30031 or slot > 30032 { return -1. }
                                                    return 1669.
                                                } else {
                                                    if slot < 30033 or slot > 30036 { return -1. }
                                                    return 1670.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 30061 {
                                            if slot <= 30054 {
                                                if slot < 30037 or slot > 30054 { return -1. }
                                                return 1671.
                                            } else {
                                                if slot < 30055 or slot > 30061 { return -1. }
                                                return 1672.
                                            }
                                        } else {
                                            if slot <= 30063 {
                                                if slot < 30062 or slot > 30063 { return -1. }
                                                return 1673.
                                            } else {
                                                if slot <= 30070 {
                                                    if slot < 30064 or slot > 30070 { return -1. }
                                                    return 1674.
                                                } else {
                                                    if slot < 30071 or slot > 30072 { return -1. }
                                                    return 1675.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 30507 {
                            if slot <= 30390 {
                                if slot <= 30259 {
                                    if slot <= 30104 {
                                        if slot <= 30082 {
                                            if slot <= 30081 {
                                                if slot < 30073 or slot > 30081 { return -1. }
                                                return 1676.
                                            } else {
                                                if slot < 30082 or slot > 30082 { return -1. }
                                                return 1677.
                                            }
                                        } else {
                                            if slot <= 30100 {
                                                if slot < 30083 or slot > 30100 { return -1. }
                                                return 1678.
                                            } else {
                                                if slot < 30101 or slot > 30104 { return -1. }
                                                return 1679.
                                            }
                                        }
                                    } else {
                                        if slot <= 30116 {
                                            if slot <= 30108 {
                                                if slot < 30105 or slot > 30108 { return -1. }
                                                return 1680.
                                            } else {
                                                if slot < 30109 or slot > 30116 { return -1. }
                                                return 1681.
                                            }
                                        } else {
                                            if slot <= 30235 {
                                                if slot < 30117 or slot > 30235 { return -1. }
                                                return 1682.
                                            } else {
                                                if slot <= 30257 {
                                                    if slot < 30236 or slot > 30257 { return -1. }
                                                    return 1683.
                                                } else {
                                                    if slot < 30258 or slot > 30259 { return -1. }
                                                    return 1684.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 30275 {
                                        if slot <= 30269 {
                                            if slot <= 30262 {
                                                if slot < 30260 or slot > 30262 { return -1. }
                                                return 1685.
                                            } else {
                                                if slot < 30263 or slot > 30269 { return -1. }
                                                return 1686.
                                            }
                                        } else {
                                            if slot <= 30272 {
                                                if slot < 30270 or slot > 30272 { return -1. }
                                                return 1687.
                                            } else {
                                                if slot < 30273 or slot > 30275 { return -1. }
                                                return 1688.
                                            }
                                        }
                                    } else {
                                        if slot <= 30296 {
                                            if slot <= 30277 {
                                                if slot < 30276 or slot > 30277 { return -1. }
                                                return 1689.
                                            } else {
                                                if slot < 30278 or slot > 30296 { return -1. }
                                                return 1690.
                                            }
                                        } else {
                                            if slot <= 30302 {
                                                if slot < 30297 or slot > 30302 { return -1. }
                                                return 1691.
                                            } else {
                                                if slot <= 30342 {
                                                    if slot < 30303 or slot > 30342 { return -1. }
                                                    return 1692.
                                                } else {
                                                    if slot < 30343 or slot > 30390 { return -1. }
                                                    return 1693.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 30454 {
                                    if slot <= 30419 {
                                        if slot <= 30404 {
                                            if slot <= 30402 {
                                                if slot < 30391 or slot > 30402 { return -1. }
                                                return 1694.
                                            } else {
                                                if slot < 30403 or slot > 30404 { return -1. }
                                                return 1695.
                                            }
                                        } else {
                                            if slot <= 30414 {
                                                if slot < 30405 or slot > 30414 { return -1. }
                                                return 1696.
                                            } else {
                                                if slot < 30415 or slot > 30419 { return -1. }
                                                return 1697.
                                            }
                                        }
                                    } else {
                                        if slot <= 30428 {
                                            if slot <= 30424 {
                                                if slot < 30420 or slot > 30424 { return -1. }
                                                return 1698.
                                            } else {
                                                if slot < 30425 or slot > 30428 { return -1. }
                                                return 1699.
                                            }
                                        } else {
                                            if slot <= 30444 {
                                                if slot < 30429 or slot > 30444 { return -1. }
                                                return 1700.
                                            } else {
                                                if slot <= 30447 {
                                                    if slot < 30445 or slot > 30447 { return -1. }
                                                    return 1701.
                                                } else {
                                                    if slot < 30448 or slot > 30454 { return -1. }
                                                    return 1702.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 30470 {
                                        if slot <= 30459 {
                                            if slot <= 30457 {
                                                if slot < 30455 or slot > 30457 { return -1. }
                                                return 1703.
                                            } else {
                                                if slot < 30458 or slot > 30459 { return -1. }
                                                return 1704.
                                            }
                                        } else {
                                            if slot <= 30462 {
                                                if slot < 30460 or slot > 30462 { return -1. }
                                                return 1705.
                                            } else {
                                                if slot < 30463 or slot > 30470 { return -1. }
                                                return 1706.
                                            }
                                        }
                                    } else {
                                        if slot <= 30495 {
                                            if slot <= 30493 {
                                                if slot < 30471 or slot > 30493 { return -1. }
                                                return 1707.
                                            } else {
                                                if slot < 30494 or slot > 30495 { return -1. }
                                                return 1708.
                                            }
                                        } else {
                                            if slot <= 30497 {
                                                if slot < 30496 or slot > 30497 { return -1. }
                                                return 1709.
                                            } else {
                                                if slot <= 30500 {
                                                    if slot < 30498 or slot > 30500 { return -1. }
                                                    return 1710.
                                                } else {
                                                    if slot < 30501 or slot > 30507 { return -1. }
                                                    return 1711.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 30620 {
                                if slot <= 30595 {
                                    if slot <= 30521 {
                                        if slot <= 30514 {
                                            if slot <= 30511 {
                                                if slot < 30508 or slot > 30511 { return -1. }
                                                return 1712.
                                            } else {
                                                if slot < 30512 or slot > 30514 { return -1. }
                                                return 1713.
                                            }
                                        } else {
                                            if slot <= 30518 {
                                                if slot < 30515 or slot > 30518 { return -1. }
                                                return 1714.
                                            } else {
                                                if slot < 30519 or slot > 30521 { return -1. }
                                                return 1715.
                                            }
                                        }
                                    } else {
                                        if slot <= 30560 {
                                            if slot <= 30528 {
                                                if slot < 30522 or slot > 30528 { return -1. }
                                                return 1716.
                                            } else {
                                                if slot < 30529 or slot > 30560 { return -1. }
                                                return 1717.
                                            }
                                        } else {
                                            if slot <= 30579 {
                                                if slot < 30561 or slot > 30579 { return -1. }
                                                return 1718.
                                            } else {
                                                if slot <= 30581 {
                                                    if slot < 30580 or slot > 30581 { return -1. }
                                                    return 1719.
                                                } else {
                                                    if slot < 30582 or slot > 30595 { return -1. }
                                                    return 1720.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 30611 {
                                        if slot <= 30607 {
                                            if slot <= 30598 {
                                                if slot < 30596 or slot > 30598 { return -1. }
                                                return 1721.
                                            } else {
                                                if slot < 30599 or slot > 30607 { return -1. }
                                                return 1722.
                                            }
                                        } else {
                                            if slot <= 30609 {
                                                if slot < 30608 or slot > 30609 { return -1. }
                                                return 1723.
                                            } else {
                                                if slot < 30610 or slot > 30611 { return -1. }
                                                return 1724.
                                            }
                                        }
                                    } else {
                                        if slot <= 30615 {
                                            if slot <= 30613 {
                                                if slot < 30612 or slot > 30613 { return -1. }
                                                return 1725.
                                            } else {
                                                if slot < 30614 or slot > 30615 { return -1. }
                                                return 1726.
                                            }
                                        } else {
                                            if slot <= 30617 {
                                                if slot < 30616 or slot > 30617 { return -1. }
                                                return 1727.
                                            } else {
                                                if slot <= 30619 {
                                                    if slot < 30618 or slot > 30619 { return -1. }
                                                    return 1728.
                                                } else {
                                                    if slot < 30620 or slot > 30620 { return -1. }
                                                    return 1729.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 30701 {
                                    if slot <= 30650 {
                                        if slot <= 30641 {
                                            if slot <= 30632 {
                                                if slot < 30621 or slot > 30632 { return -1. }
                                                return 1730.
                                            } else {
                                                if slot < 30633 or slot > 30641 { return -1. }
                                                return 1731.
                                            }
                                        } else {
                                            if slot <= 30643 {
                                                if slot < 30642 or slot > 30643 { return -1. }
                                                return 1732.
                                            } else {
                                                if slot < 30644 or slot > 30650 { return -1. }
                                                return 1733.
                                            }
                                        }
                                    } else {
                                        if slot <= 30689 {
                                            if slot <= 30658 {
                                                if slot < 30651 or slot > 30658 { return -1. }
                                                return 1734.
                                            } else {
                                                if slot < 30659 or slot > 30689 { return -1. }
                                                return 1735.
                                            }
                                        } else {
                                            if slot <= 30694 {
                                                if slot < 30690 or slot > 30694 { return -1. }
                                                return 1736.
                                            } else {
                                                if slot <= 30698 {
                                                    if slot < 30695 or slot > 30698 { return -1. }
                                                    return 1737.
                                                } else {
                                                    if slot < 30699 or slot > 30701 { return -1. }
                                                    return 1738.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 30764 {
                                        if slot <= 30714 {
                                            if slot <= 30710 {
                                                if slot < 30702 or slot > 30710 { return -1. }
                                                return 1739.
                                            } else {
                                                if slot < 30711 or slot > 30714 { return -1. }
                                                return 1740.
                                            }
                                        } else {
                                            if slot <= 30715 {
                                                if slot < 30715 or slot > 30715 { return -1. }
                                                return 1741.
                                            } else {
                                                if slot <= 30754 {
                                                    if slot < 30722 or slot > 30754 { return -1. }
                                                    return 1742.
                                                } else {
                                                    if slot < 30755 or slot > 30764 { return -1. }
                                                    return 1743.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 30771 {
                                            if slot <= 30767 {
                                                if slot < 30765 or slot > 30767 { return -1. }
                                                return 1744.
                                            } else {
                                                if slot < 30768 or slot > 30771 { return -1. }
                                                return 1745.
                                            }
                                        } else {
                                            if slot <= 30773 {
                                                if slot < 30772 or slot > 30773 { return -1. }
                                                return 1746.
                                            } else {
                                                if slot <= 30775 {
                                                    if slot < 30774 or slot > 30775 { return -1. }
                                                    return 1747.
                                                } else {
                                                    if slot < 30776 or slot > 30779 { return -1. }
                                                    return 1748.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } else {
            if slot <= 35557 {
                if slot <= 34020 {
                    if slot <= 32289 {
                        if slot <= 31442 {
                            if slot <= 31034 {
                                if slot <= 30922 {
                                    if slot <= 30865 {
                                        if slot <= 30798 {
                                            if slot <= 30782 {
                                                if slot < 30780 or slot > 30782 { return -1. }
                                                return 1749.
                                            } else {
                                                if slot < 30783 or slot > 30798 { return -1. }
                                                return 1750.
                                            }
                                        } else {
                                            if slot <= 30863 {
                                                if slot < 30799 or slot > 30863 { return -1. }
                                                return 1751.
                                            } else {
                                                if slot < 30864 or slot > 30865 { return -1. }
                                                return 1752.
                                            }
                                        }
                                    } else {
                                        if slot <= 30888 {
                                            if slot <= 30885 {
                                                if slot < 30866 or slot > 30885 { return -1. }
                                                return 1753.
                                            } else {
                                                if slot < 30886 or slot > 30888 { return -1. }
                                                return 1754.
                                            }
                                        } else {
                                            if slot <= 30890 {
                                                if slot < 30889 or slot > 30890 { return -1. }
                                                return 1755.
                                            } else {
                                                if slot <= 30918 {
                                                    if slot < 30891 or slot > 30918 { return -1. }
                                                    return 1756.
                                                } else {
                                                    if slot < 30919 or slot > 30922 { return -1. }
                                                    return 1757.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 30936 {
                                        if slot <= 30927 {
                                            if slot <= 30924 {
                                                if slot < 30923 or slot > 30924 { return -1. }
                                                return 1758.
                                            } else {
                                                if slot < 30925 or slot > 30927 { return -1. }
                                                return 1759.
                                            }
                                        } else {
                                            if slot <= 30931 {
                                                if slot < 30928 or slot > 30931 { return -1. }
                                                return 1760.
                                            } else {
                                                if slot < 30932 or slot > 30936 { return -1. }
                                                return 1761.
                                            }
                                        }
                                    } else {
                                        if slot <= 30959 {
                                            if slot <= 30948 {
                                                if slot < 30937 or slot > 30948 { return -1. }
                                                return 1762.
                                            } else {
                                                if slot < 30949 or slot > 30959 { return -1. }
                                                return 1763.
                                            }
                                        } else {
                                            if slot <= 31013 {
                                                if slot < 30960 or slot > 31013 { return -1. }
                                                return 1764.
                                            } else {
                                                if slot <= 31023 {
                                                    if slot < 31014 or slot > 31023 { return -1. }
                                                    return 1765.
                                                } else {
                                                    if slot < 31024 or slot > 31034 { return -1. }
                                                    return 1766.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 31127 {
                                    if slot <= 31091 {
                                        if slot <= 31055 {
                                            if slot <= 31037 {
                                                if slot < 31035 or slot > 31037 { return -1. }
                                                return 1767.
                                            } else {
                                                if slot < 31038 or slot > 31055 { return -1. }
                                                return 1768.
                                            }
                                        } else {
                                            if slot <= 31058 {
                                                if slot < 31056 or slot > 31058 { return -1. }
                                                return 1769.
                                            } else {
                                                if slot < 31059 or slot > 31091 { return -1. }
                                                return 1770.
                                            }
                                        }
                                    } else {
                                        if slot <= 31101 {
                                            if slot <= 31096 {
                                                if slot < 31092 or slot > 31096 { return -1. }
                                                return 1771.
                                            } else {
                                                if slot < 31097 or slot > 31101 { return -1. }
                                                return 1772.
                                            }
                                        } else {
                                            if slot <= 31106 {
                                                if slot < 31102 or slot > 31106 { return -1. }
                                                return 1773.
                                            } else {
                                                if slot <= 31122 {
                                                    if slot < 31107 or slot > 31122 { return -1. }
                                                    return 1774.
                                                } else {
                                                    if slot < 31123 or slot > 31127 { return -1. }
                                                    return 1775.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 31407 {
                                        if slot <= 31150 {
                                            if slot <= 31141 {
                                                if slot < 31128 or slot > 31141 { return -1. }
                                                return 1776.
                                            } else {
                                                if slot < 31142 or slot > 31150 { return -1. }
                                                return 1777.
                                            }
                                        } else {
                                            if slot <= 31161 {
                                                if slot < 31151 or slot > 31161 { return -1. }
                                                return 1778.
                                            } else {
                                                if slot < 31162 or slot > 31407 { return -1. }
                                                return 1779.
                                            }
                                        }
                                    } else {
                                        if slot <= 31423 {
                                            if slot <= 31419 {
                                                if slot < 31408 or slot > 31419 { return -1. }
                                                return 1780.
                                            } else {
                                                if slot < 31420 or slot > 31423 { return -1. }
                                                return 1781.
                                            }
                                        } else {
                                            if slot <= 31431 {
                                                if slot < 31424 or slot > 31431 { return -1. }
                                                return 1782.
                                            } else {
                                                if slot <= 31434 {
                                                    if slot < 31432 or slot > 31434 { return -1. }
                                                    return 1783.
                                                } else {
                                                    if slot < 31435 or slot > 31442 { return -1. }
                                                    return 1784.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 31717 {
                                if slot <= 31589 {
                                    if slot <= 31492 {
                                        if slot <= 31486 {
                                            if slot <= 31469 {
                                                if slot < 31443 or slot > 31469 { return -1. }
                                                return 1785.
                                            } else {
                                                if slot < 31470 or slot > 31486 { return -1. }
                                                return 1786.
                                            }
                                        } else {
                                            if slot <= 31488 {
                                                if slot < 31487 or slot > 31488 { return -1. }
                                                return 1787.
                                            } else {
                                                if slot < 31489 or slot > 31492 { return -1. }
                                                return 1788.
                                            }
                                        }
                                    } else {
                                        if slot <= 31501 {
                                            if slot <= 31495 {
                                                if slot < 31493 or slot > 31495 { return -1. }
                                                return 1789.
                                            } else {
                                                if slot < 31496 or slot > 31501 { return -1. }
                                                return 1790.
                                            }
                                        } else {
                                            if slot <= 31505 {
                                                if slot < 31502 or slot > 31505 { return -1. }
                                                return 1791.
                                            } else {
                                                if slot <= 31566 {
                                                    if slot < 31506 or slot > 31566 { return -1. }
                                                    return 1792.
                                                } else {
                                                    if slot < 31567 or slot > 31589 { return -1. }
                                                    return 1793.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 31691 {
                                        if slot <= 31597 {
                                            if slot <= 31593 {
                                                if slot < 31590 or slot > 31593 { return -1. }
                                                return 1794.
                                            } else {
                                                if slot < 31594 or slot > 31597 { return -1. }
                                                return 1795.
                                            }
                                        } else {
                                            if slot <= 31689 {
                                                if slot < 31598 or slot > 31689 { return -1. }
                                                return 1796.
                                            } else {
                                                if slot < 31690 or slot > 31691 { return -1. }
                                                return 1797.
                                            }
                                        }
                                    } else {
                                        if slot <= 31704 {
                                            if slot <= 31698 {
                                                if slot < 31692 or slot > 31698 { return -1. }
                                                return 1798.
                                            } else {
                                                if slot < 31699 or slot > 31704 { return -1. }
                                                return 1799.
                                            }
                                        } else {
                                            if slot <= 31707 {
                                                if slot < 31705 or slot > 31707 { return -1. }
                                                return 1800.
                                            } else {
                                                if slot <= 31714 {
                                                    if slot < 31708 or slot > 31714 { return -1. }
                                                    return 1801.
                                                } else {
                                                    if slot < 31715 or slot > 31717 { return -1. }
                                                    return 1802.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 31796 {
                                    if slot <= 31728 {
                                        if slot <= 31724 {
                                            if slot <= 31722 {
                                                if slot < 31718 or slot > 31722 { return -1. }
                                                return 1803.
                                            } else {
                                                if slot < 31723 or slot > 31724 { return -1. }
                                                return 1804.
                                            }
                                        } else {
                                            if slot <= 31727 {
                                                if slot < 31725 or slot > 31727 { return -1. }
                                                return 1805.
                                            } else {
                                                if slot < 31728 or slot > 31728 { return -1. }
                                                return 1806.
                                            }
                                        }
                                    } else {
                                        if slot <= 31782 {
                                            if slot <= 31753 {
                                                if slot < 31744 or slot > 31753 { return -1. }
                                                return 1807.
                                            } else {
                                                if slot < 31754 or slot > 31782 { return -1. }
                                                return 1808.
                                            }
                                        } else {
                                            if slot <= 31784 {
                                                if slot < 31783 or slot > 31784 { return -1. }
                                                return 1809.
                                            } else {
                                                if slot <= 31787 {
                                                    if slot < 31785 or slot > 31787 { return -1. }
                                                    return 1810.
                                                } else {
                                                    if slot < 31788 or slot > 31796 { return -1. }
                                                    return 1811.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 32235 {
                                        if slot <= 31845 {
                                            if slot <= 31799 {
                                                if slot < 31797 or slot > 31799 { return -1. }
                                                return 1812.
                                            } else {
                                                if slot < 31800 or slot > 31845 { return -1. }
                                                return 1813.
                                            }
                                        } else {
                                            if slot <= 31854 {
                                                if slot < 31846 or slot > 31854 { return -1. }
                                                return 1814.
                                            } else {
                                                if slot < 31855 or slot > 32235 { return -1. }
                                                return 1815.
                                            }
                                        }
                                    } else {
                                        if slot <= 32271 {
                                            if slot <= 32252 {
                                                if slot < 32236 or slot > 32252 { return -1. }
                                                return 1816.
                                            } else {
                                                if slot < 32253 or slot > 32271 { return -1. }
                                                return 1817.
                                            }
                                        } else {
                                            if slot <= 32280 {
                                                if slot < 32272 or slot > 32280 { return -1. }
                                                return 1818.
                                            } else {
                                                if slot <= 32286 {
                                                    if slot < 32281 or slot > 32286 { return -1. }
                                                    return 1819.
                                                } else {
                                                    if slot < 32287 or slot > 32289 { return -1. }
                                                    return 1820.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 33079 {
                            if slot <= 32461 {
                                if slot <= 32408 {
                                    if slot <= 32311 {
                                        if slot <= 32303 {
                                            if slot <= 32301 {
                                                if slot < 32290 or slot > 32301 { return -1. }
                                                return 1821.
                                            } else {
                                                if slot < 32302 or slot > 32303 { return -1. }
                                                return 1822.
                                            }
                                        } else {
                                            if slot <= 32307 {
                                                if slot < 32304 or slot > 32307 { return -1. }
                                                return 1823.
                                            } else {
                                                if slot < 32308 or slot > 32311 { return -1. }
                                                return 1824.
                                            }
                                        }
                                    } else {
                                        if slot <= 32325 {
                                            if slot <= 32316 {
                                                if slot < 32312 or slot > 32316 { return -1. }
                                                return 1825.
                                            } else {
                                                if slot < 32317 or slot > 32325 { return -1. }
                                                return 1826.
                                            }
                                        } else {
                                            if slot <= 32379 {
                                                if slot < 32361 or slot > 32379 { return -1. }
                                                return 1827.
                                            } else {
                                                if slot <= 32403 {
                                                    if slot < 32380 or slot > 32403 { return -1. }
                                                    return 1828.
                                                } else {
                                                    if slot < 32404 or slot > 32408 { return -1. }
                                                    return 1829.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 32434 {
                                        if slot <= 32429 {
                                            if slot <= 32420 {
                                                if slot < 32409 or slot > 32420 { return -1. }
                                                return 1830.
                                            } else {
                                                if slot < 32421 or slot > 32429 { return -1. }
                                                return 1831.
                                            }
                                        } else {
                                            if slot <= 32431 {
                                                if slot < 32430 or slot > 32431 { return -1. }
                                                return 1832.
                                            } else {
                                                if slot < 32432 or slot > 32434 { return -1. }
                                                return 1833.
                                            }
                                        }
                                    } else {
                                        if slot <= 32446 {
                                            if slot <= 32441 {
                                                if slot < 32438 or slot > 32441 { return -1. }
                                                return 1834.
                                            } else {
                                                if slot < 32442 or slot > 32446 { return -1. }
                                                return 1835.
                                            }
                                        } else {
                                            if slot <= 32451 {
                                                if slot < 32447 or slot > 32451 { return -1. }
                                                return 1836.
                                            } else {
                                                if slot <= 32455 {
                                                    if slot < 32452 or slot > 32455 { return -1. }
                                                    return 1837.
                                                } else {
                                                    if slot < 32456 or slot > 32461 { return -1. }
                                                    return 1838.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 32496 {
                                    if slot <= 32477 {
                                        if slot <= 32470 {
                                            if slot <= 32465 {
                                                if slot < 32462 or slot > 32465 { return -1. }
                                                return 1839.
                                            } else {
                                                if slot < 32466 or slot > 32470 { return -1. }
                                                return 1840.
                                            }
                                        } else {
                                            if slot <= 32474 {
                                                if slot < 32471 or slot > 32474 { return -1. }
                                                return 1841.
                                            } else {
                                                if slot < 32475 or slot > 32477 { return -1. }
                                                return 1842.
                                            }
                                        }
                                    } else {
                                        if slot <= 32483 {
                                            if slot <= 32481 {
                                                if slot < 32478 or slot > 32481 { return -1. }
                                                return 1843.
                                            } else {
                                                if slot < 32482 or slot > 32483 { return -1. }
                                                return 1844.
                                            }
                                        } else {
                                            if slot <= 32487 {
                                                if slot < 32484 or slot > 32487 { return -1. }
                                                return 1845.
                                            } else {
                                                if slot <= 32491 {
                                                    if slot < 32488 or slot > 32491 { return -1. }
                                                    return 1846.
                                                } else {
                                                    if slot < 32492 or slot > 32496 { return -1. }
                                                    return 1847.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 32512 {
                                        if slot <= 32501 {
                                            if slot <= 32498 {
                                                if slot < 32497 or slot > 32498 { return -1. }
                                                return 1848.
                                            } else {
                                                if slot < 32499 or slot > 32501 { return -1. }
                                                return 1849.
                                            }
                                        } else {
                                            if slot <= 32506 {
                                                if slot < 32502 or slot > 32506 { return -1. }
                                                return 1850.
                                            } else {
                                                if slot < 32507 or slot > 32512 { return -1. }
                                                return 1851.
                                            }
                                        }
                                    } else {
                                        if slot <= 32534 {
                                            if slot <= 32520 {
                                                if slot < 32513 or slot > 32520 { return -1. }
                                                return 1852.
                                            } else {
                                                if slot < 32521 or slot > 32534 { return -1. }
                                                return 1853.
                                            }
                                        } else {
                                            if slot <= 32541 {
                                                if slot < 32535 or slot > 32541 { return -1. }
                                                return 1854.
                                            } else {
                                                if slot <= 32542 {
                                                    if slot < 32542 or slot > 32542 { return -1. }
                                                    return 1855.
                                                } else {
                                                    if slot < 33078 or slot > 33079 { return -1. }
                                                    return 1856.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 33613 {
                                if slot <= 33338 {
                                    if slot <= 33181 {
                                        if slot <= 33121 {
                                            if slot <= 33088 {
                                                if slot < 33080 or slot > 33088 { return -1. }
                                                return 1857.
                                            } else {
                                                if slot < 33089 or slot > 33121 { return -1. }
                                                return 1858.
                                            }
                                        } else {
                                            if slot <= 33131 {
                                                if slot < 33122 or slot > 33131 { return -1. }
                                                return 1859.
                                            } else {
                                                if slot < 33132 or slot > 33181 { return -1. }
                                                return 1860.
                                            }
                                        }
                                    } else {
                                        if slot <= 33280 {
                                            if slot <= 33191 {
                                                if slot < 33182 or slot > 33191 { return -1. }
                                                return 1861.
                                            } else {
                                                if slot < 33192 or slot > 33280 { return -1. }
                                                return 1862.
                                            }
                                        } else {
                                            if slot <= 33285 {
                                                if slot < 33281 or slot > 33285 { return -1. }
                                                return 1863.
                                            } else {
                                                if slot <= 33306 {
                                                    if slot < 33286 or slot > 33306 { return -1. }
                                                    return 1864.
                                                } else {
                                                    if slot < 33307 or slot > 33338 { return -1. }
                                                    return 1865.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 33428 {
                                        if slot <= 33357 {
                                            if slot <= 33346 {
                                                if slot < 33339 or slot > 33346 { return -1. }
                                                return 1866.
                                            } else {
                                                if slot < 33347 or slot > 33357 { return -1. }
                                                return 1867.
                                            }
                                        } else {
                                            if slot <= 33416 {
                                                if slot < 33358 or slot > 33416 { return -1. }
                                                return 1868.
                                            } else {
                                                if slot < 33417 or slot > 33428 { return -1. }
                                                return 1869.
                                            }
                                        }
                                    } else {
                                        if slot <= 33436 {
                                            if slot <= 33434 {
                                                if slot < 33429 or slot > 33434 { return -1. }
                                                return 1870.
                                            } else {
                                                if slot < 33435 or slot > 33436 { return -1. }
                                                return 1871.
                                            }
                                        } else {
                                            if slot <= 33440 {
                                                if slot < 33437 or slot > 33440 { return -1. }
                                                return 1872.
                                            } else {
                                                if slot <= 33444 {
                                                    if slot < 33441 or slot > 33444 { return -1. }
                                                    return 1873.
                                                } else {
                                                    if slot < 33606 or slot > 33613 { return -1. }
                                                    return 1874.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 33886 {
                                    if slot <= 33773 {
                                        if slot <= 33677 {
                                            if slot <= 33615 {
                                                if slot < 33614 or slot > 33615 { return -1. }
                                                return 1875.
                                            } else {
                                                if slot < 33616 or slot > 33677 { return -1. }
                                                return 1876.
                                            }
                                        } else {
                                            if slot <= 33772 {
                                                if slot < 33678 or slot > 33772 { return -1. }
                                                return 1877.
                                            } else {
                                                if slot < 33773 or slot > 33773 { return -1. }
                                                return 1878.
                                            }
                                        }
                                    } else {
                                        if slot <= 33803 {
                                            if slot <= 33797 {
                                                if slot < 33793 or slot > 33797 { return -1. }
                                                return 1879.
                                            } else {
                                                if slot < 33798 or slot > 33803 { return -1. }
                                                return 1880.
                                            }
                                        } else {
                                            if slot <= 33880 {
                                                if slot < 33804 or slot > 33880 { return -1. }
                                                return 1881.
                                            } else {
                                                if slot <= 33883 {
                                                    if slot < 33881 or slot > 33883 { return -1. }
                                                    return 1882.
                                                } else {
                                                    if slot < 33884 or slot > 33886 { return -1. }
                                                    return 1883.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 33981 {
                                        if slot <= 33975 {
                                            if slot <= 33970 {
                                                if slot < 33969 or slot > 33970 { return -1. }
                                                return 1884.
                                            } else {
                                                if slot < 33971 or slot > 33975 { return -1. }
                                                return 1885.
                                            }
                                        } else {
                                            if slot <= 33977 {
                                                if slot < 33976 or slot > 33977 { return -1. }
                                                return 1886.
                                            } else {
                                                if slot <= 33979 {
                                                    if slot < 33978 or slot > 33979 { return -1. }
                                                    return 1887.
                                                } else {
                                                    if slot < 33980 or slot > 33981 { return -1. }
                                                    return 1888.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 33987 {
                                            if slot <= 33983 {
                                                if slot < 33982 or slot > 33983 { return -1. }
                                                return 1889.
                                            } else {
                                                if slot < 33984 or slot > 33987 { return -1. }
                                                return 1890.
                                            }
                                        } else {
                                            if slot <= 34013 {
                                                if slot < 33988 or slot > 34013 { return -1. }
                                                return 1891.
                                            } else {
                                                if slot <= 34017 {
                                                    if slot < 34014 or slot > 34017 { return -1. }
                                                    return 1892.
                                                } else {
                                                    if slot < 34018 or slot > 34020 { return -1. }
                                                    return 1893.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    if slot <= 34803 {
                        if slot <= 34323 {
                            if slot <= 34150 {
                                if slot <= 34086 {
                                    if slot <= 34044 {
                                        if slot <= 34038 {
                                            if slot <= 34034 {
                                                if slot < 34021 or slot > 34034 { return -1. }
                                                return 1894.
                                            } else {
                                                if slot < 34035 or slot > 34038 { return -1. }
                                                return 1895.
                                            }
                                        } else {
                                            if slot <= 34042 {
                                                if slot < 34039 or slot > 34042 { return -1. }
                                                return 1896.
                                            } else {
                                                if slot < 34043 or slot > 34044 { return -1. }
                                                return 1897.
                                            }
                                        }
                                    } else {
                                        if slot <= 34060 {
                                            if slot <= 34050 {
                                                if slot < 34045 or slot > 34050 { return -1. }
                                                return 1898.
                                            } else {
                                                if slot < 34051 or slot > 34060 { return -1. }
                                                return 1899.
                                            }
                                        } else {
                                            if slot <= 34063 {
                                                if slot < 34061 or slot > 34063 { return -1. }
                                                return 1900.
                                            } else {
                                                if slot <= 34072 {
                                                    if slot < 34064 or slot > 34072 { return -1. }
                                                    return 1901.
                                                } else {
                                                    if slot < 34073 or slot > 34086 { return -1. }
                                                    return 1902.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 34103 {
                                        if slot <= 34095 {
                                            if slot <= 34092 {
                                                if slot < 34087 or slot > 34092 { return -1. }
                                                return 1903.
                                            } else {
                                                if slot < 34093 or slot > 34095 { return -1. }
                                                return 1904.
                                            }
                                        } else {
                                            if slot <= 34101 {
                                                if slot < 34096 or slot > 34101 { return -1. }
                                                return 1905.
                                            } else {
                                                if slot < 34102 or slot > 34103 { return -1. }
                                                return 1906.
                                            }
                                        }
                                    } else {
                                        if slot <= 34119 {
                                            if slot <= 34113 {
                                                if slot < 34104 or slot > 34113 { return -1. }
                                                return 1907.
                                            } else {
                                                if slot < 34114 or slot > 34119 { return -1. }
                                                return 1908.
                                            }
                                        } else {
                                            if slot <= 34125 {
                                                if slot < 34120 or slot > 34125 { return -1. }
                                                return 1909.
                                            } else {
                                                if slot <= 34139 {
                                                    if slot < 34126 or slot > 34139 { return -1. }
                                                    return 1910.
                                                } else {
                                                    if slot < 34140 or slot > 34150 { return -1. }
                                                    return 1911.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 34184 {
                                    if slot <= 34168 {
                                        if slot <= 34155 {
                                            if slot <= 34153 {
                                                if slot < 34151 or slot > 34153 { return -1. }
                                                return 1912.
                                            } else {
                                                if slot < 34154 or slot > 34155 { return -1. }
                                                return 1913.
                                            }
                                        } else {
                                            if slot <= 34158 {
                                                if slot < 34156 or slot > 34158 { return -1. }
                                                return 1914.
                                            } else {
                                                if slot < 34159 or slot > 34168 { return -1. }
                                                return 1915.
                                            }
                                        }
                                    } else {
                                        if slot <= 34176 {
                                            if slot <= 34173 {
                                                if slot < 34172 or slot > 34173 { return -1. }
                                                return 1916.
                                            } else {
                                                if slot < 34174 or slot > 34176 { return -1. }
                                                return 1917.
                                            }
                                        } else {
                                            if slot <= 34180 {
                                                if slot < 34177 or slot > 34180 { return -1. }
                                                return 1918.
                                            } else {
                                                if slot <= 34182 {
                                                    if slot < 34181 or slot > 34182 { return -1. }
                                                    return 1919.
                                                } else {
                                                    if slot < 34183 or slot > 34184 { return -1. }
                                                    return 1920.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 34244 {
                                        if slot <= 34196 {
                                            if slot <= 34186 {
                                                if slot < 34185 or slot > 34186 { return -1. }
                                                return 1921.
                                            } else {
                                                if slot < 34187 or slot > 34196 { return -1. }
                                                return 1922.
                                            }
                                        } else {
                                            if slot <= 34210 {
                                                if slot < 34208 or slot > 34210 { return -1. }
                                                return 1923.
                                            } else {
                                                if slot < 34241 or slot > 34244 { return -1. }
                                                return 1924.
                                            }
                                        }
                                    } else {
                                        if slot <= 34253 {
                                            if slot <= 34249 {
                                                if slot < 34245 or slot > 34249 { return -1. }
                                                return 1925.
                                            } else {
                                                if slot < 34250 or slot > 34253 { return -1. }
                                                return 1926.
                                            }
                                        } else {
                                            if slot <= 34256 {
                                                if slot < 34254 or slot > 34256 { return -1. }
                                                return 1927.
                                            } else {
                                                if slot <= 34308 {
                                                    if slot < 34257 or slot > 34308 { return -1. }
                                                    return 1928.
                                                } else {
                                                    if slot < 34309 or slot > 34323 { return -1. }
                                                    return 1929.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 34410 {
                                if slot <= 34366 {
                                    if slot <= 34345 {
                                        if slot <= 34338 {
                                            if slot <= 34326 {
                                                if slot < 34324 or slot > 34326 { return -1. }
                                                return 1930.
                                            } else {
                                                if slot < 34327 or slot > 34338 { return -1. }
                                                return 1931.
                                            }
                                        } else {
                                            if slot <= 34342 {
                                                if slot < 34339 or slot > 34342 { return -1. }
                                                return 1932.
                                            } else {
                                                if slot < 34343 or slot > 34345 { return -1. }
                                                return 1933.
                                            }
                                        }
                                    } else {
                                        if slot <= 34358 {
                                            if slot <= 34355 {
                                                if slot < 34346 or slot > 34355 { return -1. }
                                                return 1934.
                                            } else {
                                                if slot < 34356 or slot > 34358 { return -1. }
                                                return 1935.
                                            }
                                        } else {
                                            if slot <= 34362 {
                                                if slot < 34359 or slot > 34362 { return -1. }
                                                return 1936.
                                            } else {
                                                if slot <= 34364 {
                                                    if slot < 34363 or slot > 34364 { return -1. }
                                                    return 1937.
                                                } else {
                                                    if slot < 34365 or slot > 34366 { return -1. }
                                                    return 1938.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 34394 {
                                        if slot <= 34384 {
                                            if slot <= 34377 {
                                                if slot < 34367 or slot > 34377 { return -1. }
                                                return 1939.
                                            } else {
                                                if slot < 34378 or slot > 34384 { return -1. }
                                                return 1940.
                                            }
                                        } else {
                                            if slot <= 34392 {
                                                if slot < 34385 or slot > 34392 { return -1. }
                                                return 1941.
                                            } else {
                                                if slot < 34393 or slot > 34394 { return -1. }
                                                return 1942.
                                            }
                                        }
                                    } else {
                                        if slot <= 34402 {
                                            if slot <= 34399 {
                                                if slot < 34395 or slot > 34399 { return -1. }
                                                return 1943.
                                            } else {
                                                if slot < 34400 or slot > 34402 { return -1. }
                                                return 1944.
                                            }
                                        } else {
                                            if slot <= 34404 {
                                                if slot < 34403 or slot > 34404 { return -1. }
                                                return 1945.
                                            } else {
                                                if slot <= 34408 {
                                                    if slot < 34405 or slot > 34408 { return -1. }
                                                    return 1946.
                                                } else {
                                                    if slot < 34409 or slot > 34410 { return -1. }
                                                    return 1947.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 34452 {
                                    if slot <= 34428 {
                                        if slot <= 34417 {
                                            if slot <= 34414 {
                                                if slot < 34411 or slot > 34414 { return -1. }
                                                return 1948.
                                            } else {
                                                if slot < 34415 or slot > 34417 { return -1. }
                                                return 1949.
                                            }
                                        } else {
                                            if slot <= 34424 {
                                                if slot < 34418 or slot > 34424 { return -1. }
                                                return 1950.
                                            } else {
                                                if slot < 34425 or slot > 34428 { return -1. }
                                                return 1951.
                                            }
                                        }
                                    } else {
                                        if slot <= 34437 {
                                            if slot <= 34432 {
                                                if slot < 34429 or slot > 34432 { return -1. }
                                                return 1952.
                                            } else {
                                                if slot < 34433 or slot > 34437 { return -1. }
                                                return 1953.
                                            }
                                        } else {
                                            if slot <= 34443 {
                                                if slot < 34438 or slot > 34443 { return -1. }
                                                return 1954.
                                            } else {
                                                if slot <= 34445 {
                                                    if slot < 34444 or slot > 34445 { return -1. }
                                                    return 1955.
                                                } else {
                                                    if slot < 34446 or slot > 34452 { return -1. }
                                                    return 1956.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 34474 {
                                        if slot <= 34456 {
                                            if slot <= 34454 {
                                                if slot < 34453 or slot > 34454 { return -1. }
                                                return 1957.
                                            } else {
                                                if slot < 34455 or slot > 34456 { return -1. }
                                                return 1958.
                                            }
                                        } else {
                                            if slot <= 34461 {
                                                if slot < 34457 or slot > 34461 { return -1. }
                                                return 1959.
                                            } else {
                                                if slot <= 34465 {
                                                    if slot < 34462 or slot > 34465 { return -1. }
                                                    return 1960.
                                                } else {
                                                    if slot < 34466 or slot > 34474 { return -1. }
                                                    return 1961.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 34732 {
                                            if slot <= 34537 {
                                                if slot < 34475 or slot > 34537 { return -1. }
                                                return 1962.
                                            } else {
                                                if slot < 34616 or slot > 34732 { return -1. }
                                                return 1963.
                                            }
                                        } else {
                                            if slot <= 34736 {
                                                if slot < 34733 or slot > 34736 { return -1. }
                                                return 1964.
                                            } else {
                                                if slot <= 34799 {
                                                    if slot < 34737 or slot > 34799 { return -1. }
                                                    return 1965.
                                                } else {
                                                    if slot < 34800 or slot > 34803 { return -1. }
                                                    return 1966.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 35189 {
                            if slot <= 34988 {
                                if slot <= 34924 {
                                    if slot <= 34865 {
                                        if slot <= 34830 {
                                            if slot <= 34805 {
                                                if slot < 34804 or slot > 34805 { return -1. }
                                                return 1967.
                                            } else {
                                                if slot < 34816 or slot > 34830 { return -1. }
                                                return 1968.
                                            }
                                        } else {
                                            if slot <= 34863 {
                                                if slot < 34831 or slot > 34863 { return -1. }
                                                return 1969.
                                            } else {
                                                if slot < 34864 or slot > 34865 { return -1. }
                                                return 1970.
                                            }
                                        }
                                    } else {
                                        if slot <= 34900 {
                                            if slot <= 34889 {
                                                if slot < 34866 or slot > 34889 { return -1. }
                                                return 1971.
                                            } else {
                                                if slot < 34890 or slot > 34900 { return -1. }
                                                return 1972.
                                            }
                                        } else {
                                            if slot <= 34908 {
                                                if slot < 34901 or slot > 34908 { return -1. }
                                                return 1973.
                                            } else {
                                                if slot <= 34921 {
                                                    if slot < 34909 or slot > 34921 { return -1. }
                                                    return 1974.
                                                } else {
                                                    if slot < 34922 or slot > 34924 { return -1. }
                                                    return 1975.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 34953 {
                                        if slot <= 34943 {
                                            if slot <= 34939 {
                                                if slot < 34925 or slot > 34939 { return -1. }
                                                return 1976.
                                            } else {
                                                if slot < 34940 or slot > 34943 { return -1. }
                                                return 1977.
                                            }
                                        } else {
                                            if slot <= 34950 {
                                                if slot < 34944 or slot > 34950 { return -1. }
                                                return 1978.
                                            } else {
                                                if slot < 34951 or slot > 34953 { return -1. }
                                                return 1979.
                                            }
                                        }
                                    } else {
                                        if slot <= 34964 {
                                            if slot <= 34955 {
                                                if slot < 34954 or slot > 34955 { return -1. }
                                                return 1980.
                                            } else {
                                                if slot < 34956 or slot > 34964 { return -1. }
                                                return 1981.
                                            }
                                        } else {
                                            if slot <= 34966 {
                                                if slot < 34965 or slot > 34966 { return -1. }
                                                return 1982.
                                            } else {
                                                if slot <= 34983 {
                                                    if slot < 34967 or slot > 34983 { return -1. }
                                                    return 1983.
                                                } else {
                                                    if slot < 34984 or slot > 34988 { return -1. }
                                                    return 1984.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 35112 {
                                    if slot <= 35046 {
                                        if slot <= 35023 {
                                            if slot <= 35009 {
                                                if slot < 34989 or slot > 35009 { return -1. }
                                                return 1985.
                                            } else {
                                                if slot < 35010 or slot > 35023 { return -1. }
                                                return 1986.
                                            }
                                        } else {
                                            if slot <= 35039 {
                                                if slot < 35024 or slot > 35039 { return -1. }
                                                return 1987.
                                            } else {
                                                if slot < 35040 or slot > 35046 { return -1. }
                                                return 1988.
                                            }
                                        }
                                    } else {
                                        if slot <= 35088 {
                                            if slot <= 35069 {
                                                if slot < 35047 or slot > 35069 { return -1. }
                                                return 1989.
                                            } else {
                                                if slot < 35070 or slot > 35088 { return -1. }
                                                return 1990.
                                            }
                                        } else {
                                            if slot <= 35107 {
                                                if slot < 35089 or slot > 35107 { return -1. }
                                                return 1991.
                                            } else {
                                                if slot <= 35109 {
                                                    if slot < 35108 or slot > 35109 { return -1. }
                                                    return 1992.
                                                } else {
                                                    if slot < 35110 or slot > 35112 { return -1. }
                                                    return 1993.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 35128 {
                                        if slot <= 35121 {
                                            if slot <= 35117 {
                                                if slot < 35113 or slot > 35117 { return -1. }
                                                return 1994.
                                            } else {
                                                if slot < 35118 or slot > 35121 { return -1. }
                                                return 1995.
                                            }
                                        } else {
                                            if slot <= 35123 {
                                                if slot < 35122 or slot > 35123 { return -1. }
                                                return 1996.
                                            } else {
                                                if slot < 35124 or slot > 35128 { return -1. }
                                                return 1997.
                                            }
                                        }
                                    } else {
                                        if slot <= 35143 {
                                            if slot <= 35137 {
                                                if slot < 35129 or slot > 35137 { return -1. }
                                                return 1998.
                                            } else {
                                                if slot < 35138 or slot > 35143 { return -1. }
                                                return 1999.
                                            }
                                        } else {
                                            if slot <= 35149 {
                                                if slot < 35144 or slot > 35149 { return -1. }
                                                return 2000.
                                            } else {
                                                if slot <= 35178 {
                                                    if slot < 35150 or slot > 35178 { return -1. }
                                                    return 2001.
                                                } else {
                                                    if slot < 35179 or slot > 35189 { return -1. }
                                                    return 2002.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 35330 {
                                if slot <= 35256 {
                                    if slot <= 35228 {
                                        if slot <= 35202 {
                                            if slot <= 35192 {
                                                if slot < 35190 or slot > 35192 { return -1. }
                                                return 2003.
                                            } else {
                                                if slot < 35193 or slot > 35202 { return -1. }
                                                return 2004.
                                            }
                                        } else {
                                            if slot <= 35207 {
                                                if slot < 35203 or slot > 35207 { return -1. }
                                                return 2005.
                                            } else {
                                                if slot < 35208 or slot > 35228 { return -1. }
                                                return 2006.
                                            }
                                        }
                                    } else {
                                        if slot <= 35242 {
                                            if slot <= 35236 {
                                                if slot < 35229 or slot > 35236 { return -1. }
                                                return 2007.
                                            } else {
                                                if slot < 35237 or slot > 35242 { return -1. }
                                                return 2008.
                                            }
                                        } else {
                                            if slot <= 35248 {
                                                if slot < 35243 or slot > 35248 { return -1. }
                                                return 2009.
                                            } else {
                                                if slot <= 35251 {
                                                    if slot < 35249 or slot > 35251 { return -1. }
                                                    return 2010.
                                                } else {
                                                    if slot < 35252 or slot > 35256 { return -1. }
                                                    return 2011.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 35277 {
                                        if slot <= 35264 {
                                            if slot <= 35262 {
                                                if slot < 35257 or slot > 35262 { return -1. }
                                                return 2012.
                                            } else {
                                                if slot < 35263 or slot > 35264 { return -1. }
                                                return 2013.
                                            }
                                        } else {
                                            if slot <= 35269 {
                                                if slot < 35265 or slot > 35269 { return -1. }
                                                return 2014.
                                            } else {
                                                if slot < 35270 or slot > 35277 { return -1. }
                                                return 2015.
                                            }
                                        }
                                    } else {
                                        if slot <= 35306 {
                                            if slot <= 35278 {
                                                if slot < 35278 or slot > 35278 { return -1. }
                                                return 2016.
                                            } else {
                                                if slot < 35280 or slot > 35306 { return -1. }
                                                return 2017.
                                            }
                                        } else {
                                            if slot <= 35317 {
                                                if slot < 35307 or slot > 35317 { return -1. }
                                                return 2018.
                                            } else {
                                                if slot <= 35319 {
                                                    if slot < 35318 or slot > 35319 { return -1. }
                                                    return 2019.
                                                } else {
                                                    if slot < 35320 or slot > 35330 { return -1. }
                                                    return 2020.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 35428 {
                                    if slot <= 35362 {
                                        if slot <= 35346 {
                                            if slot <= 35340 {
                                                if slot < 35331 or slot > 35340 { return -1. }
                                                return 2021.
                                            } else {
                                                if slot < 35341 or slot > 35346 { return -1. }
                                                return 2022.
                                            }
                                        } else {
                                            if slot <= 35355 {
                                                if slot < 35347 or slot > 35355 { return -1. }
                                                return 2023.
                                            } else {
                                                if slot < 35356 or slot > 35362 { return -1. }
                                                return 2024.
                                            }
                                        }
                                    } else {
                                        if slot <= 35372 {
                                            if slot <= 35367 {
                                                if slot < 35363 or slot > 35367 { return -1. }
                                                return 2025.
                                            } else {
                                                if slot < 35368 or slot > 35372 { return -1. }
                                                return 2026.
                                            }
                                        } else {
                                            if slot <= 35396 {
                                                if slot < 35373 or slot > 35396 { return -1. }
                                                return 2027.
                                            } else {
                                                if slot <= 35421 {
                                                    if slot < 35397 or slot > 35421 { return -1. }
                                                    return 2028.
                                                } else {
                                                    if slot < 35422 or slot > 35428 { return -1. }
                                                    return 2029.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 35508 {
                                        if slot <= 35475 {
                                            if slot <= 35446 {
                                                if slot < 35429 or slot > 35446 { return -1. }
                                                return 2030.
                                            } else {
                                                if slot < 35447 or slot > 35475 { return -1. }
                                                return 2031.
                                            }
                                        } else {
                                            if slot <= 35478 {
                                                if slot < 35476 or slot > 35478 { return -1. }
                                                return 2032.
                                            } else {
                                                if slot <= 35502 {
                                                    if slot < 35479 or slot > 35502 { return -1. }
                                                    return 2033.
                                                } else {
                                                    if slot < 35503 or slot > 35508 { return -1. }
                                                    return 2034.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 35519 {
                                            if slot <= 35514 {
                                                if slot < 35509 or slot > 35514 { return -1. }
                                                return 2035.
                                            } else {
                                                if slot < 35515 or slot > 35519 { return -1. }
                                                return 2036.
                                            }
                                        } else {
                                            if slot <= 35528 {
                                                if slot < 35520 or slot > 35528 { return -1. }
                                                return 2037.
                                            } else {
                                                if slot <= 35538 {
                                                    if slot < 35529 or slot > 35538 { return -1. }
                                                    return 2038.
                                                } else {
                                                    if slot < 35539 or slot > 35557 { return -1. }
                                                    return 2039.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                if slot <= 37582 {
                    if slot <= 36389 {
                        if slot <= 36083 {
                            if slot <= 35824 {
                                if slot <= 35655 {
                                    if slot <= 35593 {
                                        if slot <= 35565 {
                                            if slot <= 35558 {
                                                if slot < 35558 or slot > 35558 { return -1. }
                                                return 2040.
                                            } else {
                                                if slot < 35559 or slot > 35565 { return -1. }
                                                return 2041.
                                            }
                                        } else {
                                            if slot <= 35587 {
                                                if slot < 35566 or slot > 35587 { return -1. }
                                                return 2042.
                                            } else {
                                                if slot < 35588 or slot > 35593 { return -1. }
                                                return 2043.
                                            }
                                        }
                                    } else {
                                        if slot <= 35641 {
                                            if slot <= 35616 {
                                                if slot < 35594 or slot > 35616 { return -1. }
                                                return 2044.
                                            } else {
                                                if slot < 35617 or slot > 35641 { return -1. }
                                                return 2045.
                                            }
                                        } else {
                                            if slot <= 35643 {
                                                if slot < 35642 or slot > 35643 { return -1. }
                                                return 2046.
                                            } else {
                                                if slot <= 35648 {
                                                    if slot < 35644 or slot > 35648 { return -1. }
                                                    return 2047.
                                                } else {
                                                    if slot < 35649 or slot > 35655 { return -1. }
                                                    return 2048.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 35707 {
                                        if slot <= 35698 {
                                            if slot <= 35687 {
                                                if slot < 35656 or slot > 35687 { return -1. }
                                                return 2049.
                                            } else {
                                                if slot < 35688 or slot > 35698 { return -1. }
                                                return 2050.
                                            }
                                        } else {
                                            if slot <= 35700 {
                                                if slot < 35699 or slot > 35700 { return -1. }
                                                return 2051.
                                            } else {
                                                if slot < 35701 or slot > 35707 { return -1. }
                                                return 2052.
                                            }
                                        }
                                    } else {
                                        if slot <= 35738 {
                                            if slot <= 35735 {
                                                if slot < 35732 or slot > 35735 { return -1. }
                                                return 2053.
                                            } else {
                                                if slot < 35736 or slot > 35738 { return -1. }
                                                return 2054.
                                            }
                                        } else {
                                            if slot <= 35748 {
                                                if slot < 35739 or slot > 35748 { return -1. }
                                                return 2055.
                                            } else {
                                                if slot <= 35775 {
                                                    if slot < 35749 or slot > 35775 { return -1. }
                                                    return 2056.
                                                } else {
                                                    if slot < 35776 or slot > 35824 { return -1. }
                                                    return 2057.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 36010 {
                                    if slot <= 35917 {
                                        if slot <= 35868 {
                                            if slot <= 35825 {
                                                if slot < 35825 or slot > 35825 { return -1. }
                                                return 2058.
                                            } else {
                                                if slot < 35840 or slot > 35868 { return -1. }
                                                return 2059.
                                            }
                                        } else {
                                            if slot <= 35882 {
                                                if slot < 35869 or slot > 35882 { return -1. }
                                                return 2060.
                                            } else {
                                                if slot < 35883 or slot > 35917 { return -1. }
                                                return 2061.
                                            }
                                        }
                                    } else {
                                        if slot <= 35943 {
                                            if slot <= 35941 {
                                                if slot < 35918 or slot > 35941 { return -1. }
                                                return 2062.
                                            } else {
                                                if slot < 35942 or slot > 35943 { return -1. }
                                                return 2063.
                                            }
                                        } else {
                                            if slot <= 35984 {
                                                if slot < 35944 or slot > 35984 { return -1. }
                                                return 2064.
                                            } else {
                                                if slot <= 36000 {
                                                    if slot < 35985 or slot > 36000 { return -1. }
                                                    return 2065.
                                                } else {
                                                    if slot < 36001 or slot > 36010 { return -1. }
                                                    return 2066.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 36034 {
                                        if slot <= 36018 {
                                            if slot <= 36012 {
                                                if slot < 36011 or slot > 36012 { return -1. }
                                                return 2067.
                                            } else {
                                                if slot < 36013 or slot > 36018 { return -1. }
                                                return 2068.
                                            }
                                        } else {
                                            if slot <= 36020 {
                                                if slot < 36019 or slot > 36020 { return -1. }
                                                return 2069.
                                            } else {
                                                if slot < 36021 or slot > 36034 { return -1. }
                                                return 2070.
                                            }
                                        }
                                    } else {
                                        if slot <= 36070 {
                                            if slot <= 36044 {
                                                if slot < 36035 or slot > 36044 { return -1. }
                                                return 2071.
                                            } else {
                                                if slot < 36045 or slot > 36070 { return -1. }
                                                return 2072.
                                            }
                                        } else {
                                            if slot <= 36074 {
                                                if slot < 36071 or slot > 36074 { return -1. }
                                                return 2073.
                                            } else {
                                                if slot <= 36078 {
                                                    if slot < 36075 or slot > 36078 { return -1. }
                                                    return 2074.
                                                } else {
                                                    if slot < 36079 or slot > 36083 { return -1. }
                                                    return 2075.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 36215 {
                                if slot <= 36172 {
                                    if slot <= 36109 {
                                        if slot <= 36094 {
                                            if slot <= 36088 {
                                                if slot < 36084 or slot > 36088 { return -1. }
                                                return 2076.
                                            } else {
                                                if slot < 36089 or slot > 36094 { return -1. }
                                                return 2077.
                                            }
                                        } else {
                                            if slot <= 36099 {
                                                if slot < 36095 or slot > 36099 { return -1. }
                                                return 2078.
                                            } else {
                                                if slot < 36100 or slot > 36109 { return -1. }
                                                return 2079.
                                            }
                                        }
                                    } else {
                                        if slot <= 36156 {
                                            if slot <= 36112 {
                                                if slot < 36110 or slot > 36112 { return -1. }
                                                return 2080.
                                            } else {
                                                if slot < 36113 or slot > 36156 { return -1. }
                                                return 2081.
                                            }
                                        } else {
                                            if slot <= 36160 {
                                                if slot < 36157 or slot > 36160 { return -1. }
                                                return 2082.
                                            } else {
                                                if slot <= 36168 {
                                                    if slot < 36161 or slot > 36168 { return -1. }
                                                    return 2083.
                                                } else {
                                                    if slot < 36169 or slot > 36172 { return -1. }
                                                    return 2084.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 36188 {
                                        if slot <= 36176 {
                                            if slot <= 36174 {
                                                if slot < 36173 or slot > 36174 { return -1. }
                                                return 2085.
                                            } else {
                                                if slot < 36175 or slot > 36176 { return -1. }
                                                return 2086.
                                            }
                                        } else {
                                            if slot <= 36186 {
                                                if slot < 36177 or slot > 36186 { return -1. }
                                                return 2087.
                                            } else {
                                                if slot < 36187 or slot > 36188 { return -1. }
                                                return 2088.
                                            }
                                        }
                                    } else {
                                        if slot <= 36198 {
                                            if slot <= 36195 {
                                                if slot < 36189 or slot > 36195 { return -1. }
                                                return 2089.
                                            } else {
                                                if slot < 36196 or slot > 36198 { return -1. }
                                                return 2090.
                                            }
                                        } else {
                                            if slot <= 36206 {
                                                if slot < 36199 or slot > 36206 { return -1. }
                                                return 2091.
                                            } else {
                                                if slot <= 36213 {
                                                    if slot < 36207 or slot > 36213 { return -1. }
                                                    return 2092.
                                                } else {
                                                    if slot < 36214 or slot > 36215 { return -1. }
                                                    return 2093.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 36288 {
                                    if slot <= 36262 {
                                        if slot <= 36237 {
                                            if slot <= 36222 {
                                                if slot < 36216 or slot > 36222 { return -1. }
                                                return 2094.
                                            } else {
                                                if slot < 36223 or slot > 36237 { return -1. }
                                                return 2095.
                                            }
                                        } else {
                                            if slot <= 36258 {
                                                if slot < 36238 or slot > 36258 { return -1. }
                                                return 2096.
                                            } else {
                                                if slot < 36259 or slot > 36262 { return -1. }
                                                return 2097.
                                            }
                                        }
                                    } else {
                                        if slot <= 36279 {
                                            if slot <= 36266 {
                                                if slot < 36263 or slot > 36266 { return -1. }
                                                return 2098.
                                            } else {
                                                if slot < 36267 or slot > 36279 { return -1. }
                                                return 2099.
                                            }
                                        } else {
                                            if slot <= 36282 {
                                                if slot < 36280 or slot > 36282 { return -1. }
                                                return 2100.
                                            } else {
                                                if slot <= 36286 {
                                                    if slot < 36283 or slot > 36286 { return -1. }
                                                    return 2101.
                                                } else {
                                                    if slot < 36287 or slot > 36288 { return -1. }
                                                    return 2102.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 36334 {
                                        if slot <= 36312 {
                                            if slot <= 36308 {
                                                if slot < 36289 or slot > 36308 { return -1. }
                                                return 2103.
                                            } else {
                                                if slot < 36309 or slot > 36312 { return -1. }
                                                return 2104.
                                            }
                                        } else {
                                            if slot <= 36321 {
                                                if slot < 36313 or slot > 36321 { return -1. }
                                                return 2105.
                                            } else {
                                                if slot <= 36326 {
                                                    if slot < 36322 or slot > 36326 { return -1. }
                                                    return 2106.
                                                } else {
                                                    if slot < 36327 or slot > 36334 { return -1. }
                                                    return 2107.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 36360 {
                                            if slot <= 36347 {
                                                if slot < 36335 or slot > 36347 { return -1. }
                                                return 2108.
                                            } else {
                                                if slot < 36348 or slot > 36360 { return -1. }
                                                return 2109.
                                            }
                                        } else {
                                            if slot <= 36383 {
                                                if slot < 36361 or slot > 36383 { return -1. }
                                                return 2110.
                                            } else {
                                                if slot <= 36386 {
                                                    if slot < 36384 or slot > 36386 { return -1. }
                                                    return 2111.
                                                } else {
                                                    if slot < 36387 or slot > 36389 { return -1. }
                                                    return 2112.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 36785 {
                            if slot <= 36550 {
                                if slot <= 36445 {
                                    if slot <= 36403 {
                                        if slot <= 36397 {
                                            if slot <= 36394 {
                                                if slot < 36390 or slot > 36394 { return -1. }
                                                return 2113.
                                            } else {
                                                if slot < 36395 or slot > 36397 { return -1. }
                                                return 2114.
                                            }
                                        } else {
                                            if slot <= 36400 {
                                                if slot < 36398 or slot > 36400 { return -1. }
                                                return 2115.
                                            } else {
                                                if slot < 36401 or slot > 36403 { return -1. }
                                                return 2116.
                                            }
                                        }
                                    } else {
                                        if slot <= 36422 {
                                            if slot <= 36419 {
                                                if slot < 36404 or slot > 36419 { return -1. }
                                                return 2117.
                                            } else {
                                                if slot < 36420 or slot > 36422 { return -1. }
                                                return 2118.
                                            }
                                        } else {
                                            if slot <= 36425 {
                                                if slot < 36423 or slot > 36425 { return -1. }
                                                return 2119.
                                            } else {
                                                if slot <= 36428 {
                                                    if slot < 36426 or slot > 36428 { return -1. }
                                                    return 2120.
                                                } else {
                                                    if slot < 36429 or slot > 36445 { return -1. }
                                                    return 2121.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 36482 {
                                        if slot <= 36474 {
                                            if slot <= 36464 {
                                                if slot < 36446 or slot > 36464 { return -1. }
                                                return 2122.
                                            } else {
                                                if slot < 36465 or slot > 36474 { return -1. }
                                                return 2123.
                                            }
                                        } else {
                                            if slot <= 36475 {
                                                if slot < 36475 or slot > 36475 { return -1. }
                                                return 2124.
                                            } else {
                                                if slot < 36476 or slot > 36482 { return -1. }
                                                return 2125.
                                            }
                                        }
                                    } else {
                                        if slot <= 36503 {
                                            if slot <= 36488 {
                                                if slot < 36483 or slot > 36488 { return -1. }
                                                return 2126.
                                            } else {
                                                if slot < 36489 or slot > 36503 { return -1. }
                                                return 2127.
                                            }
                                        } else {
                                            if slot <= 36511 {
                                                if slot < 36504 or slot > 36511 { return -1. }
                                                return 2128.
                                            } else {
                                                if slot <= 36536 {
                                                    if slot < 36512 or slot > 36536 { return -1. }
                                                    return 2129.
                                                } else {
                                                    if slot < 36537 or slot > 36550 { return -1. }
                                                    return 2130.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 36649 {
                                    if slot <= 36594 {
                                        if slot <= 36560 {
                                            if slot <= 36554 {
                                                if slot < 36551 or slot > 36554 { return -1. }
                                                return 2131.
                                            } else {
                                                if slot < 36555 or slot > 36560 { return -1. }
                                                return 2132.
                                            }
                                        } else {
                                            if slot <= 36584 {
                                                if slot < 36561 or slot > 36584 { return -1. }
                                                return 2133.
                                            } else {
                                                if slot < 36585 or slot > 36594 { return -1. }
                                                return 2134.
                                            }
                                        }
                                    } else {
                                        if slot <= 36616 {
                                            if slot <= 36608 {
                                                if slot < 36595 or slot > 36608 { return -1. }
                                                return 2135.
                                            } else {
                                                if slot < 36609 or slot > 36616 { return -1. }
                                                return 2136.
                                            }
                                        } else {
                                            if slot <= 36631 {
                                                if slot < 36617 or slot > 36631 { return -1. }
                                                return 2137.
                                            } else {
                                                if slot <= 36644 {
                                                    if slot < 36632 or slot > 36644 { return -1. }
                                                    return 2138.
                                                } else {
                                                    if slot < 36645 or slot > 36649 { return -1. }
                                                    return 2139.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 36699 {
                                        if slot <= 36685 {
                                            if slot <= 36657 {
                                                if slot < 36650 or slot > 36657 { return -1. }
                                                return 2140.
                                            } else {
                                                if slot < 36658 or slot > 36685 { return -1. }
                                                return 2141.
                                            }
                                        } else {
                                            if slot <= 36691 {
                                                if slot < 36686 or slot > 36691 { return -1. }
                                                return 2142.
                                            } else {
                                                if slot < 36692 or slot > 36699 { return -1. }
                                                return 2143.
                                            }
                                        }
                                    } else {
                                        if slot <= 36748 {
                                            if slot <= 36746 {
                                                if slot < 36700 or slot > 36746 { return -1. }
                                                return 2144.
                                            } else {
                                                if slot < 36747 or slot > 36748 { return -1. }
                                                return 2145.
                                            }
                                        } else {
                                            if slot <= 36765 {
                                                if slot < 36749 or slot > 36765 { return -1. }
                                                return 2146.
                                            } else {
                                                if slot <= 36778 {
                                                    if slot < 36767 or slot > 36778 { return -1. }
                                                    return 2147.
                                                } else {
                                                    if slot < 36779 or slot > 36785 { return -1. }
                                                    return 2148.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 36919 {
                                if slot <= 36879 {
                                    if slot <= 36829 {
                                        if slot <= 36816 {
                                            if slot <= 36789 {
                                                if slot < 36786 or slot > 36789 { return -1. }
                                                return 2149.
                                            } else {
                                                if slot < 36790 or slot > 36816 { return -1. }
                                                return 2150.
                                            }
                                        } else {
                                            if slot <= 36819 {
                                                if slot < 36817 or slot > 36819 { return -1. }
                                                return 2151.
                                            } else {
                                                if slot < 36823 or slot > 36829 { return -1. }
                                                return 2152.
                                            }
                                        }
                                    } else {
                                        if slot <= 36848 {
                                            if slot <= 36845 {
                                                if slot < 36830 or slot > 36845 { return -1. }
                                                return 2153.
                                            } else {
                                                if slot < 36846 or slot > 36848 { return -1. }
                                                return 2154.
                                            }
                                        } else {
                                            if slot <= 36857 {
                                                if slot < 36849 or slot > 36857 { return -1. }
                                                return 2155.
                                            } else {
                                                if slot <= 36870 {
                                                    if slot < 36864 or slot > 36870 { return -1. }
                                                    return 2156.
                                                } else {
                                                    if slot < 36871 or slot > 36879 { return -1. }
                                                    return 2157.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 36901 {
                                        if slot <= 36884 {
                                            if slot <= 36881 {
                                                if slot < 36880 or slot > 36881 { return -1. }
                                                return 2158.
                                            } else {
                                                if slot < 36882 or slot > 36884 { return -1. }
                                                return 2159.
                                            }
                                        } else {
                                            if slot <= 36898 {
                                                if slot < 36885 or slot > 36898 { return -1. }
                                                return 2160.
                                            } else {
                                                if slot < 36899 or slot > 36901 { return -1. }
                                                return 2161.
                                            }
                                        }
                                    } else {
                                        if slot <= 36909 {
                                            if slot <= 36904 {
                                                if slot < 36902 or slot > 36904 { return -1. }
                                                return 2162.
                                            } else {
                                                if slot < 36905 or slot > 36909 { return -1. }
                                                return 2163.
                                            }
                                        } else {
                                            if slot <= 36910 {
                                                if slot < 36910 or slot > 36910 { return -1. }
                                                return 2164.
                                            } else {
                                                if slot <= 36916 {
                                                    if slot < 36914 or slot > 36916 { return -1. }
                                                    return 2165.
                                                } else {
                                                    if slot < 36917 or slot > 36919 { return -1. }
                                                    return 2166.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 37484 {
                                    if slot <= 36947 {
                                        if slot <= 36937 {
                                            if slot <= 36931 {
                                                if slot < 36920 or slot > 36931 { return -1. }
                                                return 2167.
                                            } else {
                                                if slot < 36932 or slot > 36937 { return -1. }
                                                return 2168.
                                            }
                                        } else {
                                            if slot <= 36941 {
                                                if slot < 36938 or slot > 36941 { return -1. }
                                                return 2169.
                                            } else {
                                                if slot < 36942 or slot > 36947 { return -1. }
                                                return 2170.
                                            }
                                        }
                                    } else {
                                        if slot <= 36954 {
                                            if slot <= 36953 {
                                                if slot < 36948 or slot > 36953 { return -1. }
                                                return 2171.
                                            } else {
                                                if slot < 36954 or slot > 36954 { return -1. }
                                                return 2172.
                                            }
                                        } else {
                                            if slot <= 37476 {
                                                if slot < 37475 or slot > 37476 { return -1. }
                                                return 2173.
                                            } else {
                                                if slot <= 37480 {
                                                    if slot < 37477 or slot > 37480 { return -1. }
                                                    return 2174.
                                                } else {
                                                    if slot < 37481 or slot > 37484 { return -1. }
                                                    return 2175.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 37555 {
                                        if slot <= 37504 {
                                            if slot <= 37495 {
                                                if slot < 37485 or slot > 37495 { return -1. }
                                                return 2176.
                                            } else {
                                                if slot < 37496 or slot > 37504 { return -1. }
                                                return 2177.
                                            }
                                        } else {
                                            if slot <= 37517 {
                                                if slot < 37505 or slot > 37517 { return -1. }
                                                return 2178.
                                            } else {
                                                if slot <= 37519 {
                                                    if slot < 37518 or slot > 37519 { return -1. }
                                                    return 2179.
                                                } else {
                                                    if slot < 37520 or slot > 37555 { return -1. }
                                                    return 2180.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 37563 {
                                            if slot <= 37560 {
                                                if slot < 37556 or slot > 37560 { return -1. }
                                                return 2181.
                                            } else {
                                                if slot < 37561 or slot > 37563 { return -1. }
                                                return 2182.
                                            }
                                        } else {
                                            if slot <= 37570 {
                                                if slot < 37564 or slot > 37570 { return -1. }
                                                return 2183.
                                            } else {
                                                if slot <= 37573 {
                                                    if slot < 37571 or slot > 37573 { return -1. }
                                                    return 2184.
                                                } else {
                                                    if slot < 37574 or slot > 37582 { return -1. }
                                                    return 2185.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    if slot <= 38248 {
                        if slot <= 38033 {
                            if slot <= 37798 {
                                if slot <= 37677 {
                                    if slot <= 37623 {
                                        if slot <= 37619 {
                                            if slot <= 37597 {
                                                if slot < 37583 or slot > 37597 { return -1. }
                                                return 2186.
                                            } else {
                                                if slot < 37598 or slot > 37619 { return -1. }
                                                return 2187.
                                            }
                                        } else {
                                            if slot <= 37620 {
                                                if slot < 37620 or slot > 37620 { return -1. }
                                                return 2188.
                                            } else {
                                                if slot < 37621 or slot > 37623 { return -1. }
                                                return 2189.
                                            }
                                        }
                                    } else {
                                        if slot <= 37639 {
                                            if slot <= 37636 {
                                                if slot < 37624 or slot > 37636 { return -1. }
                                                return 2190.
                                            } else {
                                                if slot < 37637 or slot > 37639 { return -1. }
                                                return 2191.
                                            }
                                        } else {
                                            if slot <= 37654 {
                                                if slot < 37640 or slot > 37654 { return -1. }
                                                return 2192.
                                            } else {
                                                if slot <= 37668 {
                                                    if slot < 37655 or slot > 37668 { return -1. }
                                                    return 2193.
                                                } else {
                                                    if slot < 37669 or slot > 37677 { return -1. }
                                                    return 2194.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 37779 {
                                        if slot <= 37712 {
                                            if slot <= 37707 {
                                                if slot < 37678 or slot > 37707 { return -1. }
                                                return 2195.
                                            } else {
                                                if slot < 37708 or slot > 37712 { return -1. }
                                                return 2196.
                                            }
                                        } else {
                                            if slot <= 37774 {
                                                if slot < 37766 or slot > 37774 { return -1. }
                                                return 2197.
                                            } else {
                                                if slot < 37775 or slot > 37779 { return -1. }
                                                return 2198.
                                            }
                                        }
                                    } else {
                                        if slot <= 37789 {
                                            if slot <= 37782 {
                                                if slot < 37780 or slot > 37782 { return -1. }
                                                return 2199.
                                            } else {
                                                if slot < 37783 or slot > 37789 { return -1. }
                                                return 2200.
                                            }
                                        } else {
                                            if slot <= 37791 {
                                                if slot < 37790 or slot > 37791 { return -1. }
                                                return 2201.
                                            } else {
                                                if slot <= 37794 {
                                                    if slot < 37792 or slot > 37794 { return -1. }
                                                    return 2202.
                                                } else {
                                                    if slot < 37795 or slot > 37798 { return -1. }
                                                    return 2203.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 37979 {
                                    if slot <= 37879 {
                                        if slot <= 37864 {
                                            if slot <= 37803 {
                                                if slot < 37802 or slot > 37803 { return -1. }
                                                return 2204.
                                            } else {
                                                if slot < 37804 or slot > 37864 { return -1. }
                                                return 2205.
                                            }
                                        } else {
                                            if slot <= 37871 {
                                                if slot < 37865 or slot > 37871 { return -1. }
                                                return 2206.
                                            } else {
                                                if slot < 37872 or slot > 37879 { return -1. }
                                                return 2207.
                                            }
                                        }
                                    } else {
                                        if slot <= 37889 {
                                            if slot <= 37880 {
                                                if slot < 37880 or slot > 37880 { return -1. }
                                                return 2208.
                                            } else {
                                                if slot < 37888 or slot > 37889 { return -1. }
                                                return 2209.
                                            }
                                        } else {
                                            if slot <= 37971 {
                                                if slot < 37890 or slot > 37971 { return -1. }
                                                return 2210.
                                            } else {
                                                if slot <= 37977 {
                                                    if slot < 37972 or slot > 37977 { return -1. }
                                                    return 2211.
                                                } else {
                                                    if slot < 37978 or slot > 37979 { return -1. }
                                                    return 2212.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 38006 {
                                        if slot <= 37999 {
                                            if slot <= 37991 {
                                                if slot < 37980 or slot > 37991 { return -1. }
                                                return 2213.
                                            } else {
                                                if slot < 37992 or slot > 37999 { return -1. }
                                                return 2214.
                                            }
                                        } else {
                                            if slot <= 38004 {
                                                if slot < 38000 or slot > 38004 { return -1. }
                                                return 2215.
                                            } else {
                                                if slot < 38005 or slot > 38006 { return -1. }
                                                return 2216.
                                            }
                                        }
                                    } else {
                                        if slot <= 38012 {
                                            if slot <= 38008 {
                                                if slot < 38007 or slot > 38008 { return -1. }
                                                return 2217.
                                            } else {
                                                if slot < 38009 or slot > 38012 { return -1. }
                                                return 2218.
                                            }
                                        } else {
                                            if slot <= 38023 {
                                                if slot < 38013 or slot > 38023 { return -1. }
                                                return 2219.
                                            } else {
                                                if slot <= 38028 {
                                                    if slot < 38024 or slot > 38028 { return -1. }
                                                    return 2220.
                                                } else {
                                                    if slot < 38030 or slot > 38033 { return -1. }
                                                    return 2221.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 38134 {
                                if slot <= 38072 {
                                    if slot <= 38057 {
                                        if slot <= 38047 {
                                            if slot <= 38042 {
                                                if slot < 38034 or slot > 38042 { return -1. }
                                                return 2222.
                                            } else {
                                                if slot < 38043 or slot > 38047 { return -1. }
                                                return 2223.
                                            }
                                        } else {
                                            if slot <= 38052 {
                                                if slot < 38048 or slot > 38052 { return -1. }
                                                return 2224.
                                            } else {
                                                if slot < 38053 or slot > 38057 { return -1. }
                                                return 2225.
                                            }
                                        }
                                    } else {
                                        if slot <= 38061 {
                                            if slot <= 38059 {
                                                if slot < 38058 or slot > 38059 { return -1. }
                                                return 2226.
                                            } else {
                                                if slot < 38060 or slot > 38061 { return -1. }
                                                return 2227.
                                            }
                                        } else {
                                            if slot <= 38065 {
                                                if slot < 38062 or slot > 38065 { return -1. }
                                                return 2228.
                                            } else {
                                                if slot <= 38067 {
                                                    if slot < 38066 or slot > 38067 { return -1. }
                                                    return 2229.
                                                } else {
                                                    if slot < 38068 or slot > 38072 { return -1. }
                                                    return 2230.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 38095 {
                                        if slot <= 38090 {
                                            if slot <= 38082 {
                                                if slot < 38073 or slot > 38082 { return -1. }
                                                return 2231.
                                            } else {
                                                if slot < 38083 or slot > 38090 { return -1. }
                                                return 2232.
                                            }
                                        } else {
                                            if slot <= 38093 {
                                                if slot < 38091 or slot > 38093 { return -1. }
                                                return 2233.
                                            } else {
                                                if slot < 38094 or slot > 38095 { return -1. }
                                                return 2234.
                                            }
                                        }
                                    } else {
                                        if slot <= 38100 {
                                            if slot <= 38098 {
                                                if slot < 38096 or slot > 38098 { return -1. }
                                                return 2235.
                                            } else {
                                                if slot < 38099 or slot > 38100 { return -1. }
                                                return 2236.
                                            }
                                        } else {
                                            if slot <= 38105 {
                                                if slot < 38101 or slot > 38105 { return -1. }
                                                return 2237.
                                            } else {
                                                if slot <= 38127 {
                                                    if slot < 38106 or slot > 38127 { return -1. }
                                                    return 2238.
                                                } else {
                                                    if slot < 38128 or slot > 38134 { return -1. }
                                                    return 2239.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 38181 {
                                    if slot <= 38151 {
                                        if slot <= 38142 {
                                            if slot <= 38139 {
                                                if slot < 38135 or slot > 38139 { return -1. }
                                                return 2240.
                                            } else {
                                                if slot < 38140 or slot > 38142 { return -1. }
                                                return 2241.
                                            }
                                        } else {
                                            if slot <= 38148 {
                                                if slot < 38143 or slot > 38148 { return -1. }
                                                return 2242.
                                            } else {
                                                if slot < 38149 or slot > 38151 { return -1. }
                                                return 2243.
                                            }
                                        }
                                    } else {
                                        if slot <= 38158 {
                                            if slot <= 38156 {
                                                if slot < 38152 or slot > 38156 { return -1. }
                                                return 2244.
                                            } else {
                                                if slot < 38157 or slot > 38158 { return -1. }
                                                return 2245.
                                            }
                                        } else {
                                            if slot <= 38173 {
                                                if slot < 38159 or slot > 38173 { return -1. }
                                                return 2246.
                                            } else {
                                                if slot <= 38179 {
                                                    if slot < 38174 or slot > 38179 { return -1. }
                                                    return 2247.
                                                } else {
                                                    if slot < 38180 or slot > 38181 { return -1. }
                                                    return 2248.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 38214 {
                                        if slot <= 38193 {
                                            if slot <= 38185 {
                                                if slot < 38182 or slot > 38185 { return -1. }
                                                return 2249.
                                            } else {
                                                if slot < 38186 or slot > 38193 { return -1. }
                                                return 2250.
                                            }
                                        } else {
                                            if slot <= 38195 {
                                                if slot < 38194 or slot > 38195 { return -1. }
                                                return 2251.
                                            } else {
                                                if slot <= 38207 {
                                                    if slot < 38196 or slot > 38207 { return -1. }
                                                    return 2252.
                                                } else {
                                                    if slot < 38208 or slot > 38214 { return -1. }
                                                    return 2253.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 38226 {
                                            if slot <= 38217 {
                                                if slot < 38215 or slot > 38217 { return -1. }
                                                return 2254.
                                            } else {
                                                if slot < 38218 or slot > 38226 { return -1. }
                                                return 2255.
                                            }
                                        } else {
                                            if slot <= 38239 {
                                                if slot < 38227 or slot > 38239 { return -1. }
                                                return 2256.
                                            } else {
                                                if slot <= 38242 {
                                                    if slot < 38240 or slot > 38242 { return -1. }
                                                    return 2257.
                                                } else {
                                                    if slot < 38243 or slot > 38248 { return -1. }
                                                    return 2258.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        if slot <= 38469 {
                            if slot <= 38355 {
                                if slot <= 38320 {
                                    if slot <= 38280 {
                                        if slot <= 38262 {
                                            if slot <= 38257 {
                                                if slot < 38249 or slot > 38257 { return -1. }
                                                return 2259.
                                            } else {
                                                if slot < 38258 or slot > 38262 { return -1. }
                                                return 2260.
                                            }
                                        } else {
                                            if slot <= 38271 {
                                                if slot < 38263 or slot > 38271 { return -1. }
                                                return 2261.
                                            } else {
                                                if slot < 38272 or slot > 38280 { return -1. }
                                                return 2262.
                                            }
                                        }
                                    } else {
                                        if slot <= 38300 {
                                            if slot <= 38283 {
                                                if slot < 38281 or slot > 38283 { return -1. }
                                                return 2263.
                                            } else {
                                                if slot < 38284 or slot > 38300 { return -1. }
                                                return 2264.
                                            }
                                        } else {
                                            if slot <= 38305 {
                                                if slot < 38301 or slot > 38305 { return -1. }
                                                return 2265.
                                            } else {
                                                if slot <= 38308 {
                                                    if slot < 38306 or slot > 38308 { return -1. }
                                                    return 2266.
                                                } else {
                                                    if slot < 38309 or slot > 38320 { return -1. }
                                                    return 2267.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 38340 {
                                        if slot <= 38328 {
                                            if slot <= 38326 {
                                                if slot < 38321 or slot > 38326 { return -1. }
                                                return 2268.
                                            } else {
                                                if slot < 38327 or slot > 38328 { return -1. }
                                                return 2269.
                                            }
                                        } else {
                                            if slot <= 38330 {
                                                if slot < 38329 or slot > 38330 { return -1. }
                                                return 2270.
                                            } else {
                                                if slot < 38331 or slot > 38340 { return -1. }
                                                return 2271.
                                            }
                                        }
                                    } else {
                                        if slot <= 38346 {
                                            if slot <= 38343 {
                                                if slot < 38341 or slot > 38343 { return -1. }
                                                return 2272.
                                            } else {
                                                if slot < 38344 or slot > 38346 { return -1. }
                                                return 2273.
                                            }
                                        } else {
                                            if slot <= 38348 {
                                                if slot < 38347 or slot > 38348 { return -1. }
                                                return 2274.
                                            } else {
                                                if slot <= 38351 {
                                                    if slot < 38349 or slot > 38351 { return -1. }
                                                    return 2275.
                                                } else {
                                                    if slot < 38352 or slot > 38355 { return -1. }
                                                    return 2276.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 38417 {
                                    if slot <= 38382 {
                                        if slot <= 38372 {
                                            if slot <= 38358 {
                                                if slot < 38357 or slot > 38358 { return -1. }
                                                return 2277.
                                            } else {
                                                if slot < 38359 or slot > 38372 { return -1. }
                                                return 2278.
                                            }
                                        } else {
                                            if slot <= 38379 {
                                                if slot < 38373 or slot > 38379 { return -1. }
                                                return 2279.
                                            } else {
                                                if slot < 38380 or slot > 38382 { return -1. }
                                                return 2280.
                                            }
                                        }
                                    } else {
                                        if slot <= 38401 {
                                            if slot <= 38384 {
                                                if slot < 38383 or slot > 38384 { return -1. }
                                                return 2281.
                                            } else {
                                                if slot < 38385 or slot > 38401 { return -1. }
                                                return 2282.
                                            }
                                        } else {
                                            if slot <= 38408 {
                                                if slot < 38402 or slot > 38408 { return -1. }
                                                return 2283.
                                            } else {
                                                if slot <= 38414 {
                                                    if slot < 38409 or slot > 38414 { return -1. }
                                                    return 2284.
                                                } else {
                                                    if slot < 38415 or slot > 38417 { return -1. }
                                                    return 2285.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 38442 {
                                        if slot <= 38425 {
                                            if slot <= 38421 {
                                                if slot < 38418 or slot > 38421 { return -1. }
                                                return 2286.
                                            } else {
                                                if slot < 38422 or slot > 38425 { return -1. }
                                                return 2287.
                                            }
                                        } else {
                                            if slot <= 38431 {
                                                if slot < 38426 or slot > 38431 { return -1. }
                                                return 2288.
                                            } else {
                                                if slot < 38432 or slot > 38442 { return -1. }
                                                return 2289.
                                            }
                                        }
                                    } else {
                                        if slot <= 38456 {
                                            if slot <= 38446 {
                                                if slot < 38443 or slot > 38446 { return -1. }
                                                return 2290.
                                            } else {
                                                if slot < 38447 or slot > 38456 { return -1. }
                                                return 2291.
                                            }
                                        } else {
                                            if slot <= 38459 {
                                                if slot < 38457 or slot > 38459 { return -1. }
                                                return 2292.
                                            } else {
                                                if slot <= 38465 {
                                                    if slot < 38460 or slot > 38465 { return -1. }
                                                    return 2293.
                                                } else {
                                                    if slot < 38466 or slot > 38469 { return -1. }
                                                    return 2294.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if slot <= 38574 {
                                if slot <= 38510 {
                                    if slot <= 38493 {
                                        if slot <= 38484 {
                                            if slot <= 38480 {
                                                if slot < 38470 or slot > 38480 { return -1. }
                                                return 2295.
                                            } else {
                                                if slot < 38481 or slot > 38484 { return -1. }
                                                return 2296.
                                            }
                                        } else {
                                            if slot <= 38491 {
                                                if slot < 38485 or slot > 38491 { return -1. }
                                                return 2297.
                                            } else {
                                                if slot < 38492 or slot > 38493 { return -1. }
                                                return 2298.
                                            }
                                        }
                                    } else {
                                        if slot <= 38502 {
                                            if slot <= 38496 {
                                                if slot < 38494 or slot > 38496 { return -1. }
                                                return 2299.
                                            } else {
                                                if slot < 38497 or slot > 38502 { return -1. }
                                                return 2300.
                                            }
                                        } else {
                                            if slot <= 38505 {
                                                if slot < 38503 or slot > 38505 { return -1. }
                                                return 2301.
                                            } else {
                                                if slot <= 38507 {
                                                    if slot < 38506 or slot > 38507 { return -1. }
                                                    return 2302.
                                                } else {
                                                    if slot < 38508 or slot > 38510 { return -1. }
                                                    return 2303.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 38536 {
                                        if slot <= 38528 {
                                            if slot <= 38512 {
                                                if slot < 38511 or slot > 38512 { return -1. }
                                                return 2304.
                                            } else {
                                                if slot < 38513 or slot > 38528 { return -1. }
                                                return 2305.
                                            }
                                        } else {
                                            if slot <= 38533 {
                                                if slot < 38529 or slot > 38533 { return -1. }
                                                return 2306.
                                            } else {
                                                if slot < 38534 or slot > 38536 { return -1. }
                                                return 2307.
                                            }
                                        }
                                    } else {
                                        if slot <= 38540 {
                                            if slot <= 38539 {
                                                if slot < 38537 or slot > 38539 { return -1. }
                                                return 2308.
                                            } else {
                                                if slot < 38540 or slot > 38540 { return -1. }
                                                return 2309.
                                            }
                                        } else {
                                            if slot <= 38551 {
                                                if slot < 38541 or slot > 38551 { return -1. }
                                                return 2310.
                                            } else {
                                                if slot <= 38553 {
                                                    if slot < 38552 or slot > 38553 { return -1. }
                                                    return 2311.
                                                } else {
                                                    if slot < 38568 or slot > 38574 { return -1. }
                                                    return 2312.
                                                }
                                            }
                                        }
                                    }
                                }
                            } else {
                                if slot <= 38674 {
                                    if slot <= 38654 {
                                        if slot <= 38611 {
                                            if slot <= 38583 {
                                                if slot < 38575 or slot > 38583 { return -1. }
                                                return 2313.
                                            } else {
                                                if slot < 38584 or slot > 38611 { return -1. }
                                                return 2314.
                                            }
                                        } else {
                                            if slot <= 38623 {
                                                if slot < 38612 or slot > 38623 { return -1. }
                                                return 2315.
                                            } else {
                                                if slot < 38624 or slot > 38654 { return -1. }
                                                return 2316.
                                            }
                                        }
                                    } else {
                                        if slot <= 38663 {
                                            if slot <= 38661 {
                                                if slot < 38655 or slot > 38661 { return -1. }
                                                return 2317.
                                            } else {
                                                if slot < 38662 or slot > 38663 { return -1. }
                                                return 2318.
                                            }
                                        } else {
                                            if slot <= 38665 {
                                                if slot < 38664 or slot > 38665 { return -1. }
                                                return 2319.
                                            } else {
                                                if slot <= 38672 {
                                                    if slot < 38666 or slot > 38672 { return -1. }
                                                    return 2320.
                                                } else {
                                                    if slot < 38673 or slot > 38674 { return -1. }
                                                    return 2321.
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    if slot <= 38716 {
                                        if slot <= 38678 {
                                            if slot <= 38676 {
                                                if slot < 38675 or slot > 38676 { return -1. }
                                                return 2322.
                                            } else {
                                                if slot < 38677 or slot > 38678 { return -1. }
                                                return 2323.
                                            }
                                        } else {
                                            if slot <= 38686 {
                                                if slot < 38679 or slot > 38686 { return -1. }
                                                return 2324.
                                            } else {
                                                if slot <= 38708 {
                                                    if slot < 38687 or slot > 38708 { return -1. }
                                                    return 2325.
                                                } else {
                                                    if slot < 38709 or slot > 38716 { return -1. }
                                                    return 2326.
                                                }
                                            }
                                        }
                                    } else {
                                        if slot <= 38838 {
                                            if slot <= 38770 {
                                                if slot < 38717 or slot > 38770 { return -1. }
                                                return 2327.
                                            } else {
                                                if slot < 38771 or slot > 38838 { return -1. }
                                                return 2328.
                                            }
                                        } else {
                                            if slot <= 38868 {
                                                if slot < 38839 or slot > 38868 { return -1. }
                                                return 2329.
                                            } else {
                                                if slot <= 38890 {
                                                    if slot < 38870 or slot > 38890 { return -1. }
                                                    return 2330.
                                                } else {
                                                    if slot < 38891 or slot > 38900 { return -1. }
                                                    return 2331.
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
